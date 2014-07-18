<?php 
$config['base_url'] = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == "on") ? "https" : "http");
$config['base_url'] .= "://".$_SERVER['HTTP_HOST'];
$config['base_url'] .= str_replace(basename($_SERVER['SCRIPT_NAME']),"",$_SERVER['SCRIPT_NAME']);
$config['index_page'] = '';
$config['uri_protocol']	= 'AUTO';
$config['url_suffix'] = '';
$config['language']	= 'english';
$config['charset'] = 'UTF-8';
$config['enable_hooks'] = TRUE;
$config['subclass_prefix'] = 'MY_';
$config['allow_get_array']		= TRUE;
$config['enable_query_strings'] = FALSE;
$config['controller_trigger']	= 'c';
$config['function_trigger']		= 'm';
$config['directory_trigger']	= 'd'; 
$config['log_threshold'] = 3;
$config['log_path'] = '';
$config['log_date_format'] = 'Y-m-d H:i:s';
$config['cache_path'] = '';
$config['encryption_key'] = 'f03517b50abe405b7911da84abd28bad';
$config['sess_cookie_name']		= 'hm_session';
$config['sess_expiration']		= 0;
$config['sess_expire_on_close']	= TRUE;
$config['sess_encrypt_cookie']	= FALSE;
$config['sess_use_database']	= FALSE;
$config['sess_table_name']		= 'ci_sessions';
$config['sess_match_ip']		= FALSE;
$config['sess_match_useragent']	= TRUE;
$config['sess_time_to_update']	= 86400;
$config['cookie_prefix']	= "bjcglh_video_";
$config['cookie_domain']	= "";
$config['cookie_path']		= "/";
$config['cookie_secure']	= FALSE;
$config['global_xss_filtering'] = FALSE;
$config['csrf_protection'] = FALSE;
$config['csrf_token_name'] = 'csrf_test_name';
$config['csrf_cookie_name'] = 'csrf_cookie_name';
$config['csrf_expire'] = 7200;
$config['compress_output'] = FALSE;
$config['time_reference'] = 'local';
$config['rewrite_short_tags'] = FALSE;
$config['proxy_ips'] = '';
$config['static'] = '/static/';
$config['method_whitelist'] = array('login', "gettask");
$config['controller_whitelist'] = array('install', "api");
$config['permitted_uri_chars'] = 'a-z 0-9~$.:_\-';

#RabbitMQ 消息队列配置
$config['mq_host'] = '127.0.0.1';
$config['mq_port'] = '5672';
$config['mq_user'] = 'shoulashou';
$config['mq_password'] = 'UgMjE6MTE6NDcgQ1NUCg';
$config['mq_vhost'] = '/shoulashou';
$config['mq_exchange'] = 'shoulashou';
$config['mq_queue'] = 'shoulashou';
$config['mq_route'] = 'shoulashou';

# 自动扫描目录
$config['videodir'] = '/home/vsftpd/alvayang';
