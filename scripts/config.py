#!/bin/env python
#-*- coding:utf-8 -*-

import logging
LOG_PATH = "/tmp/convert.log"
LOG_NAME = "Video"
LOG_FORMAT = '%(name)-12s %(asctime)s %(levelname)-8s %(message)s'
FFMPEG = '/opt/ffmpeg/bin/ffmpeg'

RMQ_USER = 'shoulashou'
RMQ_PASS = 'UgMjE6MTE6NDcgQ1NUCg'
RMQ_HOST = 'localhost'
RMQ_PORT = 5672
RMQ_VHOST = '/shoulashou'
RMQ_QUEUE = 'shoulashou'
