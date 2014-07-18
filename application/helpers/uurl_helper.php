<?php

function http_request($url,$timeout=30,$header=array()){
        if (!function_exists('curl_init')) {
            throw new Exception('server not install curl');
        }
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HEADER, true);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
        if (!empty($header)) {
            curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
        }
        $data = curl_exec($ch);
        list($header, $data) = explode("\r\n\r\n", $data);
        $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        if ($http_code == 301 || $http_code == 302) {
            $matches = array();
            preg_match('/Location:(.*?)\n/', $header, $matches);
            $url = trim(array_pop($matches));
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_HEADER, false);
            $data = curl_exec($ch);
        }

        if ($data == false) {
            curl_close($ch);
        }
        @curl_close($ch);
        return $data;
}


function download_file($url, $fname){
	$cp = curl_init($url);
	$fp = fopen($fname, "wb");
	if(!$fp) return False;
	curl_setopt($cp, CURLOPT_TIMEOUT, Config::get_curl_timeout());
	curl_setopt($cp, CURLOPT_FILE, $fp);
	curl_setopt($cp, CURLOPT_HEADER, 0);
	curl_exec($cp);
	curl_close($cp);
	fclose($fp);

	return true;
}

