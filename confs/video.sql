-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: video
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
INSERT INTO `admin` VALUES (3,'admin','41b9eca540bdaeea774848872fb4546f','f69b39ffa35f3c972c3db3e049f6a63c','admin',0,'2014-07-18 02:53:31');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subsystems`
--

LOCK TABLES `subsystems` WRITE;
/*!40000 ALTER TABLE `subsystems` DISABLE KEYS */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-18 11:04:56
