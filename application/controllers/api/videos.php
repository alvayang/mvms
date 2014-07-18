<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Videos extends CI_Controller {
    // TODO: 这个控制器应当验证来源为白名单中的机器
    public function __construct(){
        parent::__construct();
        $this->load->helper('message');
        $this->load->model('resources/resource_model');
    }

    public function index(){
    }

    public function gettask($eid) {
        //echo $this->input->ip_address();
        $obj = $this->resource_model->get_video_status($eid);
        if($obj){
            die(json_encode(array('status' => 1)));
        } else {
            die(json_encode(array('status' => 0)));
        }
    }

    public function markstatus($eid, $status){
        $this->resource_model->mark_video_status($eid, $status);
        die(json_encode(array('status' => 1)));
    }

}
