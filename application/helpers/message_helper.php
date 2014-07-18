<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
function send_message($msg, $conn_args, $exchange, $queue, $route){
        /*
    $conn_args = array(
            'host' => $ci->config->item('mq_host'),
            'port' => $ci->config->item('mq_port'),
            'login' => $ci->config->item('mq_user'),
            'password' => $ci->config->item('mq_password'),
            'vhost'=> $ci->config->item('mq_vhost')
            );
         */
    $e_name = $exchange; //交换机名
    $q_name = $queue; //队列名
    $k_route = $route; //路由key

    //print_r($conn_args);
    //创建连接和channel
    $conn = new AMQPConnection($conn_args);
    //print_r($conn);
    if (!$conn->connect()) {
        die("Cannot connect to the broker!\n");
    }
    $channel = new AMQPChannel($conn);

    //创建交换机
    $ex = new AMQPExchange($channel);
    $ex->setName($e_name);
    $ex->setType(AMQP_EX_TYPE_DIRECT); //direct类型
    $ex->setFlags(AMQP_DURABLE); //持久化
    $ex->declareExchange();
    //echo "Exchange Status:".$ex->declare()."\n";

    //创建队列
    $q = new AMQPQueue($channel);
    $q->setName($q_name);
    $q->setFlags(AMQP_DURABLE); //持久化
    $q->declareQueue();
    //echo "Message Total:".$q->declare()."\n";

    //绑定交换机与队列，并指定路由键
    //echo 'Queue Bind: '.$q->bind($e_name, $k_route)."\n";
    $q->bind($e_name, $k_route)."\n";
    $ex->publish($msg, $k_route);
    //阻塞模式接收消息
    $conn->disconnect();
}



