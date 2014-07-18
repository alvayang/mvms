<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Subsystem extends CI_Model {
	private $table_name = "subsystems";
	public function default_page($s = array()){
		if(!$s){
		$s = array(
			'name' => '基础系统',
			'menu' => json_encode(
				array(
					array(
						'name' => '子系统管理',
						'url' => 'admin/admin/subsystems'
					),
					array(
						'name' => '站点管理',
						'url' => 'admin/admin/index'
					)
				)
			)
		);
		}
		$this->db->insert($this->table_name, $s);
		return $this->db->insert_id();
	}

	public function new_sub($name, $menu, $icon, $code){
		$this->db->insert($this->table_name, 
			array(
				'name' => $name
				,'menu' => $menu
				,'icon' => $icon
				,'code' => $code
			));
		return $this->db->insert_id();
	}

	public function remove_sub($s){
		$this->db->where('code', $s);
		$this->db->delete($this->table_name);
	}


	public function getall(){
		$query = $this->db->get($this->table_name);
		if($query->num_rows() == 0) return array();
		return $query->result_array();
	}
}

