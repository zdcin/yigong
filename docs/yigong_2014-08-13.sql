# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.15)
# Database: yigong
# Generation Time: 2014-08-13 10:28:22 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table activities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `activities`;

CREATE TABLE `activities` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(36) NOT NULL DEFAULT '' COMMENT '活动名称，如防暑降温',
  `remark` varchar(256) DEFAULT NULL COMMENT '活动说明信息',
  `start_at` date DEFAULT NULL COMMENT '活动开始时间',
  `finish_at` date DEFAULT NULL COMMENT '活动结束时间',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动表，比如物品发放，防暑降温费发放等';



# Dump of table activity_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `activity_items`;

CREATE TABLE `activity_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL,
  `volunteer_id` int(11) NOT NULL,
  `is_finish` tinyint(1) NOT NULL DEFAULT '0',
  `remark` varchar(32) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `activity_id` (`activity_id`,`volunteer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动条目，记录活动中的每一个参与义工，活动的完成情况';



# Dump of table duty_histories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `duty_histories`;

CREATE TABLE `duty_histories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='义工值班历史记录表，值班只用这一个表记录';



# Dump of table groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '小组名称',
  `remark` text COMMENT '小组说明信息',
  `start_at` date DEFAULT NULL COMMENT '小组建立于',
  `finish_at` date DEFAULT NULL COMMENT '小组解散于，可用于临时小组',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='义工小组，按照工作内容划分，如接待组，咨询组，女子诗班等';

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;

INSERT INTO `groups` (`id`, `name`, `remark`, `start_at`, `finish_at`, `created_at`, `updated_at`)
VALUES
	(1,'接待组','','2014-08-12','2014-08-12','2014-08-12 07:49:28','2014-08-12 07:50:34'),
	(2,'咨询组','','2014-08-12','2014-08-12','2014-08-12 07:50:48','2014-08-12 07:50:48'),
	(3,'售书组','','2014-08-12','2014-08-12','2014-08-12 07:50:57','2014-08-12 07:50:57'),
	(4,'慕道组','','2014-08-12','2014-08-12','2014-08-12 07:51:37','2014-08-12 07:51:37'),
	(5,'老年关怀组','','2014-08-12','2014-08-12','2014-08-12 07:51:50','2014-08-12 07:51:50'),
	(6,'大诗班','','2014-08-12','2014-08-12','2014-08-12 07:52:04','2014-08-12 07:52:04'),
	(7,'女子诗班','','2014-08-12','2014-08-12','2014-08-12 07:52:11','2014-08-12 07:52:11'),
	(8,'老年诗班','','2014-08-12','2014-08-12','2014-08-12 07:52:21','2014-08-12 07:52:21'),
	(9,'爱心组','','2014-08-12','2014-08-12','2014-08-12 07:52:38','2014-08-12 07:52:38'),
	(10,'保安组','','2014-08-12','2014-08-12','2014-08-12 07:53:23','2014-08-12 07:53:23'),
	(11,'行政组','','2014-08-12','2014-08-12','2014-08-12 07:53:30','2014-08-12 07:53:30'),
	(12,'行动组','','2014-08-12','2014-08-12','2014-08-12 07:53:37','2014-08-12 07:53:37'),
	(13,'特勤组','','2014-08-12','2014-08-12','2014-08-12 07:53:43','2014-08-12 07:53:43'),
	(14,'待命组','','2014-08-12','2014-08-12','2014-08-12 07:53:54','2014-08-12 07:53:54');

/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表，有权限使用本系统的人';



# Dump of table volunteer_group_map_histories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `volunteer_group_map_histories`;

CREATE TABLE `volunteer_group_map_histories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `volunteer_id` int(11) NOT NULL,
  `join_at` date NOT NULL COMMENT '加入小组时间',
  `quit_at` date NOT NULL COMMENT '退出小组时间',
  `is_leader` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否组长',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`volunteer_id`,`join_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='义工与小组对应关系历史表';



# Dump of table volunteer_group_maps
# ------------------------------------------------------------

DROP TABLE IF EXISTS `volunteer_group_maps`;

CREATE TABLE `volunteer_group_maps` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `volunteer_id` int(11) NOT NULL,
  `join_at` date DEFAULT NULL COMMENT '加入小组时间',
  `is_leader` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否组长',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`volunteer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='义工与小组对应关系，只记录最新的，老数据放在历史表中';

LOCK TABLES `volunteer_group_maps` WRITE;
/*!40000 ALTER TABLE `volunteer_group_maps` DISABLE KEYS */;

INSERT INTO `volunteer_group_maps` (`id`, `group_id`, `volunteer_id`, `join_at`, `is_leader`, `created_at`, `updated_at`)
VALUES
	(1,13,1,'2014-08-12',0,'2014-08-12 08:26:31','2014-08-12 08:26:31'),
	(2,14,1,'2014-08-12',0,'2014-08-12 08:26:31','2014-08-12 08:26:31'),
	(3,1,1,'2014-08-12',0,'2014-08-12 08:28:56','2014-08-12 08:28:56'),
	(4,1,2,'2014-08-12',0,'2014-08-12 08:46:35','2014-08-12 08:46:35'),
	(5,7,2,'2014-08-12',0,'2014-08-12 08:46:35','2014-08-12 08:46:35'),
	(6,8,2,'2014-08-12',0,'2014-08-12 08:46:35','2014-08-12 08:46:35'),
	(7,9,2,'2014-08-12',0,'2014-08-12 08:46:35','2014-08-12 08:46:35'),
	(8,13,2,'2014-08-12',0,'2014-08-12 08:46:35','2014-08-12 08:46:35'),
	(9,14,2,'2014-08-12',0,'2014-08-12 08:46:35','2014-08-12 08:46:35');

/*!40000 ALTER TABLE `volunteer_group_maps` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table volunteers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `volunteers`;

CREATE TABLE `volunteers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cell_phone` varchar(15) NOT NULL DEFAULT '' COMMENT '手机，唯一标识一个义工',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '姓名',
  `mail` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别，默认女性',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `id_card_num` varchar(20) DEFAULT NULL COMMENT '身份证号，没有身份证用其他通用证件号',
  `address` varchar(128) DEFAULT NULL COMMENT '居住地址',
  `belief_start_at` date DEFAULT NULL COMMENT '信教开始日期',
  `is_baptized` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否受洗',
  `baptized_day` date DEFAULT NULL COMMENT '受洗日期',
  `join_at` date DEFAULT NULL COMMENT '加入本堂义工时间',
  `quit_at` date DEFAULT NULL COMMENT '退出本堂义工时间',
  `skills` varchar(128) DEFAULT NULL COMMENT '技能列表，概要信息',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `state` varchar(8) DEFAULT NULL COMMENT '状态，待定',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cell_phone` (`cell_phone`),
  UNIQUE KEY `id_card_num` (`id_card_num`),
  KEY `birthday` (`birthday`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='义工表';

LOCK TABLES `volunteers` WRITE;
/*!40000 ALTER TABLE `volunteers` DISABLE KEYS */;

INSERT INTO `volunteers` (`id`, `cell_phone`, `name`, `mail`, `birthday`, `id_card_num`, `address`, `belief_start_at`, `is_baptized`, `baptized_day`, `join_at`, `quit_at`, `skills`, `created_at`, `updated_at`, `state`)
VALUES
	(1,'13811112345','张丽吗',0,'2014-08-12','1323451829387','丰台一号','2014-08-12',1,'2013-08-12','2014-08-01','2014-08-12','广场舞','2014-08-12 08:00:32','2014-08-12 08:01:44',NULL),
	(2,'13712345678','张小琴',0,'2011-02-01','123456789012345','北京丰台1号',NULL,0,NULL,'2014-08-12',NULL,'作曲','2014-08-12 08:46:24','2014-08-12 08:46:24',NULL);

/*!40000 ALTER TABLE `volunteers` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
