-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.11 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 quickstart 的数据库结构
CREATE DATABASE IF NOT EXISTS `quickstart` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `quickstart`;


-- 导出  表 quickstart.ss_case 结构
DROP TABLE IF EXISTS `ss_case`;
CREATE TABLE IF NOT EXISTS `ss_case` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(100) NOT NULL DEFAULT '0',
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `leaf` tinyint(4) NOT NULL DEFAULT '0',
  `discription` varchar(50) DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `case_step` varchar(1000) DEFAULT NULL,
  `priority` varchar(20) DEFAULT NULL,
  `xml_config_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- 正在导出表  quickstart.ss_case 的数据：~17 rows (大约)
/*!40000 ALTER TABLE `ss_case` DISABLE KEYS */;
INSERT INTO `ss_case` (`id`, `text`, `parent_id`, `leaf`, `discription`, `user_id`, `create_date`, `update_date`, `case_step`, `priority`, `xml_config_id`) VALUES
	(1, '用例树', 0, 0, '0', 1, '2017-01-02 12:42:20', '2017-01-02 12:42:22', NULL, NULL, NULL),
	(2, '需求1', 1, 0, '0', 1, '2017-01-02 12:43:48', '2017-01-02 12:43:49', NULL, NULL, NULL),
	(3, '用例1', 2, 1, '1113333', 1, '2017-01-02 12:44:18', '2017-01-02 12:44:20', '第一步', '紧急', 6),
	(4, '需求2', 1, 0, NULL, 1, '2017-01-03 00:13:04', '2017-01-03 00:13:04', NULL, NULL, NULL),
	(5, '用例3', 4, 1, NULL, 1, '2017-01-03 00:17:03', '2017-01-03 00:17:03', NULL, NULL, NULL),
	(7, '用例2', 2, 1, '雾霾', 1, '2017-01-03 15:22:52', '2017-01-03 15:22:52', '第一步干掉这个项目', '一般', 5),
	(8, '用例333', 2, 1, NULL, 1, '2017-01-03 15:46:58', '2017-01-03 15:46:58', NULL, NULL, NULL),
	(12, 'sss', 2, 1, NULL, 1, '2017-01-03 15:52:59', '2017-01-03 15:52:59', NULL, NULL, NULL),
	(17, 'New node', 1, 1, NULL, 1, '2017-01-03 17:28:14', '2017-01-03 17:28:14', NULL, NULL, NULL),
	(18, 'New node', 1, 1, NULL, 1, '2017-01-03 17:29:20', '2017-01-03 17:29:20', NULL, NULL, NULL),
	(23, '需求1.1', 2, 1, NULL, 1, '2017-01-03 17:41:21', '2017-01-03 17:41:21', NULL, NULL, NULL),
	(24, 'yongli 2', 2, 1, NULL, 1, '2017-01-03 17:41:56', '2017-01-03 17:41:56', NULL, NULL, NULL),
	(25, 'New node', 2, 1, NULL, 1, '2017-01-03 17:45:36', '2017-01-03 17:45:36', NULL, NULL, NULL),
	(26, 'New node', 2, 0, NULL, 1, '2017-01-03 17:46:02', '2017-01-03 17:46:02', NULL, NULL, NULL),
	(27, '需求1', 2, 0, NULL, 1, '2017-01-03 17:46:26', '2017-01-03 17:46:26', NULL, NULL, NULL),
	(28, '实力1', 27, 1, NULL, 1, '2017-01-03 17:46:37', '2017-01-03 17:46:37', NULL, NULL, NULL),
	(29, '需求2122', 27, 0, NULL, 1, '2017-01-03 17:46:44', '2017-01-03 17:46:44', NULL, NULL, NULL),
	(30, '3333', 27, 0, NULL, 1, '2017-01-04 23:05:53', '2017-01-04 23:05:53', NULL, NULL, NULL),
	(31, '3333', 27, 1, NULL, 1, '2017-01-04 23:06:09', '2017-01-04 23:06:09', NULL, NULL, NULL),
	(32, '3333444', 27, 1, NULL, 1, '2017-01-04 23:08:02', '2017-01-04 23:08:02', NULL, NULL, NULL),
	(33, 'rrrr', 27, 0, NULL, 1, '2017-01-04 23:08:09', '2017-01-04 23:08:09', NULL, NULL, NULL),
	(34, 'wwwww', 26, 0, NULL, 1, '2017-01-04 23:19:36', '2017-01-04 23:19:36', NULL, NULL, NULL),
	(35, 'eeee', 26, 0, NULL, 1, '2017-01-04 23:31:53', '2017-01-04 23:31:53', NULL, NULL, NULL),
	(36, 'sssss', 1, 0, NULL, 1, '2017-01-04 23:33:11', '2017-01-04 23:33:11', NULL, NULL, NULL),
	(37, 'dddddd', 36, 0, NULL, 1, '2017-01-04 23:33:21', '2017-01-04 23:33:21', NULL, NULL, NULL),
	(38, 'dsdsdsd', 37, 0, NULL, 1, '2017-01-04 23:33:33', '2017-01-04 23:33:33', NULL, NULL, NULL),
	(39, 'sdfsfds', 35, 0, NULL, 1, '2017-01-04 23:34:11', '2017-01-04 23:34:11', NULL, NULL, NULL),
	(40, 'ewrewrew', 39, 0, NULL, 1, '2017-01-04 23:34:22', '2017-01-04 23:34:22', NULL, NULL, NULL),
	(41, 'erewrew', 40, 1, NULL, 1, '2017-01-04 23:34:27', '2017-01-04 23:34:27', NULL, NULL, NULL);
/*!40000 ALTER TABLE `ss_case` ENABLE KEYS */;


-- 导出  表 quickstart.ss_module 结构
DROP TABLE IF EXISTS `ss_module`;
CREATE TABLE IF NOT EXISTS `ss_module` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `client_type` varchar(50) DEFAULT NULL,
  `request_cmd` varchar(255) DEFAULT NULL,
  `response_cmd` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 正在导出表  quickstart.ss_module 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `ss_module` DISABLE KEYS */;
INSERT INTO `ss_module` (`id`, `title`, `client_type`, `request_cmd`, `response_cmd`, `create_date`, `update_date`, `user_id`) VALUES
	(1, '模板1', '类型22', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', NULL, NULL, 1),
	(2, '模板二', '类型133', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', NULL, NULL, 1),
	(3, '模板12222', '3232121', '321321321', '321321321', '2016-12-17 18:39:47', '2016-12-17 18:39:47', 1),
	(4, 'ewrew', 'rewrew', 'rewrew', 'rewrew', '2016-12-25 14:19:23', '2016-12-25 14:19:23', 1);
/*!40000 ALTER TABLE `ss_module` ENABLE KEYS */;


-- 导出  表 quickstart.ss_task 结构
DROP TABLE IF EXISTS `ss_task`;
CREATE TABLE IF NOT EXISTS `ss_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- 正在导出表  quickstart.ss_task 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `ss_task` DISABLE KEYS */;
INSERT INTO `ss_task` (`id`, `title`, `description`, `user_id`) VALUES
	(1, 'Study PlayFramework 2.0', 'http://www.playframework.org/', 2),
	(2, 'Study Grails 2.0', 'http://www.grails.org/', 2),
	(3, 'Try SpringFuse', 'http://www.springfuse.com/', 2),
	(4, 'Try Spring Roo', 'http://www.springsource.org/spring-roo', 2),
	(5, 'Release SpringSide 4.0', 'As soon as posibble.', 2);
/*!40000 ALTER TABLE `ss_task` ENABLE KEYS */;


-- 导出  表 quickstart.ss_user 结构
DROP TABLE IF EXISTS `ss_user`;
CREATE TABLE IF NOT EXISTS `ss_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(64) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 正在导出表  quickstart.ss_user 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `ss_user` DISABLE KEYS */;
INSERT INTO `ss_user` (`id`, `login_name`, `name`, `password`, `salt`, `roles`, `register_date`) VALUES
	(1, 'admin', 'Admin', '691b14d79bf0fa2215f155235df5e670b64394cc', '7efbd59d9741d34f', 'admin', '2012-06-04 01:00:00'),
	(2, 'user', 'Calvin', '2488aa0c31c624687bd9928e0a5d29e7d1ed520b', '6d65d24122c30500', 'user', '2012-06-04 02:00:00');
/*!40000 ALTER TABLE `ss_user` ENABLE KEYS */;


-- 导出  表 quickstart.ss_version_task 结构
DROP TABLE IF EXISTS `ss_version_task`;
CREATE TABLE IF NOT EXISTS `ss_version_task` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(100) NOT NULL DEFAULT '0',
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `leaf` tinyint(4) NOT NULL DEFAULT '0',
  `discription` varchar(50) DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0未执行，1正在执行',
  `run_result` tinyint(4) DEFAULT NULL COMMENT '2执行成功，3执行失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- 正在导出表  quickstart.ss_version_task 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `ss_version_task` DISABLE KEYS */;
INSERT INTO `ss_version_task` (`id`, `text`, `parent_id`, `leaf`, `discription`, `user_id`, `create_date`, `update_date`, `status`, `run_result`) VALUES
	(1, '版本任务', 0, 0, '0', 1, '2017-01-04 09:26:23', '2017-01-04 09:26:25', NULL, NULL),
	(2, 'ver1', 1, 0, NULL, 1, '2017-01-04 09:37:28', '2017-01-04 09:37:28', NULL, NULL),
	(3, 'rrrrr', 2, 1, NULL, 1, '2017-01-04 09:37:40', '2017-01-04 09:37:40', NULL, NULL),
	(4, 'dsds', 2, 0, NULL, 1, '2017-01-04 23:34:47', '2017-01-04 23:34:47', NULL, NULL),
	(5, 'dsds', 4, 0, NULL, 1, '2017-01-04 23:34:50', '2017-01-04 23:34:50', NULL, NULL),
	(6, 'ddd', 5, 0, NULL, 1, '2017-01-04 23:36:42', '2017-01-04 23:36:42', NULL, NULL),
	(7, 'qqqq', 6, 1, NULL, 1, '2017-01-04 23:36:47', '2017-01-04 23:36:47', NULL, NULL);
/*!40000 ALTER TABLE `ss_version_task` ENABLE KEYS */;


-- 导出  表 quickstart.ss_version_task_case 结构
DROP TABLE IF EXISTS `ss_version_task_case`;
CREATE TABLE IF NOT EXISTS `ss_version_task_case` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(100) NOT NULL DEFAULT '0',
  `task_id` bigint(20) NOT NULL DEFAULT '0',
  `discription` varchar(50) DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `case_id` bigint(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0未执行，1正在执行,2执行结束',
  `run_result` tinyint(4) DEFAULT NULL COMMENT '2执行成功，3执行失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- 正在导出表  quickstart.ss_version_task_case 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `ss_version_task_case` DISABLE KEYS */;
INSERT INTO `ss_version_task_case` (`id`, `text`, `task_id`, `discription`, `user_id`, `create_date`, `update_date`, `case_id`, `status`, `run_result`) VALUES
	(66, '用例1', 3, '1113333', 1, '2017-01-04 22:52:29', '2017-01-04 22:52:29', 3, 0, 0),
	(67, '用例1', 3, '1113333', 1, '2017-01-04 22:52:45', '2017-01-04 22:52:45', 3, 0, 0),
	(68, '用例1', 3, '1113333', 1, '2017-01-04 22:53:43', '2017-01-04 22:53:43', 3, 0, 0),
	(69, '用例1', 3, '1113333', 1, '2017-01-04 22:55:38', '2017-01-04 22:55:38', 3, 0, 0),
	(70, '用例1', 3, '1113333', 1, '2017-01-04 22:56:30', '2017-01-04 22:56:30', 3, 0, 0),
	(71, '用例1', 3, '1113333', 1, '2017-01-04 22:56:52', '2017-01-04 22:56:52', 3, 0, 0),
	(72, '用例1', 3, '1113333', 1, '2017-01-04 22:57:50', '2017-01-04 22:57:50', 3, 0, 0),
	(73, '用例1', 3, '1113333', 1, '2017-01-04 22:58:29', '2017-01-04 22:58:29', 3, 0, 0),
	(74, '用例1', 3, '1113333', 1, '2017-01-04 22:59:01', '2017-01-04 22:59:01', 3, 0, 0),
	(75, '用例1', 3, '1113333', 1, '2017-01-04 22:59:38', '2017-01-04 22:59:38', 3, 0, 0),
	(76, '用例1', 3, '1113333', 1, '2017-01-04 22:59:48', '2017-01-04 22:59:48', 3, 0, 0),
	(77, '用例1', 7, '1113333', 1, '2017-01-04 23:37:05', '2017-01-04 23:37:05', 3, 0, 0);
/*!40000 ALTER TABLE `ss_version_task_case` ENABLE KEYS */;


-- 导出  表 quickstart.ss_ver_task_case_step 结构
DROP TABLE IF EXISTS `ss_ver_task_case_step`;
CREATE TABLE IF NOT EXISTS `ss_ver_task_case_step` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ver_task_case_id` bigint(20) DEFAULT NULL,
  `order_num` int(8) NOT NULL,
  `step_name` varchar(128) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `request_content` varchar(500) DEFAULT NULL,
  `response_content` varchar(500) DEFAULT NULL,
  `request_params` varchar(500) DEFAULT NULL,
  `response_params` varchar(500) DEFAULT NULL,
  `gx_params` varchar(500) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0未执行，1正在执行',
  `run_result` tinyint(4) DEFAULT NULL COMMENT '2执行成功，3执行失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;

-- 正在导出表  quickstart.ss_ver_task_case_step 的数据：~21 rows (大约)
/*!40000 ALTER TABLE `ss_ver_task_case_step` DISABLE KEYS */;
INSERT INTO `ss_ver_task_case_step` (`id`, `ver_task_case_id`, `order_num`, `step_name`, `description`, `request_content`, `response_content`, `request_params`, `response_params`, `gx_params`, `status`, `run_result`) VALUES
	(43, 30, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"2"},{"${content}":"3"},{"${ContentType}":"2"},{"${event}":"1"},{"${statusCode}":"22"}]', '[]', NULL, 0, 0),
	(66, 31, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"431"},{"${content}":"21111"},{"${ContentType}":"1"},{"${event}":"13"},{"${statusCode}":"1111"}]', '[{"${statusCode}":"1111"}]', NULL, 0, 0),
	(67, 32, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"2"},{"${content}":"3"},{"${ContentType}":"2"},{"${event}":"1"},{"${statusCode}":"22"}]', '[]', NULL, 0, 0),
	(68, 31, 2, '步骤2', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"3223"},{"${content}":"32432"},{"${ContentType}":"3232"},{"${event}":"323232"}]', '[{"${statusCode}":"2222"}]', NULL, 0, 0),
	(69, 33, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"431"},{"${content}":"21111"},{"${ContentType}":"1"},{"${event}":"13"},{"${statusCode}":"1111"}]', '[{"${statusCode}":"1111"}]', NULL, 0, 0),
	(70, 33, 2, '步骤2', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"3223"},{"${content}":"32432"},{"${ContentType}":"3232"},{"${event}":"323232"}]', '[{"${statusCode}":"2222"}]', NULL, 0, 0),
	(71, 34, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"2"},{"${content}":"3"},{"${ContentType}":"2"},{"${event}":"1"},{"${statusCode}":"22"}]', '[]', NULL, 0, 0),
	(75, 35, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"431"},{"${content}":"21111"},{"${ContentType}":"1"},{"${event}":"13"},{"${statusCode}":"1111"}]', '[{"${statusCode}":"1111"}]', NULL, 0, 0),
	(76, 35, 2, '步骤2', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"3223"},{"${content}":"32432"},{"${ContentType}":"3232"},{"${event}":"323232"}]', '[{"${statusCode}":"2222"}]', NULL, 0, 0),
	(144, 66, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"431"},{"${content}":"21111"},{"${ContentType}":"1"},{"${event}":"13"},{"${statusCode}":"1111"}]', '[{"${statusCode}":"1111"}]', NULL, 0, 0),
	(145, 66, 2, '步骤2', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"3223"},{"${content}":"32432"},{"${ContentType}":"3232"},{"${event}":"323232"}]', '[{"${statusCode}":"2222"}]', NULL, 0, 0),
	(146, 67, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"431"},{"${content}":"21111"},{"${ContentType}":"1"},{"${event}":"13"},{"${statusCode}":"1111"}]', '[{"${statusCode}":"1111"}]', NULL, 0, 0),
	(147, 67, 2, '步骤2', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"3223"},{"${content}":"32432"},{"${ContentType}":"3232"},{"${event}":"323232"}]', '[{"${statusCode}":"2222"}]', NULL, 0, 0),
	(148, 68, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"431"},{"${content}":"21111"},{"${ContentType}":"1"},{"${event}":"13"},{"${statusCode}":"1111"}]', '[{"${statusCode}":"1111"}]', NULL, 0, 0),
	(149, 68, 2, '步骤2', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"3223"},{"${content}":"32432"},{"${ContentType}":"3232"},{"${event}":"323232"}]', '[{"${statusCode}":"2222"}]', NULL, 0, 0),
	(150, 69, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"431"},{"${content}":"21111"},{"${ContentType}":"1"},{"${event}":"13"},{"${statusCode}":"1111"}]', '[{"${statusCode}":"1111"}]', NULL, 0, 0),
	(151, 69, 2, '步骤2', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"3223"},{"${content}":"32432"},{"${ContentType}":"3232"},{"${event}":"323232"}]', '[{"${statusCode}":"2222"}]', NULL, 0, 0),
	(152, 70, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"431"},{"${content}":"21111"},{"${ContentType}":"1"},{"${event}":"13"},{"${statusCode}":"1111"}]', '[{"${statusCode}":"1111"}]', NULL, 0, 0),
	(153, 70, 2, '步骤2', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"3223"},{"${content}":"32432"},{"${ContentType}":"3232"},{"${event}":"323232"}]', '[{"${statusCode}":"2222"}]', NULL, 0, 0),
	(154, 71, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"431"},{"${content}":"21111"},{"${ContentType}":"1"},{"${event}":"13"},{"${statusCode}":"1111"}]', '[{"${statusCode}":"1111"}]', NULL, 0, 0),
	(155, 71, 2, '步骤2', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"3223"},{"${content}":"32432"},{"${ContentType}":"3232"},{"${event}":"323232"}]', '[{"${statusCode}":"2222"}]', NULL, 0, 0),
	(158, 72, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"431"},{"${content}":"21111"},{"${ContentType}":"1"},{"${event}":"13"},{"${statusCode}":"1111"}]', '[{"${statusCode}":"1111"}]', NULL, 0, 0),
	(159, 72, 2, '步骤2', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"3223"},{"${content}":"32432"},{"${ContentType}":"3232"},{"${event}":"323232"}]', '[{"${statusCode}":"2222"}]', NULL, 0, 0),
	(160, 73, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"431"},{"${content}":"21111"},{"${ContentType}":"1"},{"${event}":"13"},{"${statusCode}":"1111"}]', '[{"${statusCode}":"1111"}]', NULL, 0, 0),
	(161, 73, 2, '步骤2', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"3223"},{"${content}":"32432"},{"${ContentType}":"3232"},{"${event}":"323232"}]', '[{"${statusCode}":"2222"}]', NULL, 0, 0),
	(162, 74, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"431"},{"${content}":"21111"},{"${ContentType}":"1"},{"${event}":"13"},{"${statusCode}":"1111"}]', '[{"${statusCode}":"1111"}]', NULL, 0, 0),
	(163, 74, 2, '步骤2', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"3223"},{"${content}":"32432"},{"${ContentType}":"3232"},{"${event}":"323232"}]', '[{"${statusCode}":"2222"}]', NULL, 0, 0),
	(164, 75, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"431"},{"${content}":"21111"},{"${ContentType}":"1"},{"${event}":"13"},{"${statusCode}":"1111"}]', '[{"${statusCode}":"1111"}]', NULL, 0, 0),
	(165, 75, 2, '步骤2', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"3223"},{"${content}":"32432"},{"${ContentType}":"3232"},{"${event}":"323232"}]', '[{"${statusCode}":"2222"}]', NULL, 0, 0),
	(166, 76, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"431"},{"${content}":"21111"},{"${ContentType}":"1"},{"${event}":"13"},{"${statusCode}":"1111"}]', '[{"${statusCode}":"1111"}]', NULL, 0, 0),
	(167, 76, 2, '步骤2', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"3223"},{"${content}":"32432"},{"${ContentType}":"3232"},{"${event}":"323232"}]', '[{"${statusCode}":"2222"}]', NULL, 0, 0),
	(168, 77, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"431"},{"${content}":"21111"},{"${ContentType}":"1"},{"${event}":"13"},{"${statusCode}":"1111"}]', '[{"${statusCode}":"1111"}]', NULL, 0, 0),
	(169, 77, 2, '步骤2', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"3223"},{"${content}":"32432"},{"${ContentType}":"3232"},{"${event}":"323232"}]', '[{"${statusCode}":"2222"}]', NULL, 0, 0);
/*!40000 ALTER TABLE `ss_ver_task_case_step` ENABLE KEYS */;


-- 导出  表 quickstart.ss_xml_config 结构
DROP TABLE IF EXISTS `ss_xml_config`;
CREATE TABLE IF NOT EXISTS `ss_xml_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- 正在导出表  quickstart.ss_xml_config 的数据：~13 rows (大约)
/*!40000 ALTER TABLE `ss_xml_config` DISABLE KEYS */;
INSERT INTO `ss_xml_config` (`id`, `title`, `description`, `create_date`, `update_date`, `user_id`) VALUES
	(5, '33', '222', '2016-12-30 19:43:54', '2016-12-30 19:43:54', 1),
	(6, '434', '4334', NULL, '2017-01-01 21:54:28', 1),
	(7, '配置测试1', '配置测试2', '2017-01-01 21:55:42', '2017-01-01 21:55:42', 1),
	(8, '2', '222', '2017-01-03 20:23:47', '2017-01-03 20:23:47', 1),
	(9, '2', '222', '2017-01-03 20:24:14', '2017-01-03 20:24:14', 1),
	(10, '都懂得', '问问', '2017-01-03 20:29:01', '2017-01-03 20:29:01', 1),
	(11, '订单', '问问', '2017-01-03 20:31:14', '2017-01-03 20:31:14', 1),
	(12, '订单', '问问', '2017-01-03 20:31:57', '2017-01-03 20:31:57', 1),
	(13, '二次', '问问', '2017-01-03 20:34:11', '2017-01-03 20:34:11', 1),
	(14, '22', '232323', '2017-01-03 20:43:48', '2017-01-03 20:43:48', 1),
	(15, '333', '23232232', NULL, '2017-01-04 23:01:48', 1),
	(16, '333', '23232232', '2017-01-03 20:48:29', '2017-01-03 20:48:29', 1),
	(17, '1', '1', NULL, '2017-01-04 00:12:06', 1),
	(18, 'sss', 'sss', '2017-01-05 00:23:52', '2017-01-05 00:23:52', 1);
/*!40000 ALTER TABLE `ss_xml_config` ENABLE KEYS */;


-- 导出  表 quickstart.ss_xml_config_detail 结构
DROP TABLE IF EXISTS `ss_xml_config_detail`;
CREATE TABLE IF NOT EXISTS `ss_xml_config_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `xml_config_id` bigint(20) DEFAULT NULL,
  `order_num` int(8) NOT NULL,
  `step_name` varchar(128) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `request_content` varchar(500) DEFAULT NULL,
  `response_content` varchar(500) DEFAULT NULL,
  `request_params` varchar(500) DEFAULT NULL,
  `response_params` varchar(500) DEFAULT NULL,
  `gx_params` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- 正在导出表  quickstart.ss_xml_config_detail 的数据：~19 rows (大约)
/*!40000 ALTER TABLE `ss_xml_config_detail` DISABLE KEYS */;
INSERT INTO `ss_xml_config_detail` (`id`, `xml_config_id`, `order_num`, `step_name`, `description`, `request_content`, `response_content`, `request_params`, `response_params`, `gx_params`) VALUES
	(1, 5, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"2"},{"${content}":"3"},{"${ContentType}":"2"},{"${event}":"1"},{"${statusCode}":"22"}]', '[]', NULL),
	(2, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"43"},{"${content}":"2"},{"${ContentType}":"1"},{"${event}":"13"},{"${statusCode}":"434"}]', '[]', NULL),
	(4, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"431"},{"${content}":"2"},{"${ContentType}":"1"},{"${event}":"13"}]', '[]', NULL),
	(5, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"431"},{"${content}":"21111"},{"${ContentType}":"1"},{"${event}":"13"}]', '[]', NULL),
	(6, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"431"},{"${content}":"21111"},{"${ContentType}":"1"},{"${event}":"13"}]', '[]', NULL),
	(7, NULL, 2, '步骤2', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"3223"},{"${content}":"32432"},{"${ContentType}":"3232"},{"${event}":"323232"}]', '[]', NULL),
	(8, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"431"},{"${content}":"21111"},{"${ContentType}":"1"},{"${event}":"13"},{"${statusCode}":"1111"}]', '[]', NULL),
	(9, NULL, 2, '步骤2', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"3223"},{"${content}":"32432"},{"${ContentType}":"3232"},{"${event}":"323232"}]', '[]', NULL),
	(10, 6, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"431"},{"${content}":"21111"},{"${ContentType}":"1"},{"${event}":"13"},{"${statusCode}":"1111"}]', '[{"${statusCode}":"1111"}]', NULL),
	(11, 6, 2, '步骤2', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"3223"},{"${content}":"32432"},{"${ContentType}":"3232"},{"${event}":"323232"}]', '[{"${statusCode}":"2222"}]', NULL),
	(12, 7, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"4"}]', '[{"${statusCode}":"1"}]', NULL),
	(13, 8, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"2"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"2"}]', '[{"${statusCode}":"3"}]', NULL),
	(14, 9, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"2"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"2"}]', '[{"${statusCode}":"3"}]', NULL),
	(15, 10, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"1"},{"${ContentType}":"1"},{"${event}":"1"}]', '[{"${statusCode}":"2"}]', NULL),
	(16, 11, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"1"},{"${event}":"1"}]', '[{"${statusCode}":"33"}]', NULL),
	(17, 12, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"1"},{"${event}":"1"}]', '[{"${statusCode}":"33"}]', NULL),
	(18, 13, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"4"}]', '[{"${statusCode}":"2"}]', NULL),
	(19, 14, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"1"},{"${ContentType}":"1"},{"${event}":"1"}]', '[{"${statusCode}":"1"}]', NULL),
	(20, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"1"},{"${ContentType}":"1"},{"${event}":"1"}]', '[{"${statusCode}":"1"}]', NULL),
	(21, 16, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"1"},{"${ContentType}":"1"},{"${event}":"1"}]', '[{"${statusCode}":"1"}]', NULL),
	(22, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"4"}]', '[{"${statusCode}":"5"}]', '[{"参数":"1212"}]'),
	(23, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"4"}]', '[{"${statusCode}":"5"}]', '[{"参数":"1212"}]'),
	(24, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"4"}]', '[{"${statusCode}":"5"}]', '[{"参数":"1212"}]'),
	(25, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"4"}]', '[{"${statusCode}":"5"}]', '[{"参数":"1214"}]'),
	(26, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"4"}]', '[{"${statusCode}":"5"}]', '[{"参数":"1215"}]'),
	(27, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"4"}]', '[{"${statusCode}":"5"}]', '[{"参数":"12222"},{"参数":"1215"}]'),
	(28, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"4"}]', '[{"${statusCode}":"5"}]', '[{"参数":"12222"},{"参数":"1215"}]'),
	(29, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"4"}]', '[{"${statusCode}":"5"}]', '[{"参数":"12222"},{"参数":"1215"}]'),
	(30, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"4"}]', '[{"${statusCode}":"5"}]', '[{"参数":"11111"},{"参数":"12222"},{"参数":"1215"}]'),
	(31, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"4"}]', '[{"${statusCode}":"5"}]', '[{"参数":"参数"},{"参数":"11111"},{"参数":"12222"},{"参数":"1215"}]'),
	(32, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"4"}]', '[{"${statusCode}":"5"}]', '[{"参数":"参数"},{"参数":"参数"},{"参数":"11111"},{"参数":"12222"},{"参数":"1215"}]'),
	(33, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"4"}]', '[{"${statusCode}":"5"}]', '[{"123":"123"},{"参数":"参数"},{"参数":"11111"},{"参数":"12222"},{"参数":"1215"}]'),
	(34, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"4"}]', '[{"${statusCode}":"5"}]', '[{"123":"123"},{"参数":"123"},{"参数":"参数"},{"参数":"11111"},{"参数":"12222"}]'),
	(35, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"4"}]', '[{"${statusCode}":"5"}]', '[{"5555":"123"},{"参数":"123"},{"参数":"参数"},{"参数":"11111"},{"参数":"12222"}]'),
	(36, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"4"}]', '[{"${statusCode}":"5"}]', '[{"5555":"123"}]'),
	(37, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"4"}]', '[{"${statusCode}":"5"}]', '[{"5555":"123"}]'),
	(38, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"4"}]', '[{"${statusCode}":"5"}]', '[{"5555":"123"}]'),
	(39, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"4"}]', '[{"${statusCode}":"5"}]', '[{"5555":"123"}]'),
	(40, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"4"}]', '[{"${statusCode}":"5"}]', '[{"5555":"123"}]'),
	(41, NULL, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"4"}]', '[{"${statusCode}":"5"}]', '[{"5555":"123"}]'),
	(42, 17, 1, '步骤1', '22222', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"2"},{"${ContentType}":"3"},{"${event}":"4"}]', '[{"${statusCode}":"5"}]', '[{"5555":"123"}]'),
	(43, 15, 1, '步骤1', '模板1', '<Request>\r\n	<Parameter name="userId" value="${userId}" />\r\n	<Parameter name="content" value="${content}" />\r\n	<Parameter name="ContentType" value="${ContentType}" />\r\n	<Parameter name="event" value="${event}" />\r\n</Request>', '<Response>\r\n	<Expect>\r\n		<Parameter name="statusCode" value="${statusCode}" />\r\n	</Expect>\r\n</Response>', '[{"${userId}":"1"},{"${content}":"1"},{"${ContentType}":"1"},{"${event}":"1"}]', '[{"${statusCode}":"1"}]', '[{"333":"444"}]'),
	(44, 18, 1, '步骤1', '模板12222', '321321321', '321321321', '[]', '[]', '[]');
/*!40000 ALTER TABLE `ss_xml_config_detail` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
