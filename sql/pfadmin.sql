/*
 Navicat Premium Data Transfer

 Source Server         : fan
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost
 Source Database       : pfadmin

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : utf-8

 Date: 07/15/2019 13:44:54 PM
*/

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `alipay_config`
-- ----------------------------
DROP TABLE IF EXISTS `alipay_config`;
CREATE TABLE `alipay_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` varchar(255) DEFAULT NULL COMMENT '应用ID',
  `charset` varchar(255) DEFAULT NULL COMMENT '编码',
  `format` varchar(255) DEFAULT NULL COMMENT '类型 固定格式json',
  `gateway_url` varchar(255) DEFAULT NULL COMMENT '网关地址',
  `notify_url` varchar(255) DEFAULT NULL COMMENT '异步回调',
  `private_key` text COMMENT '私钥',
  `public_key` text COMMENT '公钥',
  `return_url` varchar(255) DEFAULT NULL COMMENT '回调地址',
  `sign_type` varchar(255) DEFAULT NULL COMMENT '签名方式',
  `sys_service_provider_id` varchar(255) DEFAULT NULL COMMENT '商户号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `pid` bigint(20) NOT NULL COMMENT '上级部门',
  `create_time` datetime DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `dept`
-- ----------------------------
BEGIN;
INSERT INTO `dept` VALUES ('1', 'eladmin', '0', '2019-03-25 09:14:05', b'1'), ('2', '研发部', '7', '2019-03-25 09:15:32', b'1'), ('5', '运维部', '7', '2019-03-25 09:20:44', b'1'), ('6', '测试部', '8', '2019-03-25 09:52:18', b'1'), ('7', '华南分部', '1', '2019-03-25 11:04:50', b'1'), ('8', '华北分部', '1', '2019-03-25 11:04:53', b'1'), ('9', '财务部', '7', '2019-03-25 11:05:34', b'1'), ('10', '行政部', '8', '2019-03-25 11:05:58', b'1'), ('11', '人事部', '8', '2019-03-25 11:07:58', b'1'), ('12', '市场部', '7', '2019-03-25 11:10:24', b'0');
COMMIT;

-- ----------------------------
--  Table structure for `dict`
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '字典名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `dict`
-- ----------------------------
BEGIN;
INSERT INTO `dict` VALUES ('1', 'user_status', '用户状态'), ('4', 'dept_status', '部门状态'), ('5', 'job_status', '岗位状态');
COMMIT;

-- ----------------------------
--  Table structure for `dict_detail`
-- ----------------------------
DROP TABLE IF EXISTS `dict_detail`;
CREATE TABLE `dict_detail` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL COMMENT '字典标签',
  `value` varchar(255) NOT NULL COMMENT '字典值',
  `sort` varchar(255) DEFAULT NULL COMMENT '排序',
  `dict_id` bigint(11) DEFAULT NULL COMMENT '字典id',
  PRIMARY KEY (`id`),
  KEY `FK5tpkputc6d9nboxojdbgnpmyb` (`dict_id`),
  CONSTRAINT `FK5tpkputc6d9nboxojdbgnpmyb` FOREIGN KEY (`dict_id`) REFERENCES `dict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `dict_detail`
-- ----------------------------
BEGIN;
INSERT INTO `dict_detail` VALUES ('1', '激活', 'true', '1', '1'), ('2', '锁定', 'false', '2', '1'), ('11', '正常', 'true', '1', '4'), ('12', '停用', 'false', '2', '4'), ('13', '正常', 'true', '1', '5'), ('14', '停用', 'false', '2', '5');
COMMIT;

-- ----------------------------
--  Table structure for `email_config`
-- ----------------------------
DROP TABLE IF EXISTS `email_config`;
CREATE TABLE `email_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `from_user` varchar(255) DEFAULT NULL COMMENT '收件人',
  `host` varchar(255) DEFAULT NULL COMMENT '邮件服务器SMTP地址',
  `pass` varchar(255) DEFAULT NULL COMMENT '密码',
  `port` varchar(255) DEFAULT NULL COMMENT '端口',
  `user` varchar(255) DEFAULT NULL COMMENT '发件者用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `gen_config`
-- ----------------------------
DROP TABLE IF EXISTS `gen_config`;
CREATE TABLE `gen_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `cover` bit(1) DEFAULT NULL COMMENT '是否覆盖',
  `module_name` varchar(255) DEFAULT NULL COMMENT '模块名称',
  `pack` varchar(255) DEFAULT NULL COMMENT '至于哪个包下',
  `path` varchar(255) DEFAULT NULL COMMENT '前端代码生成的路径',
  `api_path` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `gen_config`
-- ----------------------------
BEGIN;
INSERT INTO `gen_config` VALUES ('1', 'pf', b'0', 'eladmin-system', 'me.pf.modules.test', '/Users/Huxin/Document/front/eladmin-qt/src/views/test', '/Users/Huxin/Document/front/eladmin-qt/src/api', null);
COMMIT;

-- ----------------------------
--  Table structure for `job`
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `sort` bigint(20) NOT NULL,
  `dept_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmvhj0rogastlctflsxf1d6k3i` (`dept_id`),
  CONSTRAINT `FKmvhj0rogastlctflsxf1d6k3i` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `job`
-- ----------------------------
BEGIN;
INSERT INTO `job` VALUES ('2', '董事长秘书', b'1', '2019-03-29 14:01:30', '2', '1'), ('8', '人事专员', b'1', '2019-03-29 14:52:28', '3', '11'), ('10', '产品经理', b'0', '2019-03-29 14:55:51', '4', '2'), ('11', '全栈开发', b'1', '2019-03-31 13:39:30', '6', '2'), ('12', '软件测试', b'1', '2019-03-31 13:39:43', '5', '2'), ('19', '董事长', b'1', '2019-03-31 14:58:15', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `exception_detail` text,
  `log_type` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `params` text,
  `request_ip` varchar(255) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10334 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `i_frame` bit(1) DEFAULT NULL COMMENT '是否外链',
  `name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `component` varchar(255) DEFAULT NULL COMMENT '组件',
  `pid` bigint(20) NOT NULL COMMENT '上级菜单ID',
  `sort` bigint(20) NOT NULL COMMENT '排序',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `path` varchar(255) DEFAULT NULL COMMENT '链接地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `menu`
-- ----------------------------
BEGIN;
INSERT INTO `menu` VALUES ('1', '2018-12-18 15:11:29', b'0', '系统管理', null, '0', '1', 'system', 'system'), ('2', '2018-12-18 15:14:44', b'0', '用户管理', 'system/user/index', '1', '2', 'peoples', 'user'), ('3', '2018-12-18 15:16:07', b'0', '角色管理', 'system/role/index', '1', '3', 'role', 'role'), ('4', '2018-12-18 15:16:45', b'0', '权限管理', 'system/permission/index', '1', '4', 'permission', 'permission'), ('5', '2018-12-18 15:17:28', b'0', '菜单管理', 'system/menu/index', '1', '5', 'menu', 'menu'), ('6', '2018-12-18 15:17:48', b'0', '系统监控', null, '0', '10', 'monitor', 'monitor'), ('7', '2018-12-18 15:18:26', b'0', '操作日志', 'monitor/log/index', '6', '11', 'log', 'logs'), ('8', '2018-12-18 15:19:01', b'0', '系统缓存', 'monitor/redis/index', '6', '13', 'redis', 'redis'), ('9', '2018-12-18 15:19:34', b'0', 'SQL监控', 'monitor/sql/index', '6', '14', 'sqlMonitor', 'druid'), ('10', '2018-12-19 13:38:16', b'0', '组件管理', null, '0', '50', 'zujian', 'components'), ('11', '2018-12-19 13:38:49', b'0', '图标库', 'components/IconSelect', '10', '51', 'icon', 'icon'), ('14', '2018-12-27 10:13:09', b'0', '邮件工具', 'tools/email/index', '36', '24', 'email', 'email'), ('15', '2018-12-27 11:58:25', b'0', '富文本', 'components/Editor', '10', '52', 'fwb', 'tinymce'), ('16', '2018-12-28 09:36:53', b'0', '图床管理', 'tools/picture/index', '36', '25', 'image', 'pictures'), ('17', '2018-12-28 15:09:49', b'1', '项目地址', '', '0', '0', 'github', 'https://github.com/elunez/eladmin'), ('18', '2018-12-31 11:12:15', b'0', '七牛云存储', 'tools/qiniu/index', '36', '26', 'qiniu', 'qiniu'), ('19', '2018-12-31 14:52:38', b'0', '支付宝工具', 'tools/aliPay/index', '36', '27', 'alipay', 'aliPay'), ('21', '2019-01-04 16:22:03', b'0', '多级菜单', '', '0', '900', 'menu', 'nested'), ('22', '2019-01-04 16:23:29', b'0', '二级菜单1', 'nested/menu1/index', '21', '999', 'menu', 'menu1'), ('23', '2019-01-04 16:23:57', b'0', '二级菜单2', 'nested/menu2/index', '21', '999', 'menu', 'menu2'), ('24', '2019-01-04 16:24:48', b'0', '三级菜单1', 'nested/menu1/menu1-1', '22', '999', 'menu', 'menu1-1'), ('27', '2019-01-07 17:27:32', b'0', '三级菜单2', 'nested/menu1/menu1-2', '22', '999', 'menu', 'menu1-2'), ('28', '2019-01-07 20:34:40', b'0', '定时任务', 'system/timing/index', '36', '21', 'timing', 'timing'), ('30', '2019-01-11 15:45:55', b'0', '代码生成', 'generator/index', '36', '22', 'dev', 'generator'), ('32', '2019-01-13 13:49:03', b'0', '异常日志', 'monitor/log/errorLog', '6', '12', 'error', 'errorLog'), ('33', '2019-03-08 13:46:44', b'0', 'Markdown', 'components/MarkDown', '10', '53', 'markdown', 'markdown'), ('34', '2019-03-08 15:49:40', b'0', 'Yaml编辑器', 'components/YamlEdit', '10', '54', 'dev', 'yaml'), ('35', '2019-03-25 09:46:00', b'0', '部门管理', 'system/dept/index', '1', '6', 'dept', 'dept'), ('36', '2019-03-29 10:57:35', b'0', '系统工具', '', '0', '20', 'sys-tools', 'sys-tools'), ('37', '2019-03-29 13:51:18', b'0', '岗位管理', 'system/job/index', '1', '7', 'Steve-Jobs', 'job'), ('38', '2019-03-29 19:57:53', b'0', '接口文档', 'tools/swagger/index', '36', '23', 'swagger', 'swagger2'), ('39', '2019-04-10 11:49:04', b'0', '字典管理', 'system/dict/index', '1', '8', 'dictionary', 'dict');
COMMIT;

-- ----------------------------
--  Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `alias` varchar(255) DEFAULT NULL COMMENT '别名',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `pid` int(11) NOT NULL COMMENT '上级权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `permission`
-- ----------------------------
BEGIN;
INSERT INTO `permission` VALUES ('1', '超级管理员', '2018-12-03 12:27:48', 'ADMIN', '0'), ('2', '用户管理', '2018-12-03 12:28:19', 'USER_ALL', '0'), ('3', '用户查询', '2018-12-03 12:31:35', 'USER_SELECT', '2'), ('4', '用户创建', '2018-12-03 12:31:35', 'USER_CREATE', '2'), ('5', '用户编辑', '2018-12-03 12:31:35', 'USER_EDIT', '2'), ('6', '用户删除', '2018-12-03 12:31:35', 'USER_DELETE', '2'), ('7', '角色管理', '2018-12-03 12:28:19', 'ROLES_ALL', '0'), ('8', '角色查询', '2018-12-03 12:31:35', 'ROLES_SELECT', '7'), ('10', '角色创建', '2018-12-09 20:10:16', 'ROLES_CREATE', '7'), ('11', '角色编辑', '2018-12-09 20:10:42', 'ROLES_EDIT', '7'), ('12', '角色删除', '2018-12-09 20:11:07', 'ROLES_DELETE', '7'), ('13', '权限管理', '2018-12-09 20:11:37', 'PERMISSION_ALL', '0'), ('14', '权限查询', '2018-12-09 20:11:55', 'PERMISSION_SELECT', '13'), ('15', '权限创建', '2018-12-09 20:14:10', 'PERMISSION_CREATE', '13'), ('16', '权限编辑', '2018-12-09 20:15:44', 'PERMISSION_EDIT', '13'), ('17', '权限删除', '2018-12-09 20:15:59', 'PERMISSION_DELETE', '13'), ('18', '缓存管理', '2018-12-17 13:53:25', 'REDIS_ALL', '0'), ('20', '缓存查询', '2018-12-17 13:54:07', 'REDIS_SELECT', '18'), ('22', '缓存删除', '2018-12-17 13:55:04', 'REDIS_DELETE', '18'), ('23', '图床管理', '2018-12-27 20:31:49', 'PICTURE_ALL', '0'), ('24', '查询图片', '2018-12-27 20:32:04', 'PICTURE_SELECT', '23'), ('25', '上传图片', '2018-12-27 20:32:24', 'PICTURE_UPLOAD', '23'), ('26', '删除图片', '2018-12-27 20:32:45', 'PICTURE_DELETE', '23'), ('29', '菜单管理', '2018-12-28 17:34:31', 'MENU_ALL', '0'), ('30', '菜单查询', '2018-12-28 17:34:41', 'MENU_SELECT', '29'), ('31', '菜单创建', '2018-12-28 17:34:52', 'MENU_CREATE', '29'), ('32', '菜单编辑', '2018-12-28 17:35:20', 'MENU_EDIT', '29'), ('33', '菜单删除', '2018-12-28 17:35:29', 'MENU_DELETE', '29'), ('35', '定时任务管理', '2019-01-08 14:59:57', 'JOB_ALL', '0'), ('36', '任务查询', '2019-01-08 15:00:09', 'JOB_SELECT', '35'), ('37', '任务创建', '2019-01-08 15:00:20', 'JOB_CREATE', '35'), ('38', '任务编辑', '2019-01-08 15:00:33', 'JOB_EDIT', '35'), ('39', '任务删除', '2019-01-08 15:01:13', 'JOB_DELETE', '35'), ('40', '部门管理', '2019-03-29 17:06:55', 'DEPT_ALL', '0'), ('41', '部门查询', '2019-03-29 17:07:09', 'DEPT_SELECT', '40'), ('42', '部门创建', '2019-03-29 17:07:29', 'DEPT_CREATE', '40'), ('43', '部门编辑', '2019-03-29 17:07:52', 'DEPT_EDIT', '40'), ('44', '部门删除', '2019-03-29 17:08:14', 'DEPT_DELETE', '40'), ('45', '岗位管理', '2019-03-29 17:08:52', 'USERJOB_ALL', '0'), ('46', '岗位查询', '2019-03-29 17:10:27', 'USERJOB_SELECT', '45'), ('47', '岗位创建', '2019-03-29 17:10:55', 'USERJOB_CREATE', '45'), ('48', '岗位编辑', '2019-03-29 17:11:08', 'USERJOB_EDIT', '45'), ('49', '岗位删除', '2019-03-29 17:11:19', 'USERJOB_DELETE', '45'), ('50', '字典管理', '2019-04-10 16:24:51', 'DICT_ALL', '0'), ('51', '字典查询', '2019-04-10 16:25:16', 'DICT_SELECT', '50'), ('52', '字典创建', '2019-04-10 16:25:29', 'DICT_CREATE', '50'), ('53', '字典编辑', '2019-04-10 16:27:19', 'DICT_EDIT', '50'), ('54', '字典删除', '2019-04-10 16:27:30', 'DICT_DELETE', '50');
COMMIT;

-- ----------------------------
--  Table structure for `picture`
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_time` datetime DEFAULT NULL COMMENT '上传日期',
  `delete_url` varchar(255) DEFAULT NULL COMMENT '删除的URL',
  `filename` varchar(255) DEFAULT NULL COMMENT '图片名称',
  `height` varchar(255) DEFAULT NULL COMMENT '图片高度',
  `size` varchar(255) DEFAULT NULL COMMENT '图片大小',
  `url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `width` varchar(255) DEFAULT NULL COMMENT '图片宽度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `qiniu_config`
-- ----------------------------
DROP TABLE IF EXISTS `qiniu_config`;
CREATE TABLE `qiniu_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `access_key` text COMMENT 'accessKey',
  `bucket` varchar(255) DEFAULT NULL COMMENT 'Bucket 识别符',
  `host` varchar(255) NOT NULL COMMENT '外链域名',
  `secret_key` text COMMENT 'secretKey',
  `type` varchar(255) DEFAULT NULL COMMENT '空间类型',
  `zone` varchar(255) DEFAULT NULL COMMENT '机房',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `qiniu_content`
-- ----------------------------
DROP TABLE IF EXISTS `qiniu_content`;
CREATE TABLE `qiniu_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bucket` varchar(255) DEFAULT NULL COMMENT 'Bucket 识别符',
  `name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `size` varchar(255) DEFAULT NULL COMMENT '文件大小',
  `type` varchar(255) DEFAULT NULL COMMENT '文件类型：私有或公开',
  `update_time` datetime DEFAULT NULL COMMENT '上传或同步的时间',
  `url` varchar(255) DEFAULT NULL COMMENT '文件url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `quartz_job`
-- ----------------------------
DROP TABLE IF EXISTS `quartz_job`;
CREATE TABLE `quartz_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bean_name` varchar(255) DEFAULT NULL COMMENT 'Spring Bean名称',
  `cron_expression` varchar(255) DEFAULT NULL COMMENT 'cron 表达式',
  `is_pause` bit(1) DEFAULT NULL COMMENT '状态：1暂停、0启用',
  `job_name` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `method_name` varchar(255) DEFAULT NULL COMMENT '方法名称',
  `params` varchar(255) DEFAULT NULL COMMENT '参数',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `update_time` datetime DEFAULT NULL COMMENT '创建或更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `quartz_job`
-- ----------------------------
BEGIN;
INSERT INTO `quartz_job` VALUES ('1', 'visitsTask', '0 0 0 * * ?', b'0', '更新访客记录', 'run', null, '每日0点创建新的访客记录', '2019-01-08 14:53:31'), ('2', 'testTask', '0/5 * * * * ?', b'1', '测试1', 'run1', 'test', '带参测试，多参使用json', '2019-01-13 14:20:50'), ('3', 'testTask', '0/5 * * * * ?', b'1', '测试', 'run', '', '不带参测试', '2019-04-09 16:16:44');
COMMIT;

-- ----------------------------
--  Table structure for `quartz_log`
-- ----------------------------
DROP TABLE IF EXISTS `quartz_log`;
CREATE TABLE `quartz_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `baen_name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `cron_expression` varchar(255) DEFAULT NULL,
  `exception_detail` text,
  `is_success` bit(1) DEFAULT NULL,
  `job_name` varchar(255) DEFAULT NULL,
  `method_name` varchar(255) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `data_scope` varchar(255) DEFAULT NULL,
  `level` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `role`
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES ('1', '2018-11-23 11:04:37', '超级管理员', '系统所有权', '全部', '1'), ('2', '2018-11-23 13:09:06', '普通用户', '用于测试菜单与权限', '自定义', '3'), ('4', '2019-05-13 14:16:15', '普通管理员', '普通管理员级别为2，使用该角色新增用户时只能赋予比普通管理员级别低的角色', '自定义', '2');
COMMIT;

-- ----------------------------
--  Table structure for `roles_depts`
-- ----------------------------
DROP TABLE IF EXISTS `roles_depts`;
CREATE TABLE `roles_depts` (
  `role_id` bigint(20) NOT NULL,
  `dept_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`dept_id`),
  KEY `FK7qg6itn5ajdoa9h9o78v9ksur` (`dept_id`),
  CONSTRAINT `FK7qg6itn5ajdoa9h9o78v9ksur` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`),
  CONSTRAINT `FKrg1ci4cxxfbja0sb0pddju7k` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `roles_depts`
-- ----------------------------
BEGIN;
INSERT INTO `roles_depts` VALUES ('2', '5'), ('4', '6'), ('4', '7'), ('2', '8');
COMMIT;

-- ----------------------------
--  Table structure for `roles_menus`
-- ----------------------------
DROP TABLE IF EXISTS `roles_menus`;
CREATE TABLE `roles_menus` (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`menu_id`,`role_id`),
  KEY `FKcngg2qadojhi3a651a5adkvbq` (`role_id`),
  CONSTRAINT `FKcngg2qadojhi3a651a5adkvbq` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FKq1knxf8ykt26we8k331naabjx` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `roles_menus`
-- ----------------------------
BEGIN;
INSERT INTO `roles_menus` VALUES ('1', '1'), ('2', '1'), ('3', '1'), ('4', '1'), ('5', '1'), ('6', '1'), ('7', '1'), ('8', '1'), ('9', '1'), ('10', '1'), ('11', '1'), ('14', '1'), ('15', '1'), ('16', '1'), ('17', '1'), ('18', '1'), ('19', '1'), ('21', '1'), ('22', '1'), ('23', '1'), ('24', '1'), ('27', '1'), ('28', '1'), ('30', '1'), ('32', '1'), ('33', '1'), ('34', '1'), ('35', '1'), ('36', '1'), ('37', '1'), ('38', '1'), ('39', '1'), ('1', '2'), ('2', '2'), ('3', '2'), ('4', '2'), ('5', '2'), ('6', '2'), ('8', '2'), ('9', '2'), ('10', '2'), ('11', '2'), ('14', '2'), ('15', '2'), ('16', '2'), ('17', '2'), ('18', '2'), ('19', '2'), ('21', '2'), ('22', '2'), ('23', '2'), ('24', '2'), ('27', '2'), ('28', '2'), ('30', '2'), ('33', '2'), ('34', '2'), ('35', '2'), ('36', '2'), ('37', '2'), ('38', '2'), ('39', '2'), ('1', '4'), ('2', '4');
COMMIT;

-- ----------------------------
--  Table structure for `roles_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `roles_permissions`;
CREATE TABLE `roles_permissions` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `permission_id` bigint(20) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `FKboeuhl31go7wer3bpy6so7exi` (`permission_id`),
  CONSTRAINT `FK4hrolwj4ned5i7qe8kyiaak6m` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FKboeuhl31go7wer3bpy6so7exi` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `roles_permissions`
-- ----------------------------
BEGIN;
INSERT INTO `roles_permissions` VALUES ('1', '1'), ('2', '3'), ('4', '3'), ('4', '4'), ('4', '5'), ('2', '8'), ('2', '14'), ('2', '20'), ('2', '23'), ('2', '24'), ('2', '25'), ('2', '26'), ('2', '30'), ('2', '36'), ('2', '41'), ('2', '46'), ('2', '51');
COMMIT;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `enabled` bigint(20) DEFAULT NULL COMMENT '状态：1启用、0禁用',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `last_password_reset_time` datetime DEFAULT NULL COMMENT '最后修改密码的日期',
  `dept_id` bigint(20) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_kpubos9gc2cvtkb0thktkbkes` (`email`),
  UNIQUE KEY `username` (`username`),
  KEY `FK5rwmryny6jthaaxkogownknqp` (`dept_id`),
  KEY `FKfftoc2abhot8f2wu6cl9a5iky` (`job_id`),
  CONSTRAINT `FK5rwmryny6jthaaxkogownknqp` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`),
  CONSTRAINT `FKfftoc2abhot8f2wu6cl9a5iky` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', 'https://i.loli.net/2019/04/04/5ca5b971e1548.jpeg', '2018-08-23 09:11:56', 'admin@eladmin.net', '1', 'e10adc3949ba59abbe56e057f20f883e', 'admin', '2019-05-18 17:34:21', '2', '18888888888', '11'), ('3', 'https://aurora-1255840532.cos.ap-chengdu.myqcloud.com/8918a306ea314404835a9196585c4b75.jpeg', '2018-12-27 20:05:26', 'test@eladmin.net', '1', 'e10adc3949ba59abbe56e057f20f883e', 'test', '2019-04-01 09:15:24', '2', '17777777777', '12'), ('5', 'https://aurora-1255840532.cos.ap-chengdu.myqcloud.com/8918a306ea314404835a9196585c4b75.jpeg', '2019-04-02 10:07:12', 'hr@eladmin.net', '1', 'e10adc3949ba59abbe56e057f20f883e', 'hr', null, '11', '15555555555', '8');
COMMIT;

-- ----------------------------
--  Table structure for `users_roles`
-- ----------------------------
DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE `users_roles` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKq4eq273l04bpu4efj0jd0jb98` (`role_id`),
  CONSTRAINT `users_roles_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `users_roles_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `users_roles`
-- ----------------------------
BEGIN;
INSERT INTO `users_roles` VALUES ('1', '1'), ('3', '2'), ('5', '4');
COMMIT;

-- ----------------------------
--  Table structure for `verification_code`
-- ----------------------------
DROP TABLE IF EXISTS `verification_code`;
CREATE TABLE `verification_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(255) DEFAULT NULL COMMENT '验证码',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `status` bit(1) DEFAULT NULL COMMENT '状态：1有效、0过期',
  `type` varchar(255) DEFAULT NULL COMMENT '验证码类型：email或者短信',
  `value` varchar(255) DEFAULT NULL COMMENT '接收邮箱或者手机号码',
  `scenes` varchar(255) DEFAULT NULL COMMENT '业务名称：如重置邮箱、重置密码等',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `visits`
-- ----------------------------
DROP TABLE IF EXISTS `visits`;
CREATE TABLE `visits` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `ip_counts` bigint(20) DEFAULT NULL,
  `pv_counts` bigint(20) DEFAULT NULL,
  `week_day` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_11aksgq87euk9bcyeesfs4vtp` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
