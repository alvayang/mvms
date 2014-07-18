<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admins extends CI_Model {

    private $id   = '';
    private $name = '';
    private $passwd    = '';
    private $salt = '';
    private $privilege = '';
    private $lastip = '';
    private $lastdt = '';

    private $alter_db = null;
    private $table_name = "admin";
    function __construct()
    {
        parent::__construct();
    }

    public function new_user($username, $password, $privilege, $alter = 0){
        $db = null;
        if($alter){
            $db = $alter;
        } else {
            $db = $this->db;
        }
        $salt = md5(microtime() . $password);
        $passwd = md5($salt . $password);
        return $db->insert($this->table_name, 
            array(
                'name' => $username
                , 'passwd' => $passwd
                , 'privilege' => $privilege
                , 'salt' => $salt
            )
        );
    }

}
