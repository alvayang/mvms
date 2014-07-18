<?php


class CheckInstall{

	private function startsWith($haystack, $needle) {
		$length = strlen($needle); 
		return (substr($haystack, 0, $length) === $needle); 
	}

	public function Check(){
		$ci =& get_instance();
		$ci->load->helper('url');
		$url = current_url();
		$rs = substr_replace($url, "", 0, strlen(base_url()));
		$ci->load->library('smarty');
		@list($controller, $function, $method) = @explode("/", $rs, 3);
		$ci->smarty->assign('form_params', array('id' => 'jsonform', 'class' => "form-horizontal"));
		if($controller == "public") return true;
		if($method == "") $method = "index";
		if($method == "install" || $method == "login" || $method == "dologin") return true;
		$ci->smarty->assign('cs', $rs);
        $p = $function;
        if($method == "modify_user") $p = 'pass';
		$ci->smarty->assign('p', $p);
        $method_whitelist = $ci->config->item('method_whitelist');
        $controller_whitelist = $ci->config->item('controller_whitelist');
        if(in_array($method, $method_whitelist)) return true;
        if(in_array($controller, $controller_whitelist)) return true;
        $this->check_privilege($url);
	}

	public function check_privilege($want){
		$ci =& get_instance();
		$ci->load->library('session');
		$ci->load->library('smarty');
		$ci->load->helper('url');
		$ci->load->model('admins/subsystem', 'subsystem');
		$uid = $ci->session->userdata('uid');
		$privilege = $ci->session->userdata('privilege');
		$menu = $ci->subsystem->getall();
		$menus = array();
		if($privilege == "admin" || $privilege == "all"){
            $menus = array(
                array('icon' => 'icon-asterisk', 'name' => '系统设置', 'menus' => array(
                    array('name' => '管理员设置', 'url' => 'admin/users/index')
                    ,array('name' => '视频管理', 'url' => 'admin/video/index')
                ))
			);
		}
		$pps = explode(',', $privilege);
		foreach($menu as $m){
			if($privilege == 'admin' || $privilege == 'all' || in_array($m['code'], $pps)){
				$m['menus'] = json_decode($m['menu'], True);
				array_push($menus, $m);
			}
		}
		$url = current_url();
		$rs = substr_replace($url, "", 0, strlen(base_url()));
		foreach($menus as &$m){
			$m['id'] = md5($m['name']);
			$s = array('m' => &$m, 'rs' => $rs);
			$m['c'] = 0;
			array_walk($m['menus'], function(&$i, $k, &$s){
				$rs = $s['rs'];
				if($i['url'] == $rs){
					$s['m']['c'] += 1;
				}
			}, $s);
		}
		$ci->smarty->assign('left', $menus);
		// 检查权限
		if(!$uid){
			redirect(base_url() . "admin/users/login");
			return;
		}
	}
}


