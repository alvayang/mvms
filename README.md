mvms
====
  
## 致谢

  感谢开发这个小工具中给予我极大帮助的人: [jason](http://weibo.com/yangjiheng)，多媒体大拿。
    
  
## 介绍

Micro Video Management System.
正如名字所说的，这是个非常微小的VMS，它能为你做什么？

* 帮你把指定位置上的视频转码到MP4和M3U8，目前码率和分辨率我都写死了，谁让它使M版本的。
* 帮你抓取优酷的M3U8地址
* 预览MP4格式的结果（优酷的就别想了，只是得到了远程的M3U8的地址）

## 依赖

为了得到上面这两个小功能，你需要做如下的准备：

* Python 2.7
* Nginx
* RabbitMQ
* PHP 5.3+
* Git,能来这里，肯定有这个的.
* MySQL
* PHP: AMQP
* Python: Pika
* FFMPEG 实测版本：ffmpeg version 2.2.git
* m3u8-segmentor
* supervisor

转MP4我用的libx264和aac,因此你得有这俩支持才行。

## 工作目录介绍：

    confs/目录下全部都是配置文件，有supervisor的，有nginx的，有数据库的
    scripts/转码的工作脚本所在地
  
    Codeignitor的标准目录：
    application
    system
  
    static是存放静态文件的地方，转码的结果也在这里，所以最好是让nginx直接托管了这个目录。
  
  
## 安装  

### 配置RabbitMQ

* 配置RabbitMQ，添加用户，hosts，和queue，并且记下来这些内容。
* 修改scripts/config.py和application/config/config.php中关于RabbitMQ的章节


### 配置数据库
* 创建数据库用户和密码，以及数据库，然后导入 confs/video.sql
* 修改 applications/config/database.php中的口令和密码，或者你懒省事，抄下面的example也行.

### 配置supervisor
  
    cp confs/supervisor.conf /etc/supervisor/conf.d/video.conf
    supervisorctl reload

如果觉得进程数不够，请自行修改。    


### Example
这个完全是给懒人打造的安装过程

#### MySQL

    create database video;
    grant all privileges on video.* to video@'localhost'  identified by 'MTQwMDM3Nzg1NAo';
    flush privileges;
    
#### Nginx
    cp confs/nginx.conf /etc/nginx/sites-enable/video.conf
    /etc/init.d/nginx restart
    
#### Supervisor
    cp confs/supervisor.conf /etc/supervisor/conf.d/video.conf
    supervisorctl reload
    

## 管理员信息

    默认的管理员和密码都是admin
    [Demo](http://video.1in1.cn)
  
