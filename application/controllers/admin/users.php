<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Users extends CI_Controller {

    public function index(){
        $this->load->model('core/usersmodel', 'users');
        $users = $this->users->get_all_users();
        $this->load->model('admins/Subsystem', 'subsystem');
        $ps = $this->subsystem->getall();
        $pps = array('admin' => '超级管理员', 'all' => '超级管理员');
        foreach($ps as $p){
            $pps[$p['code']] = $p['name'];
        }
        for($i = 0; $i < count($users); $i++){
            $us = $users[$i]['privilege'];
            $uss = explode(',', $us);
            $t = array();
            foreach($uss as $u){
                if(!$u) continue;
                array_push($t, $pps[trim($u)]);
            }
            $users[$i]['display_privilege'] = implode(',', $t);
        }
        $this->smarty->assign('users', $users);
        $this->load->helper('form');
        $this->smarty->assign('title', '多账户管理');
        $this->smarty->assign('form_target', base_url() . 'admin/users/add_user');
        $this->smarty->assign('privis', $pps);
        $this->smarty->assign('mainpage', 'admin/newuser.tpl');
        $this->smarty->display('main.tpl');
    }

    public function update_user(){
        $uid = $this->input->post('uid');
        if(!$uid){
            die("Invalid Request");
        }
        $password = $this->input->post('password');
        $repassword = $this->input->post('repasswd');
        $super = $this->input->post('super');
        $this->load->model('core/usersmodel', 'user');
        $user = $this->user->find_by_prototype('id', $uid);
        if(!$user){
            die("User Not Exists");
        }
        $this->load->model('admins/Subsystem', 'subsystem');
        $ps = $this->subsystem->getall();
        $pps = array();
        foreach($ps as $p){
            $pps[$p['code']] = $p['name'];
        }
        $pri_lists = $pps;
        if($password != $repassword){
            die("Invalid Password");
        }
        $pri = '';
        if($super == 1) {
            $pri = 'admin';
        } else {
            $ps = array();
            foreach($pri_lists as $p){
                if("on" == $this->input->post($p)){
                    array_push($ps, $p);
                }
            }
            $pri = implode(',', $ps);
        }
        $uid = $this->user->update_user($user, $password, $pri);
        redirect(base_url() . 'admin/users/modify_user');
    }
    public function add_user(){
        $email = $this->input->post('email');
        $password = $this->input->post('password');
        $repassword = $this->input->post('repasswd');
        $this->load->model('core/usersmodel', 'user');
        if(!$email){
            die("Email is empty");
        }
        $user = $this->user->find_by_prototype('name', $email);
        if($user){
            die("User Exists.");
        }
        if($password != $repassword){
            die("Invalid Password");
        }
        $super = $this->input->post('super');
        $this->load->model('admins/Subsystem', 'subsystem');
        $ps = $this->subsystem->getall();
        $pps = array();
        foreach($ps as $p){
            array_push($pps, $p['code']);
        }
        $pri_lists = $pps;
        $pri = '';
        if($super == 1) {
            $pri = 'admin';
        } else {
            $ps = array();
            foreach($pri_lists as $p){
                if("on" == $this->input->post($p)){
                    array_push($ps, $p);
                }
            }
            $pri = implode(',', $ps);
        }
        $uid = $this->user->new_user($email, $password, $pri);
        if($uid > 0){
            redirect('/admin/users/index');
        } else {
            die('添加失败');
        }
    }

    public function modify_user(){
        $this->load->helper('form');
        $this->load->library('session');
        $a = $this->input->get('act');
        $i = $this->input->get('i');
        if(!$i){
            $i = $this->session->userdata('uid');
        }

        $this->load->model('core/usersmodel', 'users');
        if("d" == $a){
            $this->users->delete_user($i);
            redirect('/admin/users/index');
        } else {
            $user = $this->users->find_by_prototype('id', $i);
            if(!$user){
                die("Not Exists");
            } else {
                $this->smarty->assign('form_target', '/admin/users/update_user');
                $this->smarty->assign('title', '多账户管理');
                $this->smarty->assign('mainpage', 'admin/modifyuser.tpl');
                $this->smarty->assign('user', $user);
                $this->smarty->display('main.tpl');
            }
        }
    }


    public function login(){
        $this->load->helper('form');
        $this->smarty->assign('form_target', base_url() . 'admin/users/dologin');
        $this->smarty->assign('form_params', array('id' => 'jsonform', 'class' => "form-horizontal"));
        $this->smarty->assign('title', '登陆');
        $this->smarty->assign('style', array('class' => 'form-signin'));
        $this->smarty->display('admin/login.tpl');
    }

    public function logout(){
        try{
            $this->session->unset_userdata('uid');
            $this->session->unset_userdata('username');
            $this->session->unset_userdata('privilege');
        } catch(Exception $e){}
            redirect(base_url() . 'admin/video/index');

    }

    public function dologin(){
        $u = $this->input->post('username');
        $p = $this->input->post('password');
        $this->load->model('core/usersmodel', 'users');
        $user = $this->users->login($u, $p);
        if(false != $user){
            $this->session->set_userdata('uid', $user['id']);
            $this->session->set_userdata('username', $user['username']);
            $this->session->set_userdata('privilege', $user['privilege']);
            redirect('/admin/video/index');
        } else {
            die("登陆失败");
        }
    }

}
