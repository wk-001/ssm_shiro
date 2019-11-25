/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : shiro

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 25/11/2019 22:34:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源 ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源名称,一般是中文名称(给人看的)',
  `permission` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源权限字符串,一般是 Shiro 默认的通配符表示(给人看的)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (1, '系统管理', '*:*');
INSERT INTO `resource` VALUES (2, '用户管理', 'user:*');
INSERT INTO `resource` VALUES (3, '用户添加', 'user:add');
INSERT INTO `resource` VALUES (4, '用户删除', 'user:delete');
INSERT INTO `resource` VALUES (5, '用户修改', 'user:update');
INSERT INTO `resource` VALUES (6, '用户查询', 'user:list');
INSERT INTO `resource` VALUES (7, '用户资源查询', 'user:resources:*');
INSERT INTO `resource` VALUES (8, '角色管理', 'role:*');
INSERT INTO `resource` VALUES (9, '角色添加', 'role:add');
INSERT INTO `resource` VALUES (10, '角色删除', 'role:delete');
INSERT INTO `resource` VALUES (11, '角色修改', 'role:update');
INSERT INTO `resource` VALUES (12, '角色查询', 'role:list');
INSERT INTO `resource` VALUES (13, '角色资源查询', 'role:resources:*');
INSERT INTO `resource` VALUES (14, '资源管理', 'resource:*');
INSERT INTO `resource` VALUES (15, '资源增加', 'resource:add');
INSERT INTO `resource` VALUES (16, '资源删除', 'resource:delete');
INSERT INTO `resource` VALUES (17, '资源修改', 'resource:update');
INSERT INTO `resource` VALUES (18, '资源查询', 'resource:list');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色表 ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '管理员', 'admin');
INSERT INTO `role` VALUES (2, '开发工程师', 'dev');
INSERT INTO `role` VALUES (3, '测试工程师', 'test');
INSERT INTO `role` VALUES (4, '文档工程师', 'doc');
INSERT INTO `role` VALUES (5, '查看角色', 'list');

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource`  (
  `role_id` int(11) NOT NULL COMMENT '角色 id',
  `resource_id` int(11) NOT NULL COMMENT '资源 id',
  PRIMARY KEY (`role_id`, `resource_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色资源关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES (1, 1);
INSERT INTO `role_resource` VALUES (1, 2);
INSERT INTO `role_resource` VALUES (1, 8);
INSERT INTO `role_resource` VALUES (1, 14);
INSERT INTO `role_resource` VALUES (2, 3);
INSERT INTO `role_resource` VALUES (2, 5);
INSERT INTO `role_resource` VALUES (2, 6);
INSERT INTO `role_resource` VALUES (2, 7);
INSERT INTO `role_resource` VALUES (2, 9);
INSERT INTO `role_resource` VALUES (2, 11);
INSERT INTO `role_resource` VALUES (2, 12);
INSERT INTO `role_resource` VALUES (2, 13);
INSERT INTO `role_resource` VALUES (2, 15);
INSERT INTO `role_resource` VALUES (2, 17);
INSERT INTO `role_resource` VALUES (2, 18);
INSERT INTO `role_resource` VALUES (3, 6);
INSERT INTO `role_resource` VALUES (3, 7);
INSERT INTO `role_resource` VALUES (3, 8);
INSERT INTO `role_resource` VALUES (3, 14);
INSERT INTO `role_resource` VALUES (4, 6);
INSERT INTO `role_resource` VALUES (4, 12);
INSERT INTO `role_resource` VALUES (4, 18);
INSERT INTO `role_resource` VALUES (5, 1);
INSERT INTO `role_resource` VALUES (5, 6);
INSERT INTO `role_resource` VALUES (5, 12);
INSERT INTO `role_resource` VALUES (5, 18);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名/登录名',
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加密盐',
  `create_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `status` int(1) DEFAULT NULL COMMENT '用户状态；1：有效；0：锁定',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1', 'f0a039e0b9501c7f79c72aa07c6fa03b', 'mQH/4pdRBsVOcqleEIY/1A==', '2019-09-11 15:43:01', 1);
INSERT INTO `user` VALUES (2, '2', 'f0a039e0b9501c7f79c72aa07c6fa03b', 'mQH/4pdRBsVOcqleEIY/1A==', '2019-09-11 15:43:01', 1);
INSERT INTO `user` VALUES (3, '3', 'f0a039e0b9501c7f79c72aa07c6fa03b', 'mQH/4pdRBsVOcqleEIY/1A==', '2019-09-11 15:43:01', 1);
INSERT INTO `user` VALUES (4, '4', 'f0a039e0b9501c7f79c72aa07c6fa03b', 'mQH/4pdRBsVOcqleEIY/1A==', '2019-09-11 15:43:01', 1);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1);
INSERT INTO `user_role` VALUES (2, 2);
INSERT INTO `user_role` VALUES (3, 3);
INSERT INTO `user_role` VALUES (4, 4);

SET FOREIGN_KEY_CHECKS = 1;
