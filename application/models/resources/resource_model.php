<?php

class Resource_model extends CI_Model {

    public static  $resource_table = 'tbl_resource';
    public static  $detail_table = 'tbl_video_convert';

    const TYPE_IMAGE = 0;
    const TYPE_VIDEO = 1;
    const TYPE_AUDIO = 2;

    const TYPE_MP4 = 0;
    const TYPE_M3U8 = 1;

    const DIMENSION_720P = 0;
    const DIMENSION_1080P = 0;


    public function doread($id, $c){
        $this->db->where('id', $id);
        return $this->db->update(self::$resource_table, array('times' => $c));
    }

    public function get_resouce_by_id($id){
        $this->db->where('id', $id);
        return $this->db->get(self::$resource_table)->row_array();
    }

    public function create_resource($type = Resource_model::TYPE_IMAGE, $name = '', $resource_src = '', $duration = 0, $format = '', $sites = 0){
        $this->db->insert(self::$resource_table, array(
            'resource_type' => $type
            ,'resource_src' => $resource_src
            ,'duration' => $duration
            ,'video_format' => $format
            ,'sites' => $sites
            ,'name' => $name));
        return $this->db->insert_id();
    }

    //ToDO: 集群环境下，应当有
    public function add_video_convert($vid, $convert_type = Resource_model::TYPE_M3U8, $out_dimension = '1280x720', $convert_machine = '', $out_type = Resource_model::TYPE_M3U8, $out_path = '', $out_slice_duration = 10, $out_slice_location = '', $out_slice_url = ''){
        if(!$vid) return 0;
        $default = array(
            'vid' => $vid
            ,'convert_machine_id' => $convert_machine
            ,'convert_status' => 0
            ,'out_dimension' => $out_dimension
            ,'out_type' => $out_type
            ,'out_path' => $out_path
            ,'out_size' => 0
            ,'out_path' => ''
            ,'out_slice_duration' => $out_slice_duration
            ,'out_slice_location' => $out_slice_location
            ,'out_slice_url' => ''
        );
        $this->db->insert(self::$detail_table, $default);
        return $this->db->insert_id();
    }


    public function delete_by_id($id){
        $this->db->where('id', $id);
        $this->db->delete(self::$resource_table);
        $this->db->where('vid', $id);
        $this->db->delete(self::$detail_table);
    }


    public function update_detail_by_id($id, $key, $val){
    }

    public function get_video_status($eid){
        $this->db->trans_start();
        $sql = "SELECT * FROM " . self::$detail_table . " WHERE id=" . $eid . " FOR UPDATE";
        $query = $this->db->query($sql);
        $data = $query->row_array();
        if($data['convert_status'] == 0){
            $this->db->query("UPDATE " . self::$detail_table . " SET convert_status = 1 WHERE id=" . $eid);
        } else {
            $data = array();
        }
        $this->db->trans_complete();
        return $data;
    }

    public function mark_video_status($eid, $status){
        $this->db->where('id', $eid);
        $this->db->update(self::$detail_table, array('convert_status' => $status));
        log_message('debug', $this->db->last_query());
    }
    public function get_encoded_video_byid($id){
        $this->db->select(self::$resource_table . ".*, " . self::$detail_table . ".*, " . self::$detail_table . ".id as eid");
        $this->db->where(self::$detail_table. '.id', $id);
        $this->db->join(self::$resource_table, self::$resource_table. ".id = " . self::$detail_table . ".vid");
        $data = $this->db->get(self::$detail_table)->row_array();
        log_message("debug", $this->db->last_query());
        return $data;
    }

    public function get_encoded_video($eid){
        $this->db->where('vid', $eid);
        return $this->db->get(self::$detail_table)->result_array();
    }


    public function get_all_videos(){
        return $this->db->get(self::$resource_table)->result_array();
    }

}
