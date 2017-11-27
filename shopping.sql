/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.6.23-log : Database - myshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`myshop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `myshop`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(2,'auth','permission'),(3,'auth','group'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2017-09-30 14:07:32.407032'),(2,'auth','0001_initial','2017-09-30 14:07:32.869723'),(3,'admin','0001_initial','2017-09-30 14:07:33.038155'),(4,'admin','0002_logentry_remove_auto_add','2017-09-30 14:07:33.210712'),(5,'contenttypes','0002_remove_content_type_name','2017-09-30 14:07:33.280246'),(6,'auth','0002_alter_permission_name_max_length','2017-09-30 14:07:33.290548'),(7,'auth','0003_alter_user_email_max_length','2017-09-30 14:07:33.303348'),(8,'auth','0004_alter_user_username_opts','2017-09-30 14:07:33.313092'),(9,'auth','0005_alter_user_last_login_null','2017-09-30 14:07:33.327303'),(10,'auth','0006_require_contenttypes_0002','2017-09-30 14:07:33.329209'),(11,'auth','0007_alter_validators_add_error_messages','2017-09-30 14:07:33.338924'),(12,'auth','0008_alter_user_username_max_length','2017-09-30 14:07:33.367590'),(13,'sessions','0001_initial','2017-09-30 14:07:33.430462');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('kssqt2e4yx3knimgj191i29maqqcvm6e','ZjRiMTRiZDM5ZWM1OTg4NTAwNzc5MjUxMjNjMTI5M2ZmN2QwYTQzMzp7InZlcmlmeWNvZGUiOiJSQjRHIiwiYWRtaW51c2VyIjpudWxsfQ==','2017-10-14 14:12:51.587385'),('0tnuhet61zfkf36pc15zvm82o4vodvzp','M2JlNGRkZjY0ODZjOTRhYmRmYWRjMjc5NmYwNmViNjRmOWZmZGUyYzp7InZlcmlmeWNvZGUiOiI1UkNPIiwiYWRtaW51c2VyIjpudWxsfQ==','2017-10-14 18:29:33.543623');

/*Table structure for table `myweb_detail` */

DROP TABLE IF EXISTS `myweb_detail`;

CREATE TABLE `myweb_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `orderid` int(11) DEFAULT NULL COMMENT '订单id号',
  `goodsid` int(11) DEFAULT NULL COMMENT '商品id号',
  `name` varchar(32) DEFAULT NULL COMMENT '商品名称',
  `price` double(6,2) DEFAULT NULL COMMENT '单价',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `myweb_detail` */

/*Table structure for table `myweb_goods` */

DROP TABLE IF EXISTS `myweb_goods`;

CREATE TABLE `myweb_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `typeid` int(11) DEFAULT NULL COMMENT '类别id',
  `goods` varchar(32) DEFAULT NULL COMMENT '商品名称',
  `company` varchar(50) DEFAULT NULL COMMENT '生产厂家',
  `descr` text COMMENT '简介',
  `price` double(6,2) DEFAULT NULL COMMENT '单价',
  `picname` varchar(255) DEFAULT NULL COMMENT '图片名',
  `state` tinyint(1) DEFAULT '1' COMMENT '状态',
  `store` int(11) DEFAULT '0' COMMENT '库存量',
  `num` int(11) DEFAULT '0' COMMENT '被购买数量',
  `clicknum` int(11) DEFAULT '0' COMMENT '点击次数',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `myweb_goods` */

insert  into `myweb_goods`(`id`,`typeid`,`goods`,`company`,`descr`,`price`,`picname`,`state`,`store`,`num`,`clicknum`,`addtime`) values (3,14,'男裤_长','naike','均码，请放心购买',199.00,'1506843977.66797.jpg',1,83,0,0,1506843977),(4,14,'男衣_黑','naike','均码，请放心购买',499.00,'1506844070.678976.jpg',1,638,0,0,1506844070),(5,14,'男衣_长袖','naike','均码，请放心购买',149.00,'1506844166.5403214.jpg',1,19,0,0,1506844166),(6,15,'长裙','liliy','均码，请放心购买',899.00,'1506844325.1193528.jpg',1,4,0,0,1506844325),(7,15,'大衣_女','liliy','均码，请放心购买',599.00,'1506844361.124382.jpg',1,8,0,0,1506844361),(8,15,'长袖大衣_女','liliy','均码，请放心购买',399.00,'1506844423.1891422.jpg',1,42,0,0,1506844423),(9,16,'童装_睡衣上','巴拉巴拉','均码，请放心购买',249.00,'1506845106.1806648.jpg',1,24,0,0,1506845106),(10,16,'童装_睡衣套装','巴拉巴拉','均码，请放心购买',399.00,'1506845143.0591984.jpg',1,42,0,0,1506845143),(11,16,'童装_睡衣黄色一套','巴拉巴拉','均码，请放心购买',499.00,'1506845217.6199818.jpg',1,665,0,0,1506845217),(12,8,'ipad_2mini','apple','最新科技，创造未来',3599.00,'1506846138.2991664.jpg',1,12444,0,0,1506846138),(13,7,'iphone_6s','apple','最新科技，创造未来',4999.00,'1506846207.5264275.jpg',1,52,0,0,1506846207),(14,10,'数据线','蓝魔','最新科技，创造未来',19.00,'1506846366.2600448.jpg',1,9999999,0,0,1506846366),(15,9,'移动电源','小米','最新科技，创造未来',79.00,'1506846511.4555814.jpg',1,69480,0,0,1506846511);

/*Table structure for table `myweb_orders` */

DROP TABLE IF EXISTS `myweb_orders`;

CREATE TABLE `myweb_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) DEFAULT NULL COMMENT '会员id号',
  `linkman` varchar(32) DEFAULT NULL COMMENT '联系人',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `code` char(6) DEFAULT NULL COMMENT '邮编',
  `phone` varchar(16) DEFAULT NULL COMMENT '电话',
  `addtime` int(11) DEFAULT NULL COMMENT '购买时间',
  `total` double(8,2) DEFAULT '0.00' COMMENT '总金额',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `myweb_orders` */

/*Table structure for table `myweb_type` */

DROP TABLE IF EXISTS `myweb_type`;

CREATE TABLE `myweb_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(32) DEFAULT NULL COMMENT '分类名称',
  `pid` int(11) DEFAULT '0' COMMENT '父类id号',
  `path` varchar(255) DEFAULT NULL COMMENT '分类路径',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `myweb_type` */

insert  into `myweb_type`(`id`,`name`,`pid`,`path`) values (5,'数码产品',0,'0,'),(13,'服装',0,'0,'),(7,'手机',5,'0,5,'),(8,'相机',5,'0,5,'),(9,'移动电源',5,'0,5,'),(10,'手机配件',5,'0,5,'),(14,'男装',13,'0,13,'),(15,'女装',13,'0,13,'),(16,'童装',13,'0,13,');

/*Table structure for table `myweb_users` */

DROP TABLE IF EXISTS `myweb_users`;

CREATE TABLE `myweb_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(32) NOT NULL COMMENT '账号',
  `name` varchar(16) DEFAULT NULL COMMENT '真实姓名',
  `password` char(32) NOT NULL COMMENT '密码',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `code` char(6) DEFAULT NULL COMMENT '邮编',
  `phone` varchar(16) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) NOT NULL COMMENT 'Email',
  `state` tinyint(1) DEFAULT '1' COMMENT '状态',
  `addtime` int(11) DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex1` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `myweb_users` */

insert  into `myweb_users`(`id`,`username`,`name`,`password`,`sex`,`address`,`code`,`phone`,`email`,`state`,`addtime`) values (1,'xiaokeai','刘壮','e10adc3949ba59abbe56e057f20f883e',1,'北京市','','17717771234','www.1999@qq.com',1,1506747559),(2,'dakeai','邓','111111',1,'None','None','None','www.123@163.com',1,NULL),(3,'keai',NULL,'e3ceb5881a0a1fdaad01296d7554868d',NULL,NULL,NULL,NULL,'www.1234@111.com',0,NULL),(4,'ssh','sshh','96e79218965eb72c92a549dd5a330112',1,'','','','www.1912@163.com',1,1506796233);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
