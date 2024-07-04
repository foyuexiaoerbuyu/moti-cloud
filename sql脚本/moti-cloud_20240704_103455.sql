/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : moti-cloud

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 04/07/2024 10:34:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for file_folder
-- ----------------------------
DROP TABLE IF EXISTS `file_folder`;
CREATE TABLE `file_folder`
(
    `file_folder_id`   int                                                           NOT NULL AUTO_INCREMENT COMMENT '文件夹ID',
    `file_folder_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件夹名称',
    `parent_folder_id` int                                                           NULL DEFAULT 0 COMMENT '父文件夹ID',
    `file_store_id`    int                                                           NULL DEFAULT NULL COMMENT '所属文件仓库ID',
    `time`             datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`file_folder_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_folder
-- ----------------------------

-- ----------------------------
-- Table structure for file_store
-- ----------------------------
DROP TABLE IF EXISTS `file_store`;
CREATE TABLE `file_store`
(
    `file_store_id` int NOT NULL AUTO_INCREMENT COMMENT '文件仓库ID',
    `user_id`       int NULL DEFAULT NULL COMMENT '主人ID',
    `current_size`  int NULL DEFAULT 0 COMMENT '当前容量（单位KB）',
    `max_size`      int NULL DEFAULT 1048576 COMMENT '最大容量（单位KB）',
    `permission`    int NULL DEFAULT 0 COMMENT '仓库权限，0可上传下载、1不允许上传可以下载、2不可以上传下载',
    PRIMARY KEY (`file_store_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_store
-- ----------------------------
INSERT INTO `file_store`
VALUES (1, 2, 0, 104857600, 0);

-- ----------------------------
-- Table structure for my_file
-- ----------------------------
DROP TABLE IF EXISTS `my_file`;
CREATE TABLE `my_file`
(
    `my_file_id`       int                                                           NOT NULL AUTO_INCREMENT COMMENT '文件ID',
    `my_file_name`     varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件名',
    `file_store_id`    int                                                           NULL DEFAULT NULL COMMENT '文件仓库ID',
    `my_file_path`     varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '/' COMMENT '文件存储路径',
    `download_time`    int                                                           NULL DEFAULT 0 COMMENT '下载次数',
    `upload_time`      datetime                                                      NULL DEFAULT NULL COMMENT '上传时间',
    `parent_folder_id` int                                                           NULL DEFAULT NULL COMMENT '父文件夹ID',
    `size`             int                                                           NULL DEFAULT NULL COMMENT '文件大小',
    `type`             int                                                           NULL DEFAULT NULL COMMENT '文件类型',
    `postfix`          varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件后缀',
    PRIMARY KEY (`my_file_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of my_file
-- ----------------------------

-- ----------------------------
-- Table structure for temp_file
-- ----------------------------
DROP TABLE IF EXISTS `temp_file`;
CREATE TABLE `temp_file`
(
    `file_id`     int                                                           NOT NULL AUTO_INCREMENT COMMENT '临时文件ID',
    `file_name`   varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件名',
    `size`        varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件大小',
    `upload_time` datetime                                                      NULL DEFAULT NULL COMMENT '上传时间：4小时后删除',
    `file_path`   varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件在FTP上的存放路径',
    PRIMARY KEY (`file_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of temp_file
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `user_id`       int UNSIGNED                                                  NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `open_id`       varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户的openid',
    `file_store_id` int                                                           NULL DEFAULT NULL COMMENT '文件仓库ID',
    `user_name`     varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci  NULL DEFAULT NULL COMMENT '用户名',
    `email`         varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci  NULL DEFAULT '	0000@qq.com' COMMENT '用户邮箱',
    `password`      varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci  NULL DEFAULT NULL COMMENT '密码',
    `register_time` datetime                                                      NULL DEFAULT NULL COMMENT '注册时间',
    `image_path`    varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '头像地址',
    `role`          int                                                           NULL DEFAULT 1 COMMENT '用户角色,0管理员，1普通用户',
    PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user`
VALUES (2, NULL, 1, 'admin', '1950053842@qq.com', 'admin', '2024-07-04 08:36:05',
        'https://p.qpic.cn/qqconnect/0/app_101851241_1582451550/100?max-age=2592000&t=0', 1);

SET FOREIGN_KEY_CHECKS = 1;
