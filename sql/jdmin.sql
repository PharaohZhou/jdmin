/*
 Navicat Premium Data Transfer

 Source Server         : zhou
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : jdmin

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 14/08/2020 12:14:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `parent_id` bigint(20) NOT NULL COMMENT '上级部门ID',
  `dept_name` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '部门名称',
  `order_num` double(20,0) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='部门表';

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `job_name` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '岗位名称',
  `enable` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT '0开启1关闭',
  `order_num` double(20,0) DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='岗位表';

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `username` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作用户',
  `operation` text COLLATE utf8mb4_bin COMMENT '操作内容',
  `time` decimal(11,0) DEFAULT NULL COMMENT '耗时',
  `method` text COLLATE utf8mb4_bin COMMENT '操作方法',
  `params` text COLLATE utf8mb4_bin COMMENT '方法参数',
  `ip` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者ip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `location` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作地点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for t_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE `t_login_log` (
  `username` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  `location` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '登录地点',
  `ip` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'IP地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='操作日志表';

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `parent_id` bigint(20) NOT NULL COMMENT '上级菜单id',
  `menu_name` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '菜单名称/按钮名称',
  `path` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '对应路由path',
  `component` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '对应路由组件component',
  `perms` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图标',
  `type` char(2) COLLATE utf8mb4_bin NOT NULL COMMENT '类型 0菜单 1按钮',
  `order_num` double(20,0) DEFAULT NULL COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='菜单表';

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
  `remark` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色表';

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(50) COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `password` varchar(128) COLLATE utf8mb4_bin NOT NULL COMMENT '密码',
  `avatar` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户头像',
  `sex` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '性别 0男 1女 2保密',
  `nike_name` varchar(50) COLLATE utf8mb4_bin DEFAULT '默认昵称' COMMENT '昵称',
  `phone` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户电话',
  `status` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT '0锁定 1有效',
  `email` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮箱',
  `last_login_time` datetime DEFAULT NULL COMMENT '最近登录时间',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `job_id` bigint(20) DEFAULT NULL COMMENT '岗位id',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户表';

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户角色关联表';

SET FOREIGN_KEY_CHECKS = 1;
