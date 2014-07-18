<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Video extends CI_Controller{
    public function __construct(){
        parent::__construct();
        $this->load->helper('form');
        $this->load->helper('url');
        $this->load->helper('message');
        $this->load->model('resources/resource_model', 'resources');
    }


private function getkey($key1,$key2){
    $a = hexdec($key1);
    $b = $a ^ 0xA55AA5A5;
    $b = dechex($b);
    return $key2.$b;
}

private function sid() {
    $sid = time().(rand(0,9000)+10000);
    return $sid;
}
    public function addoutside(){
        $name = $this->input->post('name');;
        $url = $this->input->post('conds');;
        $segs = parse_url($url);
        $url = substr(basename($segs['path']), 3);
        $url = substr($url, 0, -5);
        $data = 'http://v.youku.com/player/getPlayList/VideoIDS/' . $url;
        $data = file_get_contents($data);
        if($data){
            $obj = json_decode($data, true);
            $k1 = $obj['data'][0]['key1'];
            $k2 = $obj['data'][0]['key2'];
            $key = $this->getkey($k1, $k2);
            $vid = $obj['data'][0]['videoid'];
            $sid = $this->sid();
            $link = "http://v.youku.com/player/getM3U8/vid/{$vid}/type/mp4/sid/{$sid}/K/{$key}/video.m3u8";
            $this->resources->create_resource(Resource_model::TYPE_VIDEO, $name, $link, 0, '站外', 1);
            redirect(base_url('admin/video/index'));
        }
        //echo $name;
        //echo $url;
    }

    public function previewyouku($id = 0){
            if($id == 0) die("参数错误");
            $info = $this->resources->get_resouce_by_id($id);
            $src = $info['resource_src'];
            $this->smarty->assign('title', '视频预览');
            $this->smarty->assign('videos', $src);
            $this->smarty->assign('mainpage', 'video/preview.tpl');
            $this->smarty->display('main.tpl');
    }

    public function preview($eid = 0){
        if($eid == 0) die("参数错误");

        $info = $this->resources->get_encoded_video($eid);
        $src = 0;
        foreach($info as $i){
            if($i['out_type'] == 0){
                $src = base_url($i['out_slice_location']);
                break;
            }
        }
        if(!$src){
            die("参数错误");
        }

        $this->smarty->assign('title', '视频预览');
        $this->smarty->assign('videos', $src);
        $this->smarty->assign('mainpage', 'video/preview.tpl');
        $this->smarty->display('main.tpl');
    }

    public function index(){
        $videos = $this->resources->get_all_videos();
        foreach($videos as &$v){
            $vs = $this->resources->get_encoded_video($v['id']);
            foreach($vs as $vvs){
                if($vvs['out_type'] == 0){
                    $v['cs_mp4'] = $vvs['convert_status'];
                    $v['mid'] = $vvs['id'];
                } else {
                    $v['cs_m3u8'] = $vvs['convert_status'];
                    $v['uid'] = $vvs['id'];
                }
            }
        }
        $this->smarty->assign('title', '视频管理');
        $this->smarty->assign('videos', $videos);
        $this->smarty->assign('mainpage', 'video/index.tpl');
        $this->smarty->display('main.tpl');
    }

    public function reenc($eid = 0){
        if($eid == 0)die("参数错误");
        $row = $this->resources->get_encoded_video_byid($eid);
        $this->resources->mark_video_status($eid, 0);
        $hash = explode(".", basename($row['out_slice_location']))[0];
        $type = ($row['out_type'] == 0) ? 'mp4' : 'm3u8';
        $_payload = json_encode(array('eid' => $row['eid'], 'vid' => $row['vid'], 'type' => $type, 'demision' => $row['out_dimension'], 'src' => $row['resource_src'], "hash" => $hash, 'api' => base_url('api/videos'), 'dest' => BASEPATH . "/../". $row['out_slice_location']));
        $conn_args = array(
            'host' => $this->config->item('mq_host'),
            'port' => $this->config->item('mq_port'),
            'login' => $this->config->item('mq_user'),
            'password' => $this->config->item('mq_password'),
            'vhost'=> $this->config->item('mq_vhost')
        );
        $exchange = $this->config->item('mq_exchange');
        $queue = $this->config->item('mq_queue');
        $route = $this->config->item('mq_route');
        send_message($_payload, $conn_args, $exchange, $queue, $route);
        #redirect(base_url('admin/video/index'));
    }


    public function scanvideo(){
        $videos = $this->resources->get_all_videos();
        $vids = array();
        foreach($videos as $v){
            array_push($vids, md5($v['resource_src']));
        }
        $conf_dir = $this->config->item("videodir");
        $it = new DirectoryIterator($conf_dir);
        foreach($it as $file) {
            if (!$it->isDot()) {
                echo "发现文件 ：" . $file;
                $src = $conf_dir . "/" . $file . "";
                if(in_array(md5($src), $vids)){
                    echo "文件已转码";
                    continue;
                }
                $media = md5($src);
                $dir_ready = $this->_generate_dir($media);
                if(!$dir_ready){
                    $this->flog('创建目录失败');
                    die("系统目录创建失败");
                }
                $relate = $dir_ready['rel'];
                $abs = $dir_ready['abs'];
                $hash = md5($media);
                $info = pathinfo($src);
                $ext = $info['extension'];

                $vid = $this->resources->create_resource(1, $media, $src, 0, $ext);
                $demision = "960x640";
                $eid = $this->resources->add_video_convert($vid, Resource_model::TYPE_M3U8, $demision, '', Resource_model::TYPE_M3U8, '', 10, 'static/users_data/' . $relate . $hash . ".m3u8");
                $meid = $this->resources->add_video_convert($vid, Resource_model::TYPE_MP4, $demision, '', Resource_model::TYPE_MP4, '', 10, 'static/users_data/' . $relate . $hash . ".mp4");
                //$rid = $this->wlw->create($user['id'],  $eid, $vid);
                $_payload = json_encode(array('eid' => $eid, 'vid' => $vid, 'type' => 'm3u8', 'demision' => $demision, 'src' => $src, "hash" => $hash, 'api' => base_url('api/videos'), 'dest' => USERSPATH . $relate));
                $mp4_payload = json_encode(array('eid' => $meid, 'vid' => $vid, 'type' => 'mp4', 'demision' => $demision, 'src' => $src, "hash" => $hash, 'api' => base_url('api/videos'), 'dest' => USERSPATH . $relate));
                $conn_args = array(
                    'host' => $this->config->item('mq_host'),
                    'port' => $this->config->item('mq_port'),
                    'login' => $this->config->item('mq_user'),
                    'password' => $this->config->item('mq_password'),
                    'vhost'=> $this->config->item('mq_vhost')
                );
                $exchange = $this->config->item('mq_exchange');
                $queue = $this->config->item('mq_queue');
                $route = $this->config->item('mq_route');
                echo $_payload;
                echo $mp4_payload;
                send_message($_payload, $conn_args, $exchange, $queue, $route);
                send_message($mp4_payload, $conn_args, $exchange, $queue, $route);
                // 保存起来
                //die("上传成功，开始转码啦");
            }
        }
        redirect(base_url('admin/video/index'));
    }

    public function newvideo(){
        $this->smarty->assign('title', '上传视频');
        $this->smarty->assign('mainpage', 'video/upload.tpl');
        $this->smarty->display('main.tpl');
    }

    private function flog($msg){
        log_message("debug", $msg);
    }

    private function _generate_dir($videoid){
        $hash = md5($videoid);
        $sub_a = substr($hash, 0, 4);
        $sub_b = substr($hash, 4, 4);
        if(!file_exists(USERSPATH) && !mkdir(USERSPATH)){
            $this->flog("DIR A");
            return false;
        }
        $video = USERSPATH . "/videos/";
        $this->flog("make dir : " . $video);
        if(!file_exists($video) && !mkdir($video)){
            $this->flog("DIR B");
            return false;
        }
        $video = $video . "/" . $sub_a;
        if(!file_exists($video) && !mkdir($video)){
            $this->flog("DIR C");
            return false;
        }
        $video = $video . "/" . $sub_b;
        if(!file_exists($video) && !mkdir($video)){
            $this->flog("DIR D");
            return false;
        }
        $relate = "/videos/$sub_a/$sub_b/";
        return array('abs' => $video, 'rel' => $relate);
    }

    public function doupload(){
        $media = time();//$nodes['MediaId'];
        $dir_ready = $this->_generate_dir($media);
        if(!$dir_ready){
            $this->flog('创建目录失败');
            die("系统目录创建失败");//$this->return_text('信息采集失败，请稍后尝试!', $nodes['ToUserName'], $nodes['FromUserName']);
        }
        //$url = "http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=$token&media_id=$media";
        // mp4.
        $relate = $dir_ready['rel'];
        $abs = $dir_ready['abs'];
        $hash = md5($media);
        $src = $abs . "/src_" . $hash . ".mp4";
        //$buf = file_get_contents($url);
        //$buf = 
        //file_put_contents($src, $buf);
        if($_FILES['fileToUpload']['error'] > 0){
            die("上传错误");
        }
        if(move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $src)){
            // 写一下数据库
            $vid = $this->resources->create_resource(1, $media, $src, 0, 'mp4');
            $demision = "960x640";
            $eid = $this->resources->add_video_convert($vid, Resource_model::TYPE_M3U8, $demision, '', Resource_model::TYPE_M3U8, '', 10, base_url('static/users_data/' . $relate . $hash . ".m3u8"));
            $meid = $this->resources->add_video_convert($vid, Resource_model::TYPE_MP4, $demision, '', Resource_model::TYPE_MP4, '', 10, base_url('static/users_data/' . $relate . $hash . ".mp4"));
            //$rid = $this->wlw->create($user['id'],  $eid, $vid);
            $_payload = json_encode(array('eid' => $eid, 'vid' => $vid, 'type' => 'm3u8', 'demision' => $demision, 'src' => $src, "hash" => $hash, 'api' => base_url('api/videos')));
            $mp4_payload = json_encode(array('eid' => $meid, 'vid' => $vid, 'type' => 'mp4', 'demision' => $demision, 'src' => $src, "hash" => $hash, 'api' => base_url('api/videos')));
            $conn_args = array(
                'host' => $this->config->item('mq_host'),
                'port' => $this->config->item('mq_port'),
                'login' => $this->config->item('mq_user'),
                'password' => $this->config->item('mq_password'),
                'vhost'=> $this->config->item('mq_vhost')
            );
            $exchange = $this->config->item('mq_exchange');
            $queue = $this->config->item('mq_queue');
            $route = $this->config->item('mq_route');
            $this->flog("Queue:" . $queue);
            $this->flog("Route:" . $route);
            $this->flog("Exchange:" . $exchange);
            $this->flog("msg:" . $_payload);
            send_message($_payload, $conn_args, $exchange, $queue, $route);
            // 保存起来
            die("上传成功，开始转码啦");
            //return $this->return_text('您的信息已经采集到啦,请通过两条信息分别回复 "选手 ' . $rid . ' 您的名字"和"视频 ' . $rid . ' 作品名称"!', $nodes['ToUserName'], $nodes['FromUserName']);
        } else {
            die("上传失败");
            //return $this->return_text('信息采集失败，请稍后尝试!', $nodes['ToUserName'], $nodes['FromUserName']);
        }
    }
}
