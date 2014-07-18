-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: shoulashou
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Comments`
--

DROP TABLE IF EXISTS `Comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_uid` int(11) NOT NULL DEFAULT '1',
  `comment_content` varchar(255) NOT NULL,
  `comment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pid` int(11) DEFAULT '0',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comments`
--

LOCK TABLES `Comments` WRITE;
/*!40000 ALTER TABLE `Comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `passwd` varchar(32) NOT NULL,
  `salt` varchar(32) NOT NULL,
  `privilege` text NOT NULL,
  `lastip` bigint(20) NOT NULL,
  `lastdt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (3,'admin','41b9eca540bdaeea774848872fb4546f','f69b39ffa35f3c972c3db3e049f6a63c','all',0,'2014-07-07 16:14:50'),(4,'alvayang','cb96f7c5684fae7ea937cf31b80ef1d5','f64e55ceb0e492aa60f85ff23067c37f','admin',0,'2014-07-15 01:40:47');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basic_order`
--

DROP TABLE IF EXISTS `basic_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basic_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `omid` int(11) NOT NULL,
  `price` double NOT NULL,
  `fromuser` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `relate_products` text NOT NULL,
  `tid` varchar(255) NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `fromuser` (`fromuser`),
  KEY `fromuser_2` (`fromuser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basic_order`
--

LOCK TABLES `basic_order` WRITE;
/*!40000 ALTER TABLE `basic_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `basic_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basic_products`
--

DROP TABLE IF EXISTS `basic_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basic_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `price` double NOT NULL,
  `discount` double NOT NULL,
  `sells` int(11) NOT NULL,
  `images` text NOT NULL,
  `omid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basic_products`
--

LOCK TABLES `basic_products` WRITE;
/*!40000 ALTER TABLE `basic_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `basic_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_app`
--

DROP TABLE IF EXISTS `custom_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_app` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `single` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_app`
--

LOCK TABLES `custom_app` WRITE;
/*!40000 ALTER TABLE `custom_app` DISABLE KEYS */;
INSERT INTO `custom_app` VALUES (11,'默认欢迎','2014-07-10 13:35:37',0),(12,'如何注册','2014-07-12 01:54:10',1),(13,'如何登录','2014-07-14 17:37:22',1);
/*!40000 ALTER TABLE `custom_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_app_detail`
--

DROP TABLE IF EXISTS `custom_app_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_app_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appid` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `imgheader` text NOT NULL,
  `seq` int(11) NOT NULL,
  `content` text NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `summary` text NOT NULL,
  `src` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_app_detail`
--

LOCK TABLES `custom_app_detail` WRITE;
/*!40000 ALTER TABLE `custom_app_detail` DISABLE KEYS */;
INSERT INTO `custom_app_detail` VALUES (11,11,'学习宝掌中学习平台“出线”','http://shoulashou.1in1.cn/ckfinder/userfiles/files/%E5%AD%A6%E4%B9%A0%E5%AE%9D(2).jpg',0,'<p>			</p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; list-style-type: none; color: rgb(88, 88, 88); font-family: 微软雅黑; font-size: 14px; line-height: 25px; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; &nbsp; &nbsp;不比别人笨，为何成绩不如人?</p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; list-style-type: none; color: rgb(88, 88, 88); font-family: 微软雅黑; font-size: 14px; line-height: 25px; white-space: normal; background-color: rgb(255, 255, 255);\">　　中学生的智商都差不多，为什么学习成绩却如此千差万别?有些同学学习很努力很刻苦，为什么成绩却不好?关键是他们还没有找到最好的学习方法和适合自己的老师。</p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; list-style-type: none; color: rgb(88, 88, 88); font-family: 微软雅黑; font-size: 14px; line-height: 25px; white-space: normal; background-color: rgb(255, 255, 255);\">　　手拉手网络授课——为你提供最好的学习方法和最适合你的老师</p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; list-style-type: none; color: rgb(88, 88, 88); font-family: 微软雅黑; font-size: 14px; line-height: 25px; white-space: normal; background-color: rgb(255, 255, 255);\">　　提高学习成绩，正是手拉手教育的最高宗旨。选择手拉手，给孩子一个改变的机会，实现快乐高效的学习&quot;。</p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; list-style-type: none; color: rgb(88, 88, 88); font-family: 微软雅黑; font-size: 14px; line-height: 25px; white-space: normal; background-color: rgb(255, 255, 255);\">　　手拉手网络教育简介：</p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; list-style-type: none; color: rgb(88, 88, 88); font-family: 微软雅黑; font-size: 14px; line-height: 25px; white-space: normal; background-color: rgb(255, 255, 255);\">　　手拉手网络教育是中国领先的高端教育机构，由网络精英、一线在职教师联合创立，让你足不出户享受优质的教学资源，体验多媒体教学课堂。自创立伊始，手拉手即秉持教育创新的理念和国际运营模式，立志成为中国教育行业最受尊敬的品牌。手拉手网络教育自开办以来，倍受学生以及家长的信赖。</p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; list-style-type: none; color: rgb(88, 88, 88); font-family: 微软雅黑; font-size: 14px; line-height: 25px; white-space: normal; background-color: rgb(255, 255, 255);\">　　手拉手网络教育的理念是：全面提升学生学习力，让学生快乐高效地学习!手拉手网络教育始终将学员满意度及成绩进步率作为衡量工作质量的首要标准。成功学员中包括多名重点中学校内尖子生或中高考单科满分学员。同时，98%的学员对手拉手网络教育的教学质量表示满意并愿意将手拉手网络教育推荐给朋友。过硬的教学质量让手拉手网络教育得到了众多权威机构和媒体的肯定，也让手拉手教育与各大重点中学取得了长期合作的机会。</p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; list-style-type: none; color: rgb(88, 88, 88); font-family: 微软雅黑; font-size: 14px; line-height: 25px; white-space: normal; background-color: rgb(255, 255, 255);\">　　提高学习成绩，选择手拉手的四大理由：</p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; list-style-type: none; color: rgb(88, 88, 88); font-family: 微软雅黑; font-size: 14px; line-height: 25px; white-space: normal; background-color: rgb(255, 255, 255);\">　　一、 足不出户就能享受优质的教学资源</p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; list-style-type: none; color: rgb(88, 88, 88); font-family: 微软雅黑; font-size: 14px; line-height: 25px; white-space: normal; background-color: rgb(255, 255, 255);\">　　炎热的夏天、寒冷的冬天、漆黑的晚上，这些统统不再是你享受优质的课外辅导的阻碍，无论你在哪里，只要打开电脑，进入手拉手网站，就可以与名师面对面。</p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; list-style-type: none; color: rgb(88, 88, 88); font-family: 微软雅黑; font-size: 14px; line-height: 25px; white-space: normal; background-color: rgb(255, 255, 255);\">　　二、 一线在职教师、高级教师，准确把握考试重点</p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; list-style-type: none; color: rgb(88, 88, 88); font-family: 微软雅黑; font-size: 14px; line-height: 25px; white-space: normal; background-color: rgb(255, 255, 255);\">　　手拉手的授课老师全部是来自一线教学的高级教师，拥有丰富独到的教学经验，能够精确把握考试的重点难点及学生的特点，教学方法灵活多样，易于学生消化吸收，让学生的学习效率事半功倍，保证辅导的最佳效果。</p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; list-style-type: none; color: rgb(88, 88, 88); font-family: 微软雅黑; font-size: 14px; line-height: 25px; white-space: normal; background-color: rgb(255, 255, 255);\">　　三、花最少的时间，提更高的分数</p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; list-style-type: none; color: rgb(88, 88, 88); font-family: 微软雅黑; font-size: 14px; line-height: 25px; white-space: normal; background-color: rgb(255, 255, 255);\">　　手拉手网络授课，避免了从家到辅导班的奔波，避免了时间的浪费。在手拉手教育辅导过的学员，98%以上的学员成绩大幅度提升，单科成绩提高20到40分不等。</p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p>\n		</p>','2014-07-11 02:17:37','',''),(13,12,'注册账号','http://shoulashou.1in1.cn/ckfinder/userfiles/images/th.jpeg',0,'<p>			</p><p><br/></p><p>为啥要注册账号呢？</p><p>我们的一些高级服务，需要以账号为基础，因此，需要您注册一下，注册流程很简单：</p><p><br/></p><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>关注微信号 shou_la_shou</p></li><li><p>发送多条注册消息，格式为: 注册 [属性] 值</p></li><ol class=\" list-paddingleft-2\" style=\"list-style-type: lower-alpha;\"><li><p>属性包括：</p></li><ol class=\" list-paddingleft-2\" style=\"list-style-type: lower-roman;\"><li><p>姓名</p></li><li><p>性别</p></li><li><p>年龄</p></li><li><p>昵称</p></li><li><p>密码</p></li><li><p>地址（参与活动需要这个）</p><p><br/></p></li></ol></ol></ol><p>举个例子：</p><p>注册 姓名 二毛</p><p>注册 性别 男</p><p>注册 年龄 18</p><p>注册 昵称 二毛</p><p>注册 密码 123123</p><p>注册 地址 北京市朝阳区大望路90号soho现代城B座203室</p><p><br/></p><p>\n		</p>','2014-07-12 02:08:04','',''),(14,11,'视频在线看，提高好帮手','http://shoulashou.1in1.cn/ckfinder/userfiles/files/study.jpg',2,'<p>			</p><p>如何观看视频：</p><p>当然，你需要关注我们的账号啦：</p><p>搜索好友:shou_la_shou，</p><p>或者扫描我们的二维码：</p><p><img src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405316068156886.jpg\" title=\"qrcode_for_gh_106dc37e790f_258.jpg\"/></p><p>关注之后，会给您推一份信息，带有我们的一些宣传和介绍（随便发消息也可以得到哟）.</p><p><img src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405316218419951.png\" style=\"float:none;\" title=\"IMG_0955.PNG\"/></p><p>点击上面的文章，就可以在文章最下面找到：</p><p><img src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405316222380827.png\" style=\"float:none;\" title=\"IMG_0956.PNG\"/></p><p>点击 “开始学习”&nbsp;按钮：</p><p><br/></p><p><img src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405316224204215.png\" style=\"float:none;\" title=\"IMG_0957.PNG\"/></p><p>这时候，就可以看你需要的内容了。</p><p>下面我们演示一下怎么找视频呢：</p><p><img src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405316226725534.png\" style=\"float:none;\" title=\"IMG_0958.PNG\"/></p><p>点击“地理技能提升视频教学”,进入到这个知识点当中。</p><p><img src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405316233913710.png\" style=\"float:none;\" title=\"IMG_0960.PNG\"/></p><p>点击“点击查看视频”，就可以通过视频学习了，配上下面的图文，就可以多媒体学习啦。</p><p>点击“点击查看知识点的练习题”，就可以查看和这个知识点相关配套的经典例题了。</p><p><br/></p><p>好了，到这里就可以自由自在的学习了。</p><p>有什么问题，可以直接通过微信给我们回复哦。</p><p><br/></p><p><br/></p><p>\n		</p>','2014-07-14 09:53:07','',''),(15,13,'如何登录系统','http://shoulashou.1in1.cn/ckfinder/userfiles/files/study.jpg',0,'<p>本系统的登录，不需要网页，只需要你向微信公众号发送一个“登录”字符，微信公众号会给你一个登录的链接，点击这个链接地址，就可以访问受限制资源啦。</p><p>看图：</p><p><img src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405360065242155.png\" style=\"float:none;\" title=\"IMG_0961.PNG\"/></p><p>点击“开始学习”，就进入登录状态啦。</p><p><img src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405360067516152.png\" style=\"float:none;\" title=\"IMG_0963.PNG\"/></p><p><br/></p>','2014-07-14 17:48:46','','');
/*!40000 ALTER TABLE `custom_app_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extend_order`
--

DROP TABLE IF EXISTS `extend_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extend_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) NOT NULL,
  `proname` text NOT NULL,
  `proval` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extend_order`
--

LOCK TABLES `extend_order` WRITE;
/*!40000 ALTER TABLE `extend_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `extend_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extend_products`
--

DROP TABLE IF EXISTS `extend_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extend_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `proname` varchar(255) NOT NULL,
  `proval` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extend_products`
--

LOCK TABLES `extend_products` WRITE;
/*!40000 ALTER TABLE `extend_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `extend_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game` (
  `game_id` int(11) NOT NULL AUTO_INCREMENT,
  `game_name` varchar(255) NOT NULL,
  `game_url` varchar(255) NOT NULL,
  `game_img` varchar(50) NOT NULL COMMENT '�齱��ͼ',
  `game_condition` varchar(255) DEFAULT 'any',
  PRIMARY KEY (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_item`
--

DROP TABLE IF EXISTS `game_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_item` (
  `game_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `game_item_name` varchar(255) NOT NULL,
  `game_item_url` varchar(255) NOT NULL DEFAULT '*',
  `game_item_img` varchar(50) NOT NULL,
  `game_id` int(11) NOT NULL,
  PRIMARY KEY (`game_item_id`),
  KEY `game_id` (`game_id`),
  CONSTRAINT `game_item_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_item`
--

LOCK TABLES `game_item` WRITE;
/*!40000 ALTER TABLE `game_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_result`
--

DROP TABLE IF EXISTS `game_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_result` (
  `game_result_id` int(11) NOT NULL AUTO_INCREMENT,
  `game_uid` int(11) NOT NULL DEFAULT '1',
  `game_id` int(11) NOT NULL,
  `game_item_id` int(11) NOT NULL,
  `game_prize_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`game_result_id`),
  KEY `game_item_id` (`game_item_id`),
  KEY `game_id` (`game_id`),
  CONSTRAINT `game_result_ibfk_1` FOREIGN KEY (`game_item_id`) REFERENCES `game_item` (`game_item_id`) ON DELETE CASCADE,
  CONSTRAINT `game_result_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `game` (`game_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_result`
--

LOCK TABLES `game_result` WRITE;
/*!40000 ALTER TABLE `game_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_wheel_item`
--

DROP TABLE IF EXISTS `game_wheel_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_wheel_item` (
  `wheel_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `wheel_item_name` varchar(20) NOT NULL,
  `wheel_item_probility` int(11) NOT NULL,
  `wheel_item_detail` varchar(255) DEFAULT NULL,
  `wheel_id` int(11) NOT NULL,
  PRIMARY KEY (`wheel_item_id`),
  KEY `wheel_id` (`wheel_id`),
  CONSTRAINT `game_wheel_item_ibfk_1` FOREIGN KEY (`wheel_id`) REFERENCES `wheel` (`wheel_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_wheel_item`
--

LOCK TABLES `game_wheel_item` WRITE;
/*!40000 ALTER TABLE `game_wheel_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_wheel_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hm_config`
--

DROP TABLE IF EXISTS `hm_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hm_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hmkey` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`hmkey`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hm_config`
--

LOCK TABLES `hm_config` WRITE;
/*!40000 ALTER TABLE `hm_config` DISABLE KEYS */;
INSERT INTO `hm_config` VALUES (21,'mp_login','1503456588@qq.com'),(22,'mp_password','alvayang@1in1'),(23,'mp_type','2'),(24,'mp_cookie',' data_bizuin=2394651414; Path=/; Secure; HttpOnly;  data_ticket=AgWgpPpdCvqRo+RKiEw9PxX9; Path=/; Secure; HttpOnly;  slave_user=gh_106dc37e790f; Path=/; Secure; HttpOnly;  slave_sid=eGVsYUt6eW1sTEI0ZEpRWHpEd25HcFFZdDEydDJIbHdvWmRRdHYxUW1MX2ppbjBKQzZYa2ZZMktJWEpqREpERFY1VmVORGJyaGQ3Mlc1REZQVWZhc3R5aE1taTNJa1JvZ1FQbVA3TUVxT2xrYzNUUmdscHY2SG9mY1BsK2ptMTc=; Path=/; Secure; HttpOnly;  bizuin=2394651414; Path=/; Secure; HttpOnly'),(25,'mp_token','99461c3d1e4f90e82f80aab4c889e0e2'),(26,'appid',''),(27,'secret','');
/*!40000 ALTER TABLE `hm_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyword`
--

DROP TABLE IF EXISTS `keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(128) NOT NULL,
  `gid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `word` (`word`),
  KEY `gid` (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyword`
--

LOCK TABLES `keyword` WRITE;
/*!40000 ALTER TABLE `keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyword_group`
--

DROP TABLE IF EXISTS `keyword_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyword_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(128) NOT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `group_name` (`group_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyword_group`
--

LOCK TABLES `keyword_group` WRITE;
/*!40000 ALTER TABLE `keyword_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `keyword_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) NOT NULL,
  `act` varchar(255) NOT NULL,
  `func` varchar(255) NOT NULL,
  `extra` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(32) NOT NULL,
  `is_member` tinyint(4) NOT NULL,
  `nickname` varchar(64) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `address` text NOT NULL,
  `province` varchar(10) NOT NULL,
  `city` varchar(60) NOT NULL,
  `lastdt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `country` varchar(20) NOT NULL,
  `subscribe_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `headimgurl` text NOT NULL,
  `language` varchar(32) NOT NULL,
  `groupid` int(11) NOT NULL,
  `sex` int(11) NOT NULL,
  `subscribe` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `realname` varchar(255) NOT NULL,
  `age` int(3) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `attendance` int(11) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL,
  `lastqd` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `introducer` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (15,'ocPl-jnSxL3QnPCMehLhTe6sqVXQ',1,'糊涂是福','18610104680','北京市 朝阳区','','','2014-07-14 17:44:11','','0000-00-00 00:00:00','','',0,1,0,'','学习宝',22,'',100,'','0000-00-00 00:00:00',30),(16,'ocPl-jn0yHYYrdYCO5k9bRka2EPE',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(18,'ocPl-jjA9ytLXzueiI2xjQs0skA0',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(19,'ocPl-jpuX41lCe3hask3BV1UdzUw',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(20,'ocPl-jvAiAsOjusKeKbhxvRrSflE',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(21,'ocPl-ju9qWINkKKi7bzjiHOh9qqQ',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(22,'ocPl-jqsmnS0y21e5dUmkAV8lmAs',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(23,'ocPl-juTQ0MbtxKbwz4A859a79Uo',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(24,'ocPl-jn6g51WfU4iq7ypoyJ1iLP4',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(25,'ocPl-jnCew3gejQfr4nwMTbmzzDM',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(26,'ocPl-jnCCnVTc0N2o9X2fkN-U7xA',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(27,'ocPl-jv3Se_qMZJneR4LZ_xGSdFg',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(28,'ocPl-jo8dinpFX8uHztl-SaOtDFM',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(29,'ocPl-jl9mAVV7M2g3xJqCvFDQ8Lg',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(30,'ocPl-jukFaJKvAqHa9mzV0vZy84g',1,'alvayang','18610104680','北京市朝阳区 大望路','','','2014-07-14 14:30:06','','0000-00-00 00:00:00','','',0,1,0,'','杨松',0,'',102,'','0000-00-00 00:00:00',0),(31,'ocPl-juZHeLOCeD4wBotjLscrS1Q',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(32,'ocPl-jstJxFmRziKH7Sr-bZrs1XA',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(33,'ocPl-jvG_NiwDN8y9PQdxHF4iylA',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(34,'ocPl-jnCAdme_4txH4iMCpit2eKU',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(35,'ocPl-jhRyC2e5HaitlahxBps6QPg',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(36,'ocPl-jhzR-meRF9kiwGj-pqmXKjg',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(37,'ocPl-jnyM6KKQpqTqT1XnhNU93cs',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(38,'ocPl-jgdA9YdVwa1Yv0rljhemraU',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(39,'ocPl-jjquznQgHiBk_GwOHNJ1Kpo',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(40,'ocPl-jhxEDiLBe__duStDIYApNVY',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(41,'ocPl-jlp070uffp2n9NIyysABv8g',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(42,'ocPl-jty3NS3DzQ3QB1F2PM9x31E',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(43,'ocPl-jhjpgTCp3YaR7cvCmKz_8qw',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(44,'ocPl-jk4-MenmsREPyZIT37yohUQ',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(45,'ocPl-jhkVF6qhN9RiLFArfzppq34',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(46,'ocPl-jpSjnSIkDbJaU8bvztmSkOY',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(47,'ocPl-jn6EAiFYGH75oREltljLsqo',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(48,'ocPl-jm_x7lIt4jtDHj7DSGnyHVc',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(49,'ocPl-jpZ_9jYsRk2gF0MH1rqvaAk',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(51,'ocPl-jregNQgqdFVHhQrZGosCOrM',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(52,'ocPl-jntahB0SVCVkIuPUEC3IrfQ',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(53,'ocPl-jlhEX153vkqJaGQAj1Lcc6c',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(55,'ocPl-jkHQoWbhJYKxeyh1bvGC8Lk',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(56,'ocPl-jsz3ERvkuEiAkNP0FnSEK50',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0),(57,'ocPl-jkXYBRkGqr8iJMA_rgy6gmk',0,'','','','','','0000-00-00 00:00:00','','0000-00-00 00:00:00','','',0,0,0,'','',0,'',0,'','0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_group`
--

DROP TABLE IF EXISTS `member_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  `mp_id` bigint(20) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_group`
--

LOCK TABLES `member_group` WRITE;
/*!40000 ALTER TABLE `member_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `cmd` text NOT NULL,
  `pid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minisite_articles`
--

DROP TABLE IF EXISTS `minisite_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `minisite_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `module` int(11) NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `manager` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `vid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minisite_articles`
--

LOCK TABLES `minisite_articles` WRITE;
/*!40000 ALTER TABLE `minisite_articles` DISABLE KEYS */;
INSERT INTO `minisite_articles` VALUES (17,'<p>				</p><p><br/></p><p><img width=\"550\" height=\"342\" title=\"1.png\" style=\"width: 466px; height: 331px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404985872328493.png\"/></p><p><img width=\"555\" height=\"339\" title=\"2.png\" style=\"width: 425px; height: 325px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404985874705886.png\"/></p><p><img width=\"547\" height=\"283\" title=\"3.png\" style=\"width: 412px; height: 319px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404985876129670.png\"/></p><p><img width=\"530\" height=\"221\" title=\"4.png\" style=\"width: 403px; height: 218px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404985877826693.png\"/></p><p><img width=\"544\" height=\"314\" title=\"5.png\" style=\"width: 416px; height: 339px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404985879373445.png\"/></p><p><img width=\"549\" height=\"352\" title=\"6.png\" style=\"width: 417px; height: 371px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404985881629558.png\"/></p><p><img width=\"565\" height=\"333\" title=\"7.png\" style=\"width: 405px; height: 418px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404985884459279.png\"/></p><p><img width=\"527\" height=\"374\" title=\"8.png\" style=\"width: 370px; height: 253px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404985887598882.png\"/></p><p><img width=\"548\" height=\"403\" title=\"9.png\" style=\"width: 365px; height: 246px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404985891964192.png\"/></p><p><img width=\"564\" height=\"383\" title=\"10.png\" style=\"width: 386px; height: 300px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404985895140544.png\"/></p><p><img width=\"567\" height=\"407\" title=\"11.png\" style=\"width: 405px; height: 362px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404985901877605.png\"/></p><p><img width=\"491\" height=\"290\" title=\"12.png\" style=\"width: 396px; height: 289px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404985902817533.png\"/></p><p><img width=\"458\" height=\"348\" title=\"13.png\" style=\"width: 383px; height: 332px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404985904185704.png\"/></p><p><img width=\"510\" height=\"289\" title=\"14.png\" style=\"width: 395px; height: 265px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404985905841981.png\"/></p><p><img width=\"448\" height=\"306\" title=\"15.png\" style=\"width: 398px; height: 299px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404985907240941.png\"/></p><p><img width=\"472\" height=\"315\" title=\"16.png\" style=\"width: 403px; height: 309px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404985909337716.png\"/></p><p><img width=\"505\" height=\"309\" title=\"17.png\" style=\"width: 432px; height: 310px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404985910792787.png\"/></p><p><img width=\"502\" height=\"337\" title=\"18.png\" style=\"width: 409px; height: 299px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404985912106719.png\"/></p><p><img title=\"19.png\" style=\"float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404986316950327.png\"/></p><p><img width=\"519\" height=\"352\" title=\"20.png\" style=\"width: 401px; height: 281px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404986318397658.png\"/></p><p><img width=\"518\" height=\"216\" title=\"21.png\" style=\"width: 426px; height: 211px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404986319164423.png\"/></p><p><img width=\"532\" height=\"386\" title=\"22.png\" style=\"width: 435px; height: 444px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404986321954507.png\"/></p><p><img width=\"551\" height=\"332\" title=\"23.png\" style=\"width: 432px; height: 441px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404986324333356.png\"/></p><p><img width=\"533\" height=\"330\" title=\"24.png\" style=\"width: 439px; height: 351px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404986343715809.png\"/></p><p><img width=\"551\" height=\"372\" title=\"25.png\" style=\"width: 469px; height: 402px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404986345883210.png\"/></p><p><img width=\"532\" height=\"341\" title=\"26.png\" style=\"width: 455px; height: 392px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404986347697791.png\"/></p><p><img width=\"527\" height=\"350\" title=\"27.png\" style=\"width: 464px; height: 356px; float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404986349478208.png\"/></p><p><br/></p><p><br/></p><p>\n				</p>','等高线图的判读与应用',7,'2014-07-10 10:00:58',3,146,0),(18,'<p><img title=\"1.png\" style=\"float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404989236426599.png\"/></p><p><img title=\"2.png\" style=\"float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404989239462907.png\"/></p><p><img title=\"3.png\" style=\"float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404989240563334.png\"/></p><p><img title=\"4.png\" style=\"float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404989242664518.png\"/></p><p><img title=\"5.png\" style=\"float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404989244552670.png\"/></p><p><img title=\"6.png\" style=\"float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404989246940908.png\"/></p><p><img title=\"7.png\" style=\"float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1404989247754788.png\"/></p><p></p>','地图',7,'2014-07-10 10:47:45',3,17,0),(19,'<p><img title=\"p1.png\" style=\"float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405048009549618.png\"/></p><p><img title=\"p2.png\" style=\"float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405048014624839.png\"/></p><p><img title=\"p3.png\" style=\"float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405048019150316.png\"/></p><p></p>','集合的概念与运算',12,'2014-07-11 03:07:31',3,17,0),(20,'<p><img src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405070975782598.png\" style=\"float:none;\" title=\"p1.png\"/></p><p><img src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405070979662223.png\" style=\"float:none;\" title=\"p2.png\"/></p><p><img src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405070984562703.png\" style=\"float:none;\" title=\"p3.png\"/></p><p><br/></p>','命题及充要条件',12,'2014-07-11 09:30:05',3,3,0),(21,'<p><img title=\"pr1.png\" style=\"float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405076301274834.png\"/></p><p><img title=\"pr2.png\" style=\"float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405076304925941.png\"/></p><p><img title=\"pr3.png\" style=\"float: none;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405076312517557.png\"/></p><p></p>','逻辑联结词、全称量词与存在量词',12,'2014-07-11 10:58:45',3,7,0),(23,'<p>				</p><p><br/></p><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>各种图表的判读。</p></li><li><p>各种地理事物特征描述。</p></li><li><p>对地理事物进行分析、对比、评价。</p></li><li><p>各类地理问题及对策。&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</p></li></ol><p><br/></p><p><br/></p><p>\n				</p>','地理技能提升视频教学（一）',7,'2014-07-14 02:06:51',3,48,13),(24,'<p>				</p><p><br/></p><p>新东方,高中数学系列：</p><p>集合的含义与表示方法</p><p><br/></p><p>\n				</p>','[新东方]1.集合的含义与表示方法',12,'2014-07-14 16:57:25',3,17,18),(25,'<p>				</p><p>[新东方]集合的运算</p><p>\n				</p>','[新东方]2.集合的运算',12,'2014-07-14 17:11:09',3,8,19),(26,'<p>				</p><p>[新东方]3. 映射 函数的概念</p><p>\n				</p>','[新东方]3. 映射 函数的概念',12,'2014-07-14 17:11:46',3,6,20),(27,'<p>[新东方]4 函数的表示方法</p>','[新东方]4 函数的表示方法',12,'2014-07-14 17:14:44',3,7,21),(28,'<p>5 函数的性质:单调性与最值</p>','[新东方]05 函数的性质:单调性与最值',12,'2014-07-14 17:15:11',3,10,22),(29,'<p>6 函数的性质:奇偶性与对称</p>','[新东方]06 函数的性质:奇偶性与对称',12,'2014-07-14 17:15:52',3,2,23),(30,'<p>07 函数综合问题</p>','[新东方]07 函数综合问题',12,'2014-07-14 17:16:54',3,10,24),(31,'<p>8 指数运算 对数运算</p>','[新东方]8 指数运算 对数运算',12,'2014-07-14 17:17:49',3,5,25),(32,'<p>9 指数函数 对数函数</p>','[新东方]9 指数函数 对数函数',12,'2014-07-14 17:18:24',3,0,25),(33,'<p>10 方程 不等式 函数</p>','[新东方]10 方程 不等式 函数',12,'2014-07-14 17:18:56',3,0,27),(34,'<p>[新东方]11. 函数的应用</p>','[新东方]11. 函数的应用',12,'2014-07-14 17:28:44',3,0,28),(35,'<p>				</p><p>正弦定理视频教学</p><p>\n				</p>','等比数列定义',15,'2014-07-15 09:18:45',21,15,30),(36,'<p>				</p><p>线状分布图</p><p>\n				</p>','地理技能提升视频教学（二）',7,'2014-07-15 13:13:48',3,6,46),(37,'<p>高二数学·正弦定理。</p>','正弦定理',15,'2014-07-16 02:52:50',3,0,36),(38,'<p><span style=\"color: rgb(51, 51, 51); font-family: &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 20px; background-color: rgb(245, 245, 245);\">化学反应与能量变化</span></p>','化学反应与能量变化',16,'2014-07-16 06:24:44',3,0,47),(39,'<p class=\"p1\">等比数列的前N项和第一部分</p><p><br/></p>','等比数列的前N项和(一)',15,'2014-07-16 08:56:57',3,0,32);
/*!40000 ALTER TABLE `minisite_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minisite_modules`
--

DROP TABLE IF EXISTS `minisite_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `minisite_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(255) NOT NULL,
  `module_type` int(11) NOT NULL,
  `module_icon` text NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `module_name` (`module_name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minisite_modules`
--

LOCK TABLES `minisite_modules` WRITE;
/*!40000 ALTER TABLE `minisite_modules` DISABLE KEYS */;
INSERT INTO `minisite_modules` VALUES (7,'高中地理',0,'',0),(8,'高中英语',0,'',0),(10,'高中物理',0,'',0),(11,'高中化学',0,'',0),(12,'高中数学',0,'',0),(13,'视频专区',0,'http://shoulashou.1in1.cn/ckfinder/userfiles/files/study.jpg',0),(15,'高二数学',0,'',13),(16,'高二化学',0,'',13);
/*!40000 ALTER TABLE `minisite_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minisite_questions`
--

DROP TABLE IF EXISTS `minisite_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `minisite_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `module` int(11) NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `manager` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `answer` text NOT NULL,
  `qdesc` text NOT NULL,
  `tdesc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minisite_questions`
--

LOCK TABLES `minisite_questions` WRITE;
/*!40000 ALTER TABLE `minisite_questions` DISABLE KEYS */;
INSERT INTO `minisite_questions` VALUES (1,'<p>xxx</p>','xxz',14,'2014-07-10 08:30:23',3,0,'','',''),(2,'<p>题目1</p>','等高线-1',15,'2014-07-10 09:50:26',3,1,'','',''),(3,'<p>等高线2</p>','等高线2',15,'2014-07-10 09:50:38',3,0,'','',''),(4,'<p>等高线3等高线3等高线3等高线3等高线3</p><p>等高线3等高线3等高线3</p><p>等高线3等高线3等高线3</p>','等高线3',15,'2014-07-10 09:57:20',3,0,'','',''),(9,'<p><img width=\"630\" height=\"251\" title=\"图片d1.png\" style=\"width: 609px; height: 185px;\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405003030789180.png\"/><img title=\"图片d2.png\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405003299448331.png\"/></p>','题1',17,'2014-07-10 14:49:09',3,2,'<p>4. B</p><p></p>','<p><img title=\"图片d3.png\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405003601579092.png\"/></p>','0'),(13,'<p><img title=\"图片d4.png\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405005489428211.png\"/></p>','题2',17,'2014-07-10 15:19:53',3,0,'','<p><img title=\"图片d6.png\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405005584147529.png\"/></p>','0'),(14,'<p><img title=\"t1.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405054497966934.jpg\"/></p>','题1',19,'2014-07-11 04:56:39',3,3,'<p>D:4</p>','<p><img title=\"x1.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405054528282943.jpg\"/></p>','0'),(15,'<p><img title=\"t2.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405054641701027.jpg\"/></p>','题2',19,'2014-07-11 04:58:19',3,0,'<p>B</p>','<p><img title=\"x2.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405054668536691.jpg\"/></p>','0'),(16,'<p><img title=\"t3.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405054731526678.jpg\"/></p>','题3',19,'2014-07-11 04:59:38',3,0,'<p>B</p>','<p><img title=\"x3.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405054760117330.jpg\"/></p>','0'),(17,'<p><img title=\"t4.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405054813278425.jpg\"/></p>','题4',19,'2014-07-11 05:00:43',3,0,'<p>A</p>','<p><img title=\"x4.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405054834874092.jpg\"/></p>','0'),(18,'<p><img title=\"t5.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405054874171511.jpg\"/></p>','题5',19,'2014-07-11 05:01:47',3,0,'<p>D</p>','<p><img title=\"x5.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405054898962803.jpg\"/></p>','0'),(19,'<p><img title=\"t6.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405054939489203.jpg\"/></p>','题6',19,'2014-07-11 05:03:05',3,0,'<p>A</p>','<p><img title=\"x6.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405054963593303.jpg\"/></p>','0'),(20,'<p><img title=\"t7.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405055011283274.jpg\"/></p>','题7',19,'2014-07-11 05:04:02',3,0,'<p>A</p>','<p><img title=\"x7.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405055029629786.jpg\"/></p>','0'),(21,'<p><img title=\"t8.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405055074436220.jpg\"/></p>','题8',19,'2014-07-11 05:05:13',3,0,'<p>D</p>','<p><img title=\"x8.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405055099289348.jpg\"/></p>','0'),(22,'<p><img title=\"t9.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405055144187894.jpg\"/></p>','题9',19,'2014-07-11 05:06:15',3,0,'0','<p>C</p>','<p><img title=\"x9.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405055164977747.jpg\"/></p>'),(23,'<p><img title=\"t10.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405055208623525.jpg\"/></p>','题10',19,'2014-07-11 05:07:23',3,1,'<p>C</p>','<p><img title=\"x10.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405055231938229.jpg\"/></p>','0'),(24,'<p><img src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405071052550233.jpg\" title=\"t1.jpg\"/></p>','题1',20,'2014-07-11 09:31:35',3,0,'<p>A</p>','<p><img src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405071078746047.jpg\" title=\"x1.jpg\"/></p>','0'),(25,'<p><img src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405071129618222.jpg\" title=\"t2.jpg\"/></p>','题2',20,'2014-07-11 09:32:40',3,0,'<p>B</p>','<p><img src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405071149642360.jpg\" title=\"x2.jpg\"/></p>','0'),(26,'<p><img src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405071189800569.jpg\" title=\"t3.jpg\"/></p>','题3',20,'2014-07-11 09:33:38',3,0,'<p>A</p>','<p><img src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405071206867946.jpg\" title=\"x3.jpg\"/></p>','0'),(28,'<p><img src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405071424340091.jpg\" title=\"t4.jpg\"/></p>','题4',20,'2014-07-11 09:38:16',3,0,'<p>3、4</p>','<p><img src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405071473989532.jpg\" title=\"x4.jpg\"/></p>','<p><img src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405071447633906.jpg\" title=\"x4.jpg\"/></p>'),(29,'<p><img src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405071533318157.jpg\" title=\"t5.jpg\"/></p>','题5',20,'2014-07-11 09:39:24',3,0,'<p>D</p>','<p><img src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405071553599377.jpg\" title=\"x5.jpg\"/></p>','0'),(30,'<p><img src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405071590336405.jpg\" title=\"t6.jpg\"/></p>','题6',20,'2014-07-11 09:40:16',3,0,'<p>A</p>','<p><img src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405071607375925.jpg\" title=\"x6.jpg\"/></p>','0'),(33,'<p><img title=\"t1.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405076380868026.jpg\"/></p>','题1',21,'2014-07-11 11:00:34',3,1,'<p>C</p>','<p><img title=\"x1.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405076413350978.jpg\"/></p>',''),(34,'<p><img title=\"t2.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405076471665014.jpg\"/></p>','题2',21,'2014-07-11 11:01:47',3,1,'<p>B</p>','<p><img title=\"x2.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405076496946857.jpg\"/></p>','0'),(35,'<p><img title=\"t3.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405076541663410.jpg\"/></p>','题3',21,'2014-07-11 11:02:53',3,0,'<p>A</p>','<p><img title=\"x3.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405076563757683.jpg\"/></p>','0'),(36,'<p><img title=\"t4.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405076620608403.jpg\"/></p>','题4',21,'2014-07-11 11:04:51',3,0,'<p>B</p>','<p><img title=\"x4.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405076654994531.jpg\"/></p>','0'),(37,'<p><img title=\"t5.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405076729773593.jpg\"/></p>','题5',21,'2014-07-11 11:06:04',3,0,'<p>D</p>','<p><img title=\"x5.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405076753851020.jpg\"/></p>','0'),(38,'<p><img title=\"t6.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405076792462089.jpg\"/></p>','题6',21,'2014-07-11 11:07:13',3,0,'0','<p><img title=\"x6.jpg\" src=\"http://shoulashou.1in1.cn/..//static/users_data/editor//201407/1405076822955917.jpg\"/></p>','0');
/*!40000 ALTER TABLE `minisite_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_orders`
--

DROP TABLE IF EXISTS `model_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_name` varchar(255) NOT NULL,
  `properties` text NOT NULL,
  `payment` int(11) NOT NULL,
  `products` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_orders`
--

LOCK TABLES `model_orders` WRITE;
/*!40000 ALTER TABLE `model_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_products`
--

DROP TABLE IF EXISTS `model_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_name` varchar(255) NOT NULL,
  `properties` text NOT NULL,
  `payment` int(11) NOT NULL,
  `products` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_products`
--

LOCK TABLES `model_products` WRITE;
/*!40000 ALTER TABLE `model_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `seq` int(11) NOT NULL,
  `command` text NOT NULL,
  `reply` text NOT NULL,
  `type` int(11) NOT NULL,
  `prid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (33,'subscribe',0,'','11',2,0),(34,'default',0,'','11',2,0),(35,'管理地址',0,'admin','http://shoulashou.1in1.cn/admin/user/login',0,0);
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subsystems`
--

DROP TABLE IF EXISTS `subsystems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subsystems` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `menu` text NOT NULL,
  `icon` varchar(255) NOT NULL,
  `code` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subsystems`
--

LOCK TABLES `subsystems` WRITE;
/*!40000 ALTER TABLE `subsystems` DISABLE KEYS */;
INSERT INTO `subsystems` VALUES (114,'微官网','[{\"name\":\"\\u7f51\\u9875\\u6a21\\u677f\",\"url\":\"minisite\\/minisite\\/manager\"},{\"name\":\"\\u680f\\u76ee\\u7ba1\\u7406\",\"url\":\"minisite\\/minisite\\/modules_manager\"},{\"name\":\"\\u77e5\\u8bc6\\u70b9\\u7ba1\\u7406\",\"url\":\"minisite\\/minisite\\/list_article\"},{\"name\":\"\\u9898\\u76ee\\u7ba1\\u7406\",\"url\":\"minisite\\/minisite\\/list_questions\"},{\"name\":\"\\u7559\\u8a00\\u677f\\u7ba1\\u7406\",\"url\":\"comment\\/comment\\/listcomment\"}]','icon-eye-open','minisite'),(115,'会员系统','[{\"name\":\"\\u7c89\\u4e1d\\u4e2d\\u5fc3\",\"url\":\"members\\/members\\/listfans\"},{\"name\":\"\\u4f1a\\u5458\\u4e2d\\u5fc3\",\"url\":\"members\\/members\\/listmember\"},{\"name\":\"\\u4f1a\\u5458\\u5206\\u7ec4\",\"url\":\"members\\/groups\\/index\"}]','icon-tags','members'),(116,'微客服','[{\"name\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"url\":\"admin\\/video\"},{\"name\":\"\\u7d20\\u6750\\u7ba1\\u7406\",\"url\":\"admin\\/mp\\/articles\"},{\"name\":\"\\u5173\\u6ce8\\u56de\\u590d\\u8bbe\\u7f6e\",\"url\":\"admin\\/mp\\/display_subscribe_reply\"},{\"name\":\"\\u9ed8\\u8ba4\\u56de\\u590d\\u8bbe\\u7f6e\",\"url\":\"admin\\/mp\\/display_default_reply\"},{\"name\":\"\\u81ea\\u5b9a\\u4e49\\u56de\\u590d\\u8bbe\\u7f6e\",\"url\":\"admin\\/mp\\/display_custom_reply\"},{\"name\":\"\\u8865\\u5145\\u81ea\\u5b9a\\u4e49\\u56de\\u590d\",\"url\":\"admin\\/mp\\/display_append_reply\"},{\"name\":\"\\u7ba1\\u7406\\u5173\\u952e\\u5b57\",\"url\":\"keyword\\/keyword\\/index\"}]','icon-user','mp');
/*!40000 ALTER TABLE `subsystems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_resource`
--

DROP TABLE IF EXISTS `tbl_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resource_type` tinyint(4) DEFAULT NULL,
  `resource_src` text,
  `duration` double DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `video_format` varchar(45) DEFAULT NULL,
  `sites` int(11) NOT NULL DEFAULT '0',
  `times` int(11) NOT NULL DEFAULT '0',
  `prize` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_resource`
--

LOCK TABLES `tbl_resource` WRITE;
/*!40000 ALTER TABLE `tbl_resource` DISABLE KEYS */;
INSERT INTO `tbl_resource` VALUES (13,1,'/home/vsftpd/alvayang/M20140713_160141.asf',0,'142a291371af2aab072ef97189def0ac','asf',0,3,0),(14,1,'/home/vsftpd/alvayang/金毛预测.mp4',0,'440337c22b9fa22e0e801855597e8fff','mp4',0,0,0),(15,1,'/home/vsftpd/alvayang/舌尖上的韩国.mp4',0,'28ce5133f299365947049c7b0dc9ac14','mp4',0,0,0),(16,1,'/home/vsftpd/alvayang/范佩西罗本合轰4球击溃世界冠军.mp4',0,'3ac004c18132df14665613258f93d8c4','mp4',0,0,0),(17,1,'/home/vsftpd/alvayang/IMG_0030.m4v',0,'66de30f502dae559d6dc8f946c1b3181','m4v',0,0,0),(18,1,'http://v.youku.com/player/getM3U8/vid/149182196/type/mp4/sid/140535622815967/K/e5d4145650095c6a1411deba/video.m3u8',0,'集合的含义与表示方法','站外',1,24,0),(19,1,'http://v.youku.com/player/getM3U8/vid/149182325/type/mp4/sid/140535760713043/K/0f901d86b6f86efa161dc88d/video.m3u8',0,'集合的运算','站外',1,3,0),(20,1,'http://v.youku.com/player/getM3U8/vid/149182441/type/mp4/sid/140535762513017/K/c316b50bcaee75421411debb/video.m3u8',0,'映射 函数的概念','站外',1,4,0),(21,1,'http://v.youku.com/player/getM3U8/vid/149182664/type/mp4/sid/140535767210127/K/c316b50bcaee75421411debb/video.m3u8',0,'4函数的表示方法','站外',1,4,0),(22,1,'http://v.youku.com/player/getM3U8/vid/149182828/type/mp4/sid/140535772318851/K/c316b50bcaee75421411debb/video.m3u8',0,'05 函数的性质:单调性与最值','站外',1,4,0),(23,1,'http://v.youku.com/player/getM3U8/vid/149182974/type/mp4/sid/140535774011222/K/c316b50bcaee75421411debb/video.m3u8',0,'06 函数的性质:奇偶性与对称','站外',1,1,0),(24,1,'http://v.youku.com/player/getM3U8/vid/149183121/type/mp4/sid/140535775915006/K/0c2bf1e577fa3cb01829b260/video.m3u8',0,'08 函数综合问题','站外',1,5,0),(25,1,'http://v.youku.com/player/getM3U8/vid/149183248/type/mp4/sid/140535780513770/K/0f901d86b6f86efa161dc88d/video.m3u8',0,'09 指数运算 对数运算','站外',1,2,0),(26,1,'http://v.youku.com/player/getM3U8/vid/149183457/type/mp4/sid/140535782312911/K/c316b50bcaee75421411debb/video.m3u8',0,'10 指数函数 对数函数','站外',1,0,0),(27,1,'http://v.youku.com/player/getM3U8/vid/149183597/type/mp4/sid/140535783713961/K/c316b50bcaee75421411debb/video.m3u8',0,'11 方程 不等式 函数','站外',1,0,0),(28,1,'http://v.youku.com/player/getM3U8/vid/149183724/type/mp4/sid/140535880412321/K/c9bdfc0589df99591829b262/video.m3u8',0,'12 函数的应用','站外',1,0,0),(29,1,'/home/vsftpd/alvayang/01 集合的含义与表示方法.mp4',0,'52b8eb256a51838b9158147fb8a0630a','mp4',0,0,0),(30,1,'/home/vsftpd/alvayang/09 等比数列定义.mp4',0,'8bec381c09eae98c18268c80c70b077c','mp4',0,3,0),(31,1,'/home/vsftpd/alvayang/14 一元二次不等式及其解法.mp4',0,'be858b7f04f94e023b3a92f6d0eda2d6','mp4',0,0,0),(32,1,'/home/vsftpd/alvayang/11 等比数列的前n项和(一).mp4',0,'798b9eff2654bfba942fc87f7f5d0cc8','mp4',0,0,0),(33,1,'/home/vsftpd/alvayang/05 数列的概念及简单表示法.mp4',0,'128b98420a7233b7dfc9c034373d52fa','mp4',0,0,0),(34,1,'/home/vsftpd/alvayang/10  等比数列的性质.mp4',0,'63ef6a4a13a34fb08797ca54526bf640','mp4',0,0,0),(35,1,'/home/vsftpd/alvayang/15 二元一次不等式(组)与平面区域.mp4',0,'e3b981a824a7ea6d99f9a9cf81998c49','mp4',0,0,0),(36,1,'/home/vsftpd/alvayang/01 正弦定理.mp4',0,'c9fdbd9c9ebcf4213e374524da3b2635','mp4',0,5,0),(37,1,'/home/vsftpd/alvayang/16 简单的线性规划.mp4',0,'81cfb6d5906189ba6caddaadc6c14d09','mp4',0,0,0),(38,1,'/home/vsftpd/alvayang/17 基本不等式.mp4',0,'243126504ca8ec3e3d545feaa3c3e4c1','mp4',0,0,0),(39,1,'/home/vsftpd/alvayang/07 等差数列的前n项和(一).mp4',0,'f4a3c384c4894c5caf348f8dd72ef28d','mp4',0,0,0),(40,1,'/home/vsftpd/alvayang/12  等比数列的前n项和(二).mp4',0,'f4a93de73526827449461d20904f6e9e','mp4',0,0,0),(41,1,'/home/vsftpd/alvayang/13 不等关系和不等式.mp4',0,'b42d45225881d85fb0c2d9826c9651e7','mp4',0,0,0),(42,1,'/home/vsftpd/alvayang/06 等差数列.mp4',0,'9c26dce032753040a78cea854065026c','mp4',0,0,0),(43,1,'/home/vsftpd/alvayang/04 正弦定理和余弦定理在三角形中的应用.mp4',0,'f62d19ab6071e59634d87831c692f1e4','mp4',0,0,0),(44,1,'/home/vsftpd/alvayang/08  等差数列的前n项和(二).mp4',0,'6ddb67d139df4816830573eafcf4380c','mp4',0,0,0),(45,1,'/home/vsftpd/alvayang/02 余弦定理.mp4',0,'02d2f77bc830fe34c899fbc966a84c52','mp4',0,0,0),(46,1,'/home/vsftpd/alvayang/M20140715_160733.asf',0,'cd8ce20d636e0e799bee4871ee8b5618','asf',0,4,0),(47,1,'/home/vsftpd/alvayang/李强 第1讲 化学反应与能量变化.mp4',0,'d3b0deba8d2857ec70fa741f75b52161','mp4',0,0,0),(48,1,'/home/vsftpd/alvayang/01 单词记忆20法之联想记忆法.mp4',0,'98742a9576d506afd807af772886defc','mp4',0,0,0);
/*!40000 ALTER TABLE `tbl_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_video_convert`
--

DROP TABLE IF EXISTS `tbl_video_convert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_video_convert` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vid` bigint(20) DEFAULT NULL,
  `convert_status` varchar(45) DEFAULT NULL,
  `convert_machine_id` varchar(45) DEFAULT NULL,
  `convert_start_dt` datetime DEFAULT NULL,
  `convert_end_dt` datetime DEFAULT NULL,
  `out_dimension` varchar(45) DEFAULT NULL,
  `out_type` tinyint(4) DEFAULT NULL,
  `out_size` double DEFAULT NULL,
  `out_path` text,
  `out_slice_duration` text NOT NULL,
  `out_slice_location` text NOT NULL,
  `out_slice_url` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_video_convert`
--

LOCK TABLES `tbl_video_convert` WRITE;
/*!40000 ALTER TABLE `tbl_video_convert` DISABLE KEYS */;
INSERT INTO `tbl_video_convert` VALUES (1,1,'-1','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/7649/de43/7649de438c0384b9fa6a1785f931642c.m3u8',''),(2,1,'2','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/7649/de43/7649de438c0384b9fa6a1785f931642c.mp4',''),(3,2,'0','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/7649/de43/7649de438c0384b9fa6a1785f931642c.m3u8',''),(4,2,'0','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/7649/de43/7649de438c0384b9fa6a1785f931642c.mp4',''),(5,3,'0','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/2588/bca6/2588bca67b1386d568f55678ed467ca4.m3u8',''),(6,3,'0','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/2588/bca6/2588bca67b1386d568f55678ed467ca4.mp4',''),(7,4,'0','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/9725/38ab/972538abed6c6dad671dd7d77ba03436.m3u8',''),(8,4,'0','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/9725/38ab/972538abed6c6dad671dd7d77ba03436.mp4',''),(9,5,'0','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/ed31/abee/ed31abee928e882cc34fd287f09495da.m3u8',''),(10,5,'0','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/ed31/abee/ed31abee928e882cc34fd287f09495da.mp4',''),(11,6,'0','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/7649/de43/7649de438c0384b9fa6a1785f931642c.m3u8',''),(12,6,'0','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/7649/de43/7649de438c0384b9fa6a1785f931642c.mp4',''),(13,7,'0','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/2588/bca6/2588bca67b1386d568f55678ed467ca4.m3u8',''),(14,7,'0','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/2588/bca6/2588bca67b1386d568f55678ed467ca4.mp4',''),(15,8,'0','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/9725/38ab/972538abed6c6dad671dd7d77ba03436.m3u8',''),(16,8,'0','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/9725/38ab/972538abed6c6dad671dd7d77ba03436.mp4',''),(17,9,'0','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/ed31/abee/ed31abee928e882cc34fd287f09495da.m3u8',''),(18,9,'0','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/ed31/abee/ed31abee928e882cc34fd287f09495da.mp4',''),(19,10,'0','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/7649/de43/7649de438c0384b9fa6a1785f931642c.m3u8',''),(20,10,'0','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/7649/de43/7649de438c0384b9fa6a1785f931642c.mp4',''),(21,11,'0','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/7649/de43/7649de438c0384b9fa6a1785f931642c.m3u8',''),(22,11,'0','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/7649/de43/7649de438c0384b9fa6a1785f931642c.mp4',''),(23,12,'-1','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/7649/de43/7649de438c0384b9fa6a1785f931642c.m3u8',''),(24,12,'-1','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/7649/de43/7649de438c0384b9fa6a1785f931642c.mp4',''),(25,13,'3','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/7649/de43/7649de438c0384b9fa6a1785f931642c.m3u8',''),(26,13,'3','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/7649/de43/7649de438c0384b9fa6a1785f931642c.mp4',''),(27,14,'3','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/81ec/f1ae/81ecf1ae2396d794d5f4f0015e1e6abb.m3u8',''),(28,14,'3','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/81ec/f1ae/81ecf1ae2396d794d5f4f0015e1e6abb.mp4',''),(29,15,'3','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/157d/42a5/157d42a5de231f49cf238e043c1c5935.m3u8',''),(30,15,'3','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/157d/42a5/157d42a5de231f49cf238e043c1c5935.mp4',''),(31,16,'2','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/536a/ed9f/536aed9fbc60bf9c3ddc726d7b2942b0.m3u8',''),(32,16,'2','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/536a/ed9f/536aed9fbc60bf9c3ddc726d7b2942b0.mp4',''),(33,17,'3','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/3c88/7961/3c887961913dd97b2d095ae186cde394.m3u8',''),(34,17,'3','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/3c88/7961/3c887961913dd97b2d095ae186cde394.mp4',''),(35,29,'2','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/f090/d9d5/f090d9d5f64b9c189dbf3c0525197725.m3u8',''),(36,29,'3','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/f090/d9d5/f090d9d5f64b9c189dbf3c0525197725.mp4',''),(37,30,'3','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/85cd/e9c4/85cde9c4f0941eb774ee2f5438015db6.m3u8',''),(38,30,'3','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/85cd/e9c4/85cde9c4f0941eb774ee2f5438015db6.mp4',''),(39,31,'3','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/0d0c/e065/0d0ce0659f77bd89613e5e7af996ed34.m3u8',''),(40,31,'3','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/0d0c/e065/0d0ce0659f77bd89613e5e7af996ed34.mp4',''),(41,32,'3','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/3355/fb94/3355fb94119693be6e9bde275bae2b19.m3u8',''),(42,32,'3','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/3355/fb94/3355fb94119693be6e9bde275bae2b19.mp4',''),(43,33,'3','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/94d7/22a6/94d722a696818761a396aa81f02c2f27.m3u8',''),(44,33,'3','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/94d7/22a6/94d722a696818761a396aa81f02c2f27.mp4',''),(45,34,'3','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/6d46/b5d9/6d46b5d9d2902c00284cb852c04d707b.m3u8',''),(46,34,'3','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/6d46/b5d9/6d46b5d9d2902c00284cb852c04d707b.mp4',''),(47,35,'3','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/e63d/04e0/e63d04e0a58c51e1f14898ea7faac6e0.m3u8',''),(48,35,'3','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/e63d/04e0/e63d04e0a58c51e1f14898ea7faac6e0.mp4',''),(49,36,'3','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/e216/d522/e216d522da1753d3c18bba982da451a9.m3u8',''),(50,36,'3','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/e216/d522/e216d522da1753d3c18bba982da451a9.mp4',''),(51,37,'3','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/ce32/f716/ce32f7167fa8404c6fb7d13a34b96dfa.m3u8',''),(52,37,'3','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/ce32/f716/ce32f7167fa8404c6fb7d13a34b96dfa.mp4',''),(53,38,'3','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/cc8c/902c/cc8c902c66828b21da4452f0c57cab23.m3u8',''),(54,38,'3','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/cc8c/902c/cc8c902c66828b21da4452f0c57cab23.mp4',''),(55,39,'3','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/c7ee/2029/c7ee202966ea382ed3a6c27576b42676.m3u8',''),(56,39,'3','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/c7ee/2029/c7ee202966ea382ed3a6c27576b42676.mp4',''),(57,40,'3','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/5bdc/695d/5bdc695d12b8ba9d583a727e2b6ca046.m3u8',''),(58,40,'3','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/5bdc/695d/5bdc695d12b8ba9d583a727e2b6ca046.mp4',''),(59,41,'3','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/6f01/041d/6f01041d7693305a3835944370c09603.m3u8',''),(60,41,'3','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/6f01/041d/6f01041d7693305a3835944370c09603.mp4',''),(61,42,'3','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/8877/fbe0/8877fbe0735ebdf5cbb536bf01289e20.m3u8',''),(62,42,'3','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/8877/fbe0/8877fbe0735ebdf5cbb536bf01289e20.mp4',''),(63,43,'3','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/4edd/3c6a/4edd3c6a1455df0ba1b4957385925068.m3u8',''),(64,43,'3','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/4edd/3c6a/4edd3c6a1455df0ba1b4957385925068.mp4',''),(65,44,'3','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/5545/fff7/5545fff77ecb2282ee9393f12b1c70c6.m3u8',''),(66,44,'3','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/5545/fff7/5545fff77ecb2282ee9393f12b1c70c6.mp4',''),(67,45,'3','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/bbc0/c80a/bbc0c80a75fdc11819ca4b36c95c7dae.m3u8',''),(68,45,'3','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/bbc0/c80a/bbc0c80a75fdc11819ca4b36c95c7dae.mp4',''),(69,46,'3','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/6e83/6d2a/6e836d2a64c4858ee2720a15a166b033.m3u8',''),(70,46,'3','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/6e83/6d2a/6e836d2a64c4858ee2720a15a166b033.mp4',''),(71,47,'3','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/ef62/53cf/ef6253cfc3087d3e457a7222ced489ab.m3u8',''),(72,47,'3','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/ef62/53cf/ef6253cfc3087d3e457a7222ced489ab.mp4',''),(73,48,'3','',NULL,NULL,'960x640',1,0,'','10','static/users_data//videos/b4fc/b176/b4fcb1769c787b98ffd11d4bdff48e9d.m3u8',''),(74,48,'3','',NULL,NULL,'960x640',0,0,'','10','static/users_data//videos/b4fc/b176/b4fcb1769c787b98ffd11d4bdff48e9d.mp4','');
/*!40000 ALTER TABLE `tbl_video_convert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `password` varchar(64) NOT NULL,
  `privilege` text NOT NULL,
  `last_ip` bigint(20) NOT NULL,
  `lastdt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `salt` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `id` int(11) NOT NULL DEFAULT '0',
  `version` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wheel`
--

DROP TABLE IF EXISTS `wheel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wheel` (
  `wheel_id` int(11) NOT NULL AUTO_INCREMENT,
  `wheel_name` varchar(20) NOT NULL,
  `wheel_condition` varchar(255) NOT NULL DEFAULT 'any',
  PRIMARY KEY (`wheel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wheel`
--

LOCK TABLES `wheel` WRITE;
/*!40000 ALTER TABLE `wheel` DISABLE KEYS */;
/*!40000 ALTER TABLE `wheel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-16 20:11:19
