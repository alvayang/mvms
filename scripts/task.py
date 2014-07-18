#!/bin/env python
#-*- coding:utf-8 -*-
import sys, os, subprocess, json, time
import pika
import traceback
import logging
from config import *
import sys 

import logging, urllib2
logging.basicConfig()
service_root = os.path.dirname(os.path.realpath(__file__))
if service_root != '':
    service_root = service_root + '/'

LOG_LEVEL = logging.DEBUG

WAIT = 1
START = 2
SUCCESS = 3
FAILED = -1
EMPTY = -2

logger = logging.getLogger(LOG_NAME)  
formatter = logging.Formatter(LOG_FORMAT)
file_handler = logging.FileHandler(LOG_PATH) 
file_handler.setFormatter(formatter)  
logger.setLevel(LOG_LEVEL)
logger.addHandler(file_handler)

def log(msg):
    logger.debug(msg)

def error(msg):
    logger.error(msg)

def _make_request(full_url):
    log("Send Request:" + str(full_url))
    try:
        data=urllib2.urlopen(full_url)
        return data.read()
    except:
        error("Request:" + str(traceback.format_exc()))
        return ''
    return ''



def get_task(prefix, eid):
    url = prefix + "/gettask/" + str(eid)
    buf = _make_request(url)
    log("Get Task:" + str(buf))
    try:
        obj = json.loads(buf)
        return obj['status'] == 1
    except:
        #print traceback.format_exc()
        error("TaskDecode Error:" + str(buf))
        return 0

def mark_status(prefix, eid, reason):
    url = prefix + "/markstatus/" + str(eid) + "/" + str(reason)
    buf = _make_request(url)
    try:
        obj = json.loads(buf)
        return obj['status'] == 1
    except:
        error("Bad Request :" + str(buf))
        return 0

def convert_video(data):
    #TODO: 考虑CDN
    _eid = data['eid']
    _vid = data['vid']
    _src = data['src']
    _dest = data['dest']
    _type = data['type']
    _demision = data['demision']
    _hash = data['hash']
    _api = data['api']
    _m3u8path = os.path.join(os.path.dirname(_dest), _hash + ".m3u8")
    _mp4path = os.path.join(os.path.dirname(_dest), _hash + ".mp4")
    if not get_task(_api, _eid):
        error("Fetch Task Error")    
        return mark_status(_api, _eid, FAILED)
    CHANGE_TO_TARGET = "cd " + os.path.dirname(_dest) + " && "
    _cmd = "/usr/bin/mediainfo --Inform=\"Video;%Duration%\" '" + _src + "'"
    _time = 0
    try:
        _time = subprocess.check_output(_cmd, shell = True)
        _time = _time.strip()
        log("Duration:" + str(_time))
    except:
        error("Execute Duration Cmd error:" + str(traceback.format_exc()))
        return mark_status(_api, _eid, FAILED)
    if not _time or _time == 0:
        log("Empty File:" + str(_time))
        os.unlink(_src)
        return mark_status(_api, _eid, EMPTY)

    if not mark_status(_api, _eid, START):
        return mark_status(_api, _eid, FAILED)

    if _type == "m3u8":
        _cmd = '%s %s -i "%s" -loglevel quiet -threads 8 -f mpegts -vcodec libx264 -b 600k -r 25  -acodec libfaac -ar 44100 -ab 32k -s %s - | segmenter -i - -d 10 -p %s -m "%s" -u "./"' % (CHANGE_TO_TARGET, FFMPEG, _src, _demision, _hash, _m3u8path)
    else:
        _cmd = '%s %s -i "%s" -loglevel quiet -threads 8 -profile:v baseline -vcodec libx264 -b 300k -r 25 -f mp4 -acodec libfaac -ab 32k -ac 2 -ar 44100 -s %s  -movflags +faststart -y  "%s"' % (CHANGE_TO_TARGET, FFMPEG, _src, _demision, _mp4path)
    log("Execute Command: %s" % _cmd)
    try:
        status = subprocess.call(_cmd, shell = True)
        if status == 0:
            return mark_status(_api, _eid, SUCCESS)
        else:
            return mark_status(_api, _eid, FAILED)
    except:
        error("Execute Command Exception:" + str(traceback.format_exc()))
        return mark_status(_api, _eid, FAILED)

    return mark_status(_api, _eid, FAILED)

def on_message(channel, method_frame, header_frame, body):
    log("Message:" + body)
    channel.basic_ack(delivery_tag=method_frame.delivery_tag)
    try:
        data = json.loads(body)
    except:
        error("Decode Error:" + body)
        return False

    if 'vid' in data and 'eid' in data:
        try:
            convert_video(data)
        except:
            print traceback.format_exc()
            pass


credentials = pika.PlainCredentials(RMQ_USER, RMQ_PASS)
parameters = pika.ConnectionParameters(RMQ_HOST,
        RMQ_PORT,
        RMQ_VHOST,
        credentials = credentials)
connection = pika.BlockingConnection(parameters)
channel = connection.channel()
channel.basic_consume(on_message, RMQ_QUEUE)

try:
    log("Starting")
    channel.start_consuming()
except KeyboardInterrupt:
    log("Offline")
    channel.stop_consuming()
connection.close()
