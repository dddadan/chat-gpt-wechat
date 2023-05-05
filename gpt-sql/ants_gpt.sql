/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : ants_gpt

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 04/05/2023 22:14:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (6, 'wx_chat', '微信聊天表', NULL, NULL, 'WxChat', 'crud', 'com.ants.weixin', 'weixin', 'chat', '微信聊天', 'ants', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-03-05 15:15:22', '', '2023-03-05 15:16:30', NULL);
INSERT INTO `gen_table` VALUES (7, 'wx_feedback', '反馈管理', NULL, NULL, 'WxFeedback', 'crud', 'com.ants.weixin', 'weixin', 'feedback', '反馈管理', 'ants', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-03-13 21:35:23', '', '2023-03-13 21:36:27', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 203 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (185, '6', 'id', '主键', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-05 15:15:22', '', '2023-03-05 15:16:30');
INSERT INTO `gen_table_column` VALUES (186, '6', 'user_id', '用户id', 'int', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-03-05 15:15:22', '', '2023-03-05 15:16:30');
INSERT INTO `gen_table_column` VALUES (187, '6', 'role', '角色', 'varchar(50)', 'String', 'role', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2023-03-05 15:15:22', '', '2023-03-05 15:16:30');
INSERT INTO `gen_table_column` VALUES (188, '6', 'content', '内容', 'text', 'String', 'content', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 4, 'admin', '2023-03-05 15:15:22', '', '2023-03-05 15:16:30');
INSERT INTO `gen_table_column` VALUES (189, '6', 'error_flag', '是否报错', 'int', 'Long', 'errorFlag', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-03-05 15:15:22', '', '2023-03-05 15:16:30');
INSERT INTO `gen_table_column` VALUES (190, '6', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, '1', 'BETWEEN', 'datetime', '', 6, 'admin', '2023-03-05 15:15:22', '', '2023-03-05 15:16:30');
INSERT INTO `gen_table_column` VALUES (191, '6', 'create_by', '创建者', 'varchar(100)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2023-03-05 15:15:22', '', '2023-03-05 15:16:30');
INSERT INTO `gen_table_column` VALUES (192, '6', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2023-03-05 15:15:22', '', '2023-03-05 15:16:30');
INSERT INTO `gen_table_column` VALUES (193, '6', 'update_by', '更新者', 'varchar(100)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2023-03-05 15:15:22', '', '2023-03-05 15:16:30');
INSERT INTO `gen_table_column` VALUES (194, '6', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2023-03-05 15:15:22', '', '2023-03-05 15:16:30');
INSERT INTO `gen_table_column` VALUES (195, '7', 'id', '主键', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-13 21:35:23', '', '2023-03-13 21:36:27');
INSERT INTO `gen_table_column` VALUES (196, '7', 'openid', 'openid', 'varchar(100)', 'String', 'openid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-03-13 21:35:23', '', '2023-03-13 21:36:27');
INSERT INTO `gen_table_column` VALUES (197, '7', 'feedback', '反馈内容', 'text', 'String', 'feedback', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'textarea', '', 3, 'admin', '2023-03-13 21:35:23', '', '2023-03-13 21:36:27');
INSERT INTO `gen_table_column` VALUES (198, '7', 'contact', '联系方式', 'varchar(200)', 'String', 'contact', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2023-03-13 21:35:23', '', '2023-03-13 21:36:27');
INSERT INTO `gen_table_column` VALUES (199, '7', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', '1', 'BETWEEN', 'datetime', '', 5, 'admin', '2023-03-13 21:35:23', '', '2023-03-13 21:36:27');
INSERT INTO `gen_table_column` VALUES (200, '7', 'create_by', '创建者', 'varchar(100)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2023-03-13 21:35:23', '', '2023-03-13 21:36:27');
INSERT INTO `gen_table_column` VALUES (201, '7', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2023-03-13 21:35:23', '', '2023-03-13 21:36:27');
INSERT INTO `gen_table_column` VALUES (202, '7', 'update_by', '更新者', 'varchar(100)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2023-03-13 21:35:23', '', '2023-03-13 21:36:27');
INSERT INTO `gen_table_column` VALUES (203, '7', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2023-03-13 21:35:23', '', '2023-03-13 21:36:27');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('AntsScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('AntsScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('AntsScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('AntsScheduler', 'TASK_CLASS_NAME7', 'DEFAULT', '0 0/1 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `fired_time` bigint(0) NOT NULL,
  `sched_time` bigint(0) NOT NULL,
  `priority` int(0) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('AntsScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ants.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001D636F6D2E616E74732E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720026636F6D2E616E74732E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001776B0199B878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('AntsScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ants.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001D636F6D2E616E74732E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720026636F6D2E616E74732E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001776B0199B878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('AntsScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ants.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001D636F6D2E616E74732E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720026636F6D2E616E74732E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001776B0199B878707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('AntsScheduler', 'TASK_CLASS_NAME7', 'DEFAULT', NULL, 'com.ants.quartz.util.QuartzJobExecution', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001D636F6D2E616E74732E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720026636F6D2E616E74732E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001872E38301878707400007070707400013074000D3020302F31202A202A202A203F740015616E74735461736B2E616E74734E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000007740012E5BC82E5B8B8E8818AE5A4A9E5A484E7908674000131740001307800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('AntsScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('AntsScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `last_checkin_time` bigint(0) NOT NULL,
  `checkin_interval` bigint(0) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('AntsScheduler', 'PC-2022092016141683131864843', 1683134072536, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `repeat_count` bigint(0) NOT NULL,
  `repeat_interval` bigint(0) NOT NULL,
  `times_triggered` bigint(0) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `int_prop_1` int(0) NULL DEFAULT NULL,
  `int_prop_2` int(0) NULL DEFAULT NULL,
  `long_prop_1` bigint(0) NULL DEFAULT NULL,
  `long_prop_2` bigint(0) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `next_fire_time` bigint(0) NULL DEFAULT NULL,
  `prev_fire_time` bigint(0) NULL DEFAULT NULL,
  `priority` int(0) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `start_time` bigint(0) NOT NULL,
  `end_time` bigint(0) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `misfire_instr` smallint(0) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('AntsScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1683131870000, -1, 5, 'PAUSED', 'CRON', 1683131864000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('AntsScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1683131865000, -1, 5, 'PAUSED', 'CRON', 1683131864000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('AntsScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1683131880000, -1, 5, 'PAUSED', 'CRON', 1683131864000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('AntsScheduler', 'TASK_CLASS_NAME7', 'DEFAULT', 'TASK_CLASS_NAME7', 'DEFAULT', NULL, 1683134100000, 1683134040000, 5, 'WAITING', 'CRON', 1683131865000, 0, NULL, -1, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-02-04 11:06:43', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-02-04 11:06:43', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-02-04 11:06:43', '', NULL, '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-04 11:06:42', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-04 11:06:42', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-04 11:06:42', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-04 11:06:42', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-04 11:06:42', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-04 11:06:42', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-04 11:06:42', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-04 11:06:42', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-04 11:06:42', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-02-04 11:06:42', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-02-04 11:06:43', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-02-04 11:06:43', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-02-04 11:06:43', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-02-04 11:06:43', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-02-04 11:06:43', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-02-04 11:06:43', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-02-04 11:06:43', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-02-04 11:06:43', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-02-04 11:06:43', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-02-04 11:06:43', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-02-04 11:06:43', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-02-04 11:06:43', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-02-04 11:06:43', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, 1, '源', 'sources', 'ants_logs_type', NULL, NULL, 'N', '0', 'admin', '2023-02-09 23:28:06', 'admin', '2023-03-02 23:34:23', '源类型');
INSERT INTO `sys_dict_data` VALUES (30, 2, '通道', 'channels', 'ants_logs_type', NULL, NULL, 'N', '0', 'admin', '2023-02-09 23:28:17', 'admin', '2023-03-02 23:34:26', '通道类型');
INSERT INTO `sys_dict_data` VALUES (31, 3, '目标', 'sinks', 'ants_logs_type', NULL, NULL, 'N', '0', 'admin', '2023-02-09 23:28:28', 'admin', '2023-03-02 23:34:28', '目标类型');
INSERT INTO `sys_dict_data` VALUES (32, 1, '输入框', 'Input', 'ants_logs_config_field_type', NULL, NULL, 'N', '0', 'admin', '2023-02-12 23:51:30', 'admin', '2023-02-12 23:52:01', '输入框');
INSERT INTO `sys_dict_data` VALUES (33, 2, '计数器', 'InputNumber', 'ants_logs_config_field_type', NULL, NULL, 'N', '0', 'admin', '2023-02-12 23:52:18', '', NULL, '计数器');
INSERT INTO `sys_dict_data` VALUES (34, 3, '文本框', 'TextArea', 'ants_logs_config_field_type', NULL, NULL, 'N', '0', 'admin', '2023-02-12 23:53:26', '', NULL, '文本框');
INSERT INTO `sys_dict_data` VALUES (35, 4, '开关', 'Switch', 'ants_logs_config_field_type', NULL, NULL, 'N', '0', 'admin', '2023-02-13 00:23:46', '', NULL, '开关');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '收集类型', 'ants_logs_type', '0', 'admin', '2023-02-09 23:27:10', '', NULL, '日志收集类型');
INSERT INTO `sys_dict_type` VALUES (12, '字段类型', 'ants_logs_config_field_type', '0', 'admin', '2023-02-12 23:51:03', 'admin', '2023-02-12 23:51:13', '日志配置字段类型');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-02-04 11:06:43', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-02-04 11:06:43', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-02-04 11:06:43', '', NULL, '');
INSERT INTO `sys_job` VALUES (7, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '0 0/1 * * * ?', '1', '0', '0', 'admin', '2023-03-30 00:34:07', '', '2023-03-30 00:34:16', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 314 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：16毫秒', '0', '', '2023-03-30 00:27:18');
INSERT INTO `sys_job_log` VALUES (2, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：14毫秒', '0', '', '2023-03-30 00:27:18');
INSERT INTO `sys_job_log` VALUES (3, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：14毫秒', '0', '', '2023-03-30 00:27:18');
INSERT INTO `sys_job_log` VALUES (4, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:18');
INSERT INTO `sys_job_log` VALUES (5, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:18');
INSERT INTO `sys_job_log` VALUES (6, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:18');
INSERT INTO `sys_job_log` VALUES (7, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:18');
INSERT INTO `sys_job_log` VALUES (8, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:18');
INSERT INTO `sys_job_log` VALUES (9, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:18');
INSERT INTO `sys_job_log` VALUES (10, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:18');
INSERT INTO `sys_job_log` VALUES (11, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:27:18');
INSERT INTO `sys_job_log` VALUES (12, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:18');
INSERT INTO `sys_job_log` VALUES (13, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:18');
INSERT INTO `sys_job_log` VALUES (14, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:18');
INSERT INTO `sys_job_log` VALUES (15, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:18');
INSERT INTO `sys_job_log` VALUES (16, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:18');
INSERT INTO `sys_job_log` VALUES (17, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:18');
INSERT INTO `sys_job_log` VALUES (18, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:18');
INSERT INTO `sys_job_log` VALUES (19, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：11毫秒', '0', '', '2023-03-30 00:27:18');
INSERT INTO `sys_job_log` VALUES (20, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:18');
INSERT INTO `sys_job_log` VALUES (21, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：17毫秒', '0', '', '2023-03-30 00:27:19');
INSERT INTO `sys_job_log` VALUES (22, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：11毫秒', '0', '', '2023-03-30 00:27:19');
INSERT INTO `sys_job_log` VALUES (23, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：11毫秒', '0', '', '2023-03-30 00:27:19');
INSERT INTO `sys_job_log` VALUES (24, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：12毫秒', '0', '', '2023-03-30 00:27:19');
INSERT INTO `sys_job_log` VALUES (25, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：11毫秒', '0', '', '2023-03-30 00:27:19');
INSERT INTO `sys_job_log` VALUES (26, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:19');
INSERT INTO `sys_job_log` VALUES (27, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:19');
INSERT INTO `sys_job_log` VALUES (28, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:19');
INSERT INTO `sys_job_log` VALUES (29, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:27:19');
INSERT INTO `sys_job_log` VALUES (30, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:19');
INSERT INTO `sys_job_log` VALUES (31, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:19');
INSERT INTO `sys_job_log` VALUES (32, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:19');
INSERT INTO `sys_job_log` VALUES (33, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:19');
INSERT INTO `sys_job_log` VALUES (34, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:27:19');
INSERT INTO `sys_job_log` VALUES (35, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:20');
INSERT INTO `sys_job_log` VALUES (36, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:21');
INSERT INTO `sys_job_log` VALUES (37, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:22');
INSERT INTO `sys_job_log` VALUES (38, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:23');
INSERT INTO `sys_job_log` VALUES (39, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:27:24');
INSERT INTO `sys_job_log` VALUES (40, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:25');
INSERT INTO `sys_job_log` VALUES (41, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:26');
INSERT INTO `sys_job_log` VALUES (42, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:27');
INSERT INTO `sys_job_log` VALUES (43, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：11毫秒', '0', '', '2023-03-30 00:27:28');
INSERT INTO `sys_job_log` VALUES (44, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:29');
INSERT INTO `sys_job_log` VALUES (45, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：17毫秒', '0', '', '2023-03-30 00:27:30');
INSERT INTO `sys_job_log` VALUES (46, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:31');
INSERT INTO `sys_job_log` VALUES (47, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:32');
INSERT INTO `sys_job_log` VALUES (48, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:33');
INSERT INTO `sys_job_log` VALUES (49, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:34');
INSERT INTO `sys_job_log` VALUES (50, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:35');
INSERT INTO `sys_job_log` VALUES (51, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：13毫秒', '0', '', '2023-03-30 00:27:36');
INSERT INTO `sys_job_log` VALUES (52, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:27:37');
INSERT INTO `sys_job_log` VALUES (53, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:38');
INSERT INTO `sys_job_log` VALUES (54, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:39');
INSERT INTO `sys_job_log` VALUES (55, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：17毫秒', '0', '', '2023-03-30 00:27:40');
INSERT INTO `sys_job_log` VALUES (56, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:27:41');
INSERT INTO `sys_job_log` VALUES (57, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:42');
INSERT INTO `sys_job_log` VALUES (58, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:43');
INSERT INTO `sys_job_log` VALUES (59, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:27:44');
INSERT INTO `sys_job_log` VALUES (60, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:27:45');
INSERT INTO `sys_job_log` VALUES (61, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:46');
INSERT INTO `sys_job_log` VALUES (62, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:47');
INSERT INTO `sys_job_log` VALUES (63, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:48');
INSERT INTO `sys_job_log` VALUES (64, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:49');
INSERT INTO `sys_job_log` VALUES (65, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:50');
INSERT INTO `sys_job_log` VALUES (66, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：12毫秒', '0', '', '2023-03-30 00:27:51');
INSERT INTO `sys_job_log` VALUES (67, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:52');
INSERT INTO `sys_job_log` VALUES (68, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:27:53');
INSERT INTO `sys_job_log` VALUES (69, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：21毫秒', '0', '', '2023-03-30 00:28:02');
INSERT INTO `sys_job_log` VALUES (70, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：13毫秒', '0', '', '2023-03-30 00:28:02');
INSERT INTO `sys_job_log` VALUES (71, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：12毫秒', '0', '', '2023-03-30 00:28:02');
INSERT INTO `sys_job_log` VALUES (72, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：11毫秒', '0', '', '2023-03-30 00:28:03');
INSERT INTO `sys_job_log` VALUES (73, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:28:04');
INSERT INTO `sys_job_log` VALUES (74, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：11毫秒', '0', '', '2023-03-30 00:28:05');
INSERT INTO `sys_job_log` VALUES (75, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：11毫秒', '0', '', '2023-03-30 00:28:06');
INSERT INTO `sys_job_log` VALUES (76, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：12毫秒', '0', '', '2023-03-30 00:28:07');
INSERT INTO `sys_job_log` VALUES (77, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:28:08');
INSERT INTO `sys_job_log` VALUES (78, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：11毫秒', '0', '', '2023-03-30 00:28:09');
INSERT INTO `sys_job_log` VALUES (79, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:28:10');
INSERT INTO `sys_job_log` VALUES (80, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：21毫秒', '0', '', '2023-03-30 00:28:36');
INSERT INTO `sys_job_log` VALUES (81, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：13毫秒', '0', '', '2023-03-30 00:28:36');
INSERT INTO `sys_job_log` VALUES (82, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:28:36');
INSERT INTO `sys_job_log` VALUES (83, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:28:36');
INSERT INTO `sys_job_log` VALUES (84, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:28:37');
INSERT INTO `sys_job_log` VALUES (85, '错误聊天自动化处理', 'DEFAULT', 'antsTask.antsNoParams', '错误聊天自动化处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:28:38');
INSERT INTO `sys_job_log` VALUES (86, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：11毫秒', '0', '', '2023-03-30 00:29:37');
INSERT INTO `sys_job_log` VALUES (87, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-03-30 00:29:37');
INSERT INTO `sys_job_log` VALUES (88, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:37');
INSERT INTO `sys_job_log` VALUES (89, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:37');
INSERT INTO `sys_job_log` VALUES (90, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:37');
INSERT INTO `sys_job_log` VALUES (91, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:37');
INSERT INTO `sys_job_log` VALUES (92, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:37');
INSERT INTO `sys_job_log` VALUES (93, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：11毫秒', '0', '', '2023-03-30 00:29:37');
INSERT INTO `sys_job_log` VALUES (94, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:37');
INSERT INTO `sys_job_log` VALUES (95, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：11毫秒', '0', '', '2023-03-30 00:29:37');
INSERT INTO `sys_job_log` VALUES (96, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:37');
INSERT INTO `sys_job_log` VALUES (97, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:37');
INSERT INTO `sys_job_log` VALUES (98, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：11毫秒', '0', '', '2023-03-30 00:29:37');
INSERT INTO `sys_job_log` VALUES (99, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:37');
INSERT INTO `sys_job_log` VALUES (100, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:37');
INSERT INTO `sys_job_log` VALUES (101, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：11毫秒', '0', '', '2023-03-30 00:29:37');
INSERT INTO `sys_job_log` VALUES (102, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：12毫秒', '0', '', '2023-03-30 00:29:37');
INSERT INTO `sys_job_log` VALUES (103, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：13毫秒', '0', '', '2023-03-30 00:29:37');
INSERT INTO `sys_job_log` VALUES (104, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：13毫秒', '0', '', '2023-03-30 00:29:37');
INSERT INTO `sys_job_log` VALUES (105, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：12毫秒', '0', '', '2023-03-30 00:29:37');
INSERT INTO `sys_job_log` VALUES (106, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-03-30 00:29:37');
INSERT INTO `sys_job_log` VALUES (107, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：12毫秒', '0', '', '2023-03-30 00:29:37');
INSERT INTO `sys_job_log` VALUES (108, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:37');
INSERT INTO `sys_job_log` VALUES (109, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：11毫秒', '0', '', '2023-03-30 00:29:38');
INSERT INTO `sys_job_log` VALUES (110, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：11毫秒', '0', '', '2023-03-30 00:29:38');
INSERT INTO `sys_job_log` VALUES (111, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:38');
INSERT INTO `sys_job_log` VALUES (112, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：11毫秒', '0', '', '2023-03-30 00:29:38');
INSERT INTO `sys_job_log` VALUES (113, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：11毫秒', '0', '', '2023-03-30 00:29:38');
INSERT INTO `sys_job_log` VALUES (114, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：11毫秒', '0', '', '2023-03-30 00:29:38');
INSERT INTO `sys_job_log` VALUES (115, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：11毫秒', '0', '', '2023-03-30 00:29:38');
INSERT INTO `sys_job_log` VALUES (116, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:38');
INSERT INTO `sys_job_log` VALUES (117, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:38');
INSERT INTO `sys_job_log` VALUES (118, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:38');
INSERT INTO `sys_job_log` VALUES (119, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:38');
INSERT INTO `sys_job_log` VALUES (120, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:39');
INSERT INTO `sys_job_log` VALUES (121, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:40');
INSERT INTO `sys_job_log` VALUES (122, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:41');
INSERT INTO `sys_job_log` VALUES (123, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:42');
INSERT INTO `sys_job_log` VALUES (124, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:43');
INSERT INTO `sys_job_log` VALUES (125, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:44');
INSERT INTO `sys_job_log` VALUES (126, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:45');
INSERT INTO `sys_job_log` VALUES (127, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:46');
INSERT INTO `sys_job_log` VALUES (128, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：11毫秒', '0', '', '2023-03-30 00:29:47');
INSERT INTO `sys_job_log` VALUES (129, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:48');
INSERT INTO `sys_job_log` VALUES (130, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:49');
INSERT INTO `sys_job_log` VALUES (131, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：13毫秒', '0', '', '2023-03-30 00:29:50');
INSERT INTO `sys_job_log` VALUES (132, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:51');
INSERT INTO `sys_job_log` VALUES (133, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:52');
INSERT INTO `sys_job_log` VALUES (134, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：12毫秒', '0', '', '2023-03-30 00:29:53');
INSERT INTO `sys_job_log` VALUES (135, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：11毫秒', '0', '', '2023-03-30 00:29:54');
INSERT INTO `sys_job_log` VALUES (136, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:55');
INSERT INTO `sys_job_log` VALUES (137, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:29:56');
INSERT INTO `sys_job_log` VALUES (138, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:57');
INSERT INTO `sys_job_log` VALUES (139, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:58');
INSERT INTO `sys_job_log` VALUES (140, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:29:59');
INSERT INTO `sys_job_log` VALUES (141, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:30:00');
INSERT INTO `sys_job_log` VALUES (142, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:30:01');
INSERT INTO `sys_job_log` VALUES (143, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:30:02');
INSERT INTO `sys_job_log` VALUES (144, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:03');
INSERT INTO `sys_job_log` VALUES (145, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:30:04');
INSERT INTO `sys_job_log` VALUES (146, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:30:05');
INSERT INTO `sys_job_log` VALUES (147, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:30:06');
INSERT INTO `sys_job_log` VALUES (148, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:30:07');
INSERT INTO `sys_job_log` VALUES (149, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:08');
INSERT INTO `sys_job_log` VALUES (150, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:30:09');
INSERT INTO `sys_job_log` VALUES (151, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:30:10');
INSERT INTO `sys_job_log` VALUES (152, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:30:11');
INSERT INTO `sys_job_log` VALUES (153, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:30:12');
INSERT INTO `sys_job_log` VALUES (154, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:30:13');
INSERT INTO `sys_job_log` VALUES (155, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:30:14');
INSERT INTO `sys_job_log` VALUES (156, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:15');
INSERT INTO `sys_job_log` VALUES (157, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:16');
INSERT INTO `sys_job_log` VALUES (158, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:17');
INSERT INTO `sys_job_log` VALUES (159, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:18');
INSERT INTO `sys_job_log` VALUES (160, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:19');
INSERT INTO `sys_job_log` VALUES (161, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:20');
INSERT INTO `sys_job_log` VALUES (162, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:21');
INSERT INTO `sys_job_log` VALUES (163, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:22');
INSERT INTO `sys_job_log` VALUES (164, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:23');
INSERT INTO `sys_job_log` VALUES (165, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:24');
INSERT INTO `sys_job_log` VALUES (166, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:25');
INSERT INTO `sys_job_log` VALUES (167, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:26');
INSERT INTO `sys_job_log` VALUES (168, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:27');
INSERT INTO `sys_job_log` VALUES (169, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:28');
INSERT INTO `sys_job_log` VALUES (170, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:29');
INSERT INTO `sys_job_log` VALUES (171, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:30:30');
INSERT INTO `sys_job_log` VALUES (172, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:31');
INSERT INTO `sys_job_log` VALUES (173, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:32');
INSERT INTO `sys_job_log` VALUES (174, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:33');
INSERT INTO `sys_job_log` VALUES (175, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:34');
INSERT INTO `sys_job_log` VALUES (176, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:35');
INSERT INTO `sys_job_log` VALUES (177, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:30:36');
INSERT INTO `sys_job_log` VALUES (178, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:37');
INSERT INTO `sys_job_log` VALUES (179, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:38');
INSERT INTO `sys_job_log` VALUES (180, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:39');
INSERT INTO `sys_job_log` VALUES (181, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:40');
INSERT INTO `sys_job_log` VALUES (182, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:30:41');
INSERT INTO `sys_job_log` VALUES (183, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:42');
INSERT INTO `sys_job_log` VALUES (184, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:30:43');
INSERT INTO `sys_job_log` VALUES (185, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:44');
INSERT INTO `sys_job_log` VALUES (186, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：8毫秒', '0', '', '2023-03-30 00:30:45');
INSERT INTO `sys_job_log` VALUES (187, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:30:46');
INSERT INTO `sys_job_log` VALUES (188, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:47');
INSERT INTO `sys_job_log` VALUES (189, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:30:48');
INSERT INTO `sys_job_log` VALUES (190, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:49');
INSERT INTO `sys_job_log` VALUES (191, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:30:50');
INSERT INTO `sys_job_log` VALUES (192, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：50毫秒', '0', '', '2023-03-30 00:30:51');
INSERT INTO `sys_job_log` VALUES (193, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:30:52');
INSERT INTO `sys_job_log` VALUES (194, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:30:53');
INSERT INTO `sys_job_log` VALUES (195, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-03-30 00:30:54');
INSERT INTO `sys_job_log` VALUES (196, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-03-30 00:30:55');
INSERT INTO `sys_job_log` VALUES (197, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:30:56');
INSERT INTO `sys_job_log` VALUES (198, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:30:57');
INSERT INTO `sys_job_log` VALUES (199, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:30:58');
INSERT INTO `sys_job_log` VALUES (200, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:30:59');
INSERT INTO `sys_job_log` VALUES (201, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:00');
INSERT INTO `sys_job_log` VALUES (202, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:01');
INSERT INTO `sys_job_log` VALUES (203, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-03-30 00:31:02');
INSERT INTO `sys_job_log` VALUES (204, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:03');
INSERT INTO `sys_job_log` VALUES (205, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:04');
INSERT INTO `sys_job_log` VALUES (206, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-03-30 00:31:05');
INSERT INTO `sys_job_log` VALUES (207, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-03-30 00:31:06');
INSERT INTO `sys_job_log` VALUES (208, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-03-30 00:31:07');
INSERT INTO `sys_job_log` VALUES (209, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-03-30 00:31:08');
INSERT INTO `sys_job_log` VALUES (210, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:09');
INSERT INTO `sys_job_log` VALUES (211, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-03-30 00:31:10');
INSERT INTO `sys_job_log` VALUES (212, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-03-30 00:31:11');
INSERT INTO `sys_job_log` VALUES (213, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-03-30 00:31:12');
INSERT INTO `sys_job_log` VALUES (214, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-03-30 00:31:13');
INSERT INTO `sys_job_log` VALUES (215, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 00:31:14');
INSERT INTO `sys_job_log` VALUES (216, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-03-30 00:31:15');
INSERT INTO `sys_job_log` VALUES (217, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:16');
INSERT INTO `sys_job_log` VALUES (218, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-03-30 00:31:17');
INSERT INTO `sys_job_log` VALUES (219, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-03-30 00:31:18');
INSERT INTO `sys_job_log` VALUES (220, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-03-30 00:31:19');
INSERT INTO `sys_job_log` VALUES (221, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:20');
INSERT INTO `sys_job_log` VALUES (222, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：19毫秒', '0', '', '2023-03-30 00:31:30');
INSERT INTO `sys_job_log` VALUES (223, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：8毫秒', '0', '', '2023-03-30 00:31:30');
INSERT INTO `sys_job_log` VALUES (224, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：8毫秒', '0', '', '2023-03-30 00:31:30');
INSERT INTO `sys_job_log` VALUES (225, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:30');
INSERT INTO `sys_job_log` VALUES (226, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：8毫秒', '0', '', '2023-03-30 00:31:31');
INSERT INTO `sys_job_log` VALUES (227, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:32');
INSERT INTO `sys_job_log` VALUES (228, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：8毫秒', '0', '', '2023-03-30 00:31:33');
INSERT INTO `sys_job_log` VALUES (229, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:34');
INSERT INTO `sys_job_log` VALUES (230, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:35');
INSERT INTO `sys_job_log` VALUES (231, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:36');
INSERT INTO `sys_job_log` VALUES (232, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：8毫秒', '0', '', '2023-03-30 00:31:37');
INSERT INTO `sys_job_log` VALUES (233, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:38');
INSERT INTO `sys_job_log` VALUES (234, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:39');
INSERT INTO `sys_job_log` VALUES (235, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：8毫秒', '0', '', '2023-03-30 00:31:40');
INSERT INTO `sys_job_log` VALUES (236, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:41');
INSERT INTO `sys_job_log` VALUES (237, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:42');
INSERT INTO `sys_job_log` VALUES (238, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:43');
INSERT INTO `sys_job_log` VALUES (239, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:44');
INSERT INTO `sys_job_log` VALUES (240, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：13毫秒', '0', '', '2023-03-30 00:31:45');
INSERT INTO `sys_job_log` VALUES (241, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:46');
INSERT INTO `sys_job_log` VALUES (242, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:47');
INSERT INTO `sys_job_log` VALUES (243, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-03-30 00:31:48');
INSERT INTO `sys_job_log` VALUES (244, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:49');
INSERT INTO `sys_job_log` VALUES (245, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:50');
INSERT INTO `sys_job_log` VALUES (246, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:51');
INSERT INTO `sys_job_log` VALUES (247, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：8毫秒', '0', '', '2023-03-30 00:31:52');
INSERT INTO `sys_job_log` VALUES (248, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:53');
INSERT INTO `sys_job_log` VALUES (249, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:54');
INSERT INTO `sys_job_log` VALUES (250, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:31:55');
INSERT INTO `sys_job_log` VALUES (251, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：27毫秒', '0', '', '2023-03-30 00:33:13');
INSERT INTO `sys_job_log` VALUES (252, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：12毫秒', '0', '', '2023-03-30 00:33:13');
INSERT INTO `sys_job_log` VALUES (253, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:33:13');
INSERT INTO `sys_job_log` VALUES (254, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:33:13');
INSERT INTO `sys_job_log` VALUES (255, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:33:14');
INSERT INTO `sys_job_log` VALUES (256, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:33:15');
INSERT INTO `sys_job_log` VALUES (257, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-03-30 00:33:16');
INSERT INTO `sys_job_log` VALUES (258, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:33:17');
INSERT INTO `sys_job_log` VALUES (259, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:33:18');
INSERT INTO `sys_job_log` VALUES (260, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:33:19');
INSERT INTO `sys_job_log` VALUES (261, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:33:20');
INSERT INTO `sys_job_log` VALUES (262, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：8毫秒', '0', '', '2023-03-30 00:33:21');
INSERT INTO `sys_job_log` VALUES (263, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：8毫秒', '0', '', '2023-03-30 00:33:22');
INSERT INTO `sys_job_log` VALUES (264, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:33:23');
INSERT INTO `sys_job_log` VALUES (265, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：8毫秒', '0', '', '2023-03-30 00:33:24');
INSERT INTO `sys_job_log` VALUES (266, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:33:25');
INSERT INTO `sys_job_log` VALUES (267, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：8毫秒', '0', '', '2023-03-30 00:33:26');
INSERT INTO `sys_job_log` VALUES (268, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:33:27');
INSERT INTO `sys_job_log` VALUES (269, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:33:28');
INSERT INTO `sys_job_log` VALUES (270, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：8毫秒', '0', '', '2023-03-30 00:33:29');
INSERT INTO `sys_job_log` VALUES (271, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 00:33:30');
INSERT INTO `sys_job_log` VALUES (272, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-03-30 00:33:31');
INSERT INTO `sys_job_log` VALUES (273, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：24毫秒', '0', '', '2023-03-30 00:39:00');
INSERT INTO `sys_job_log` VALUES (274, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：11毫秒', '0', '', '2023-03-30 00:40:00');
INSERT INTO `sys_job_log` VALUES (275, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：10毫秒', '0', '', '2023-03-30 00:41:00');
INSERT INTO `sys_job_log` VALUES (276, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：21毫秒', '0', '', '2023-03-30 01:01:00');
INSERT INTO `sys_job_log` VALUES (277, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：13毫秒', '0', '', '2023-03-30 01:02:00');
INSERT INTO `sys_job_log` VALUES (278, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：8毫秒', '0', '', '2023-03-30 01:03:00');
INSERT INTO `sys_job_log` VALUES (279, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 01:04:00');
INSERT INTO `sys_job_log` VALUES (280, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：22毫秒', '0', '', '2023-03-30 01:05:00');
INSERT INTO `sys_job_log` VALUES (281, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 01:06:00');
INSERT INTO `sys_job_log` VALUES (282, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 01:07:00');
INSERT INTO `sys_job_log` VALUES (283, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：5毫秒', '0', '', '2023-03-30 01:08:00');
INSERT INTO `sys_job_log` VALUES (284, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：8毫秒', '0', '', '2023-03-30 01:09:00');
INSERT INTO `sys_job_log` VALUES (285, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-03-30 01:10:00');
INSERT INTO `sys_job_log` VALUES (286, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：7毫秒', '0', '', '2023-03-30 01:11:00');
INSERT INTO `sys_job_log` VALUES (287, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-03-30 01:12:00');
INSERT INTO `sys_job_log` VALUES (288, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：5毫秒', '0', '', '2023-03-30 01:13:00');
INSERT INTO `sys_job_log` VALUES (289, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-03-30 01:14:00');
INSERT INTO `sys_job_log` VALUES (290, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：5毫秒', '0', '', '2023-03-30 01:15:00');
INSERT INTO `sys_job_log` VALUES (291, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：18毫秒', '0', '', '2023-03-30 01:39:00');
INSERT INTO `sys_job_log` VALUES (292, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-03-30 01:40:00');
INSERT INTO `sys_job_log` VALUES (293, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：5毫秒', '0', '', '2023-03-30 01:41:00');
INSERT INTO `sys_job_log` VALUES (294, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-03-30 01:42:00');
INSERT INTO `sys_job_log` VALUES (295, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-03-30 01:44:00');
INSERT INTO `sys_job_log` VALUES (296, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：97毫秒', '0', '', '2023-05-03 22:13:03');
INSERT INTO `sys_job_log` VALUES (297, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：8毫秒', '0', '', '2023-05-03 22:14:00');
INSERT INTO `sys_job_log` VALUES (298, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：8毫秒', '0', '', '2023-05-03 22:15:00');
INSERT INTO `sys_job_log` VALUES (299, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-05-03 22:16:00');
INSERT INTO `sys_job_log` VALUES (300, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：12毫秒', '0', '', '2023-05-03 22:17:00');
INSERT INTO `sys_job_log` VALUES (301, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-05-03 22:18:00');
INSERT INTO `sys_job_log` VALUES (302, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-05-03 22:19:00');
INSERT INTO `sys_job_log` VALUES (303, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：9毫秒', '0', '', '2023-05-03 22:20:00');
INSERT INTO `sys_job_log` VALUES (304, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：8毫秒', '0', '', '2023-05-03 22:21:00');
INSERT INTO `sys_job_log` VALUES (305, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：8毫秒', '0', '', '2023-05-03 22:22:00');
INSERT INTO `sys_job_log` VALUES (306, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：11毫秒', '0', '', '2023-05-03 22:44:00');
INSERT INTO `sys_job_log` VALUES (307, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：11毫秒', '0', '', '2023-05-03 22:45:00');
INSERT INTO `sys_job_log` VALUES (308, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-05-03 22:46:00');
INSERT INTO `sys_job_log` VALUES (309, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-03 22:47:00');
INSERT INTO `sys_job_log` VALUES (310, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-05-03 22:48:00');
INSERT INTO `sys_job_log` VALUES (311, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：6毫秒', '0', '', '2023-05-03 22:49:00');
INSERT INTO `sys_job_log` VALUES (312, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-03 22:50:00');
INSERT INTO `sys_job_log` VALUES (313, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：11毫秒', '0', '', '2023-05-03 22:51:00');
INSERT INTO `sys_job_log` VALUES (314, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：45毫秒', '0', '', '2023-05-03 22:52:00');
INSERT INTO `sys_job_log` VALUES (315, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：33毫秒', '0', '', '2023-05-03 22:53:00');
INSERT INTO `sys_job_log` VALUES (316, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：36毫秒', '0', '', '2023-05-03 22:54:00');
INSERT INTO `sys_job_log` VALUES (317, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-03 22:55:00');
INSERT INTO `sys_job_log` VALUES (318, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：18毫秒', '0', '', '2023-05-03 22:56:00');
INSERT INTO `sys_job_log` VALUES (319, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-03 22:57:00');
INSERT INTO `sys_job_log` VALUES (320, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：29毫秒', '0', '', '2023-05-03 22:58:00');
INSERT INTO `sys_job_log` VALUES (321, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-03 22:59:00');
INSERT INTO `sys_job_log` VALUES (322, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-03 23:00:00');
INSERT INTO `sys_job_log` VALUES (323, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：19毫秒', '0', '', '2023-05-03 23:01:00');
INSERT INTO `sys_job_log` VALUES (324, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-03 23:02:00');
INSERT INTO `sys_job_log` VALUES (325, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-03 23:03:00');
INSERT INTO `sys_job_log` VALUES (326, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：17毫秒', '0', '', '2023-05-03 23:04:00');
INSERT INTO `sys_job_log` VALUES (327, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：44毫秒', '0', '', '2023-05-03 23:05:00');
INSERT INTO `sys_job_log` VALUES (328, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-03 23:06:00');
INSERT INTO `sys_job_log` VALUES (329, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-03 23:07:00');
INSERT INTO `sys_job_log` VALUES (330, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-03 23:08:00');
INSERT INTO `sys_job_log` VALUES (331, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-03 23:09:00');
INSERT INTO `sys_job_log` VALUES (332, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-03 23:10:00');
INSERT INTO `sys_job_log` VALUES (333, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：17毫秒', '0', '', '2023-05-03 23:11:00');
INSERT INTO `sys_job_log` VALUES (334, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-03 23:12:00');
INSERT INTO `sys_job_log` VALUES (335, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-03 23:13:00');
INSERT INTO `sys_job_log` VALUES (336, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-03 23:14:00');
INSERT INTO `sys_job_log` VALUES (337, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：19毫秒', '0', '', '2023-05-03 23:15:00');
INSERT INTO `sys_job_log` VALUES (338, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-03 23:16:00');
INSERT INTO `sys_job_log` VALUES (339, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：18毫秒', '0', '', '2023-05-03 23:17:00');
INSERT INTO `sys_job_log` VALUES (340, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：18毫秒', '0', '', '2023-05-03 23:18:00');
INSERT INTO `sys_job_log` VALUES (341, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-03 23:19:00');
INSERT INTO `sys_job_log` VALUES (342, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-03 23:20:00');
INSERT INTO `sys_job_log` VALUES (343, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-03 23:21:00');
INSERT INTO `sys_job_log` VALUES (344, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：24毫秒', '0', '', '2023-05-03 23:22:00');
INSERT INTO `sys_job_log` VALUES (345, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-03 23:23:00');
INSERT INTO `sys_job_log` VALUES (346, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：18毫秒', '0', '', '2023-05-03 23:24:00');
INSERT INTO `sys_job_log` VALUES (347, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-03 23:25:00');
INSERT INTO `sys_job_log` VALUES (348, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-03 23:26:00');
INSERT INTO `sys_job_log` VALUES (349, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-03 23:27:00');
INSERT INTO `sys_job_log` VALUES (350, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-03 23:28:00');
INSERT INTO `sys_job_log` VALUES (351, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-03 23:29:00');
INSERT INTO `sys_job_log` VALUES (352, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：13毫秒', '0', '', '2023-05-03 23:30:00');
INSERT INTO `sys_job_log` VALUES (353, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-03 23:31:00');
INSERT INTO `sys_job_log` VALUES (354, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-03 23:32:00');
INSERT INTO `sys_job_log` VALUES (355, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-03 23:33:00');
INSERT INTO `sys_job_log` VALUES (356, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-03 23:34:00');
INSERT INTO `sys_job_log` VALUES (357, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-03 23:35:00');
INSERT INTO `sys_job_log` VALUES (358, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-03 23:36:00');
INSERT INTO `sys_job_log` VALUES (359, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-03 23:37:00');
INSERT INTO `sys_job_log` VALUES (360, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：13毫秒', '0', '', '2023-05-03 23:38:00');
INSERT INTO `sys_job_log` VALUES (361, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-03 23:39:00');
INSERT INTO `sys_job_log` VALUES (362, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：20毫秒', '0', '', '2023-05-03 23:40:00');
INSERT INTO `sys_job_log` VALUES (363, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-03 23:41:00');
INSERT INTO `sys_job_log` VALUES (364, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-03 23:42:00');
INSERT INTO `sys_job_log` VALUES (365, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-03 23:43:00');
INSERT INTO `sys_job_log` VALUES (366, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-03 23:44:00');
INSERT INTO `sys_job_log` VALUES (367, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-03 23:45:00');
INSERT INTO `sys_job_log` VALUES (368, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-03 23:46:00');
INSERT INTO `sys_job_log` VALUES (369, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-03 23:47:00');
INSERT INTO `sys_job_log` VALUES (370, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-03 23:48:00');
INSERT INTO `sys_job_log` VALUES (371, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-03 23:49:00');
INSERT INTO `sys_job_log` VALUES (372, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-03 23:50:00');
INSERT INTO `sys_job_log` VALUES (373, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-03 23:51:00');
INSERT INTO `sys_job_log` VALUES (374, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：13毫秒', '0', '', '2023-05-03 23:52:00');
INSERT INTO `sys_job_log` VALUES (375, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：13毫秒', '0', '', '2023-05-03 23:53:00');
INSERT INTO `sys_job_log` VALUES (376, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-03 23:54:00');
INSERT INTO `sys_job_log` VALUES (377, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-03 23:55:00');
INSERT INTO `sys_job_log` VALUES (378, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-03 23:56:00');
INSERT INTO `sys_job_log` VALUES (379, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-03 23:57:00');
INSERT INTO `sys_job_log` VALUES (380, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-03 23:58:00');
INSERT INTO `sys_job_log` VALUES (381, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-03 23:59:00');
INSERT INTO `sys_job_log` VALUES (382, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-04 00:00:00');
INSERT INTO `sys_job_log` VALUES (383, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-04 00:01:00');
INSERT INTO `sys_job_log` VALUES (384, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-04 00:02:00');
INSERT INTO `sys_job_log` VALUES (385, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-04 00:03:00');
INSERT INTO `sys_job_log` VALUES (386, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-04 00:04:00');
INSERT INTO `sys_job_log` VALUES (387, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-04 00:05:00');
INSERT INTO `sys_job_log` VALUES (388, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-04 00:06:00');
INSERT INTO `sys_job_log` VALUES (389, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：17毫秒', '0', '', '2023-05-04 00:07:00');
INSERT INTO `sys_job_log` VALUES (390, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-04 00:08:00');
INSERT INTO `sys_job_log` VALUES (391, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-04 00:09:00');
INSERT INTO `sys_job_log` VALUES (392, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-04 00:10:00');
INSERT INTO `sys_job_log` VALUES (393, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-04 00:11:00');
INSERT INTO `sys_job_log` VALUES (394, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-04 00:12:00');
INSERT INTO `sys_job_log` VALUES (395, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-04 00:13:00');
INSERT INTO `sys_job_log` VALUES (396, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-04 00:14:00');
INSERT INTO `sys_job_log` VALUES (397, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-04 00:15:00');
INSERT INTO `sys_job_log` VALUES (398, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-04 00:16:00');
INSERT INTO `sys_job_log` VALUES (399, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-04 00:17:00');
INSERT INTO `sys_job_log` VALUES (400, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-04 00:18:00');
INSERT INTO `sys_job_log` VALUES (401, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-04 00:19:00');
INSERT INTO `sys_job_log` VALUES (402, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-04 00:20:00');
INSERT INTO `sys_job_log` VALUES (403, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-04 00:21:00');
INSERT INTO `sys_job_log` VALUES (404, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-04 00:22:00');
INSERT INTO `sys_job_log` VALUES (405, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-04 00:23:00');
INSERT INTO `sys_job_log` VALUES (406, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-04 00:24:00');
INSERT INTO `sys_job_log` VALUES (407, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-04 00:25:00');
INSERT INTO `sys_job_log` VALUES (408, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：24毫秒', '0', '', '2023-05-04 00:27:00');
INSERT INTO `sys_job_log` VALUES (409, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：13毫秒', '0', '', '2023-05-04 00:28:00');
INSERT INTO `sys_job_log` VALUES (410, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-04 00:29:00');
INSERT INTO `sys_job_log` VALUES (411, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-04 00:30:00');
INSERT INTO `sys_job_log` VALUES (412, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：20毫秒', '0', '', '2023-05-04 00:31:00');
INSERT INTO `sys_job_log` VALUES (413, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：21毫秒', '0', '', '2023-05-04 00:32:00');
INSERT INTO `sys_job_log` VALUES (414, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-04 00:33:00');
INSERT INTO `sys_job_log` VALUES (415, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：20毫秒', '0', '', '2023-05-04 00:35:00');
INSERT INTO `sys_job_log` VALUES (416, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：21毫秒', '0', '', '2023-05-04 00:36:00');
INSERT INTO `sys_job_log` VALUES (417, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：18毫秒', '0', '', '2023-05-04 00:37:00');
INSERT INTO `sys_job_log` VALUES (418, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：23毫秒', '0', '', '2023-05-04 00:38:00');
INSERT INTO `sys_job_log` VALUES (419, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：21毫秒', '0', '', '2023-05-04 00:39:00');
INSERT INTO `sys_job_log` VALUES (420, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-04 00:40:00');
INSERT INTO `sys_job_log` VALUES (421, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-04 00:41:00');
INSERT INTO `sys_job_log` VALUES (422, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-04 00:42:00');
INSERT INTO `sys_job_log` VALUES (423, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-04 00:43:00');
INSERT INTO `sys_job_log` VALUES (424, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-04 00:44:00');
INSERT INTO `sys_job_log` VALUES (425, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-04 00:45:00');
INSERT INTO `sys_job_log` VALUES (426, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-04 00:46:00');
INSERT INTO `sys_job_log` VALUES (427, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-04 00:47:00');
INSERT INTO `sys_job_log` VALUES (428, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：18毫秒', '0', '', '2023-05-04 00:48:00');
INSERT INTO `sys_job_log` VALUES (429, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-04 00:49:00');
INSERT INTO `sys_job_log` VALUES (430, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-04 00:50:00');
INSERT INTO `sys_job_log` VALUES (431, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-04 00:51:00');
INSERT INTO `sys_job_log` VALUES (432, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-04 00:52:00');
INSERT INTO `sys_job_log` VALUES (433, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-04 00:53:00');
INSERT INTO `sys_job_log` VALUES (434, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-04 00:54:00');
INSERT INTO `sys_job_log` VALUES (435, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-04 00:55:00');
INSERT INTO `sys_job_log` VALUES (436, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-04 00:56:00');
INSERT INTO `sys_job_log` VALUES (437, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-04 00:57:00');
INSERT INTO `sys_job_log` VALUES (438, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-04 00:58:00');
INSERT INTO `sys_job_log` VALUES (439, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-04 00:59:00');
INSERT INTO `sys_job_log` VALUES (440, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-04 01:00:00');
INSERT INTO `sys_job_log` VALUES (441, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-04 01:01:00');
INSERT INTO `sys_job_log` VALUES (442, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-04 01:02:00');
INSERT INTO `sys_job_log` VALUES (443, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-04 01:03:00');
INSERT INTO `sys_job_log` VALUES (444, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-04 01:04:00');
INSERT INTO `sys_job_log` VALUES (445, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-04 01:05:00');
INSERT INTO `sys_job_log` VALUES (446, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：17毫秒', '0', '', '2023-05-04 01:06:00');
INSERT INTO `sys_job_log` VALUES (447, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-04 01:07:00');
INSERT INTO `sys_job_log` VALUES (448, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-04 01:08:00');
INSERT INTO `sys_job_log` VALUES (449, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：18毫秒', '0', '', '2023-05-04 01:09:00');
INSERT INTO `sys_job_log` VALUES (450, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-04 01:10:00');
INSERT INTO `sys_job_log` VALUES (451, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-04 01:11:00');
INSERT INTO `sys_job_log` VALUES (452, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：16毫秒', '0', '', '2023-05-04 01:12:00');
INSERT INTO `sys_job_log` VALUES (453, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：15毫秒', '0', '', '2023-05-04 01:13:00');
INSERT INTO `sys_job_log` VALUES (454, '异常聊天处理', 'DEFAULT', 'antsTask.antsNoParams', '异常聊天处理 总共耗时：14毫秒', '0', '', '2023-05-04 01:14:00');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 156 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-04 11:58:34');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-04 12:00:02');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-04 12:03:36');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-04 15:19:35');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-04 15:25:18');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-04 16:56:56');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-04 16:57:00');
INSERT INTO `sys_logininfor` VALUES (107, '123', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-02-04 17:27:25');
INSERT INTO `sys_logininfor` VALUES (108, '123', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-02-04 17:27:30');
INSERT INTO `sys_logininfor` VALUES (109, '123', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-02-04 17:27:39');
INSERT INTO `sys_logininfor` VALUES (110, '123', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-02-04 17:27:44');
INSERT INTO `sys_logininfor` VALUES (111, '', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-02-04 17:28:32');
INSERT INTO `sys_logininfor` VALUES (112, '123', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-02-04 17:29:45');
INSERT INTO `sys_logininfor` VALUES (113, '123', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-02-04 17:29:51');
INSERT INTO `sys_logininfor` VALUES (114, '', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-02-04 17:31:05');
INSERT INTO `sys_logininfor` VALUES (115, '213', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-02-04 17:43:32');
INSERT INTO `sys_logininfor` VALUES (116, '123', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-02-04 17:43:54');
INSERT INTO `sys_logininfor` VALUES (117, '123', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-02-04 17:44:32');
INSERT INTO `sys_logininfor` VALUES (118, '123', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2021-02-04 17:48:18');
INSERT INTO `sys_logininfor` VALUES (119, '123', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-04 17:48:22');
INSERT INTO `sys_logininfor` VALUES (120, '123', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-04 17:48:31');
INSERT INTO `sys_logininfor` VALUES (121, '123', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 3', '2021-02-04 17:52:25');
INSERT INTO `sys_logininfor` VALUES (122, '1234', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-02-04 17:58:40');
INSERT INTO `sys_logininfor` VALUES (123, '1234', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-04 17:58:43');
INSERT INTO `sys_logininfor` VALUES (124, '1234', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-04 17:58:50');
INSERT INTO `sys_logininfor` VALUES (125, '123', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-02-04 18:03:18');
INSERT INTO `sys_logininfor` VALUES (126, '123', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-04 18:03:21');
INSERT INTO `sys_logininfor` VALUES (127, '123', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-04 18:03:32');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 00:09:13');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-07 00:10:02');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 00:11:47');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 22:49:44');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-09 23:12:46');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-09 23:54:36');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-12 19:53:21');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-12 20:51:34');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-12 21:47:21');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-13 22:15:21');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-14 22:48:50');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-15 00:48:51');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-15 21:47:53');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-02-16 21:58:53');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-16 21:58:55');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-02-19 22:36:56');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-19 22:36:58');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-19 23:08:04');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-19 23:30:02');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-20 00:33:28');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-20 22:36:27');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-21 00:36:38');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-21 22:34:26');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-02 23:34:00');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-05 15:09:39');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-05 15:09:44');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-13 21:34:50');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-16 22:13:19');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-30 00:12:31');
INSERT INTO `sys_logininfor` VALUES (157, 'oE04J6nRYE185cYzh9S0si35oVNU', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-03 23:01:38');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-03 23:01:42');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(0) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(0) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2117 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 1, 0, 'M', '0', '0', '', 'system', 'admin', '2021-02-04 11:06:42', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2021-02-04 11:06:42', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2021-02-04 11:06:42', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2021-02-04 11:06:42', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2021-02-04 11:06:42', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2021-02-04 11:06:42', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2021-02-04 11:06:42', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2021-02-04 11:06:42', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2021-02-04 11:06:42', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2021-02-04 11:06:42', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2021-02-04 11:06:42', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2021-02-04 11:06:42', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2021-02-04 11:06:42', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2021-02-04 11:06:42', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2021-02-04 11:06:42', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2021-02-04 11:06:42', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2021-02-04 11:06:42', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2021-02-04 11:06:42', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2021-02-04 11:06:42', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2021-02-04 11:06:42', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2021-02-04 11:06:42', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2021-02-04 11:06:42', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '微信管理', 0, 4, 'weixin', NULL, 1, 0, 'M', '0', '0', NULL, 'wechat', 'admin', '2022-10-22 18:39:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '微信用户', 2000, 1, 'user', 'weixin/user/index', 1, 0, 'C', '0', '0', 'weixin:user:list', 'peoples', 'admin', '2022-10-22 18:42:07', 'admin', '2022-10-22 18:52:58', '微信用户菜单');
INSERT INTO `sys_menu` VALUES (2002, '微信用户查询', 2001, 1, '#', '', 1, 0, 'F', '0', '0', 'weixin:user:query', '#', 'admin', '2022-10-22 18:42:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '微信用户新增', 2001, 2, '#', '', 1, 0, 'F', '0', '0', 'weixin:user:add', '#', 'admin', '2022-10-22 18:42:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '微信用户修改', 2001, 3, '#', '', 1, 0, 'F', '0', '0', 'weixin:user:edit', '#', 'admin', '2022-10-22 18:42:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '微信用户删除', 2001, 4, '#', '', 1, 0, 'F', '0', '0', 'weixin:user:remove', '#', 'admin', '2022-10-22 18:42:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '微信用户导出', 2001, 5, '#', '', 1, 0, 'F', '0', '0', 'weixin:user:export', '#', 'admin', '2022-10-22 18:42:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2106, '微信聊天', 2000, 1, 'chat', 'weixin/chat/index', 1, 0, 'C', '0', '0', 'weixin:chat:list', 'wechat', 'admin', '2023-03-05 15:17:48', 'admin', '2023-03-05 15:20:08', '微信聊天菜单');
INSERT INTO `sys_menu` VALUES (2107, '微信聊天查询', 2106, 1, '#', '', 1, 0, 'F', '0', '0', 'weixin:chat:query', '#', 'admin', '2023-03-05 15:17:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2108, '微信聊天新增', 2106, 2, '#', '', 1, 0, 'F', '0', '0', 'weixin:chat:add', '#', 'admin', '2023-03-05 15:17:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2109, '微信聊天修改', 2106, 3, '#', '', 1, 0, 'F', '0', '0', 'weixin:chat:edit', '#', 'admin', '2023-03-05 15:17:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2110, '微信聊天删除', 2106, 4, '#', '', 1, 0, 'F', '0', '0', 'weixin:chat:remove', '#', 'admin', '2023-03-05 15:17:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2111, '微信聊天导出', 2106, 5, '#', '', 1, 0, 'F', '0', '0', 'weixin:chat:export', '#', 'admin', '2023-03-05 15:17:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2112, '反馈管理', 2000, 1, 'feedback', 'weixin/feedback/index', 1, 0, 'C', '0', '0', 'weixin:feedback:list', 'form', 'admin', '2023-03-13 21:37:00', 'admin', '2023-03-13 21:40:22', '反馈管理菜单');
INSERT INTO `sys_menu` VALUES (2113, '反馈管理查询', 2112, 1, '#', '', 1, 0, 'F', '0', '0', 'weixin:feedback:query', '#', 'admin', '2023-03-13 21:37:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2114, '反馈管理新增', 2112, 2, '#', '', 1, 0, 'F', '0', '0', 'weixin:feedback:add', '#', 'admin', '2023-03-13 21:37:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2115, '反馈管理修改', 2112, 3, '#', '', 1, 0, 'F', '0', '0', 'weixin:feedback:edit', '#', 'admin', '2023-03-13 21:37:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2116, '反馈管理删除', 2112, 4, '#', '', 1, 0, 'F', '0', '0', 'weixin:feedback:remove', '#', 'admin', '2023-03-13 21:37:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2117, '反馈管理导出', 2112, 5, '#', '', 1, 0, 'F', '0', '0', 'weixin:feedback:export', '#', 'admin', '2023-03-13 21:37:00', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2021-02-04 11:06:43', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2021-02-04 11:06:43', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 441 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '个人信息', 2, 'com.ants.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1612408002000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"大数据日志审计管理系统2.0\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1612408002000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 00:12:41');
INSERT INTO `sys_oper_log` VALUES (101, '个人信息', 2, 'com.ants.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1612408002000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"大数据日志审计管理系统2.0\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1612408002000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 00:12:50');
INSERT INTO `sys_oper_log` VALUES (102, '个人信息', 2, 'com.ants.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1612408002000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"email\":\"ants@163.com\",\"nickName\":\"大数据日志审计管理系统2.0\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1612408002000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-07 00:12:56');
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 6, 'com.ants.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'ants_type_config', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-09 23:13:03');
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 2, 'com.ants.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ants\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1675955583000,\"tableId\":1,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Configname\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"configname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"配置名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1675955583000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"configName\"},{\"capJavaField\":\"Configtab\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"configtab\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"配置标签\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1675955583000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"configTab\"},{\"capJavaField\":\"Configtype\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"configtype\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"配置类型\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isP', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-09 23:14:12');
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 2, 'com.ants.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ants\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"updateTime\":1675955652000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1675955583000,\"tableId\":1,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Configname\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"configname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"配置名称\",\"isQuery\":\"1\",\"updateTime\":1675955652000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1675955583000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"configName\"},{\"capJavaField\":\"Configtab\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"configtab\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"配置标签\",\"isQuery\":\"1\",\"updateTime\":1675955652000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1675955583000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"configTab\"},{\"capJavaField\":\"Configtype\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"configtype\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"配置类型\",\"isQuery\":\"1\",\"updateTime\":1675955652000,\"sort\":4,\"li', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-09 23:14:24');
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 1, 'com.ants.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"monitor\",\"orderNum\":\"4\",\"menuName\":\"logs\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"logs\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-09 23:14:51');
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 2, 'com.ants.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"monitor\",\"orderNum\":\"4\",\"menuName\":\"日志收集\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"logs\",\"children\":[],\"createTime\":1675955691000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1061,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-09 23:15:02');
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 2, 'com.ants.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ants\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"updateTime\":1675955664000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1675955583000,\"tableId\":1,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Configname\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"configname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"配置名称\",\"isQuery\":\"1\",\"updateTime\":1675955664000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1675955583000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"configName\"},{\"capJavaField\":\"Configtab\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"configtab\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"配置标签\",\"isQuery\":\"1\",\"updateTime\":1675955664000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1675955583000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"configTab\"},{\"capJavaField\":\"Configtype\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"configtype\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"配置类型\",\"isQuery\":\"1\",\"updateTime\":1675955664000,\"sort\":4,\"li', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-09 23:16:21');
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 8, 'com.ants.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2023-02-09 23:18:00');
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 2, 'com.ants.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"list\",\"orderNum\":\"1\",\"menuName\":\"基础配置\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"config\",\"component\":\"logs/config/index\",\"children\":[],\"createTime\":1675956254000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1062,\"menuType\":\"C\",\"perms\":\"logs:config:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-09 23:24:38');
INSERT INTO `sys_oper_log` VALUES (111, '字典类型', 1, 'com.ants.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"收集类型\",\"remark\":\"日志收集类型\",\"params\":{},\"dictType\":\"ants_logs_type\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-09 23:27:10');
INSERT INTO `sys_oper_log` VALUES (112, '字典数据', 1, 'com.ants.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"sources\",\"dictSort\":1,\"remark\":\"源类型\",\"params\":{},\"dictType\":\"ants_logs_type\",\"dictLabel\":\"源\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-09 23:28:06');
INSERT INTO `sys_oper_log` VALUES (113, '字典数据', 1, 'com.ants.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"channel\",\"dictSort\":2,\"remark\":\"通道类型\",\"params\":{},\"dictType\":\"ants_logs_type\",\"dictLabel\":\"通道\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-09 23:28:17');
INSERT INTO `sys_oper_log` VALUES (114, '字典数据', 1, 'com.ants.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"目标\",\"dictSort\":3,\"remark\":\"目标类型\",\"params\":{},\"dictType\":\"ants_logs_type\",\"dictLabel\":\"sink\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-09 23:28:28');
INSERT INTO `sys_oper_log` VALUES (115, '字典数据', 2, 'com.ants.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"sink\",\"dictSort\":3,\"remark\":\"目标类型\",\"params\":{},\"dictType\":\"ants_logs_type\",\"dictLabel\":\"目标\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1675956508000,\"dictCode\":31,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-09 23:28:35');
INSERT INTO `sys_oper_log` VALUES (116, '字典数据', 2, 'com.ants.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"source\",\"dictSort\":1,\"remark\":\"源类型\",\"params\":{},\"dictType\":\"ants_logs_type\",\"dictLabel\":\"源\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1675956486000,\"dictCode\":29,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-09 23:29:02');
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 2, 'com.ants.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/ants_type_config', '127.0.0.1', '内网IP', '{tableName=ants_type_config}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-09 23:33:57');
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 8, 'com.ants.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2023-02-09 23:33:59');
INSERT INTO `sys_oper_log` VALUES (119, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675957140373,\"configname\":\"命令源\",\"params\":{},\"configtab\":\"Exec Source\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1\r\n### The error may exist in file [D:\\WorkSpace_Java\\ants-logs-manage\\ants-system\\target\\classes\\mapper\\logs\\AntsTypeConfigMapper.xml]\r\n### The error may involve com.ants.logs.mapper.AntsTypeConfigMapper.insertAntsTypeConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ants_type_config          ( configName,             configTab,             configType,             configIndex,                          create_time )           values ( ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1; nested exception is java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1', '2023-02-09 23:39:00');
INSERT INTO `sys_oper_log` VALUES (120, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675957213929,\"configname\":\"命令源\",\"params\":{},\"configtab\":\"Exec Source\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1\r\n### The error may exist in file [D:\\WorkSpace_Java\\ants-logs-manage\\ants-system\\target\\classes\\mapper\\logs\\AntsTypeConfigMapper.xml]\r\n### The error may involve com.ants.logs.mapper.AntsTypeConfigMapper.insertAntsTypeConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ants_type_config          ( configName,             configTab,             configType,             configIndex,                          create_time )           values ( ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1; nested exception is java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1', '2023-02-09 23:40:13');
INSERT INTO `sys_oper_log` VALUES (121, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675957217723,\"configname\":\"命令源\",\"params\":{},\"configtab\":\"Exec Source\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1\r\n### The error may exist in file [D:\\WorkSpace_Java\\ants-logs-manage\\ants-system\\target\\classes\\mapper\\logs\\AntsTypeConfigMapper.xml]\r\n### The error may involve com.ants.logs.mapper.AntsTypeConfigMapper.insertAntsTypeConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ants_type_config          ( configName,             configTab,             configType,             configIndex,                          create_time )           values ( ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1; nested exception is java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1', '2023-02-09 23:40:17');
INSERT INTO `sys_oper_log` VALUES (122, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675957388837,\"configname\":\"命令源\",\"remark\":\"Unix命令执行进程，输出日志数据\",\"params\":{},\"configtab\":\"Exec Source\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1\r\n### The error may exist in file [D:\\WorkSpace_Java\\ants-logs-manage\\ants-system\\target\\classes\\mapper\\logs\\AntsTypeConfigMapper.xml]\r\n### The error may involve com.ants.logs.mapper.AntsTypeConfigMapper.insertAntsTypeConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ants_type_config          ( configName,             configTab,             configType,             configIndex,             remark,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1; nested exception is java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1', '2023-02-09 23:43:08');
INSERT INTO `sys_oper_log` VALUES (123, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675957719907,\"configname\":\"命令源\",\"remark\":\"执行Unix命令执行后不断输出日志数据，如tail -f\",\"params\":{},\"configtab\":\"Exec Source\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1\r\n### The error may exist in file [D:\\WorkSpace_Java\\ants-logs-manage\\ants-system\\target\\classes\\mapper\\logs\\AntsTypeConfigMapper.xml]\r\n### The error may involve com.ants.logs.mapper.AntsTypeConfigMapper.insertAntsTypeConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ants_type_config          ( configName,             configTab,             configType,             configIndex,             remark,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1; nested exception is java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1', '2023-02-09 23:48:39');
INSERT INTO `sys_oper_log` VALUES (124, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675957817008,\"configname\":\"命令源\",\"remark\":\"执行Unix命令执行后不断输出日志数据，如tail -f\",\"params\":{},\"configtab\":\"Exec Source\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1\r\n### The error may exist in file [D:\\WorkSpace_Java\\ants-logs-manage\\ants-system\\target\\classes\\mapper\\logs\\AntsTypeConfigMapper.xml]\r\n### The error may involve com.ants.logs.mapper.AntsTypeConfigMapper.insertAntsTypeConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ants_type_config          ( configName,             configTab,             configType,             configIndex,             remark,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1; nested exception is java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1', '2023-02-09 23:50:17');
INSERT INTO `sys_oper_log` VALUES (125, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675957904716,\"configname\":\"命令源\",\"remark\":\"执行Unix命令执行后不断输出日志数据，如tail -f\",\"params\":{},\"configtab\":\"Exec Source\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1\r\n### The error may exist in file [D:\\WorkSpace_Java\\ants-logs-manage\\ants-system\\target\\classes\\mapper\\logs\\AntsTypeConfigMapper.xml]\r\n### The error may involve com.ants.logs.mapper.AntsTypeConfigMapper.insertAntsTypeConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ants_type_config          ( configName,             configTab,             configType,             configIndex,             remark,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1; nested exception is java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1', '2023-02-09 23:51:44');
INSERT INTO `sys_oper_log` VALUES (126, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675958162530,\"configname\":\"命令源\",\"remark\":\"Unix命令不断输入的日志，如tail -f\",\"params\":{},\"configtab\":\"Exec Source\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1\r\n### The error may exist in file [D:\\WorkSpace_Java\\ants-logs-manage\\ants-system\\target\\classes\\mapper\\logs\\AntsTypeConfigMapper.xml]\r\n### The error may involve com.ants.logs.mapper.AntsTypeConfigMapper.insertAntsTypeConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ants_type_config          ( configName,             configTab,             configType,             configIndex,             remark,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1; nested exception is java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1', '2023-02-09 23:56:02');
INSERT INTO `sys_oper_log` VALUES (127, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675958224346,\"configname\":\"命令源\",\"remark\":\"Unix命令不断输入的日志，如tail -f\",\"params\":{},\"configtab\":\"Exec Source\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1\r\n### The error may exist in file [D:\\WorkSpace_Java\\ants-logs-manage\\ants-system\\target\\classes\\mapper\\logs\\AntsTypeConfigMapper.xml]\r\n### The error may involve com.ants.logs.mapper.AntsTypeConfigMapper.insertAntsTypeConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ants_type_config          ( configName,             configTab,             configType,             configIndex,             remark,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1; nested exception is java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1', '2023-02-09 23:57:04');
INSERT INTO `sys_oper_log` VALUES (128, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675958354476,\"configname\":\"命令源\",\"remark\":\"\",\"params\":{},\"configtab\":\"Exec Source\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1\r\n### The error may exist in file [D:\\WorkSpace_Java\\ants-logs-manage\\ants-system\\target\\classes\\mapper\\logs\\AntsTypeConfigMapper.xml]\r\n### The error may involve com.ants.logs.mapper.AntsTypeConfigMapper.insertAntsTypeConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ants_type_config          ( configName,             configTab,             configType,             configIndex,             remark,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1; nested exception is java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1', '2023-02-09 23:59:14');
INSERT INTO `sys_oper_log` VALUES (129, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675958356878,\"configname\":\"命令源\",\"remark\":\"Unix命令不断输入的日志，如tail -f\",\"params\":{},\"configtab\":\"\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1\r\n### The error may exist in file [D:\\WorkSpace_Java\\ants-logs-manage\\ants-system\\target\\classes\\mapper\\logs\\AntsTypeConfigMapper.xml]\r\n### The error may involve com.ants.logs.mapper.AntsTypeConfigMapper.insertAntsTypeConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ants_type_config          ( configName,             configTab,             configType,             configIndex,             remark,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1; nested exception is java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'configName\' at row 1', '2023-02-09 23:59:16');
INSERT INTO `sys_oper_log` VALUES (130, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675958360412,\"configname\":\"\",\"remark\":\"Unix命令不断输入的日志，如tail -f\",\"params\":{},\"configtab\":\"Exec Source\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'remark\' at row 1\r\n### The error may exist in file [D:\\WorkSpace_Java\\ants-logs-manage\\ants-system\\target\\classes\\mapper\\logs\\AntsTypeConfigMapper.xml]\r\n### The error may involve com.ants.logs.mapper.AntsTypeConfigMapper.insertAntsTypeConfig-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ants_type_config          ( configName,             configTab,             configType,             configIndex,             remark,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'remark\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'remark\' at row 1; nested exception is java.sql.SQLException: Incorrect string value: \'\\xE5\\x91\\xBD\\xE4\\xBB\\xA4...\' for column \'remark\' at row 1', '2023-02-09 23:59:20');
INSERT INTO `sys_oper_log` VALUES (131, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675959212419,\"configname\":\"命令源\",\"remark\":\"Unix命令不断输入的日志，如tail -f\",\"id\":1,\"params\":{},\"configtab\":\"Exec Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:13:32');
INSERT INTO `sys_oper_log` VALUES (132, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":2,\"createTime\":1675959420272,\"configname\":\"本地目录源\",\"remark\":\"监视某个本地路径产生的日志文件\",\"id\":2,\"params\":{},\"configtab\":\"Spooling Directory Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:17:00');
INSERT INTO `sys_oper_log` VALUES (133, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":2,\"createTime\":1675959420000,\"configname\":\"本地目录源\",\"remark\":\"监视某个本地路径产生的日志文件\",\"updateTime\":1675959710189,\"id\":2,\"params\":{},\"configtab\":\"Spooling Directory Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:21:50');
INSERT INTO `sys_oper_log` VALUES (134, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675959212000,\"configname\":\"命令源\",\"remark\":\"Exec源在启动时运行给定的Unix命令，并期望该进程在标准输出时连续生成数据（stderr被简单地丢弃，除非属性logStdErr设置为true）。如果进程出于任何原因退出，源也将退出，并且不会产生更多数据。这意味着cat[命名管道]或tail-F[文件]等配置将产生所需的结果，而as date可能不会产生-前两个命令产生数据流，后者产生单个事件并退出。\",\"updateTime\":1675959918592,\"id\":1,\"params\":{},\"configtab\":\"Exec Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:25:18');
INSERT INTO `sys_oper_log` VALUES (135, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":2,\"createTime\":1675959420000,\"configname\":\"本地目录源\",\"remark\":\"该源允许您通过将要摄取的文件放入磁盘上的“假脱机”目录来摄取数据。此源将监视指定目录中的新文件，并在新文件出现时解析事件。事件解析逻辑是可插入的。在将给定文件完全读入通道后，默认情况下通过重命名文件来指示完成，或者可以删除该文件，或者使用trackerDir来跟踪已处理的文件。\",\"updateTime\":1675959962648,\"id\":2,\"params\":{},\"configtab\":\"Spooling Directory Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:26:02');
INSERT INTO `sys_oper_log` VALUES (136, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":3,\"createTime\":1675960006004,\"configname\":\"Kafka源\",\"remark\":\"Kafka Source是一个Apache Kafka消费者，它从Kafka主题中读取消息。如果有多个Kafka源在运行，可以使用相同的Consumer Group对它们进行配置，这样每个源都将为主题读取一组唯一的分区。\",\"id\":3,\"params\":{},\"configtab\":\"Kafka Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:26:46');
INSERT INTO `sys_oper_log` VALUES (137, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":4,\"createTime\":1675960041875,\"configname\":\"TCP源\",\"remark\":\"在给定端口上侦听并将每行文本转换为事件的类似于netcat的源。行为类似于nc-k-l[host][port]。换句话说，它打开指定的端口并侦听数据。期望提供的数据是换行的文本。每一行文本都会变成一个Flume事件，并通过连接的通道发送。\",\"id\":4,\"params\":{},\"configtab\":\"NetCat TCP Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:27:21');
INSERT INTO `sys_oper_log` VALUES (138, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":4,\"createTime\":1675960042000,\"configname\":\"TCP源\",\"remark\":\"在给定端口上侦听并将每行文本转换为事件的类似于netcat的源。行为类似于nc -k -l [host] [port]。换句话说，它打开指定的端口并侦听数据。期望提供的数据是换行的文本。每一行文本都会变成一个Flume事件，并通过连接的通道发送。\",\"updateTime\":1675960052705,\"id\":4,\"params\":{},\"configtab\":\"NetCat TCP Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:27:32');
INSERT INTO `sys_oper_log` VALUES (139, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":5,\"createTime\":1675960085393,\"configname\":\"UDP源\",\"remark\":\"根据最初的Netcat（TCP）源，该源在给定端口上侦听，并将每行文本转换为事件，并通过连接的通道发送。行为类似于nc -u -k -l [host] [port]。\",\"id\":5,\"params\":{},\"configtab\":\"NetCat UDP Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:28:05');
INSERT INTO `sys_oper_log` VALUES (140, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":6,\"createTime\":1675960169929,\"configname\":\"Syslog TCP源\",\"remark\":\"更新、更快、支持多端口的版本的Syslog TCP源。请注意，端口配置设置已取代端口。多端口功能意味着它可以以高效的方式同时侦听多个端口。这个源代码使用ApacheMina库来实现这一点。提供对RFC-3164和许多常见的RFC-5424格式消息的支持。还提供了配置每个端口使用的字符集的功能。\",\"id\":6,\"params\":{},\"configtab\":\"Syslog TCP Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:29:29');
INSERT INTO `sys_oper_log` VALUES (141, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":7,\"createTime\":1675960228782,\"configname\":\"Syslog UDP源\",\"remark\":\"读取系统日志数据并生成事件。UDP源将整个消息视为单个事件。\",\"id\":7,\"params\":{},\"configtab\":\"Syslog UDP Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:30:28');
INSERT INTO `sys_oper_log` VALUES (142, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":8,\"createTime\":1675960291405,\"configname\":\"HTTP源\",\"remark\":\"通过HTTP POST和GET接受的源。GET只能用于实验。此处理程序接受HttpServletRequest并返回水槽事件列表。从一个Http请求处理的所有事件都在一个事务中提交到通道，从而提高了通道（如文件通道）的效率。如果处理程序抛出异常，则此源将返回HTTP状态400。如果频道已满，或者源无法将事件附加到频道，则源将返回HTTP 503-暂时不可用状态。\",\"id\":8,\"params\":{},\"configtab\":\"HTTP Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:31:31');
INSERT INTO `sys_oper_log` VALUES (143, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":9,\"createTime\":1675960335917,\"configname\":\"内存通道\",\"remark\":\"事件存储在具有可配置最大大小的内存队列中。它非常适合需要更高吞吐量并准备在代理失败时丢失暂存数据的流。\",\"id\":9,\"params\":{},\"configtab\":\"Memory Channel\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:32:15');
INSERT INTO `sys_oper_log` VALUES (144, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":10,\"createTime\":1675960362724,\"configname\":\"JDBC通道\",\"remark\":\"事件存储在由数据库支持的持久存储中。JDBC通道当前支持嵌入式Derby。这是一个持久的通道，非常适合可恢复性很重要的流。\",\"id\":10,\"params\":{},\"configtab\":\"JDBC Channel\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:32:42');
INSERT INTO `sys_oper_log` VALUES (145, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":11,\"createTime\":1675960424127,\"configname\":\"文件通道\",\"remark\":\"本地文件存储通道缓存\",\"id\":11,\"params\":{},\"configtab\":\"File Channel\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:33:44');
INSERT INTO `sys_oper_log` VALUES (146, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sink\",\"configindex\":1,\"createTime\":1675960484183,\"configname\":\"HDFS目标\",\"remark\":\"此接收器将事件写入Hadoop分布式文件系统（HDFS）。它目前支持创建文本和序列文件。它支持两种文件类型的压缩。可以根据经过的时间、数据大小或事件数量定期滚动文件（关闭当前文件并创建新文件）。它还根据时间戳或事件发生的机器等属性对数据进行桶/分区。HDFS目录路径可能包含格式化转义序列，该序列将被HDFS接收器替换，以生成用于存储事件的目录/文件名。使用此接收器需要安装hadoop，以便Flume可以使用hadoop jar与HDFS集群通信。注意，需要支持sync（）调用的Hadoop版本。\",\"id\":12,\"params\":{},\"configtab\":\"HDFS Sink\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:34:44');
INSERT INTO `sys_oper_log` VALUES (147, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"channel\",\"configindex\":9,\"createTime\":1675960336000,\"configname\":\"内存通道\",\"remark\":\"事件存储在具有可配置最大大小的内存队列中。它非常适合需要更高吞吐量并准备在代理失败时丢失暂存数据的流。\",\"updateTime\":1675960490947,\"id\":9,\"params\":{},\"configtab\":\"Memory Channel\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:34:50');
INSERT INTO `sys_oper_log` VALUES (148, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"channel\",\"configindex\":10,\"createTime\":1675960363000,\"configname\":\"JDBC通道\",\"remark\":\"事件存储在由数据库支持的持久存储中。JDBC通道当前支持嵌入式Derby。这是一个持久的通道，非常适合可恢复性很重要的流。\",\"updateTime\":1675960496120,\"id\":10,\"params\":{},\"configtab\":\"JDBC Channel\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:34:56');
INSERT INTO `sys_oper_log` VALUES (149, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"channel\",\"configindex\":11,\"createTime\":1675960424000,\"configname\":\"文件通道\",\"remark\":\"本地文件存储通道缓存\",\"updateTime\":1675960499528,\"id\":11,\"params\":{},\"configtab\":\"File Channel\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:34:59');
INSERT INTO `sys_oper_log` VALUES (150, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sink\",\"configindex\":12,\"createTime\":1675960484000,\"configname\":\"HDFS目标\",\"remark\":\"此接收器将事件写入Hadoop分布式文件系统（HDFS）。它目前支持创建文本和序列文件。它支持两种文件类型的压缩。可以根据经过的时间、数据大小或事件数量定期滚动文件（关闭当前文件并创建新文件）。它还根据时间戳或事件发生的机器等属性对数据进行桶/分区。HDFS目录路径可能包含格式化转义序列，该序列将被HDFS接收器替换，以生成用于存储事件的目录/文件名。使用此接收器需要安装hadoop，以便Flume可以使用hadoop jar与HDFS集群通信。注意，需要支持sync（）调用的Hadoop版本。\",\"updateTime\":1675960505993,\"id\":12,\"params\":{},\"configtab\":\"HDFS Sink\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:35:06');
INSERT INTO `sys_oper_log` VALUES (151, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sink\",\"configindex\":13,\"createTime\":1675960538033,\"configname\":\"日志目标\",\"remark\":\"在INFO级别记录事件。通常用于测试/调试目的。必需的财产以粗体显示。此接收器是唯一不需要日志记录原始数据部分中解释的额外配置的例外。\",\"id\":13,\"params\":{},\"configtab\":\"Logger Sink\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:35:38');
INSERT INTO `sys_oper_log` VALUES (152, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sink\",\"configindex\":14,\"createTime\":1675960576352,\"configname\":\"文档目标\",\"remark\":\"在本地文件系统上存储事件\",\"id\":14,\"params\":{},\"configtab\":\"File Roll Sink\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:36:16');
INSERT INTO `sys_oper_log` VALUES (153, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sink\",\"configindex\":1,\"createTime\":1675960704865,\"configname\":\"Kafka目标\",\"remark\":\"可以将数据发布到Kafka主题。其中一个目标是与Kafka集成，以便基于pull的处理系统能够处理来自不同源的数据。\",\"id\":15,\"params\":{},\"configtab\":\"Kafka Sink\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:38:24');
INSERT INTO `sys_oper_log` VALUES (154, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sink\",\"configindex\":15,\"createTime\":1675960705000,\"configname\":\"Kafka目标\",\"remark\":\"可以将数据发布到Kafka主题。其中一个目标是与Kafka集成，以便基于pull的处理系统能够处理来自不同源的数据。\",\"updateTime\":1675960711430,\"id\":15,\"params\":{},\"configtab\":\"Kafka Sink\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:38:31');
INSERT INTO `sys_oper_log` VALUES (155, '基础配置', 1, 'com.ants.web.controller.logs.AntsTypeConfigController.add()', 'POST', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sink\",\"configindex\":16,\"createTime\":1675960734758,\"configname\":\"HTTP目标\",\"remark\":\"此接收器的行为是，它将从通道接收事件，并使用HTTPPOST请求将这些事件发送到远程服务。事件内容作为POST正文发送。\",\"id\":16,\"params\":{},\"configtab\":\"HTTP Sink\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:38:54');
INSERT INTO `sys_oper_log` VALUES (156, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sink\",\"configindex\":16,\"createTime\":1675960735000,\"configname\":\"HTTP目标\",\"remark\":\"此接收器的行为是，它将从通道接收事件，并使用HTTPPOST请求将这些事件发送到远程服务。事件内容作为POST正文发送。\",\"updateTime\":1675961102658,\"id\":16,\"params\":{},\"configtab\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:45:02');
INSERT INTO `sys_oper_log` VALUES (157, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sink\",\"configindex\":16,\"createTime\":1675960735000,\"configname\":\"HTTP目标\",\"remark\":\"此接收器的行为是，它将从通道接收事件，并使用HTTPPOST请求将这些事件发送到远程服务。事件内容作为POST正文发送。\",\"updateTime\":1675961118104,\"id\":16,\"params\":{},\"configtab\":\"HTTP Sink\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:45:18');
INSERT INTO `sys_oper_log` VALUES (158, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sink\",\"configindex\":16,\"createTime\":1675960735000,\"configname\":\"HTTP目标\",\"remark\":\"此接收器的行为是，它将从通道接收事件，并使用HTTPPOST请求将这些事件发送到远程服务。事件内容作为POST正文发送。\",\"updateTime\":1675961708516,\"id\":16,\"params\":{},\"configtab\":\"HTTP Sink\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:55:08');
INSERT INTO `sys_oper_log` VALUES (159, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sink\",\"configindex\":16,\"createTime\":1675960735000,\"configname\":\"HTTP目标\",\"remark\":\"此接收器的行为是，它将从通道接收事件，并使用HTTPPOST请求将这些事件发送到远程服务。事件内容作为POST正文发送。\",\"updateTime\":1675961716056,\"id\":16,\"params\":{},\"configtab\":\"HTTP Sink中\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:55:16');
INSERT INTO `sys_oper_log` VALUES (160, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sink\",\"configindex\":16,\"createTime\":1675960735000,\"configname\":\"HTTP目标\",\"remark\":\"此接收器的行为是，它将从通道接收事件，并使用HTTPPOST请求将这些事件发送到远程服务。事件内容作为POST正文发送。\",\"updateTime\":1675961719058,\"id\":16,\"params\":{},\"configtab\":\"HTTP Sink\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:55:19');
INSERT INTO `sys_oper_log` VALUES (161, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sink\",\"configindex\":16,\"createTime\":1675960735000,\"configname\":\"HTTP目标\",\"remark\":\"此接收器的行为是，它将从通道接收事件，并使用HTTPPOST请求将这些事件发送到远程服务。事件内容作为POST正文发送。\",\"updateTime\":1675961769722,\"id\":16,\"params\":{},\"configtab\":\"HTTP Sink标\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:56:09');
INSERT INTO `sys_oper_log` VALUES (162, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sink\",\"configindex\":16,\"createTime\":1675960735000,\"configname\":\"HTTP目标\",\"remark\":\"此接收器的行为是，它将从通道接收事件，并使用HTTPPOST请求将这些事件发送到远程服务。事件内容作为POST正文发送。\",\"updateTime\":1675961772816,\"id\":16,\"params\":{},\"configtab\":\"HTTP Sink\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:56:12');
INSERT INTO `sys_oper_log` VALUES (163, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675959212000,\"configname\":\"命令源\",\"remark\":\"Exec源在启动时运行给定的Unix命令，并期望该进程在标准输出时连续生成数据（stderr被简单地丢弃，除非属性logStdErr设置为true）。如果进程出于任何原因退出，源也将退出，并且不会产生更多数据。这意味着cat[命名管道]或tail-F[文件]等配置将产生所需的结果，而as date可能不会产生-前两个命令产生数据流，后者产生单个事件并退出。\",\"updateTime\":1675961930868,\"id\":1,\"params\":{},\"configtab\":\"Exec Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:58:50');
INSERT INTO `sys_oper_log` VALUES (164, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675959212000,\"configname\":\"命令源\",\"remark\":\"Exec源在启动时运行给定的Unix命令，并期望该进程在标准输出时连续生成数据（stderr被简单地丢弃，除非属性logStdErr设置为true）。如果进程出于任何原因退出，源也将退出，并且不会产生更多数据。这意味着cat[命名管道]或tail-F[文件]等配置将产生所需的结果，而as date可能不会产生-前两个命令产生数据流，后者产生单个事件并退出。\",\"updateTime\":1675961933864,\"id\":1,\"params\":{},\"configtab\":\"Exec Source1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:58:53');
INSERT INTO `sys_oper_log` VALUES (165, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675959212000,\"configname\":\"命令源\",\"remark\":\"Exec源在启动时运行给定的Unix命令，并期望该进程在标准输出时连续生成数据（stderr被简单地丢弃，除非属性logStdErr设置为true）。如果进程出于任何原因退出，源也将退出，并且不会产生更多数据。这意味着cat[命名管道]或tail-F[文件]等配置将产生所需的结果，而as date可能不会产生-前两个命令产生数据流，后者产生单个事件并退出。\",\"updateTime\":1675961942972,\"id\":1,\"params\":{},\"configtab\":\"Exec Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:59:02');
INSERT INTO `sys_oper_log` VALUES (166, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675959212000,\"configname\":\"命令源\",\"remark\":\"Exec源在启动时运行给定的Unix命令，并期望该进程在标准输出时连续生成数据（stderr被简单地丢弃，除非属性logStdErr设置为true）。如果进程出于任何原因退出，源也将退出，并且不会产生更多数据。这意味着cat[命名管道]或tail-F[文件]等配置将产生所需的结果，而as date可能不会产生-前两个命令产生数据流，后者产生单个事件并退出。\",\"updateTime\":1675961949669,\"id\":1,\"params\":{},\"configtab\":\"ExecSource\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:59:09');
INSERT INTO `sys_oper_log` VALUES (167, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675959212000,\"configname\":\"命令源\",\"remark\":\"Exec源在启动时运行给定的Unix命令，并期望该进程在标准输出时连续生成数据（stderr被简单地丢弃，除非属性logStdErr设置为true）。如果进程出于任何原因退出，源也将退出，并且不会产生更多数据。这意味着cat[命名管道]或tail-F[文件]等配置将产生所需的结果，而as date可能不会产生-前两个命令产生数据流，后者产生单个事件并退出。\",\"updateTime\":1675961952565,\"id\":1,\"params\":{},\"configtab\":\"Exec Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:59:12');
INSERT INTO `sys_oper_log` VALUES (168, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675959212000,\"configname\":\"命令源\",\"remark\":\"Exec源在启动时运行给定的Unix命令，并期望该进程在标准输出时连续生成数据（stderr被简单地丢弃，除非属性logStdErr设置为true）。如果进程出于任何原因退出，源也将退出，并且不会产生更多数据。这意味着cat[命名管道]或tail-F[文件]等配置将产生所需的结果，而as date可能不会产生-前两个命令产生数据流，后者产生单个事件并退出。\",\"updateTime\":1675961954838,\"id\":1,\"params\":{},\"configtab\":\"Exec Source \"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:59:14');
INSERT INTO `sys_oper_log` VALUES (169, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675959212000,\"configname\":\"命令源\",\"remark\":\"Exec源在启动时运行给定的Unix命令，并期望该进程在标准输出时连续生成数据（stderr被简单地丢弃，除非属性logStdErr设置为true）。如果进程出于任何原因退出，源也将退出，并且不会产生更多数据。这意味着cat[命名管道]或tail-F[文件]等配置将产生所需的结果，而as date可能不会产生-前两个命令产生数据流，后者产生单个事件并退出。\",\"updateTime\":1675961957482,\"id\":1,\"params\":{},\"configtab\":\"Exec Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:59:17');
INSERT INTO `sys_oper_log` VALUES (170, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675959212000,\"configname\":\"命令源\",\"remark\":\"Exec源在启动时运行给定的Unix命令，并期望该进程在标准输出时连续生成数据（stderr被简单地丢弃，除非属性logStdErr设置为true）。如果进程出于任何原因退出，源也将退出，并且不会产生更多数据。这意味着cat[命名管道]或tail-F[文件]等配置将产生所需的结果，而as date可能不会产生-前两个命令产生数据流，后者产生单个事件并退出。\",\"updateTime\":1675961962034,\"id\":1,\"params\":{},\"configtab\":\"Exec Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 00:59:22');
INSERT INTO `sys_oper_log` VALUES (171, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675959212000,\"configname\":\"命令源\",\"remark\":\"Exec源在启动时运行给定的Unix命令，并期望该进程在标准输出时连续生成数据（stderr被简单地丢弃，除非属性logStdErr设置为true）。如果进程出于任何原因退出，源也将退出，并且不会产生更多数据。这意味着cat[命名管道]或tail-F[文件]等配置将产生所需的结果，而as date可能不会产生-前两个命令产生数据流，后者产生单个事件并退出。\",\"updateTime\":1675962026727,\"id\":1,\"params\":{},\"configtab\":\"Exec Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 01:00:26');
INSERT INTO `sys_oper_log` VALUES (172, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675959212000,\"configname\":\"命令源\",\"remark\":\"Exec源在启动时运行给定的Unix命令，并期望该进程在标准输出时连续生成数据（stderr被简单地丢弃，除非属性logStdErr设置为true）。如果进程出于任何原因退出，源也将退出，并且不会产生更多数据。这意味着cat[命名管道]或tail-F[文件]等配置将产生所需的结果，而as date可能不会产生-前两个命令产生数据流，后者产生单个事件并退出。\",\"updateTime\":1675962036392,\"id\":1,\"params\":{},\"configtab\":\"ExecSource\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 01:00:36');
INSERT INTO `sys_oper_log` VALUES (173, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"createTime\":1675959212000,\"configname\":\"命令源\",\"remark\":\"Exec源在启动时运行给定的Unix命令，并期望该进程在标准输出时连续生成数据（stderr被简单地丢弃，除非属性logStdErr设置为true）。如果进程出于任何原因退出，源也将退出，并且不会产生更多数据。这意味着cat[命名管道]或tail-F[文件]等配置将产生所需的结果，而as date可能不会产生-前两个命令产生数据流，后者产生单个事件并退出。\",\"updateTime\":1675962046480,\"id\":1,\"params\":{},\"configtab\":\"Exec Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-10 01:00:46');
INSERT INTO `sys_oper_log` VALUES (174, '菜单管理', 2, 'com.ants.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"list\",\"orderNum\":\"1\",\"menuName\":\"集成配置\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"config\",\"component\":\"logs/config/index\",\"children\":[],\"createTime\":1675956254000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1062,\"menuType\":\"C\",\"perms\":\"logs:config:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 21:04:14');
INSERT INTO `sys_oper_log` VALUES (175, '代码生成', 6, 'com.ants.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'ants_type_config_data', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 21:47:31');
INSERT INTO `sys_oper_log` VALUES (176, '代码生成', 2, 'com.ants.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ants\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":11,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1676209651000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Configid\",\"usableColumn\":false,\"columnId\":12,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"configid\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"配置id\",\"isQuery\":\"1\",\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1676209651000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"configId\"},{\"capJavaField\":\"Datalabel\",\"usableColumn\":false,\"columnId\":13,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"datalabel\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"配置标签\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1676209651000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"dataLabel\"},{\"capJavaField\":\"Dataprop\",\"usableColumn\":false,\"columnId\":14,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"dataprop\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"配置字段\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"create', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 21:50:40');
INSERT INTO `sys_oper_log` VALUES (177, '代码生成', 2, 'com.ants.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ants\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":11,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"updateTime\":1676209840000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1676209651000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Configid\",\"usableColumn\":false,\"columnId\":12,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"configid\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"配置id\",\"isQuery\":\"1\",\"updateTime\":1676209840000,\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1676209651000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"configId\"},{\"capJavaField\":\"Datalabel\",\"usableColumn\":false,\"columnId\":13,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"datalabel\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"配置标签\",\"isQuery\":\"1\",\"updateTime\":1676209840000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1676209651000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"dataLabel\"},{\"capJavaField\":\"Dataprop\",\"usableColumn\":false,\"columnId\":14,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"dataprop\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"配置字段\",\"isQuery\":\"1\",\"updateTime\":1676209840000', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 21:50:59');
INSERT INTO `sys_oper_log` VALUES (178, '代码生成', 8, 'com.ants.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2023-02-12 21:51:02');
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 2, 'com.ants.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"list\",\"orderNum\":\"1\",\"menuName\":\"集成配置\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"config\",\"component\":\"logs/config/config\",\"children\":[],\"createTime\":1675956254000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1062,\"menuType\":\"C\",\"perms\":\"logs:config:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 21:54:01');
INSERT INTO `sys_oper_log` VALUES (180, '菜单管理', 2, 'com.ants.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"education\",\"orderNum\":\"1\",\"menuName\":\"配置数据\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"data\",\"component\":\"logs/data/index\",\"children\":[],\"createTime\":1676210691000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1068,\"menuType\":\"C\",\"perms\":\"logs:data:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 22:06:27');
INSERT INTO `sys_oper_log` VALUES (181, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1068', '127.0.0.1', '内网IP', '{menuId=1068}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2023-02-12 22:07:13');
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1069', '127.0.0.1', '内网IP', '{menuId=1069}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 22:07:17');
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1070', '127.0.0.1', '内网IP', '{menuId=1070}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 22:07:18');
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1071', '127.0.0.1', '内网IP', '{menuId=1071}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 22:07:19');
INSERT INTO `sys_oper_log` VALUES (185, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1072', '127.0.0.1', '内网IP', '{menuId=1072}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 22:07:20');
INSERT INTO `sys_oper_log` VALUES (186, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1073', '127.0.0.1', '内网IP', '{menuId=1073}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 22:07:21');
INSERT INTO `sys_oper_log` VALUES (187, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1068', '127.0.0.1', '内网IP', '{menuId=1068}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 22:07:22');
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 2, 'com.ants.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"配置数据\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"config/data\",\"component\":\"logs/config/data\",\"children\":[],\"createTime\":1676210898000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1074,\"menuType\":\"C\",\"perms\":\"logs:data:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 22:08:49');
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 2, 'com.ants.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"list\",\"orderNum\":\"1\",\"menuName\":\"集成配置\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"index\",\"component\":\"logs/config/index\",\"children\":[],\"createTime\":1675956254000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1062,\"menuType\":\"C\",\"perms\":\"logs:config:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 22:10:00');
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 2, 'com.ants.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"配置数据\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"config/data\",\"component\":\"logs/config/data/:configId(\\\\\\\\d+)\",\"children\":[],\"createTime\":1676210898000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1074,\"menuType\":\"C\",\"perms\":\"logs:data:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 22:16:09');
INSERT INTO `sys_oper_log` VALUES (191, '菜单管理', 2, 'com.ants.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"配置数据\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"config/data\",\"component\":\"logs/config/data/(\\\\\\\\d+)\",\"children\":[],\"createTime\":1676210898000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1074,\"menuType\":\"C\",\"perms\":\"logs:data:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 22:16:37');
INSERT INTO `sys_oper_log` VALUES (192, '菜单管理', 2, 'com.ants.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"配置数据\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"data\",\"component\":\"logs/config/data/(\\\\\\\\d+)\",\"children\":[],\"createTime\":1676210898000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1074,\"menuType\":\"C\",\"perms\":\"logs:data:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 22:16:50');
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 2, 'com.ants.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"配置数据\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"config/data\",\"component\":\"logs/config/data/:configId(\\\\\\\\d+)\",\"children\":[],\"createTime\":1676210898000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1074,\"menuType\":\"C\",\"perms\":\"logs:data:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 22:17:19');
INSERT INTO `sys_oper_log` VALUES (194, '菜单管理', 2, 'com.ants.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"配置数据\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"config/data\",\"component\":\"logs/config/data\",\"children\":[],\"createTime\":1676210898000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1074,\"menuType\":\"C\",\"perms\":\"logs:data:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 22:17:43');
INSERT INTO `sys_oper_log` VALUES (195, '菜单管理', 2, 'com.ants.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"配置数据\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"config/data\",\"component\":\"logs/config/data/:configId(\\\\\\\\d+)\",\"children\":[],\"createTime\":1676210898000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1074,\"menuType\":\"C\",\"perms\":\"logs:data:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 22:19:39');
INSERT INTO `sys_oper_log` VALUES (196, '菜单管理', 2, 'com.ants.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"配置数据\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"config/data\",\"component\":\"logs/config/data:configId(\\\\\\\\d+)\",\"children\":[],\"createTime\":1676210898000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1074,\"menuType\":\"C\",\"perms\":\"logs:data:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 22:20:16');
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 2, 'com.ants.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"配置数据\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"config/data\",\"component\":\"logs/config/data\",\"children\":[],\"createTime\":1676210898000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1074,\"menuType\":\"C\",\"perms\":\"logs:data:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 22:20:34');
INSERT INTO `sys_oper_log` VALUES (198, '菜单管理', 2, 'com.ants.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"配置数据\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"config/data\",\"component\":\"logs/config/data\",\"children\":[],\"createTime\":1676210898000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1074,\"menuType\":\"C\",\"perms\":\"logs:data:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 22:20:40');
INSERT INTO `sys_oper_log` VALUES (199, '菜单管理', 2, 'com.ants.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"dict\",\"orderNum\":\"1\",\"menuName\":\"配置数据\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"config/data\",\"component\":\"logs/config/data\",\"children\":[],\"createTime\":1676210898000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1074,\"menuType\":\"C\",\"perms\":\"logs:data:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 22:20:46');
INSERT INTO `sys_oper_log` VALUES (200, '字典类型', 1, 'com.ants.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"字段类型\",\"params\":{},\"dictType\":\"ants_logs_config_field_type\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 23:51:03');
INSERT INTO `sys_oper_log` VALUES (201, '字典类型', 2, 'com.ants.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":1676217063000,\"updateBy\":\"admin\",\"dictName\":\"字段类型\",\"remark\":\"字段类型\",\"dictId\":12,\"params\":{},\"dictType\":\"ants_logs_config_field_type\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 23:51:08');
INSERT INTO `sys_oper_log` VALUES (202, '字典类型', 2, 'com.ants.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":1676217063000,\"updateBy\":\"admin\",\"dictName\":\"字段类型\",\"remark\":\"日志配置字段类型\",\"dictId\":12,\"params\":{},\"dictType\":\"ants_logs_config_field_type\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 23:51:13');
INSERT INTO `sys_oper_log` VALUES (203, '字典数据', 1, 'com.ants.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"input\",\"dictSort\":1,\"remark\":\"输入框\",\"params\":{},\"dictType\":\"ants_logs_config_field_type\",\"dictLabel\":\"输入框\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 23:51:31');
INSERT INTO `sys_oper_log` VALUES (204, '字典数据', 2, 'com.ants.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"Input\",\"dictSort\":1,\"remark\":\"输入框\",\"params\":{},\"dictType\":\"ants_logs_config_field_type\",\"dictLabel\":\"输入框\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1676217090000,\"dictCode\":32,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 23:52:01');
INSERT INTO `sys_oper_log` VALUES (205, '字典数据', 1, 'com.ants.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"InputNumber\",\"dictSort\":2,\"remark\":\"计数器\",\"params\":{},\"dictType\":\"ants_logs_config_field_type\",\"dictLabel\":\"计数器\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 23:52:18');
INSERT INTO `sys_oper_log` VALUES (206, '字典数据', 1, 'com.ants.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"TextArea\",\"dictSort\":3,\"remark\":\"文本框\",\"params\":{},\"dictType\":\"ants_logs_config_field_type\",\"dictLabel\":\"文本框\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-12 23:53:26');
INSERT INTO `sys_oper_log` VALUES (207, '配置数据', 1, 'com.ants.web.controller.logs.AntsTypeConfigDataController.add()', 'POST', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"command\",\"dataremark\":\"所使用的系统命令，一般是cat 或者tail\",\"dataindex\":1,\"params\":{},\"dataisrequired\":1,\"datalabel\":\"命令行\",\"datakey\":\"command\",\"createTime\":1676217764473,\"datamessage\":\"请输入正确的命令行\",\"datatype\":\"TextArea\",\"id\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 00:02:44');
INSERT INTO `sys_oper_log` VALUES (208, '配置数据', 1, 'com.ants.web.controller.logs.AntsTypeConfigDataController.add()', 'POST', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"shell\",\"dataremark\":\"设置用于运行命令的shell。 例如 / bin / sh -c。 仅适用于依赖shell功能的命令，如通配符、后退标记、管道等。\",\"dataindex\":1,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"shell命令\",\"datakey\":\"shell\",\"createTime\":1676217955883,\"datatype\":\"TextArea\",\"id\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 00:05:55');
INSERT INTO `sys_oper_log` VALUES (209, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"command\",\"dataremark\":\"所使用的系统命令，一般是cat 或者tail\",\"dataindex\":1,\"updateTime\":1676218066552,\"params\":{},\"dataisrequired\":1,\"datalabel\":\"命令行\",\"datakey\":\"command\",\"createTime\":1676217764000,\"datamessage\":\"请输入正确的命令行\",\"datatype\":\"TextArea\",\"configid\":1,\"id\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 00:07:46');
INSERT INTO `sys_oper_log` VALUES (210, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"shell\",\"dataremark\":\"设置用于运行命令的shell。 例如 / bin / sh -c。 仅适用于依赖shell功能的命令，如通配符、后退标记、管道等。\",\"dataindex\":1,\"updateTime\":1676218071728,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"shell命令1\",\"datakey\":\"shell\",\"createTime\":1676217956000,\"datatype\":\"TextArea\",\"configid\":1,\"id\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 00:07:51');
INSERT INTO `sys_oper_log` VALUES (211, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"shell\",\"dataremark\":\"设置用于运行命令的shell。 例如 / bin / sh -c。 仅适用于依赖shell功能的命令，如通配符、后退标记、管道等。\",\"dataindex\":1,\"updateTime\":1676218075101,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"shell命令\",\"datakey\":\"shell\",\"createTime\":1676217956000,\"datatype\":\"TextArea\",\"configid\":1,\"id\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 00:07:55');
INSERT INTO `sys_oper_log` VALUES (212, '配置数据', 1, 'com.ants.web.controller.logs.AntsTypeConfigDataController.add()', 'POST', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"restartThrottle\",\"datadefaultvalue\":\"10000\",\"dataremark\":\"尝试重新启动之前等待的时间（毫秒）\",\"dataindex\":3,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"尝试重启等待时长\",\"datakey\":\"restartThrottle\",\"createTime\":1676218284513,\"datatype\":\"InputNumber\",\"configid\":1,\"id\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 00:11:24');
INSERT INTO `sys_oper_log` VALUES (213, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"shell\",\"dataremark\":\"设置用于运行命令的shell。 例如 / bin / sh -c。 仅适用于依赖shell功能的命令，如通配符、后退标记、管道等。\",\"dataindex\":2,\"updateTime\":1676218290603,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"shell命令\",\"datakey\":\"shell\",\"createTime\":1676217956000,\"datatype\":\"TextArea\",\"configid\":1,\"id\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 00:11:30');
INSERT INTO `sys_oper_log` VALUES (214, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"command\",\"dataremark\":\"所使用的系统命令，一般是cat 或者tail\",\"dataindex\":1,\"updateTime\":1676218296088,\"params\":{},\"dataisrequired\":1,\"datalabel\":\"执行命令行\",\"datakey\":\"command\",\"createTime\":1676217764000,\"datamessage\":\"请输入正确的命令行\",\"datatype\":\"TextArea\",\"configid\":1,\"id\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 00:11:36');
INSERT INTO `sys_oper_log` VALUES (215, '字典数据', 1, 'com.ants.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"Switch\",\"dictSort\":4,\"remark\":\"开关\",\"params\":{},\"dictType\":\"ants_logs_config_field_type\",\"dictLabel\":\"开关\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 00:23:46');
INSERT INTO `sys_oper_log` VALUES (216, '配置数据', 1, 'com.ants.web.controller.logs.AntsTypeConfigDataController.add()', 'POST', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"restart\",\"datadefaultvalue\":\"false\",\"dataremark\":\"如果执行命令线程挂掉，是否重启\",\"dataindex\":4,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"命令挂掉是否重启\",\"datakey\":\"restart\",\"createTime\":1676219086260,\"datatype\":\"Switch\",\"configid\":1,\"id\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 00:24:46');
INSERT INTO `sys_oper_log` VALUES (217, '配置数据', 1, 'com.ants.web.controller.logs.AntsTypeConfigDataController.add()', 'POST', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"logStdErr\",\"datadefaultvalue\":\"false\",\"dataremark\":\"是否会记录命令的stderr内容\",\"dataindex\":5,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"是否记录stderr内容\",\"datakey\":\"logStdErr\",\"createTime\":1676219124623,\"datatype\":\"Switch\",\"configid\":1,\"id\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 00:25:24');
INSERT INTO `sys_oper_log` VALUES (218, '配置数据', 1, 'com.ants.web.controller.logs.AntsTypeConfigDataController.add()', 'POST', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"batchSize\",\"datadefaultvalue\":\"20\",\"dataremark\":\"读取并向通道发送数据时单次发送的最大数量\",\"dataindex\":6,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"单次读取最大数量\",\"datakey\":\"batchSize\",\"createTime\":1676219171844,\"datatype\":\"InputNumber\",\"configid\":1,\"id\":6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 00:26:11');
INSERT INTO `sys_oper_log` VALUES (219, '配置数据', 1, 'com.ants.web.controller.logs.AntsTypeConfigDataController.add()', 'POST', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"batchTimeout\",\"datadefaultvalue\":\"3000\",\"dataremark\":\"向下游推送数据时，单次批量发送Event的最大等待时间（毫秒），如果等待了batchTimeout毫秒后未达到一次批量发送数量，则仍然执行发送操作。\",\"dataindex\":7,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"单次最大等待时长\",\"datakey\":\"batchTimeout\",\"createTime\":1676219202597,\"datatype\":\"Input\",\"configid\":1,\"id\":7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 00:26:42');
INSERT INTO `sys_oper_log` VALUES (220, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"shell\",\"dataremark\":\"设置用于运行命令的shell。 例如 / bin / sh -c。 仅适用于依赖shell功能的命令，如通配符、后退标记、管道等。\",\"dataindex\":2,\"updateTime\":1676219608232,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"shell命令\",\"datakey\":\"shell\",\"createTime\":1676217956000,\"datatype\":\"TextArea\",\"configid\":1,\"id\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 00:33:28');
INSERT INTO `sys_oper_log` VALUES (221, '配置数据', 1, 'com.ants.web.controller.logs.AntsTypeConfigDataController.add()', 'POST', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"type\",\"datadefaultvalue\":\"memory\",\"dataremark\":\"组件类型，值为memory\",\"dataindex\":1,\"params\":{},\"dataisrequired\":1,\"datalabel\":\"类型\",\"datakey\":\"type\",\"createTime\":1676298101199,\"datamessage\":\"组件类型不能为空，且值为memory\",\"datatype\":\"Input\",\"configid\":9,\"id\":8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 22:21:41');
INSERT INTO `sys_oper_log` VALUES (222, '配置数据', 1, 'com.ants.web.controller.logs.AntsTypeConfigDataController.add()', 'POST', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"capacity\",\"datadefaultvalue\":\"100\",\"dataindex\":2,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"通道内存最大数\",\"datakey\":\"capacity\",\"createTime\":1676298273187,\"datatype\":\"InputNumber\",\"configid\":9,\"id\":9}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 22:24:33');
INSERT INTO `sys_oper_log` VALUES (223, '配置数据', 1, 'com.ants.web.controller.logs.AntsTypeConfigDataController.add()', 'POST', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"transactionCapacity\",\"datadefaultvalue\":\"100\",\"dataremark\":\"source 或者 sink 每个事务中存取 Event 的操作数量（不能比 capacity 大）\",\"dataindex\":3,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"通道操作数量最大数\",\"datakey\":\"transactionCapacity\",\"createTime\":1676298310824,\"datatype\":\"InputNumber\",\"configid\":9,\"id\":10}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 22:25:10');
INSERT INTO `sys_oper_log` VALUES (224, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"capacity\",\"datadefaultvalue\":\"100\",\"dataremark\":\"内存中存储 Event 的最大数\",\"dataindex\":2,\"updateTime\":1676298316314,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"通道内存最大数\",\"datakey\":\"capacity\",\"createTime\":1676298273000,\"datatype\":\"InputNumber\",\"configid\":9,\"id\":9}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 22:25:16');
INSERT INTO `sys_oper_log` VALUES (225, '配置数据', 1, 'com.ants.web.controller.logs.AntsTypeConfigDataController.add()', 'POST', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"keepAlive\",\"datadefaultvalue\":\"3\",\"dataremark\":\"添加或删除一个 Event 的超时时间（秒）\",\"dataindex\":4,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"超时时间\",\"datakey\":\"keep-alive\",\"createTime\":1676298344226,\"datatype\":\"InputNumber\",\"configid\":9,\"id\":11}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 22:25:44');
INSERT INTO `sys_oper_log` VALUES (226, '配置数据', 1, 'com.ants.web.controller.logs.AntsTypeConfigDataController.add()', 'POST', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"byteCapacityBufferPercentage\",\"datadefaultvalue\":\"20\",\"dataremark\":\"指定 Event header 所占空间大小与 channel 中所有 Event 的总大小之间的百分比\",\"dataindex\":5,\"params\":{},\"dataisrequired\":2,\"datalabel\":\" header占空间大小百分比\",\"datakey\":\"byteCapacityBufferPercentage\",\"createTime\":1676298384764,\"datatype\":\"InputNumber\",\"configid\":9,\"id\":12}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 22:26:24');
INSERT INTO `sys_oper_log` VALUES (227, '配置数据', 1, 'com.ants.web.controller.logs.AntsTypeConfigDataController.add()', 'POST', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"byteCapacity\",\"dataremark\":\"Channel 中最大允许存储所有 Event 的总字节数（bytes）。默认情况下会使用JVM可用内存的80%作为最大可用内存（就是JVM启动参数里面配置的-Xmx的值）。 计算总字节时只计算 Event 的主体，这也是提供 byteCapacityBufferPercentage 配置参数的原因。注意，当你在一个 Agent 里面有多个内存 channel 的时候， 而且碰巧这些 channel 存储相同的物理 Event（例如：这些 channel 通过复制机制（ 复制选择器 ）接收同一个 source 中的 Event）， 这时候这些 Event 占用的空间是累加的，并不会只计算一次。如果这个值设置为0（不限制），就会达到200G左右的内部硬件限制。\",\"dataindex\":1,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"最大允许存储字节数\",\"datakey\":\"byteCapacity\",\"createTime\":1676298430215,\"datatype\":\"InputNumber\",\"configid\":9}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'dataRemark\' at row 1\r\n### The error may exist in file [D:\\WorkSpace_Java\\ants-logs-manage\\ants-system\\target\\classes\\mapper\\logs\\AntsTypeConfigDataMapper.xml]\r\n### The error may involve com.ants.logs.mapper.AntsTypeConfigDataMapper.insertAntsTypeConfigData-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ants_type_config_data          ( configId,             dataLabel,             dataProp,             dataKey,                          dataType,             dataIndex,             dataIsRequired,                                       dataRemark,             create_time )           values ( ?,             ?,             ?,             ?,                          ?,             ?,             ?,                                       ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'dataRemark\' at row 1\n; Data truncation: Data too long for column \'dataRemark\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'dataRemark\' at row 1', '2023-02-13 22:27:10');
INSERT INTO `sys_oper_log` VALUES (228, '配置数据', 1, 'com.ants.web.controller.logs.AntsTypeConfigDataController.add()', 'POST', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"byteCapacity\",\"dataremark\":\"Channel 中最大允许存储所有 Event 的总字节数（bytes）。默认情况下会使用JVM可用内存的80%作为最大可用内存（就是JVM启动参数里面配置的-Xmx的值）。 计算总字节时只计算 Event 的主体，这也是提供 byteCapacityBufferPercentage 配置参数的原因。注意，当你在一个 Agent 里面有多个内存 channel 的时候， 而且碰巧这些 channel 存储相同的物理 Event（例如：这些 channel 通过复制机制（ 复制选择器 ）接收同一个 source 中的 Event）， 这时候这些 Event 占用的空间是累加的，并不会只计算一次。如果这个值设置为0（不限制），就会达到200G左右的内部硬件限制。\",\"dataindex\":1,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"最大允许存储字节数\",\"datakey\":\"byteCapacity\",\"createTime\":1676298448884,\"datatype\":\"InputNumber\",\"configid\":9,\"id\":13}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 22:27:28');
INSERT INTO `sys_oper_log` VALUES (229, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"byteCapacity\",\"dataremark\":\"Channel 中最大允许存储所有 Event 的总字节数（bytes）。默认情况下会使用JVM可用内存的80%作为最大可用内存（就是JVM启动参数里面配置的-Xmx的值）。 计算总字节时只计算 Event 的主体，这也是提供 byteCapacityBufferPercentage 配置参数的原因。注意，当你在一个 Agent 里面有多个内存 channel 的时候， 而且碰巧这些 channel 存储相同的物理 Event（例如：这些 channel 通过复制机制（ 复制选择器 ）接收同一个 source 中的 Event）， 这时候这些 Event 占用的空间是累加的，并不会只计算一次。如果这个值设置为0（不限制），就会达到200G左右的内部硬件限制。\",\"dataindex\":6,\"updateTime\":1676298459327,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"最大允许存储字节数\",\"datakey\":\"byteCapacity\",\"createTime\":1676298449000,\"datatype\":\"InputNumber\",\"configid\":9,\"id\":13}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 22:27:39');
INSERT INTO `sys_oper_log` VALUES (230, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"byteCapacity\",\"dataremark\":\"Channel 中最大允许存储所有 Event 的总字节数（bytes）。默认情况下会使用JVM可用内存的80%作为最大可用内存（就是JVM启动参数里面配置的-Xmx的值）。 计算总字节时只计算 Event 的主体，这也是提供 byteCapacityBufferPercentage 配置参数的原因。注意，当你在一个 Agent 里面有多个内存 channel 的时候， 而且碰巧这些 channel 存储相同的物理 Event（例如：这些 channel 通过复制机制（ 复制选择器 ）接收同一个 source 中的 Event）， 这时候这些 Event 占用的空间是累加的，并不会只计算一次。如果这个值设置为0（不限制），就会达到200G左右的内部硬件限制。\",\"dataindex\":1,\"updateTime\":1676298819383,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"最大允许存储字节数\",\"datakey\":\"byteCapacity\",\"createTime\":1676298449000,\"datatype\":\"InputNumber\",\"configid\":9,\"id\":13}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 22:33:39');
INSERT INTO `sys_oper_log` VALUES (231, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"byteCapacity\",\"dataremark\":\"Channel 中最大允许存储所有 Event 的总字节数（bytes）。默认情况下会使用JVM可用内存的80%作为最大可用内存（就是JVM启动参数里面配置的-Xmx的值）。 计算总字节时只计算 Event 的主体，这也是提供 byteCapacityBufferPercentage 配置参数的原因。注意，当你在一个 Agent 里面有多个内存 channel 的时候， 而且碰巧这些 channel 存储相同的物理 Event（例如：这些 channel 通过复制机制（ 复制选择器 ）接收同一个 source 中的 Event）， 这时候这些 Event 占用的空间是累加的，并不会只计算一次。如果这个值设置为0（不限制），就会达到200G左右的内部硬件限制。\",\"dataindex\":6,\"updateTime\":1676298824545,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"最大允许存储字节数\",\"datakey\":\"byteCapacity\",\"createTime\":1676298449000,\"datatype\":\"InputNumber\",\"configid\":9,\"id\":13}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 22:33:44');
INSERT INTO `sys_oper_log` VALUES (232, '配置数据', 1, 'com.ants.web.controller.logs.AntsTypeConfigDataController.add()', 'POST', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"type\",\"datadefaultvalue\":\"logger\",\"dataremark\":\"组件类型，这个是： logger\",\"dataindex\":1,\"params\":{},\"dataisrequired\":1,\"datalabel\":\"组件类型\",\"datakey\":\"type\",\"createTime\":1676298953561,\"datamessage\":\"组件类型不能为空\",\"datatype\":\"Input\",\"configid\":13,\"id\":14}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 22:35:53');
INSERT INTO `sys_oper_log` VALUES (233, '配置数据', 1, 'com.ants.web.controller.logs.AntsTypeConfigDataController.add()', 'POST', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataprop\":\"maxBytesToLog\",\"datadefaultvalue\":\"16\",\"dataremark\":\"Event body 输出到日志的最大字节数，超出的部分会被丢弃\",\"dataindex\":2,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"输出最大字节数\",\"datakey\":\"maxBytesToLog\",\"createTime\":1676298981185,\"datatype\":\"InputNumber\",\"configid\":13,\"id\":15}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 22:36:21');
INSERT INTO `sys_oper_log` VALUES (234, '代码生成', 6, 'com.ants.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'ants_channels,ants_sinks,ants_sources', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 22:38:08');
INSERT INTO `sys_oper_log` VALUES (235, '代码生成', 2, 'com.ants.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ants\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":27,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1676299088000,\"tableId\":3,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Type\",\"usableColumn\":false,\"columnId\":28,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"type\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"类型\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1676299088000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"type\"},{\"capJavaField\":\"Capacity\",\"usableColumn\":false,\"columnId\":29,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"capacity\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"存储最大数\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1676299088000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"capacity\"},{\"capJavaField\":\"Transactioncapacity\",\"usableColumn\":false,\"columnId\":30,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"transactioncapacity\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"操作数量\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":16762990', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 22:43:13');
INSERT INTO `sys_oper_log` VALUES (236, '代码生成', 2, 'com.ants.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ants\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":58,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1676299088000,\"tableId\":4,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Type\",\"usableColumn\":false,\"columnId\":59,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"type\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"组件类型\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1676299088000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"type\"},{\"capJavaField\":\"Hdfspath\",\"usableColumn\":false,\"columnId\":60,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"hdfspath\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"HDFS目录路径\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1676299088000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"hdfsPath\"},{\"capJavaField\":\"Hdfsfileprefix\",\"usableColumn\":false,\"columnId\":61,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"hdfsfileprefix\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"新建文件的前缀\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 22:49:21');
INSERT INTO `sys_oper_log` VALUES (237, '代码生成', 2, 'com.ants.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ants\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":110,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1676299088000,\"tableId\":5,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Type\",\"usableColumn\":false,\"columnId\":111,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"type\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"组件类型\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1676299088000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"type\"},{\"capJavaField\":\"Command\",\"usableColumn\":false,\"columnId\":112,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"command\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"系统命令\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"text\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1676299088000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"command\"},{\"capJavaField\":\"Shell\",\"usableColumn\":false,\"columnId\":113,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"shell\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"运行命令shell\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":167629908', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 22:53:33');
INSERT INTO `sys_oper_log` VALUES (238, '代码生成', 8, 'com.ants.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2023-02-13 22:53:39');
INSERT INTO `sys_oper_log` VALUES (239, '菜单管理', 2, 'com.ants.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"tree\",\"orderNum\":\"2\",\"menuName\":\"数据源\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"sources\",\"component\":\"logs/sources/index\",\"children\":[],\"createTime\":1676300073000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1092,\"menuType\":\"C\",\"perms\":\"logs:sources:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 22:57:24');
INSERT INTO `sys_oper_log` VALUES (240, '菜单管理', 2, 'com.ants.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"online\",\"orderNum\":\"3\",\"menuName\":\"数据通道\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"channels\",\"component\":\"logs/channels/index\",\"children\":[],\"createTime\":1676300058000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1080,\"menuType\":\"C\",\"perms\":\"logs:channels:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 22:57:51');
INSERT INTO `sys_oper_log` VALUES (241, '菜单管理', 2, 'com.ants.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"drag\",\"orderNum\":\"4\",\"menuName\":\"数据目标\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"sinks\",\"component\":\"logs/sinks/index\",\"children\":[],\"createTime\":1676300064000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1086,\"menuType\":\"C\",\"perms\":\"logs:sinks:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 22:58:05');
INSERT INTO `sys_oper_log` VALUES (242, '菜单管理', 2, 'com.ants.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"3\",\"menuName\":\"数据通道\",\"params\":{},\"parentId\":1061,\"isCache\":\"0\",\"path\":\"channels\",\"component\":\"logs/channels/index\",\"children\":[],\"createTime\":1676300058000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1080,\"menuType\":\"C\",\"perms\":\"logs:channels:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 22:58:23');
INSERT INTO `sys_oper_log` VALUES (243, '代码生成', 2, 'com.ants.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/ants_type_config_data', '127.0.0.1', '内网IP', '{tableName=ants_type_config_data}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 23:51:09');
INSERT INTO `sys_oper_log` VALUES (244, '代码生成', 2, 'com.ants.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/ants_type_config_data', '127.0.0.1', '内网IP', '{tableName=ants_type_config_data}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 23:51:27');
INSERT INTO `sys_oper_log` VALUES (245, '代码生成', 2, 'com.ants.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ants\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":11,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"updateTime\":1676209859000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1676209651000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Configid\",\"usableColumn\":false,\"columnId\":12,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"configid\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"配置id\",\"isQuery\":\"1\",\"updateTime\":1676209859000,\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1676209651000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"configId\"},{\"capJavaField\":\"Datalabel\",\"usableColumn\":false,\"columnId\":13,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"datalabel\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"配置标签\",\"isQuery\":\"1\",\"updateTime\":1676209859000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1676209651000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"dataLabel\"},{\"capJavaField\":\"Dataprop\",\"usableColumn\":false,\"columnId\":14,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"dataprop\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"配置字段\",\"isQuery\":\"1\",\"updateTime\":1676209859000', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-13 23:51:42');
INSERT INTO `sys_oper_log` VALUES (246, '代码生成', 8, 'com.ants.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2023-02-13 23:51:44');
INSERT INTO `sys_oper_log` VALUES (247, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataisdisabled\":1,\"dataprop\":\"batchTimeout\",\"datadefaultvalue\":\"3000\",\"dataremark\":\"向下游推送数据时，单次批量发送Event的最大等待时间（毫秒），如果等待了batchTimeout毫秒后未达到一次批量发送数量，则仍然执行发送操作。\",\"dataindex\":7,\"updateTime\":1676304955052,\"dataisshow\":1,\"dataisquery\":2,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"单次最大等待时长\",\"datakey\":\"batchTimeout\",\"createTime\":1676219203000,\"datatype\":\"Input\",\"configid\":1,\"id\":7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-14 00:15:55');
INSERT INTO `sys_oper_log` VALUES (248, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataisdisabled\":1,\"dataprop\":\"batchTimeout\",\"datadefaultvalue\":\"3000\",\"dataremark\":\"向下游推送数据时，单次批量发送Event的最大等待时间（毫秒），如果等待了batchTimeout毫秒后未达到一次批量发送数量，则仍然执行发送操作。\",\"dataindex\":7,\"updateTime\":1676304975936,\"dataisshow\":1,\"dataisquery\":1,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"单次最大等待时长\",\"datakey\":\"batchTimeout\",\"createTime\":1676219203000,\"datatype\":\"Input\",\"configid\":1,\"id\":7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-14 00:16:15');
INSERT INTO `sys_oper_log` VALUES (249, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataisdisabled\":1,\"dataprop\":\"batchTimeout\",\"datadefaultvalue\":\"3000\",\"dataremark\":\"向下游推送数据时，单次批量发送Event的最大等待时间（毫秒），如果等待了batchTimeout毫秒后未达到一次批量发送数量，则仍然执行发送操作。\",\"dataindex\":7,\"updateTime\":1676305021304,\"dataisshow\":1,\"dataisquery\":2,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"单次最大等待时长\",\"datakey\":\"batchTimeout\",\"createTime\":1676219203000,\"datatype\":\"Input\",\"configid\":1,\"id\":7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-14 00:17:01');
INSERT INTO `sys_oper_log` VALUES (250, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataisdisabled\":1,\"dataprop\":\"batchTimeout\",\"datadefaultvalue\":\"3000\",\"dataremark\":\"向下游推送数据时，单次批量发送Event的最大等待时间（毫秒），如果等待了batchTimeout毫秒后未达到一次批量发送数量，则仍然执行发送操作。\",\"dataindex\":7,\"updateTime\":1676305042704,\"dataisshow\":1,\"dataisquery\":1,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"单次最大等待时长\",\"datakey\":\"batchTimeout\",\"createTime\":1676219203000,\"datatype\":\"Input\",\"configid\":1,\"id\":7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-14 00:17:22');
INSERT INTO `sys_oper_log` VALUES (251, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataisdisabled\":1,\"dataprop\":\"command\",\"dataremark\":\"所使用的系统命令，一般是cat 或者tail\",\"dataindex\":1,\"updateTime\":1676386486744,\"dataisshow\":2,\"dataisquery\":1,\"params\":{},\"dataisrequired\":1,\"datalabel\":\"执行命令行\",\"datakey\":\"command\",\"createTime\":1676217764000,\"datamessage\":\"请输入正确的命令行\",\"datatype\":\"TextArea\",\"configid\":1,\"id\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-14 22:54:46');
INSERT INTO `sys_oper_log` VALUES (252, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataisdisabled\":1,\"dataprop\":\"command\",\"dataremark\":\"所使用的系统命令，一般是cat 或者tail\",\"dataindex\":1,\"updateTime\":1676386489858,\"dataisshow\":1,\"dataisquery\":1,\"params\":{},\"dataisrequired\":1,\"datalabel\":\"执行命令行\",\"datakey\":\"command\",\"createTime\":1676217764000,\"datamessage\":\"请输入正确的命令行\",\"datatype\":\"TextArea\",\"configid\":1,\"id\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-14 22:54:49');
INSERT INTO `sys_oper_log` VALUES (253, '数据源', 1, 'com.ants.web.controller.logs.AntsSourcesController.add()', 'POST', 1, 'admin', NULL, '/logs/sources', '127.0.0.1', '内网IP', '{\"id\":1,\"params\":{},\"restart\":2,\"createTime\":1676388009965}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-14 23:20:09');
INSERT INTO `sys_oper_log` VALUES (254, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataisdisabled\":1,\"dataprop\":\"batchTimeout\",\"datadefaultvalue\":\"3000\",\"dataremark\":\"向下游推送数据时，单次批量发送Event的最大等待时间（毫秒），如果等待了batchTimeout毫秒后未达到一次批量发送数量，则仍然执行发送操作。\",\"dataindex\":7,\"updateTime\":1676470821768,\"dataisshow\":1,\"dataisquery\":1,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"单次最大等待时长\",\"datakey\":\"batchTimeout\",\"createTime\":1676219203000,\"datatype\":\"InputNumber\",\"configid\":1,\"id\":7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-15 22:20:21');
INSERT INTO `sys_oper_log` VALUES (255, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataisdisabled\":1,\"dataprop\":\"restartThrottle\",\"datadefaultvalue\":\"10000\",\"dataremark\":\"尝试重新启动之前等待的时间（毫秒）\",\"dataindex\":3,\"updateTime\":1676474100147,\"dataisshow\":1,\"dataisquery\":1,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"尝试重启等待时长\",\"datakey\":\"restartthrottle\",\"createTime\":1676218285000,\"datatype\":\"InputNumber\",\"configid\":1,\"id\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-15 23:15:00');
INSERT INTO `sys_oper_log` VALUES (256, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataisdisabled\":1,\"dataprop\":\"restartThrottle\",\"datadefaultvalue\":\"10000\",\"dataremark\":\"尝试重新启动之前等待的时间（毫秒）\",\"dataindex\":3,\"updateTime\":1676474100399,\"dataisshow\":1,\"dataisquery\":1,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"尝试重启等待时长\",\"datakey\":\"restartthrottle\",\"createTime\":1676218285000,\"datatype\":\"InputNumber\",\"configid\":1,\"id\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-15 23:15:00');
INSERT INTO `sys_oper_log` VALUES (257, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataisdisabled\":1,\"dataprop\":\"batchTimeout\",\"datadefaultvalue\":\"3000\",\"dataremark\":\"向下游推送数据时，单次批量发送Event的最大等待时间（毫秒），如果等待了batchTimeout毫秒后未达到一次批量发送数量，则仍然执行发送操作。\",\"dataindex\":7,\"updateTime\":1676474104994,\"dataisshow\":1,\"dataisquery\":1,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"单次最大等待时长\",\"datakey\":\"batchtimeout\",\"createTime\":1676219203000,\"datatype\":\"InputNumber\",\"configid\":1,\"id\":7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-15 23:15:05');
INSERT INTO `sys_oper_log` VALUES (258, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataisdisabled\":1,\"dataprop\":\"batchSize\",\"datadefaultvalue\":\"20\",\"dataremark\":\"读取并向通道发送数据时单次发送的最大数量\",\"dataindex\":6,\"updateTime\":1676474109949,\"dataisshow\":1,\"dataisquery\":1,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"单次读取最大数量\",\"datakey\":\"batchsize\",\"createTime\":1676219172000,\"datatype\":\"InputNumber\",\"configid\":1,\"id\":6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-15 23:15:09');
INSERT INTO `sys_oper_log` VALUES (259, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataisdisabled\":1,\"dataprop\":\"logStdErr\",\"datadefaultvalue\":\"false\",\"dataremark\":\"是否会记录命令的stderr内容\",\"dataindex\":5,\"updateTime\":1676474115617,\"dataisshow\":1,\"dataisquery\":1,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"是否记录stderr内容\",\"datakey\":\"logstderr\",\"createTime\":1676219125000,\"datatype\":\"Switch\",\"configid\":1,\"id\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-15 23:15:15');
INSERT INTO `sys_oper_log` VALUES (260, '数据源', 1, 'com.ants.web.controller.logs.AntsSourcesController.add()', 'POST', 1, 'admin', NULL, '/logs/sources', '127.0.0.1', '内网IP', '{\"batchsize\":23,\"id\":2,\"params\":{},\"logstderr\":1,\"restartthrottle\":10000,\"restart\":1,\"command\":\"ping www.baidu.com\",\"createTime\":1676476362738,\"batchtimeout\":3000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-15 23:52:42');
INSERT INTO `sys_oper_log` VALUES (261, '数据源', 2, 'com.ants.web.controller.logs.AntsSourcesController.edit()', 'PUT', 1, 'admin', NULL, '/logs/sources', '127.0.0.1', '内网IP', '{\"batchsize\":23,\"id\":2,\"params\":{},\"logstderr\":1,\"restartthrottle\":10000,\"restart\":1,\"updateTime\":1676476417156,\"command\":\"ping www.baidu.com1\",\"createTime\":1676476363000,\"batchtimeout\":3000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-15 23:53:37');
INSERT INTO `sys_oper_log` VALUES (262, '数据源', 2, 'com.ants.web.controller.logs.AntsSourcesController.edit()', 'PUT', 1, 'admin', NULL, '/logs/sources', '127.0.0.1', '内网IP', '{\"batchsize\":23,\"id\":2,\"params\":{},\"logstderr\":1,\"restartthrottle\":10004,\"restart\":1,\"updateTime\":1676476834454,\"command\":\"ping www.baidu.com1\",\"createTime\":1676476363000,\"batchtimeout\":3000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 00:00:34');
INSERT INTO `sys_oper_log` VALUES (263, '数据源', 2, 'com.ants.web.controller.logs.AntsSourcesController.edit()', 'PUT', 1, 'admin', NULL, '/logs/sources', '127.0.0.1', '内网IP', '{\"batchsize\":14,\"id\":2,\"params\":{},\"logstderr\":2,\"restartthrottle\":10000,\"restart\":1,\"updateTime\":1676476843531,\"command\":\"ping www.baidu.com1\",\"createTime\":1676476363000,\"batchtimeout\":3000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 00:00:43');
INSERT INTO `sys_oper_log` VALUES (264, '数据源', 2, 'com.ants.web.controller.logs.AntsSourcesController.edit()', 'PUT', 1, 'admin', NULL, '/logs/sources', '127.0.0.1', '内网IP', '{\"batchsize\":14,\"id\":2,\"params\":{},\"shell\":\"123\",\"logstderr\":2,\"restartthrottle\":10000,\"restart\":1,\"updateTime\":1676476846357,\"command\":\"ping www.baidu.com1\",\"createTime\":1676476363000,\"batchtimeout\":3000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 00:00:46');
INSERT INTO `sys_oper_log` VALUES (265, '数据源', 2, 'com.ants.web.controller.logs.AntsSourcesController.edit()', 'PUT', 1, 'admin', NULL, '/logs/sources', '127.0.0.1', '内网IP', '{\"batchsize\":14,\"id\":2,\"params\":{},\"shell\":\"123\",\"logstderr\":2,\"restartthrottle\":10000,\"restart\":1,\"updateTime\":1676476851515,\"command\":\"ping www.baidu.com1\",\"createTime\":1676476363000,\"batchtimeout\":3000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 00:00:51');
INSERT INTO `sys_oper_log` VALUES (266, '数据源', 2, 'com.ants.web.controller.logs.AntsSourcesController.edit()', 'PUT', 1, 'admin', NULL, '/logs/sources', '127.0.0.1', '内网IP', '{\"batchsize\":14,\"id\":2,\"params\":{},\"shell\":\"123\",\"logstderr\":2,\"restartthrottle\":10000,\"restart\":1,\"updateTime\":1676476864791,\"command\":\"ping www.baidu.com1\",\"createTime\":1676476363000,\"batchtimeout\":3000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 00:01:04');
INSERT INTO `sys_oper_log` VALUES (267, '数据源', 2, 'com.ants.web.controller.logs.AntsSourcesController.edit()', 'PUT', 1, 'admin', NULL, '/logs/sources', '127.0.0.1', '内网IP', '{\"batchsize\":14,\"id\":2,\"params\":{},\"shell\":\"123\",\"logstderr\":2,\"restartthrottle\":10000,\"restart\":1,\"updateTime\":1676476945590,\"command\":\"ping www.baidu.com1\",\"createTime\":1676476363000,\"batchtimeout\":3000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 00:02:25');
INSERT INTO `sys_oper_log` VALUES (268, '代码生成', 2, 'com.ants.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/ants_channels', '127.0.0.1', '内网IP', '{tableName=ants_channels}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 00:28:33');
INSERT INTO `sys_oper_log` VALUES (269, '代码生成', 2, 'com.ants.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/ants_sinks', '127.0.0.1', '内网IP', '{tableName=ants_sinks}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 00:28:34');
INSERT INTO `sys_oper_log` VALUES (270, '代码生成', 2, 'com.ants.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/ants_sources', '127.0.0.1', '内网IP', '{tableName=ants_sources}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 00:28:35');
INSERT INTO `sys_oper_log` VALUES (271, '代码生成', 8, 'com.ants.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2023-02-16 00:28:39');
INSERT INTO `sys_oper_log` VALUES (272, '数据源', 3, 'com.ants.web.controller.logs.AntsSourcesController.remove()', 'DELETE', 1, 'admin', NULL, '/logs/sources/2', '127.0.0.1', '内网IP', '{ids=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 00:34:14');
INSERT INTO `sys_oper_log` VALUES (273, '代码生成', 2, 'com.ants.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/ants_channels', '127.0.0.1', '内网IP', '{tableName=ants_channels}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 22:02:35');
INSERT INTO `sys_oper_log` VALUES (274, '代码生成', 2, 'com.ants.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/ants_sinks', '127.0.0.1', '内网IP', '{tableName=ants_sinks}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 22:02:37');
INSERT INTO `sys_oper_log` VALUES (275, '代码生成', 2, 'com.ants.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/ants_sources', '127.0.0.1', '内网IP', '{tableName=ants_sources}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 22:02:38');
INSERT INTO `sys_oper_log` VALUES (276, '代码生成', 8, 'com.ants.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2023-02-16 22:03:00');
INSERT INTO `sys_oper_log` VALUES (277, '代码生成', 2, 'com.ants.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/ants_channels', '127.0.0.1', '内网IP', '{tableName=ants_channels}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 22:07:51');
INSERT INTO `sys_oper_log` VALUES (278, '代码生成', 2, 'com.ants.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/ants_sinks', '127.0.0.1', '内网IP', '{tableName=ants_sinks}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 22:07:52');
INSERT INTO `sys_oper_log` VALUES (279, '代码生成', 2, 'com.ants.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/ants_sources', '127.0.0.1', '内网IP', '{tableName=ants_sources}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 22:07:53');
INSERT INTO `sys_oper_log` VALUES (280, '代码生成', 8, 'com.ants.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2023-02-16 22:07:55');
INSERT INTO `sys_oper_log` VALUES (281, '数据源', 1, 'com.ants.web.controller.logs.AntsSourcesController.add()', 'POST', 1, 'admin', NULL, '/logs/sources', '127.0.0.1', '内网IP', '{\"batchsize\":20,\"id\":3,\"params\":{},\"logstderr\":1,\"restartthrottle\":10000,\"restart\":1,\"command\":\"ping www.baidu.com\",\"createTime\":1676558856781,\"batchtimeout\":3000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 22:47:36');
INSERT INTO `sys_oper_log` VALUES (282, '数据源', 1, 'com.ants.web.controller.logs.AntsSourcesController.add()', 'POST', 1, 'admin', NULL, '/logs/sources', '127.0.0.1', '内网IP', '{\"batchsize\":20,\"id\":4,\"params\":{},\"logstderr\":2,\"restartthrottle\":10000,\"restart\":2,\"command\":\"asdas\",\"createTime\":1676558949244,\"batchtimeout\":3000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 22:49:09');
INSERT INTO `sys_oper_log` VALUES (283, '数据源', 1, 'com.ants.web.controller.logs.AntsSourcesController.add()', 'POST', 1, 'admin', NULL, '/logs/sources', '127.0.0.1', '内网IP', '{\"batchsize\":20,\"id\":5,\"params\":{},\"name\":\"dasd\",\"sourceIndex\":1,\"logstderr\":2,\"restartthrottle\":10000,\"restart\":2,\"command\":\"asdsa\",\"createTime\":1676558991665,\"batchtimeout\":3000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 22:49:51');
INSERT INTO `sys_oper_log` VALUES (284, '数据源', 1, 'com.ants.web.controller.logs.AntsSourcesController.add()', 'POST', 1, 'admin', NULL, '/logs/sources', '127.0.0.1', '内网IP', '{\"batchsize\":20,\"id\":6,\"params\":{},\"configid\":1,\"name\":\"asdsa\",\"sourceIndex\":1,\"logstderr\":2,\"restartthrottle\":10000,\"restart\":2,\"command\":\"asdasd\",\"createTime\":1676559137826,\"batchtimeout\":3000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 22:52:17');
INSERT INTO `sys_oper_log` VALUES (285, '代码生成', 2, 'com.ants.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/ants_type_config', '127.0.0.1', '内网IP', '{tableName=ants_type_config}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 23:00:10');
INSERT INTO `sys_oper_log` VALUES (286, '代码生成', 8, 'com.ants.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2023-02-16 23:00:11');
INSERT INTO `sys_oper_log` VALUES (287, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":1,\"remark\":\"Exec源在启动时运行给定的Unix命令，并期望该进程在标准输出时连续生成数据（stderr被简单地丢弃，除非属性logStdErr设置为true）。如果进程出于任何原因退出，源也将退出，并且不会产生更多数据。这意味着cat[命名管道]或tail-F[文件]等配置将产生所需的结果，而as date可能不会产生-前两个命令产生数据流，后者产生单个事件并退出。\",\"updateTime\":1676559913925,\"params\":{},\"createTime\":1675959212000,\"configmodule\":\"exec\",\"configname\":\"命令源\",\"id\":1,\"configtab\":\"Exec Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 23:05:13');
INSERT INTO `sys_oper_log` VALUES (288, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":2,\"remark\":\"该源允许您通过将要摄取的文件放入磁盘上的“假脱机”目录来摄取数据。此源将监视指定目录中的新文件，并在新文件出现时解析事件。事件解析逻辑是可插入的。在将给定文件完全读入通道后，默认情况下通过重命名文件来指示完成，或者可以删除该文件，或者使用trackerDir来跟踪已处理的文件。\",\"updateTime\":1676559935032,\"params\":{},\"createTime\":1675959420000,\"configmodule\":\"spooldir\",\"configname\":\"本地目录源\",\"id\":2,\"configtab\":\"Spooling Directory Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 23:05:35');
INSERT INTO `sys_oper_log` VALUES (289, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":3,\"remark\":\"Kafka Source是一个Apache Kafka消费者，它从Kafka主题中读取消息。如果有多个Kafka源在运行，可以使用相同的Consumer Group对它们进行配置，这样每个源都将为主题读取一组唯一的分区。\",\"updateTime\":1676559945388,\"params\":{},\"createTime\":1675960006000,\"configmodule\":\"org.apache.flume.source.kafka.KafkaSource\",\"configname\":\"Kafka源\",\"id\":3,\"configtab\":\"Kafka Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 23:05:45');
INSERT INTO `sys_oper_log` VALUES (290, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":4,\"remark\":\"在给定端口上侦听并将每行文本转换为事件的类似于netcat的源。行为类似于nc -k -l [host] [port]。换句话说，它打开指定的端口并侦听数据。期望提供的数据是换行的文本。每一行文本都会变成一个Flume事件，并通过连接的通道发送。\",\"updateTime\":1676559955602,\"params\":{},\"createTime\":1675960042000,\"configmodule\":\"netcat\",\"configname\":\"TCP源\",\"id\":4,\"configtab\":\"NetCat TCP Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 23:05:55');
INSERT INTO `sys_oper_log` VALUES (291, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":5,\"remark\":\"根据最初的Netcat（TCP）源，该源在给定端口上侦听，并将每行文本转换为事件，并通过连接的通道发送。行为类似于nc -u -k -l [host] [port]。\",\"updateTime\":1676559965672,\"params\":{},\"createTime\":1675960085000,\"configmodule\":\"netcatudp\",\"configname\":\"UDP源\",\"id\":5,\"configtab\":\"NetCat UDP Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 23:06:05');
INSERT INTO `sys_oper_log` VALUES (292, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":6,\"remark\":\"更新、更快、支持多端口的版本的Syslog TCP源。请注意，端口配置设置已取代端口。多端口功能意味着它可以以高效的方式同时侦听多个端口。这个源代码使用ApacheMina库来实现这一点。提供对RFC-3164和许多常见的RFC-5424格式消息的支持。还提供了配置每个端口使用的字符集的功能。\",\"updateTime\":1676559977839,\"params\":{},\"createTime\":1675960170000,\"configmodule\":\"multiport_syslogtcp\",\"configname\":\"Syslog TCP源\",\"id\":6,\"configtab\":\"Syslog TCP Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 23:06:17');
INSERT INTO `sys_oper_log` VALUES (293, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":7,\"remark\":\"读取系统日志数据并生成事件。UDP源将整个消息视为单个事件。\",\"updateTime\":1676559986481,\"params\":{},\"createTime\":1675960229000,\"configmodule\":\"syslogudp\",\"configname\":\"Syslog UDP源\",\"id\":7,\"configtab\":\"Syslog UDP Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 23:06:26');
INSERT INTO `sys_oper_log` VALUES (294, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"source\",\"configindex\":8,\"remark\":\"通过HTTP POST和GET接受的源。GET只能用于实验。此处理程序接受HttpServletRequest并返回水槽事件列表。从一个Http请求处理的所有事件都在一个事务中提交到通道，从而提高了通道（如文件通道）的效率。如果处理程序抛出异常，则此源将返回HTTP状态400。如果频道已满，或者源无法将事件附加到频道，则源将返回HTTP 503-暂时不可用状态。\",\"updateTime\":1676559994717,\"params\":{},\"createTime\":1675960291000,\"configmodule\":\"http\",\"configname\":\"HTTP源\",\"id\":8,\"configtab\":\"HTTP Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 23:06:34');
INSERT INTO `sys_oper_log` VALUES (295, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"channel\",\"configindex\":9,\"remark\":\"事件存储在具有可配置最大大小的内存队列中。它非常适合需要更高吞吐量并准备在代理失败时丢失暂存数据的流。\",\"updateTime\":1676560002556,\"params\":{},\"createTime\":1675960336000,\"configmodule\":\"memory\",\"configname\":\"内存通道\",\"id\":9,\"configtab\":\"Memory Channel\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 23:06:42');
INSERT INTO `sys_oper_log` VALUES (296, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"channel\",\"configindex\":10,\"remark\":\"事件存储在由数据库支持的持久存储中。JDBC通道当前支持嵌入式Derby。这是一个持久的通道，非常适合可恢复性很重要的流。\",\"updateTime\":1676560012611,\"params\":{},\"createTime\":1675960363000,\"configmodule\":\"jdbc\",\"configname\":\"JDBC通道\",\"id\":10,\"configtab\":\"JDBC Channel\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 23:06:52');
INSERT INTO `sys_oper_log` VALUES (297, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"channel\",\"configindex\":11,\"remark\":\"本地文件存储通道缓存\",\"updateTime\":1676560022154,\"params\":{},\"createTime\":1675960424000,\"configmodule\":\"file\",\"configname\":\"文件通道\",\"id\":11,\"configtab\":\"File Channel\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 23:07:02');
INSERT INTO `sys_oper_log` VALUES (298, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sink\",\"configindex\":12,\"remark\":\"此接收器将事件写入Hadoop分布式文件系统（HDFS）。它目前支持创建文本和序列文件。它支持两种文件类型的压缩。可以根据经过的时间、数据大小或事件数量定期滚动文件（关闭当前文件并创建新文件）。它还根据时间戳或事件发生的机器等属性对数据进行桶/分区。HDFS目录路径可能包含格式化转义序列，该序列将被HDFS接收器替换，以生成用于存储事件的目录/文件名。使用此接收器需要安装hadoop，以便Flume可以使用hadoop jar与HDFS集群通信。注意，需要支持sync（）调用的Hadoop版本。\",\"updateTime\":1676560034188,\"params\":{},\"createTime\":1675960484000,\"configmodule\":\"hdfs\",\"configname\":\"HDFS目标\",\"id\":12,\"configtab\":\"HDFS Sink\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 23:07:14');
INSERT INTO `sys_oper_log` VALUES (299, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sink\",\"configindex\":13,\"remark\":\"在INFO级别记录事件。通常用于测试/调试目的。必需的财产以粗体显示。此接收器是唯一不需要日志记录原始数据部分中解释的额外配置的例外。\",\"updateTime\":1676560043054,\"params\":{},\"createTime\":1675960538000,\"configmodule\":\"logger\",\"configname\":\"日志目标\",\"id\":13,\"configtab\":\"Logger Sink\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 23:07:23');
INSERT INTO `sys_oper_log` VALUES (300, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sink\",\"configindex\":14,\"remark\":\"在本地文件系统上存储事件\",\"updateTime\":1676560050892,\"params\":{},\"createTime\":1675960576000,\"configmodule\":\"file_roll\",\"configname\":\"文档目标\",\"id\":14,\"configtab\":\"File Roll Sink\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 23:07:30');
INSERT INTO `sys_oper_log` VALUES (301, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sink\",\"configindex\":15,\"remark\":\"可以将数据发布到Kafka主题。其中一个目标是与Kafka集成，以便基于pull的处理系统能够处理来自不同源的数据。\",\"updateTime\":1676560060324,\"params\":{},\"createTime\":1675960705000,\"configmodule\":\"org.apache.flume.sink.kafka.KafkaSink\",\"configname\":\"Kafka目标\",\"id\":15,\"configtab\":\"Kafka Sink\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 23:07:40');
INSERT INTO `sys_oper_log` VALUES (302, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sink\",\"configindex\":16,\"remark\":\"此接收器的行为是，它将从通道接收事件，并使用HTTPPOST请求将这些事件发送到远程服务。事件内容作为POST正文发送。\",\"updateTime\":1676560069117,\"params\":{},\"createTime\":1675960735000,\"configmodule\":\"http\",\"configname\":\"HTTP目标\",\"id\":16,\"configtab\":\"HTTP Sink\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 23:07:49');
INSERT INTO `sys_oper_log` VALUES (303, '数据源', 1, 'com.ants.web.controller.logs.AntsSourcesController.add()', 'POST', 1, 'admin', NULL, '/logs/sources', '127.0.0.1', '内网IP', '{\"batchsize\":20,\"id\":7,\"params\":{},\"configid\":1,\"name\":\"shell_source_logs\",\"sourceIndex\":1,\"logstderr\":1,\"restartthrottle\":10000,\"restart\":1,\"command\":\"ping www.baidu.com\",\"createTime\":1676560553323,\"batchtimeout\":3000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 23:15:53');
INSERT INTO `sys_oper_log` VALUES (304, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataisdisabled\":1,\"dataprop\":\"restart\",\"datadefaultvalue\":\"2\",\"dataremark\":\"如果执行命令线程挂掉，是否重启\",\"dataindex\":4,\"updateTime\":1676561648293,\"dataisshow\":1,\"dataisquery\":1,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"命令挂掉是否重启\",\"datakey\":\"restart\",\"createTime\":1676219086000,\"datatype\":\"Switch\",\"configid\":1,\"id\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 23:34:08');
INSERT INTO `sys_oper_log` VALUES (305, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataisdisabled\":1,\"dataprop\":\"logStdErr\",\"datadefaultvalue\":\"2\",\"dataremark\":\"是否会记录命令的stderr内容\",\"dataindex\":5,\"updateTime\":1676561652589,\"dataisshow\":1,\"dataisquery\":1,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"是否记录stderr内容\",\"datakey\":\"logstderr\",\"createTime\":1676219125000,\"datatype\":\"Switch\",\"configid\":1,\"id\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 23:34:12');
INSERT INTO `sys_oper_log` VALUES (306, '数据源', 1, 'com.ants.web.controller.logs.AntsSourcesController.add()', 'POST', 1, 'admin', NULL, '/logs/sources', '127.0.0.1', '内网IP', '{\"batchsize\":20,\"id\":8,\"params\":{},\"configid\":1,\"name\":\"shell_source_logs\",\"sourceIndex\":1,\"logstderr\":2,\"restartthrottle\":10000,\"restart\":2,\"command\":\"shell_source_logs\",\"createTime\":1676561680472,\"batchtimeout\":3000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 23:34:40');
INSERT INTO `sys_oper_log` VALUES (307, '数据源', 2, 'com.ants.web.controller.logs.AntsSourcesController.edit()', 'PUT', 1, 'admin', NULL, '/logs/sources', '127.0.0.1', '内网IP', '{\"batchsize\":20,\"id\":7,\"params\":{},\"configid\":1,\"name\":\"shell_source_logs\",\"sourceIndex\":1,\"logstderr\":1,\"restartthrottle\":10000,\"restart\":1,\"command\":\"ping www.baidu.com\",\"createTime\":1676560553000,\"batchtimeout\":3000}', '{\"msg\":\"数据源名称已存在，请修改后重试\",\"code\":500}', 0, NULL, '2023-02-16 23:43:07');
INSERT INTO `sys_oper_log` VALUES (308, '数据源', 1, 'com.ants.web.controller.logs.AntsSourcesController.add()', 'POST', 1, 'admin', NULL, '/logs/sources', '127.0.0.1', '内网IP', '{\"batchsize\":20,\"params\":{},\"configid\":1,\"name\":\"shell_source_logs\",\"sourceIndex\":1,\"logstderr\":2,\"restartthrottle\":10000,\"restart\":2,\"command\":\"shell_source_logs\",\"batchtimeout\":3000}', '{\"msg\":\"数据源名称已存在，请修改后重试\",\"code\":500}', 0, NULL, '2023-02-16 23:43:14');
INSERT INTO `sys_oper_log` VALUES (309, '数据源', 3, 'com.ants.web.controller.logs.AntsSourcesController.remove()', 'DELETE', 1, 'admin', NULL, '/logs/sources/8', '127.0.0.1', '内网IP', '{ids=8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-16 23:48:23');
INSERT INTO `sys_oper_log` VALUES (310, '数据源', 1, 'com.ants.web.controller.logs.AntsSourcesController.add()', 'POST', 1, 'admin', NULL, '/logs/sources', '127.0.0.1', '内网IP', '{\"batchsize\":20,\"params\":{},\"configid\":1,\"name\":\"shell_source_logs\",\"sourceIndex\":1,\"logstderr\":2,\"restartthrottle\":10000,\"restart\":2,\"command\":\"shell_source_logs\",\"batchtimeout\":3000}', '{\"msg\":\"数据源名称已存在，请修改后重试\",\"code\":500}', 0, NULL, '2023-02-16 23:48:27');
INSERT INTO `sys_oper_log` VALUES (311, '数据源', 5, 'com.ants.web.controller.logs.AntsSourcesController.export()', 'GET', 1, 'admin', NULL, '/logs/sources/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"3bdd204a-3f33-42b2-9431-0790503c5884_sources.xlsx\",\"code\":200}', 0, NULL, '2023-02-16 23:48:57');
INSERT INTO `sys_oper_log` VALUES (312, '代码生成', 8, 'com.ants.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2023-02-19 23:35:39');
INSERT INTO `sys_oper_log` VALUES (313, '数据目标', 1, 'com.ants.web.controller.logs.AntsSinksController.add()', 'POST', 1, 'admin', NULL, '/logs/sinks', '127.0.0.1', '内网IP', '{\"id\":1,\"sinkIndex\":1,\"params\":{},\"configid\":13,\"maxbytestolog\":16,\"name\":\"logger_sink_logs\",\"createTime\":1676821223212}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-19 23:40:23');
INSERT INTO `sys_oper_log` VALUES (314, '数据目标', 2, 'com.ants.web.controller.logs.AntsSinksController.edit()', 'PUT', 1, 'admin', NULL, '/logs/sinks', '127.0.0.1', '内网IP', '{\"id\":1,\"sinkIndex\":1,\"params\":{},\"configid\":13,\"maxbytestolog\":16,\"name\":\"logger_sink_logs\",\"updateTime\":1676821250001,\"remake\":\"使用INFO级别把Event内容输出到日志中，一般用来测试、调试使用。这个 Sink 是唯一一个不需要额外配置就能把 Event 的原始内容输出的Sink，参照 输出原始数据到日志 。\",\"createTime\":1676821223000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-19 23:40:50');
INSERT INTO `sys_oper_log` VALUES (315, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sink\",\"configindex\":13,\"remark\":\"在INFO级别记录事件。通常用于测试/调试目的。必需的财产以粗体显示。此接收器是唯一不需要日志记录原始数据部分中解释的额外配置的例外。\",\"updateTime\":1676821443203,\"params\":{},\"createTime\":1675960538000,\"configmodule\":\"logger\",\"configname\":\"日志目标\",\"id\":13,\"configtab\":\"Logger Sink\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-19 23:44:03');
INSERT INTO `sys_oper_log` VALUES (316, '配置数据', 3, 'com.ants.web.controller.logs.AntsTypeConfigDataController.remove()', 'DELETE', 1, 'admin', NULL, '/logs/data/14', '127.0.0.1', '内网IP', '{ids=14}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-19 23:45:20');
INSERT INTO `sys_oper_log` VALUES (317, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataisdisabled\":1,\"dataprop\":\"maxBytesToLog\",\"datadefaultvalue\":\"16\",\"dataremark\":\"Event body 输出到日志的最大字节数，超出的部分会被丢弃\",\"dataindex\":1,\"updateTime\":1676821523860,\"dataisshow\":1,\"dataisquery\":1,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"输出最大字节数\",\"datakey\":\"maxBytesToLog\",\"createTime\":1676298981000,\"datatype\":\"InputNumber\",\"configid\":13,\"id\":15}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-19 23:45:23');
INSERT INTO `sys_oper_log` VALUES (318, '数据目标', 1, 'com.ants.web.controller.logs.AntsSinksController.add()', 'POST', 1, 'admin', NULL, '/logs/sinks', '127.0.0.1', '内网IP', '{\"id\":2,\"sinkIndex\":1,\"params\":{},\"configid\":13,\"maxbytestolog\":16,\"name\":\"logger_sink_logs\",\"createTime\":1676821551721}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-19 23:45:51');
INSERT INTO `sys_oper_log` VALUES (319, '数据目标', 3, 'com.ants.web.controller.logs.AntsSinksController.remove()', 'DELETE', 1, 'admin', NULL, '/logs/sinks/1', '127.0.0.1', '内网IP', '{ids=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-19 23:45:58');
INSERT INTO `sys_oper_log` VALUES (320, '数据通道', 1, 'com.ants.web.controller.logs.AntsChannelsController.add()', 'POST', 1, 'admin', NULL, '/logs/channels', '127.0.0.1', '内网IP', '{\"keepalive\":3,\"capacity\":100,\"bytecapacity\":1,\"id\":1,\"bytecapacitybufferpercentage\":20,\"transactioncapacity\":100,\"remake\":\"内存 channel 是把 Event 队列存储到内存上，队列的最大数量就是 capacity 的设定值。它非常适合对吞吐量有较高要求的场景，但也是有代价的，当发生故障的时候会丢失当时内存中的所有 Event\",\"params\":{},\"createTime\":1676821810187,\"configid\":9,\"name\":\"memory_channel_logs\",\"channelIndex\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-19 23:50:10');
INSERT INTO `sys_oper_log` VALUES (321, '配置数据', 3, 'com.ants.web.controller.logs.AntsTypeConfigDataController.remove()', 'DELETE', 1, 'admin', NULL, '/logs/data/8', '127.0.0.1', '内网IP', '{ids=8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-19 23:50:24');
INSERT INTO `sys_oper_log` VALUES (322, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataisdisabled\":1,\"dataprop\":\"capacity\",\"datadefaultvalue\":\"100\",\"dataremark\":\"内存中存储 Event 的最大数\",\"dataindex\":1,\"updateTime\":1676821829082,\"dataisshow\":1,\"dataisquery\":1,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"通道内存最大数\",\"datakey\":\"capacity\",\"createTime\":1676298273000,\"datatype\":\"InputNumber\",\"configid\":9,\"id\":9}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-19 23:50:29');
INSERT INTO `sys_oper_log` VALUES (323, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataisdisabled\":1,\"dataprop\":\"transactionCapacity\",\"datadefaultvalue\":\"100\",\"dataremark\":\"source 或者 sink 每个事务中存取 Event 的操作数量（不能比 capacity 大）\",\"dataindex\":2,\"updateTime\":1676821831842,\"dataisshow\":1,\"dataisquery\":1,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"通道操作数量最大数\",\"datakey\":\"transactionCapacity\",\"createTime\":1676298311000,\"datatype\":\"InputNumber\",\"configid\":9,\"id\":10}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-19 23:50:31');
INSERT INTO `sys_oper_log` VALUES (324, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataisdisabled\":1,\"dataprop\":\"keepAlive\",\"datadefaultvalue\":\"3\",\"dataremark\":\"添加或删除一个 Event 的超时时间（秒）\",\"dataindex\":3,\"updateTime\":1676821834504,\"dataisshow\":1,\"dataisquery\":1,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"超时时间\",\"datakey\":\"keep-alive\",\"createTime\":1676298344000,\"datatype\":\"InputNumber\",\"configid\":9,\"id\":11}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-19 23:50:34');
INSERT INTO `sys_oper_log` VALUES (325, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataisdisabled\":1,\"dataprop\":\"byteCapacityBufferPercentage\",\"datadefaultvalue\":\"20\",\"dataremark\":\"指定 Event header 所占空间大小与 channel 中所有 Event 的总大小之间的百分比\",\"dataindex\":4,\"updateTime\":1676821837838,\"dataisshow\":1,\"dataisquery\":1,\"params\":{},\"dataisrequired\":2,\"datalabel\":\" header占空间大小百分比\",\"datakey\":\"byteCapacityBufferPercentage\",\"createTime\":1676298385000,\"datatype\":\"InputNumber\",\"configid\":9,\"id\":12}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-19 23:50:37');
INSERT INTO `sys_oper_log` VALUES (326, '配置数据', 2, 'com.ants.web.controller.logs.AntsTypeConfigDataController.edit()', 'PUT', 1, 'admin', NULL, '/logs/data', '127.0.0.1', '内网IP', '{\"dataisdisabled\":1,\"dataprop\":\"byteCapacity\",\"dataremark\":\"Channel 中最大允许存储所有 Event 的总字节数（bytes）。默认情况下会使用JVM可用内存的80%作为最大可用内存（就是JVM启动参数里面配置的-Xmx的值）。 计算总字节时只计算 Event 的主体，这也是提供 byteCapacityBufferPercentage 配置参数的原因。注意，当你在一个 Agent 里面有多个内存 channel 的时候， 而且碰巧这些 channel 存储相同的物理 Event（例如：这些 channel 通过复制机制（ 复制选择器 ）接收同一个 source 中的 Event）， 这时候这些 Event 占用的空间是累加的，并不会只计算一次。如果这个值设置为0（不限制），就会达到200G左右的内部硬件限制。\",\"dataindex\":5,\"updateTime\":1676821840530,\"dataisshow\":1,\"dataisquery\":1,\"params\":{},\"dataisrequired\":2,\"datalabel\":\"最大允许存储字节数\",\"datakey\":\"byteCapacity\",\"createTime\":1676298449000,\"datatype\":\"InputNumber\",\"configid\":9,\"id\":13}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-19 23:50:40');
INSERT INTO `sys_oper_log` VALUES (327, '数据通道', 5, 'com.ants.web.controller.logs.AntsChannelsController.export()', 'GET', 1, 'admin', NULL, '/logs/channels/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"90bb72fd-f001-46fe-ac17-d788150320a8_channels.xlsx\",\"code\":200}', 0, NULL, '2023-02-19 23:51:31');
INSERT INTO `sys_oper_log` VALUES (328, '字典数据', 2, 'com.ants.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"sources\",\"dictSort\":1,\"remark\":\"源类型\",\"params\":{},\"dictType\":\"ants_logs_type\",\"dictLabel\":\"源\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1675956486000,\"dictCode\":29,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 23:34:23');
INSERT INTO `sys_oper_log` VALUES (329, '字典数据', 2, 'com.ants.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"channels\",\"dictSort\":2,\"remark\":\"通道类型\",\"params\":{},\"dictType\":\"ants_logs_type\",\"dictLabel\":\"通道\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1675956497000,\"dictCode\":30,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 23:34:26');
INSERT INTO `sys_oper_log` VALUES (330, '字典数据', 2, 'com.ants.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"sinks\",\"dictSort\":3,\"remark\":\"目标类型\",\"params\":{},\"dictType\":\"ants_logs_type\",\"dictLabel\":\"目标\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1675956508000,\"dictCode\":31,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 23:34:28');
INSERT INTO `sys_oper_log` VALUES (331, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sources\",\"configindex\":1,\"remark\":\"Exec源在启动时运行给定的Unix命令，并期望该进程在标准输出时连续生成数据（stderr被简单地丢弃，除非属性logStdErr设置为true）。如果进程出于任何原因退出，源也将退出，并且不会产生更多数据。这意味着cat[命名管道]或tail-F[文件]等配置将产生所需的结果，而as date可能不会产生-前两个命令产生数据流，后者产生单个事件并退出。\",\"updateTime\":1677771996527,\"params\":{},\"createTime\":1675959212000,\"configmodule\":\"exec\",\"configname\":\"命令源\",\"id\":1,\"configtab\":\"Exec_Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 23:46:36');
INSERT INTO `sys_oper_log` VALUES (332, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sources\",\"configindex\":2,\"remark\":\"该源允许您通过将要摄取的文件放入磁盘上的“假脱机”目录来摄取数据。此源将监视指定目录中的新文件，并在新文件出现时解析事件。事件解析逻辑是可插入的。在将给定文件完全读入通道后，默认情况下通过重命名文件来指示完成，或者可以删除该文件，或者使用trackerDir来跟踪已处理的文件。\",\"updateTime\":1677772002274,\"params\":{},\"createTime\":1675959420000,\"configmodule\":\"spooldir\",\"configname\":\"本地目录源\",\"id\":2,\"configtab\":\"Spooling_Directory_Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 23:46:42');
INSERT INTO `sys_oper_log` VALUES (333, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sources\",\"configindex\":3,\"remark\":\"Kafka Source是一个Apache Kafka消费者，它从Kafka主题中读取消息。如果有多个Kafka源在运行，可以使用相同的Consumer Group对它们进行配置，这样每个源都将为主题读取一组唯一的分区。\",\"updateTime\":1677772007504,\"params\":{},\"createTime\":1675960006000,\"configmodule\":\"org.apache.flume.source.kafka.KafkaSource\",\"configname\":\"Kafka源\",\"id\":3,\"configtab\":\"Kafka_Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 23:46:47');
INSERT INTO `sys_oper_log` VALUES (334, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sources\",\"configindex\":4,\"remark\":\"在给定端口上侦听并将每行文本转换为事件的类似于netcat的源。行为类似于nc -k -l [host] [port]。换句话说，它打开指定的端口并侦听数据。期望提供的数据是换行的文本。每一行文本都会变成一个Flume事件，并通过连接的通道发送。\",\"updateTime\":1677772012777,\"params\":{},\"createTime\":1675960042000,\"configmodule\":\"netcat\",\"configname\":\"TCP源\",\"id\":4,\"configtab\":\"NetCat_TCP_Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 23:46:52');
INSERT INTO `sys_oper_log` VALUES (335, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sources\",\"configindex\":5,\"remark\":\"根据最初的Netcat（TCP）源，该源在给定端口上侦听，并将每行文本转换为事件，并通过连接的通道发送。行为类似于nc -u -k -l [host] [port]。\",\"updateTime\":1677772018226,\"params\":{},\"createTime\":1675960085000,\"configmodule\":\"netcatudp\",\"configname\":\"UDP源\",\"id\":5,\"configtab\":\"NetCat_UDP_Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 23:46:58');
INSERT INTO `sys_oper_log` VALUES (336, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sources\",\"configindex\":6,\"remark\":\"更新、更快、支持多端口的版本的Syslog TCP源。请注意，端口配置设置已取代端口。多端口功能意味着它可以以高效的方式同时侦听多个端口。这个源代码使用ApacheMina库来实现这一点。提供对RFC-3164和许多常见的RFC-5424格式消息的支持。还提供了配置每个端口使用的字符集的功能。\",\"updateTime\":1677772024288,\"params\":{},\"createTime\":1675960170000,\"configmodule\":\"multiport_syslogtcp\",\"configname\":\"Syslog TCP源\",\"id\":6,\"configtab\":\"Syslog_TCP_Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 23:47:04');
INSERT INTO `sys_oper_log` VALUES (337, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sources\",\"configindex\":8,\"remark\":\"通过HTTP POST和GET接受的源。GET只能用于实验。此处理程序接受HttpServletRequest并返回水槽事件列表。从一个Http请求处理的所有事件都在一个事务中提交到通道，从而提高了通道（如文件通道）的效率。如果处理程序抛出异常，则此源将返回HTTP状态400。如果频道已满，或者源无法将事件附加到频道，则源将返回HTTP 503-暂时不可用状态。\",\"updateTime\":1677772028181,\"params\":{},\"createTime\":1675960291000,\"configmodule\":\"http\",\"configname\":\"HTTP源\",\"id\":8,\"configtab\":\"HTTP_Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 23:47:08');
INSERT INTO `sys_oper_log` VALUES (338, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"channels\",\"configindex\":10,\"remark\":\"事件存储在由数据库支持的持久存储中。JDBC通道当前支持嵌入式Derby。这是一个持久的通道，非常适合可恢复性很重要的流。\",\"updateTime\":1677772031803,\"params\":{},\"createTime\":1675960363000,\"configmodule\":\"jdbc\",\"configname\":\"JDBC通道\",\"id\":10,\"configtab\":\"JDBC_Channel\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 23:47:11');
INSERT INTO `sys_oper_log` VALUES (339, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"channels\",\"configindex\":9,\"remark\":\"事件存储在具有可配置最大大小的内存队列中。它非常适合需要更高吞吐量并准备在代理失败时丢失暂存数据的流。\",\"updateTime\":1677772038411,\"params\":{},\"createTime\":1675960336000,\"configmodule\":\"memory\",\"configname\":\"内存通道\",\"id\":9,\"configtab\":\"Memory_Channel\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 23:47:18');
INSERT INTO `sys_oper_log` VALUES (340, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sources\",\"configindex\":7,\"remark\":\"读取系统日志数据并生成事件。UDP源将整个消息视为单个事件。\",\"updateTime\":1677772044731,\"params\":{},\"createTime\":1675960229000,\"configmodule\":\"syslogudp\",\"configname\":\"Syslog UDP源\",\"id\":7,\"configtab\":\"Syslog_UDP_Source\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 23:47:24');
INSERT INTO `sys_oper_log` VALUES (341, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"channels\",\"configindex\":11,\"remark\":\"本地文件存储通道缓存\",\"updateTime\":1677772051447,\"params\":{},\"createTime\":1675960424000,\"configmodule\":\"file\",\"configname\":\"文件通道\",\"id\":11,\"configtab\":\"File_Channel\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 23:47:31');
INSERT INTO `sys_oper_log` VALUES (342, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sinks\",\"configindex\":12,\"remark\":\"此接收器将事件写入Hadoop分布式文件系统（HDFS）。它目前支持创建文本和序列文件。它支持两种文件类型的压缩。可以根据经过的时间、数据大小或事件数量定期滚动文件（关闭当前文件并创建新文件）。它还根据时间戳或事件发生的机器等属性对数据进行桶/分区。HDFS目录路径可能包含格式化转义序列，该序列将被HDFS接收器替换，以生成用于存储事件的目录/文件名。使用此接收器需要安装hadoop，以便Flume可以使用hadoop jar与HDFS集群通信。注意，需要支持sync（）调用的Hadoop版本。\",\"updateTime\":1677772054949,\"params\":{},\"createTime\":1675960484000,\"configmodule\":\"hdfs\",\"configname\":\"HDFS目标\",\"id\":12,\"configtab\":\"HDFS_Sink\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 23:47:34');
INSERT INTO `sys_oper_log` VALUES (343, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sinks\",\"configindex\":13,\"remark\":\"在INFO级别记录事件。通常用于测试/调试目的。必需的财产以粗体显示。此接收器是唯一不需要日志记录原始数据部分中解释的额外配置的例外。\",\"updateTime\":1677772058406,\"params\":{},\"createTime\":1675960538000,\"configmodule\":\"logger\",\"configname\":\"日志目标\",\"id\":13,\"configtab\":\"Logger_Sink\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 23:47:38');
INSERT INTO `sys_oper_log` VALUES (344, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sinks\",\"configindex\":14,\"remark\":\"在本地文件系统上存储事件\",\"updateTime\":1677772064130,\"params\":{},\"createTime\":1675960576000,\"configmodule\":\"file_roll\",\"configname\":\"文档目标\",\"id\":14,\"configtab\":\"File_Roll_Sink\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 23:47:44');
INSERT INTO `sys_oper_log` VALUES (345, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sinks\",\"configindex\":15,\"remark\":\"可以将数据发布到Kafka主题。其中一个目标是与Kafka集成，以便基于pull的处理系统能够处理来自不同源的数据。\",\"updateTime\":1677772068998,\"params\":{},\"createTime\":1675960705000,\"configmodule\":\"org.apache.flume.sink.kafka.KafkaSink\",\"configname\":\"Kafka目标\",\"id\":15,\"configtab\":\"Kafka_Sink\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 23:47:49');
INSERT INTO `sys_oper_log` VALUES (346, '基础配置', 2, 'com.ants.web.controller.logs.AntsTypeConfigController.edit()', 'PUT', 1, 'admin', NULL, '/logs/config', '127.0.0.1', '内网IP', '{\"configtype\":\"sinks\",\"configindex\":16,\"remark\":\"此接收器的行为是，它将从通道接收事件，并使用HTTPPOST请求将这些事件发送到远程服务。事件内容作为POST正文发送。\",\"updateTime\":1677772072126,\"params\":{},\"createTime\":1675960735000,\"configmodule\":\"http\",\"configname\":\"HTTP目标\",\"id\":16,\"configtab\":\"HTTP_Sink\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 23:47:52');
INSERT INTO `sys_oper_log` VALUES (347, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2087', '127.0.0.1', '内网IP', '{menuId=2087}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2023-03-05 15:10:35');
INSERT INTO `sys_oper_log` VALUES (348, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2088', '127.0.0.1', '内网IP', '{menuId=2088}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2023-03-05 15:10:38');
INSERT INTO `sys_oper_log` VALUES (349, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2089', '127.0.0.1', '内网IP', '{menuId=2089}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:10:40');
INSERT INTO `sys_oper_log` VALUES (350, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2090', '127.0.0.1', '内网IP', '{menuId=2090}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:10:42');
INSERT INTO `sys_oper_log` VALUES (351, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2091', '127.0.0.1', '内网IP', '{menuId=2091}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:10:44');
INSERT INTO `sys_oper_log` VALUES (352, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2092', '127.0.0.1', '内网IP', '{menuId=2092}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:10:45');
INSERT INTO `sys_oper_log` VALUES (353, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2093', '127.0.0.1', '内网IP', '{menuId=2093}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:10:47');
INSERT INTO `sys_oper_log` VALUES (354, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2088', '127.0.0.1', '内网IP', '{menuId=2088}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:10:48');
INSERT INTO `sys_oper_log` VALUES (355, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2101', '127.0.0.1', '内网IP', '{menuId=2101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:10:50');
INSERT INTO `sys_oper_log` VALUES (356, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2102', '127.0.0.1', '内网IP', '{menuId=2102}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:10:52');
INSERT INTO `sys_oper_log` VALUES (357, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2103', '127.0.0.1', '内网IP', '{menuId=2103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:10:53');
INSERT INTO `sys_oper_log` VALUES (358, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2104', '127.0.0.1', '内网IP', '{menuId=2104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:10:54');
INSERT INTO `sys_oper_log` VALUES (359, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2105', '127.0.0.1', '内网IP', '{menuId=2105}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:10:55');
INSERT INTO `sys_oper_log` VALUES (360, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2100', '127.0.0.1', '内网IP', '{menuId=2100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:10:57');
INSERT INTO `sys_oper_log` VALUES (361, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2087', '127.0.0.1', '内网IP', '{menuId=2087}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:10:58');
INSERT INTO `sys_oper_log` VALUES (362, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2032', '127.0.0.1', '内网IP', '{menuId=2032}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:01');
INSERT INTO `sys_oper_log` VALUES (363, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2033', '127.0.0.1', '内网IP', '{menuId=2033}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:02');
INSERT INTO `sys_oper_log` VALUES (364, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2034', '127.0.0.1', '内网IP', '{menuId=2034}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:03');
INSERT INTO `sys_oper_log` VALUES (365, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2035', '127.0.0.1', '内网IP', '{menuId=2035}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:05');
INSERT INTO `sys_oper_log` VALUES (366, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2036', '127.0.0.1', '内网IP', '{menuId=2036}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:06');
INSERT INTO `sys_oper_log` VALUES (367, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2031', '127.0.0.1', '内网IP', '{menuId=2031}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:07');
INSERT INTO `sys_oper_log` VALUES (368, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2026', '127.0.0.1', '内网IP', '{menuId=2026}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:09');
INSERT INTO `sys_oper_log` VALUES (369, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2027', '127.0.0.1', '内网IP', '{menuId=2027}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:11');
INSERT INTO `sys_oper_log` VALUES (370, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2028', '127.0.0.1', '内网IP', '{menuId=2028}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:12');
INSERT INTO `sys_oper_log` VALUES (371, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2029', '127.0.0.1', '内网IP', '{menuId=2029}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:13');
INSERT INTO `sys_oper_log` VALUES (372, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2030', '127.0.0.1', '内网IP', '{menuId=2030}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:14');
INSERT INTO `sys_oper_log` VALUES (373, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2025', '127.0.0.1', '内网IP', '{menuId=2025}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:15');
INSERT INTO `sys_oper_log` VALUES (374, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2056', '127.0.0.1', '内网IP', '{menuId=2056}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:17');
INSERT INTO `sys_oper_log` VALUES (375, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2058', '127.0.0.1', '内网IP', '{menuId=2058}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:18');
INSERT INTO `sys_oper_log` VALUES (376, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2057', '127.0.0.1', '内网IP', '{menuId=2057}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:19');
INSERT INTO `sys_oper_log` VALUES (377, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2059', '127.0.0.1', '内网IP', '{menuId=2059}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:20');
INSERT INTO `sys_oper_log` VALUES (378, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2060', '127.0.0.1', '内网IP', '{menuId=2060}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:21');
INSERT INTO `sys_oper_log` VALUES (379, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2055', '127.0.0.1', '内网IP', '{menuId=2055}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:22');
INSERT INTO `sys_oper_log` VALUES (380, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2044', '127.0.0.1', '内网IP', '{menuId=2044}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:25');
INSERT INTO `sys_oper_log` VALUES (381, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2045', '127.0.0.1', '内网IP', '{menuId=2045}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:26');
INSERT INTO `sys_oper_log` VALUES (382, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2046', '127.0.0.1', '内网IP', '{menuId=2046}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:27');
INSERT INTO `sys_oper_log` VALUES (383, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2047', '127.0.0.1', '内网IP', '{menuId=2047}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:28');
INSERT INTO `sys_oper_log` VALUES (384, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2048', '127.0.0.1', '内网IP', '{menuId=2048}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:29');
INSERT INTO `sys_oper_log` VALUES (385, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2043', '127.0.0.1', '内网IP', '{menuId=2043}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:30');
INSERT INTO `sys_oper_log` VALUES (386, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2050', '127.0.0.1', '内网IP', '{menuId=2050}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:33');
INSERT INTO `sys_oper_log` VALUES (387, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2051', '127.0.0.1', '内网IP', '{menuId=2051}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:34');
INSERT INTO `sys_oper_log` VALUES (388, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2052', '127.0.0.1', '内网IP', '{menuId=2052}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:35');
INSERT INTO `sys_oper_log` VALUES (389, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2053', '127.0.0.1', '内网IP', '{menuId=2053}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:36');
INSERT INTO `sys_oper_log` VALUES (390, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2054', '127.0.0.1', '内网IP', '{menuId=2054}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:37');
INSERT INTO `sys_oper_log` VALUES (391, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2049', '127.0.0.1', '内网IP', '{menuId=2049}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:38');
INSERT INTO `sys_oper_log` VALUES (392, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2061', '127.0.0.1', '内网IP', '{menuId=2061}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:40');
INSERT INTO `sys_oper_log` VALUES (393, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2008', '127.0.0.1', '内网IP', '{menuId=2008}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:44');
INSERT INTO `sys_oper_log` VALUES (394, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2009', '127.0.0.1', '内网IP', '{menuId=2009}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:45');
INSERT INTO `sys_oper_log` VALUES (395, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2010', '127.0.0.1', '内网IP', '{menuId=2010}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:46');
INSERT INTO `sys_oper_log` VALUES (396, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2011', '127.0.0.1', '内网IP', '{menuId=2011}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:47');
INSERT INTO `sys_oper_log` VALUES (397, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2012', '127.0.0.1', '内网IP', '{menuId=2012}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:49');
INSERT INTO `sys_oper_log` VALUES (398, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2007', '127.0.0.1', '内网IP', '{menuId=2007}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:50');
INSERT INTO `sys_oper_log` VALUES (399, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2014', '127.0.0.1', '内网IP', '{menuId=2014}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:52');
INSERT INTO `sys_oper_log` VALUES (400, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2015', '127.0.0.1', '内网IP', '{menuId=2015}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:53');
INSERT INTO `sys_oper_log` VALUES (401, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2016', '127.0.0.1', '内网IP', '{menuId=2016}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:54');
INSERT INTO `sys_oper_log` VALUES (402, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2017', '127.0.0.1', '内网IP', '{menuId=2017}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:55');
INSERT INTO `sys_oper_log` VALUES (403, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2018', '127.0.0.1', '内网IP', '{menuId=2018}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:56');
INSERT INTO `sys_oper_log` VALUES (404, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2013', '127.0.0.1', '内网IP', '{menuId=2013}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:57');
INSERT INTO `sys_oper_log` VALUES (405, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2020', '127.0.0.1', '内网IP', '{menuId=2020}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:58');
INSERT INTO `sys_oper_log` VALUES (406, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2021', '127.0.0.1', '内网IP', '{menuId=2021}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:11:59');
INSERT INTO `sys_oper_log` VALUES (407, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2022', '127.0.0.1', '内网IP', '{menuId=2022}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:12:01');
INSERT INTO `sys_oper_log` VALUES (408, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2023', '127.0.0.1', '内网IP', '{menuId=2023}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:12:02');
INSERT INTO `sys_oper_log` VALUES (409, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2024', '127.0.0.1', '内网IP', '{menuId=2024}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:12:02');
INSERT INTO `sys_oper_log` VALUES (410, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2019', '127.0.0.1', '内网IP', '{menuId=2019}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:12:03');
INSERT INTO `sys_oper_log` VALUES (411, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2038', '127.0.0.1', '内网IP', '{menuId=2038}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:12:06');
INSERT INTO `sys_oper_log` VALUES (412, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2039', '127.0.0.1', '内网IP', '{menuId=2039}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:12:07');
INSERT INTO `sys_oper_log` VALUES (413, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2040', '127.0.0.1', '内网IP', '{menuId=2040}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:12:08');
INSERT INTO `sys_oper_log` VALUES (414, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2041', '127.0.0.1', '内网IP', '{menuId=2041}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:12:09');
INSERT INTO `sys_oper_log` VALUES (415, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2042', '127.0.0.1', '内网IP', '{menuId=2042}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:12:10');
INSERT INTO `sys_oper_log` VALUES (416, '菜单管理', 3, 'com.ants.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2037', '127.0.0.1', '内网IP', '{menuId=2037}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:12:11');
INSERT INTO `sys_oper_log` VALUES (417, '微信用户', 2, 'com.ants.web.controller.weixin.WxUserController.edit()', 'PUT', 1, 'admin', NULL, '/weixin/user', '127.0.0.1', '内网IP', '{\"gender\":0,\"nickName\":\"R1BUXzc1MjdlMzFj\",\"openid\":\"oBWyw5DeW2DojyGVCKVcBy8UB42U\",\"updateTime\":1678000404369,\"params\":{},\"deleteFlag\":0,\"lastLoginTime\":1677934438000,\"createTime\":1677934438000,\"disableFlag\":0,\"id\":57}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:13:24');
INSERT INTO `sys_oper_log` VALUES (418, '代码生成', 3, 'com.ants.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1,2,3,4,5', '127.0.0.1', '内网IP', '{tableIds=1,2,3,4,5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:15:06');
INSERT INTO `sys_oper_log` VALUES (419, '代码生成', 6, 'com.ants.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'wx_chat', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:15:22');
INSERT INTO `sys_oper_log` VALUES (420, '代码生成', 2, 'com.ants.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ants\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":185,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1678000522000,\"tableId\":6,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"UserId\",\"usableColumn\":false,\"columnId\":186,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1678000522000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"user_id\"},{\"capJavaField\":\"Role\",\"usableColumn\":false,\"columnId\":187,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"role\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"角色\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1678000522000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"role\"},{\"capJavaField\":\"Content\",\"usableColumn\":false,\"columnId\":188,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"content\",\"htmlType\":\"editor\",\"edit\":true,\"query\":true,\"columnComment\":\"内容\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"text\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1678000522000,\"isEdit\":\"1\",\"tableI', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:16:13');
INSERT INTO `sys_oper_log` VALUES (421, '代码生成', 2, 'com.ants.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ants\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":185,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"updateTime\":1678000573000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1678000522000,\"tableId\":6,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"UserId\",\"usableColumn\":false,\"columnId\":186,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户id\",\"isQuery\":\"1\",\"updateTime\":1678000573000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1678000522000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"user_id\"},{\"capJavaField\":\"Role\",\"usableColumn\":false,\"columnId\":187,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"role\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"角色\",\"isQuery\":\"1\",\"updateTime\":1678000573000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1678000522000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"role\"},{\"capJavaField\":\"Content\",\"usableColumn\":false,\"columnId\":188,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"content\",\"htmlType\":\"editor\",\"edit\":true,\"query\":true,\"columnComment\":\"内容\",\"isQuery\":\"1\",\"updateTime\":1678000573000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"query', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:16:30');
INSERT INTO `sys_oper_log` VALUES (422, '代码生成', 8, 'com.ants.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2023-03-05 15:16:32');
INSERT INTO `sys_oper_log` VALUES (423, '菜单管理', 2, 'com.ants.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"wechat\",\"orderNum\":\"1\",\"menuName\":\"微信聊天\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"chat\",\"component\":\"weixin/chat/index\",\"children\":[],\"createTime\":1678000668000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2106,\"menuType\":\"C\",\"perms\":\"weixin:chat:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-05 15:20:08');
INSERT INTO `sys_oper_log` VALUES (424, '代码生成', 6, 'com.ants.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'wx_feedback', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-13 21:35:23');
INSERT INTO `sys_oper_log` VALUES (425, '代码生成', 2, 'com.ants.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ants\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":195,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1678714523000,\"tableId\":7,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Openid\",\"usableColumn\":false,\"columnId\":196,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"openid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"openid\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1678714523000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"openid\"},{\"capJavaField\":\"Feedback\",\"usableColumn\":false,\"columnId\":197,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"feedback\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"反馈内容\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"text\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1678714523000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"feedback\"},{\"capJavaField\":\"Contact\",\"usableColumn\":false,\"columnId\":198,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"contact\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"联系方式\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-13 21:36:10');
INSERT INTO `sys_oper_log` VALUES (426, '代码生成', 2, 'com.ants.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ants\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":195,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"主键\",\"updateTime\":1678714570000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1678714523000,\"tableId\":7,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Openid\",\"usableColumn\":false,\"columnId\":196,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"openid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"openid\",\"isQuery\":\"1\",\"updateTime\":1678714570000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1678714523000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"openid\"},{\"capJavaField\":\"Feedback\",\"usableColumn\":false,\"columnId\":197,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"feedback\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":true,\"columnComment\":\"反馈内容\",\"isQuery\":\"1\",\"updateTime\":1678714570000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"text\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1678714523000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"feedback\"},{\"capJavaField\":\"Contact\",\"usableColumn\":false,\"columnId\":198,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"contact\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"联系方式\",\"isQuery\":\"1\",\"updateTime\":1678714570000,\"sort\":4,\"list\":true,\"params\":{},\"j', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-13 21:36:27');
INSERT INTO `sys_oper_log` VALUES (427, '代码生成', 8, 'com.ants.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2023-03-13 21:36:31');
INSERT INTO `sys_oper_log` VALUES (428, '菜单管理', 2, 'com.ants.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"form\",\"orderNum\":\"1\",\"menuName\":\"反馈管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"feedback\",\"component\":\"weixin/feedback/index\",\"children\":[],\"createTime\":1678714620000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2112,\"menuType\":\"C\",\"perms\":\"weixin:feedback:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-13 21:40:22');
INSERT INTO `sys_oper_log` VALUES (429, '反馈管理', 3, 'com.ants.web.controller.weixin.WxFeedbackController.remove()', 'DELETE', 1, 'admin', NULL, '/weixin/feedback/4', '127.0.0.1', '内网IP', '{ids=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-13 21:49:17');
INSERT INTO `sys_oper_log` VALUES (430, '定时任务', 1, 'com.ants.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"jobName\":\"错误聊天自动化处理\",\"concurrent\":\"0\",\"jobGroup\":\"DEFAULT\",\"params\":{},\"cronExpression\":\"* * * * * ?\",\"jobId\":4,\"createBy\":\"admin\",\"nextValidTime\":1680107207000,\"invokeTarget\":\"antsTask.antsNoParams\",\"misfirePolicy\":\"1\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 00:26:47');
INSERT INTO `sys_oper_log` VALUES (431, '定时任务', 2, 'com.ants.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', NULL, '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"jobId\":4,\"misfirePolicy\":\"0\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 00:26:50');
INSERT INTO `sys_oper_log` VALUES (432, '定时任务', 2, 'com.ants.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', NULL, '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"jobId\":4,\"misfirePolicy\":\"0\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 00:28:38');
INSERT INTO `sys_oper_log` VALUES (433, '定时任务', 1, 'com.ants.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"jobName\":\"异常聊天处理\",\"concurrent\":\"0\",\"jobGroup\":\"DEFAULT\",\"params\":{},\"cronExpression\":\"* * * * * ? *\",\"jobId\":5,\"createBy\":\"admin\",\"nextValidTime\":1680107346000,\"invokeTarget\":\"antsTask.antsNoParams\",\"misfirePolicy\":\"1\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 00:29:05');
INSERT INTO `sys_oper_log` VALUES (434, '定时任务', 2, 'com.ants.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', NULL, '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"jobId\":5,\"misfirePolicy\":\"0\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 00:29:09');
INSERT INTO `sys_oper_log` VALUES (435, '定时任务', 3, 'com.ants.quartz.controller.SysJobController.remove()', 'DELETE', 1, 'admin', NULL, '/monitor/job/4', '127.0.0.1', '内网IP', '{jobIds=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 00:31:14');
INSERT INTO `sys_oper_log` VALUES (436, '定时任务', 2, 'com.ants.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', NULL, '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"jobId\":5,\"misfirePolicy\":\"0\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 00:33:31');
INSERT INTO `sys_oper_log` VALUES (437, '定时任务', 3, 'com.ants.quartz.controller.SysJobController.remove()', 'DELETE', 1, 'admin', NULL, '/monitor/job/5', '127.0.0.1', '内网IP', '{jobIds=5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 00:33:48');
INSERT INTO `sys_oper_log` VALUES (438, '定时任务', 1, 'com.ants.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"jobName\":\"异常聊天处理\",\"concurrent\":\"1\",\"jobGroup\":\"DEFAULT\",\"params\":{},\"cronExpression\":\" 0 0/1 * * * ?\",\"jobId\":6,\"createBy\":\"admin\",\"nextValidTime\":1680107640000,\"invokeTarget\":\"antsTask.antsNoParams\",\"misfirePolicy\":\"1\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 00:33:50');
INSERT INTO `sys_oper_log` VALUES (439, '定时任务', 1, 'com.ants.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"jobName\":\"异常聊天处理\",\"concurrent\":\"0\",\"jobGroup\":\"DEFAULT\",\"params\":{},\"cronExpression\":\"0 0/1 * * * ?\",\"jobId\":7,\"createBy\":\"admin\",\"nextValidTime\":1680107700000,\"invokeTarget\":\"antsTask.antsNoParams\",\"misfirePolicy\":\"1\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 00:34:07');
INSERT INTO `sys_oper_log` VALUES (440, '定时任务', 3, 'com.ants.quartz.controller.SysJobController.remove()', 'DELETE', 1, 'admin', NULL, '/monitor/job/6', '127.0.0.1', '内网IP', '{jobIds=6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 00:34:14');
INSERT INTO `sys_oper_log` VALUES (441, '定时任务', 2, 'com.ants.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', NULL, '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"jobId\":7,\"misfirePolicy\":\"0\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-30 00:34:16');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-02-04 11:06:42', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-02-04 11:06:42', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2021-02-04 11:06:42', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '大数据日志审计管理系统2.0', '00', 'ants@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-02-04 11:06:42', 'admin', '2021-02-04 11:06:42', '', '2023-02-07 00:12:56', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-02-04 11:06:42', 'admin', '2021-02-04 11:06:42', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (104, 103, '123', '123', '00', '', '', '1', '', '$2a$10$8kRBAthtfYFhe/y1Mog54O8YThtkxjBAUsqikl0V.zFNhvjilCgGG', '0', '0', '', NULL, 'admin', '2021-02-04 18:03:12', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (104, 2);

-- ----------------------------
-- Table structure for wx_chat
-- ----------------------------
DROP TABLE IF EXISTS `wx_chat`;
CREATE TABLE `wx_chat`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'openid',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '角色',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '内容',
  `error_flag` int(0) NULL DEFAULT NULL COMMENT '是否报错',
  `duration` int(0) NULL DEFAULT NULL COMMENT '耗时',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新者',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `openid`(`openid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 584 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '微信聊天表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wx_feedback
-- ----------------------------
DROP TABLE IF EXISTS `wx_feedback`;
CREATE TABLE `wx_feedback`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'openid',
  `feedback` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '反馈内容',
  `role` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '角色',
  `contact` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '联系方式',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新者',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '反馈管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wx_user
-- ----------------------------
DROP TABLE IF EXISTS `wx_user`;
CREATE TABLE `wx_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'openid',
  `avatar_url` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '头像',
  `nick_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '昵称',
  `gender` int(0) NULL DEFAULT NULL COMMENT '性别',
  `country` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '国家',
  `province` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '城市',
  `language` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '语言',
  `delete_flag` int(0) NULL DEFAULT NULL COMMENT '是否删除',
  `disable_flag` int(0) NULL DEFAULT NULL COMMENT '是否禁用',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最近更新时间',
  `create_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新者',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `openid`(`openid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '微信用户表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
