<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Usersmodel extends CI_MODEL {
	private $table_name = "admin";
	public function __construct(){
		parent::__construct();
	}

	public function new_user($name, $passwd, $privilege){
		$salt = md5(microtime() . $name);
		$passwd = md5($salt.$passwd);
		$user = array(
			'name' => $name
			,'passwd' => $passwd
			,'salt' => $salt
			, 'privilege' => $privilege
		);
		$this->db->insert($this->table_name, $user);
		return $this->db->insert_id();
	}

	public function find_by_prototype($prototype, $value){
		if(!$prototype || !$value) return array();
		$query = $this->db->get_where($this->table_name, array($prototype => $value));
		if($query->num_rows() == 0) return array();
		$s = $query->result_array();
		return $s[0];
	}

	public function get_all_users(){
		$query = $this->db->get($this->table_name);
		if($query->num_rows() == 0) return array();
		return $query->result_array();
	}


	public function delete_user($i){
		$this->db->where('id', $i);
		$this->db->delete($this->table_name);
	}

	public function update_user($user, $password, $privilege){
		$salt = $user['salt'];
		if("" != $password){
			$salt = $user['salt'];
			if($salt == "") $salt = md5(microtime());
			$password = md5($salt . $password);
		} else {
			$password = $user['password'];
		}
		$this->db->where('id', $user['id']);
		$param = array(
			'passwd' => $password
			, 'privilege' => $privilege
			, 'salt' => $salt
		);
		$this->db->update($this->table_name, $param);
		return ;
	}

	public function list_user(){
		return $this->db->get($this->table_name).result_array();
	}
	public function login($email, $passwd){
		$user = $this->find_by_prototype('name', $email);
		if(!$user) return false;
		$salt = $user['salt'];
		if(md5($salt . $passwd) == $user['passwd']){
			return $user;
		} else {
			return false;
		}

	}
}
