/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`smart-parking` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `app_car_manage` */

DROP TABLE IF EXISTS `app_car_manage`;

CREATE TABLE `app_car_manage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gender` varchar(1) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `org_id` bigint(20) NOT NULL,
  `org_name` varchar(500) DEFAULT NULL,
  `park_manage_id` bigint(20) NOT NULL,
  `park_manage_name` varchar(500) DEFAULT NULL,
  `parking_lot` varchar(100) DEFAULT NULL,
  `plate_number` varchar(100) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `user_id_create` bigint(20) DEFAULT NULL,
  `validity_time` datetime DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `app_car_manage` */

insert  into `app_car_manage`(`id`,`gender`,`gmt_create`,`gmt_modified`,`name`,`nickname`,`org_id`,`org_name`,`park_manage_id`,`park_manage_name`,`parking_lot`,`plate_number`,`remark`,`status`,`type`,`user_id_create`,`validity_time`,`mobile`) values (1,'1','2021-04-11 21:58:50','2021-04-19 19:49:35',NULL,'212112',36,'青岛海信',2,'海克斯康','2121','212121',NULL,1,1,NULL,'2021-04-26 00:00:00','17762018584');

/*Table structure for table `app_car_park_manage` */

DROP TABLE IF EXISTS `app_car_park_manage`;

CREATE TABLE `app_car_park_manage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `free_time` int(11) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  `max_money` decimal(18,2) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `org_id` bigint(20) NOT NULL,
  `org_name` varchar(500) DEFAULT NULL,
  `parking_space_number` int(11) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `time_unit` int(11) DEFAULT NULL,
  `unit_cost` decimal(18,2) DEFAULT NULL,
  `user_id_create` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `app_car_park_manage` */

insert  into `app_car_park_manage`(`id`,`free_time`,`gmt_create`,`gmt_modified`,`max_money`,`name`,`org_id`,`org_name`,`parking_space_number`,`status`,`time_unit`,`unit_cost`,`user_id_create`) values (2,60,'2021-03-27 21:52:08','2021-03-27 21:52:08','100.00','海克斯康',36,'青岛海信',12,1,30,'5.00',NULL);

/*Table structure for table `app_car_parking_record` */

DROP TABLE IF EXISTS `app_car_parking_record`;

CREATE TABLE `app_car_parking_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cost` decimal(18,2) DEFAULT NULL,
  `gmt_into` datetime DEFAULT NULL,
  `gmt_out` datetime DEFAULT NULL,
  `org_id` bigint(20) NOT NULL,
  `org_name` varchar(500) DEFAULT NULL,
  `park_manage_id` bigint(20) NOT NULL,
  `park_manage_name` varchar(500) DEFAULT NULL,
  `plate_number` varchar(100) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `app_car_parking_record` */

insert  into `app_car_parking_record`(`id`,`cost`,`gmt_into`,`gmt_out`,`org_id`,`org_name`,`park_manage_id`,`park_manage_name`,`plate_number`,`type`) values (1,NULL,'2021-04-19 21:43:41',NULL,36,'青岛海信',2,'海克斯康','苏E05EV8',2);

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `config_key` varchar(200) NOT NULL COMMENT '唯一标识',
  `config_value` varchar(500) NOT NULL COMMENT '值',
  `config_remark` varchar(1000) NOT NULL COMMENT '备注',
  `user_id_create` bigint(20) NOT NULL COMMENT '创建人',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL COMMENT '状态 0 禁用 1 可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='基础配置';

/*Data for the table `sys_config` */

/*Table structure for table `sys_landing_records` */

DROP TABLE IF EXISTS `sys_landing_records`;

CREATE TABLE `sys_landing_records` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `login_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近登录时间',
  `place` varchar(10) NOT NULL COMMENT '最近登录地点',
  `ip` char(15) NOT NULL COMMENT '最近登录IP',
  `login_way` char(10) NOT NULL COMMENT '登录方式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户登录日志';

/*Data for the table `sys_landing_records` */

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `time` int(11) DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` text COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `device_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '访问方式 0:PC 1:手机 2:未知',
  `log_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型 0: 一般日志记录 1: 异常错误日志',
  `exception_detail` text COMMENT '异常详细信息',
  `gmt_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='系统日志';

/*Data for the table `sys_log` */

insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`device_type`,`log_type`,`exception_detail`,`gmt_create`) values (1,1,'admin','登录',10,'','','0:0:0:0:0:0:0:1',0,0,'','2021-03-08 19:58:39');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`device_type`,`log_type`,`exception_detail`,`gmt_create`) values (2,1,'admin','登录',10,'','','0:0:0:0:0:0:0:1',0,0,'','2021-03-16 20:26:27');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`device_type`,`log_type`,`exception_detail`,`gmt_create`) values (3,1,'admin','登录',10,'','','0:0:0:0:0:0:0:1',0,0,'','2021-03-26 20:51:14');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`device_type`,`log_type`,`exception_detail`,`gmt_create`) values (4,1,'admin','登录',10,'','','0:0:0:0:0:0:0:1',0,0,'','2021-03-26 21:10:51');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`device_type`,`log_type`,`exception_detail`,`gmt_create`) values (5,1,'admin','登录',10,'','','0:0:0:0:0:0:0:1',0,0,'','2021-04-11 20:45:05');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`device_type`,`log_type`,`exception_detail`,`gmt_create`) values (6,1,'admin','登录',10,'','','0:0:0:0:0:0:0:1',0,0,'','2021-04-13 20:15:18');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`device_type`,`log_type`,`exception_detail`,`gmt_create`) values (7,1,'admin','登录',10,'','','0:0:0:0:0:0:0:1',0,0,'','2021-04-13 20:15:21');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`device_type`,`log_type`,`exception_detail`,`gmt_create`) values (8,1,'admin','登录',10,'','','0:0:0:0:0:0:0:1',0,0,'','2021-04-19 19:47:39');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`device_type`,`log_type`,`exception_detail`,`gmt_create`) values (9,1,'admin','登录',10,'','','0:0:0:0:0:0:0:1',0,0,'','2021-04-19 20:17:24');
insert  into `sys_log`(`id`,`user_id`,`username`,`operation`,`time`,`method`,`params`,`ip`,`device_type`,`log_type`,`exception_detail`,`gmt_create`) values (10,1,'admin','登录',10,'','','0:0:0:0:0:0:0:1',0,0,'','2021-04-19 20:46:12');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `gmt_create` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (1,0,'系统管理',NULL,'',0,'layui-icon layui-icon-template-1',5,'2017-08-09 22:49:47','2017-09-11 17:25:22');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (2,1,'系统菜单','sys/menu/list.html',NULL,1,'layui-icon layui-icon-spread-left',10,'2017-08-09 22:55:15','2017-08-17 10:00:12');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (6,299,'用户管理','sys/user/list.html','',1,'layui-icon layui-icon-username',2,'2017-08-10 14:12:11','2017-09-05 12:57:42');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (7,1,'角色管理','sys/role/list.html','',1,'layui-icon layui-icon-tree',1,'2017-08-10 14:13:19','2017-09-05 12:57:30');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (11,6,'刷新','/sys/user/list','sys:user:list',2,NULL,0,'2017-08-14 10:51:05','2017-09-05 12:47:23');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (12,6,'新增','/sys/user/save','sys:user:save',2,NULL,0,'2017-08-14 10:51:35','2017-09-05 12:47:34');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (13,6,'编辑','/sys/user/update','sys:user:edit',2,NULL,0,'2017-08-14 10:52:06','2017-09-05 12:47:46');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (14,6,'删除','/sys/user/remove','sys:user:remove',2,NULL,0,'2017-08-14 10:52:24','2017-09-05 12:48:03');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (15,7,'刷新','/sys/role/list','sys:role:list',2,NULL,0,'2017-08-14 10:56:37','2017-09-05 12:44:04');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (16,7,'新增','/sys/role/save','sys:role:save',2,NULL,0,'2017-08-14 10:57:02','2017-09-05 12:44:23');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (17,7,'编辑','/sys/role/update','sys:role:edit',2,NULL,0,'2017-08-14 10:57:31','2017-09-05 12:44:48');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (18,7,'删除','/sys/role/remove','sys:role:remove',2,NULL,0,'2017-08-14 10:57:50','2017-09-05 12:45:02');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (19,7,'操作权限','/sys/role/authorize/opt','sys:role:authorizeOpt',2,NULL,0,'2017-08-14 10:58:55','2017-09-05 12:45:29');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (20,2,'刷新','/sys/menu/list','sys:menu:list',2,NULL,0,'2017-08-14 10:59:32','2017-09-05 13:06:24');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (21,2,'新增','/sys/menu/save','sys:menu:save',2,NULL,0,'2017-08-14 10:59:56','2017-09-05 13:06:35');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (22,2,'编辑','/sys/menu/update','sys:menu:edit',2,NULL,0,'2017-08-14 11:00:26','2017-09-05 13:06:48');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (23,2,'删除','/sys/menu/remove','sys:menu:remove',2,NULL,0,'2017-08-14 11:00:58','2017-09-05 13:07:00');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (24,6,'启用','/sys/user/enable','sys:user:enable',2,NULL,0,'2017-08-14 17:27:18','2017-09-05 12:48:30');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (25,6,'停用','/sys/user/disable','sys:user:disable',2,NULL,0,'2017-08-14 17:27:43','2017-09-05 12:48:49');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (26,6,'重置密码','/sys/user/rest','sys:user:resetPassword',2,NULL,0,'2017-08-14 17:28:34','2017-09-05 12:49:17');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (27,267,'系统日志','sys/log/list.html',NULL,1,'fa fa-warning',3,'2017-08-14 22:11:53','2017-08-17 09:55:19');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (28,27,'刷新','/sys/log/list','sys:log:list',2,NULL,0,'2017-08-14 22:30:22','2017-09-05 13:05:24');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (29,27,'删除','/sys/log/remove','sys:log:remove',2,NULL,0,'2017-08-14 22:30:43','2017-09-05 13:05:37');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (30,27,'清空','/sys/log/clear','sys:log:clear',2,NULL,0,'2017-08-14 22:31:02','2017-09-05 13:05:53');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (42,261,'刷新','/sys/org/list','sys:org:list',2,NULL,0,'2017-08-17 10:03:36','2017-09-05 11:47:37');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (43,261,'新增','/sys/org/save','sys:org:save',2,NULL,0,'2017-08-17 10:03:54','2017-09-05 12:40:55');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (44,261,'编辑','/sys/org/update','sys:org:edit',2,NULL,0,'2017-08-17 10:04:11','2017-09-05 12:43:06');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (45,261,'删除','/sys/org/remove','sys:org:remove',2,NULL,0,'2017-08-17 10:04:30','2017-09-05 12:42:19');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (46,7,'数据权限','/sys/role/authorize/data','sys:role:authorizeData',2,NULL,0,'2017-08-17 13:48:11','2017-09-05 12:45:54');
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (261,299,'合作单位','/sys/org/list.html',NULL,1,'layui-icon layui-icon-friends',3,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (264,1,'全局配置','sys/config/list.html',NULL,1,'layui-icon layui-icon-templeate-1',40,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (267,0,'系统监控',NULL,NULL,0,'layui-icon layui-icon-camera',40,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (295,0,'停车场管理',NULL,NULL,0,'layui-icon layui-icon-diamond',0,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (296,295,'停车场管理','car/parkManage/list.html',NULL,1,'layui-icon layui-icon-set',1,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (299,0,'账户管理',NULL,NULL,0,'layui-icon layui-icon-username',10,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (300,0,'车场管理',NULL,NULL,0,'layui-icon layui-icon-release',3,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (301,300,'车辆管理','car/carManage/list.html',NULL,1,'layui-icon layui-icon-release',1,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (302,0,'停车记录',NULL,NULL,0,'layui-icon layui-icon-file-b',4,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (303,302,'停车记录','car/parkingRecord/list.html',NULL,1,'layui-icon layui-icon-location',1,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (304,0,'车牌识别','',NULL,0,'layui-icon layui-icon-camera-fill',1,NULL,NULL);
insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`,`gmt_create`,`gmt_modified`) values (305,304,'车牌识别','car/distinguish/list.html',NULL,1,'layui-icon layui-icon-camera-fill',1,NULL,NULL);

/*Table structure for table `sys_org` */

DROP TABLE IF EXISTS `sys_org`;

CREATE TABLE `sys_org` (
  `org_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '机构id',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级机构ID，一级机构为0',
  `code` varchar(100) DEFAULT NULL COMMENT '机构编码',
  `name` varchar(100) DEFAULT NULL COMMENT '机构名称',
  `full_name` varchar(100) DEFAULT NULL COMMENT '机构名称(全称)',
  `director` varchar(100) DEFAULT NULL COMMENT '机构负责人',
  `email` varchar(100) DEFAULT NULL COMMENT '联系邮箱',
  `phone` varchar(100) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(4) DEFAULT '1' COMMENT '可用标识  1：可用  0：不可用',
  `gmt_create` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='机构管理';

/*Data for the table `sys_org` */

insert  into `sys_org`(`org_id`,`parent_id`,`code`,`name`,`full_name`,`director`,`email`,`phone`,`address`,`order_num`,`status`,`gmt_create`,`gmt_modified`) values (36,0,'00006','青岛海信','青岛海信','海信',NULL,NULL,NULL,NULL,1,'2020-05-08 22:06:58','2020-05-08 22:07:03');
insert  into `sys_org`(`org_id`,`parent_id`,`code`,`name`,`full_name`,`director`,`email`,`phone`,`address`,`order_num`,`status`,`gmt_create`,`gmt_modified`) values (38,0,'00005','青岛海尔','青岛海尔',NULL,NULL,NULL,NULL,NULL,1,'2020-05-08 22:17:32','2020-11-07 10:44:25');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `org_id` bigint(255) DEFAULT NULL COMMENT '所属机构',
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统角色';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`org_id`,`role_name`,`role_sign`,`remark`,`user_id_create`,`gmt_create`,`gmt_modified`) values (1,17,'超级管理员','admin','【系统内置】',2,'2017-08-12 00:43:52','2017-11-21 10:19:08');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14891 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14850,1,295);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14851,1,296);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14852,1,304);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14853,1,305);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14854,1,300);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14855,1,301);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14856,1,302);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14857,1,303);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14858,1,1);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14859,1,7);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14860,1,15);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14861,1,16);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14862,1,17);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14863,1,18);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14864,1,19);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14865,1,46);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14866,1,2);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14867,1,20);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14868,1,21);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14869,1,22);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14870,1,23);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14871,1,264);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14872,1,299);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14873,1,6);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14874,1,11);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14875,1,12);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14876,1,13);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14877,1,14);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14878,1,24);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14879,1,25);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14880,1,26);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14881,1,261);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14882,1,42);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14883,1,43);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14884,1,44);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14885,1,45);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14886,1,267);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14887,1,27);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14888,1,28);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14889,1,29);
insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values (14890,1,30);

/*Table structure for table `sys_role_org` */

DROP TABLE IF EXISTS `sys_role_org`;

CREATE TABLE `sys_role_org` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `org_id` bigint(20) DEFAULT NULL COMMENT '机构ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='角色与机构对应关系';

/*Data for the table `sys_role_org` */

insert  into `sys_role_org`(`id`,`role_id`,`org_id`) values (17,1,17);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `org_id` bigint(20) NOT NULL COMMENT '所属机构',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `nickname` varchar(50) DEFAULT NULL COMMENT '姓名(昵称)',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `avatar_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '头像上传 0:未上传 1:上传',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `is_modify_pwd` tinyint(4) DEFAULT '0' COMMENT '是否修改过初始密码',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='系统用户';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`org_id`,`username`,`password`,`nickname`,`email`,`mobile`,`status`,`avatar_status`,`remark`,`user_id_create`,`gmt_create`,`gmt_modified`,`is_modify_pwd`) values (1,36,'admin','4cf28b576b2af52c9441d653e5a79917','admin','100000@qq.com','17788888888',1,0,NULL,1,'2017-08-15 21:40:39','2021-03-08 21:04:16',1);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户与角色对应关系';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`id`,`user_id`,`role_id`) values (265,1,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
