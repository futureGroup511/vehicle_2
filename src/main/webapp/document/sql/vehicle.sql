/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : vehicle

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 07/10/2017 21:03:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_dict
-- ----------------------------
DROP TABLE IF EXISTS `base_dict`;
CREATE TABLE `base_dict`  (
  `dict_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据字典id(主键)',
  `dict_type_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据字典类别代码',
  `dict_type_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据字典类别名称',
  `dict_item_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据字典项目名称',
  `dict_item_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '数据字典项目(可为空)',
  `dict_sort` int(10) DEFAULT NULL COMMENT '排序字段',
  `dict_enable` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '1:使用 0:停用',
  `dict_memo` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_dict
-- ----------------------------
INSERT INTO `base_dict` VALUES ('10', '002', '车辆状态', '备案中', NULL, 10, '2', NULL);
INSERT INTO `base_dict` VALUES ('11', '003', '查询状态', '不能查询', NULL, 11, '3', NULL);
INSERT INTO `base_dict` VALUES ('12', '003', '查询状态', '可以查询', NULL, 12, '3', NULL);
INSERT INTO `base_dict` VALUES ('8', '002', '车辆状态', '备案失败', NULL, 8, '2', NULL);
INSERT INTO `base_dict` VALUES ('9', '002', '车辆状态  ', '备案成功 ', NULL, 9, '2', NULL);

-- ----------------------------
-- Table structure for maintains
-- ----------------------------
DROP TABLE IF EXISTS `maintains`;
CREATE TABLE `maintains`  (
  `MAINTAIN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `USER_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `VEHICLE_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PLATE_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `USER_PHONE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `USERS_ID` int(11) DEFAULT NULL,
  `DATE` datetime(0) DEFAULT NULL,
  `JUDGE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `OPERATION_STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`MAINTAIN_ID`) USING BTREE,
  INDEX `FK1jy6yab6j854j5ybmb1dmbnaw`(`JUDGE`) USING BTREE,
  INDEX `FKasr1ohspt77lw74vi7ta4bp74`(`OPERATION_STATUS`) USING BTREE,
  CONSTRAINT `FK1jy6yab6j854j5ybmb1dmbnaw` FOREIGN KEY (`JUDGE`) REFERENCES `base_dict` (`dict_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKasr1ohspt77lw74vi7ta4bp74` FOREIGN KEY (`OPERATION_STATUS`) REFERENCES `base_dict` (`dict_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKcvv6f5423l53v9yprf2r94s4b` FOREIGN KEY (`JUDGE`) REFERENCES `base_dict` (`dict_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKj6wytoa8ylv89rhg7tq45e4l6` FOREIGN KEY (`OPERATION_STATUS`) REFERENCES `base_dict` (`dict_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of maintains
-- ----------------------------
INSERT INTO `maintains` VALUES (1, '客运', '谢亚飞', '00001', '豫G2000U', '15837337963', 10, '2017-10-06 11:00:01', '11', '9');
INSERT INTO `maintains` VALUES (2, '货车', '谢亚飞', '00001', '豫G2000U', '15837337963', 10, '2017-10-06 11:15:40', '11', '9');
INSERT INTO `maintains` VALUES (3, '货运', 'jerry', '00009', '豫G1234U', '18336069295', 1, '2017-10-06 17:12:34', '11', '9');
INSERT INTO `maintains` VALUES (4, '货车', '谢亚飞', '00001', '豫G2000U', '15837337963', 10, '2017-10-07 11:28:09', '12', '10');
INSERT INTO `maintains` VALUES (5, '货车', '谢亚飞', '00001', '豫G2000U', '15837337963', 10, '2017-10-07 11:28:27', '12', '10');
INSERT INTO `maintains` VALUES (6, '货运', 'jerry', '00007', '豫G1234U', '18336069295', 1, '2017-10-07 18:45:38', '11', '9');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `USERS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ADDRESS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PHONE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ROLE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DATE` datetime(0) DEFAULT NULL,
  `VEHICLES_NUMBER` int(11) DEFAULT NULL,
  `MAINTAINS_NUMBER` int(11) DEFAULT NULL,
  `JUDGE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`USERS_ID`) USING BTREE,
  INDEX `FKcsvwk3cq05rs77foegt9kvq4a`(`JUDGE`) USING BTREE,
  CONSTRAINT `FK5vc4mk0pckb2cbccq0fkw70gf` FOREIGN KEY (`JUDGE`) REFERENCES `base_dict` (`dict_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKcsvwk3cq05rs77foegt9kvq4a` FOREIGN KEY (`JUDGE`) REFERENCES `base_dict` (`dict_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '1234', 'c20ad4d76fe97759aa27a0c99bff6710', 'jerry', 'hky', '18336069295', 'admin', '2017-10-05 09:29:36', 6, 2, '11');
INSERT INTO `users` VALUES (3, '123', 'c20ad4d76fe97759aa27a0c99bff6710', '12', 'hky', '13137740549', 'admin', '2017-10-05 10:14:09', NULL, NULL, '12');
INSERT INTO `users` VALUES (5, 'zxzxc', 'c20ad4d76fe97759aa27a0c99bff6710', '121', '121', '15537364889', 'admin', '2017-10-05 11:31:43', NULL, NULL, '12');
INSERT INTO `users` VALUES (6, 'xzzxc', 'afdd0b4ad2ec172c586e2150770fbf9e', '12121', '56', '15837337963', 'admin', '2017-10-05 11:33:39', NULL, NULL, '12');
INSERT INTO `users` VALUES (7, '123456', '6c8349cc7260ae62e3b1396831a8398f', '12', '566', '15537364889', 'admin', '2017-10-05 11:37:59', NULL, NULL, '12');
INSERT INTO `users` VALUES (8, '21465', 'c20ad4d76fe97759aa27a0c99bff6710', '12', '56', '15837337963', 'admin', '2017-10-05 11:38:35', NULL, NULL, '12');
INSERT INTO `users` VALUES (9, '121', '4c56ff4ce4aaf9573aa5dff913df997a', '121', '121', '13137740549', 'admin', '2017-10-05 15:08:55', NULL, NULL, '12');
INSERT INTO `users` VALUES (10, 'gclm', '2cc53441ac560f44444fd5e361c41362', '谢亚飞', 'hky', '15837337963', 'administrator', '2017-10-05 19:32:15', 3, 6, '12');
INSERT INTO `users` VALUES (11, 'ASDASD', 'afdd0b4ad2ec172c586e2150770fbf9e', '121', '121', '15646543254', 'administrator', '2017-10-05 21:30:33', NULL, NULL, '12');
INSERT INTO `users` VALUES (12, 'alj', 'e43dea77695e2871a36ee31f1ea533cd', '安李杰', '4566', '18945612312', 'admin', '2017-10-06 08:54:06', NULL, NULL, '12');
INSERT INTO `users` VALUES (13, '656565', 'afdd0b4ad2ec172c586e2150770fbf9e', '56645', 'DFG', '18336069295', 'admin', '2017-10-06 10:22:55', NULL, NULL, '12');
INSERT INTO `users` VALUES (14, '865465', 'afdd0b4ad2ec172c586e2150770fbf9e', '6565', '客家话', '18336069295', 'admin', '2017-10-06 10:23:16', NULL, NULL, '12');
INSERT INTO `users` VALUES (15, '12121212121asdasd', '988107799b07e29ceac10dc9adb42915', 'zxc', '121', '15837337963', 'admin', '2017-10-06 15:57:11', NULL, NULL, '12');
INSERT INTO `users` VALUES (16, 'admin', 'e64b78fc3bc91bcbc7dc232ba8ec59e0', '未来', 'hky', '15837337963', 'admin', '2017-10-06 17:08:32', NULL, NULL, '12');
INSERT INTO `users` VALUES (17, 'qwe', '6c3baa8a7c8355e495c351c1bb589902', 'ewe', 'ew', '15646543254', 'admin', '2017-10-06 20:58:11', NULL, NULL, '12');
INSERT INTO `users` VALUES (18, 'fgh', '220b76aefdcff1bae4ee9bc1d59d9cd5', 'v ', 'c', '15837337963', 'admin', '2017-10-06 20:59:32', NULL, NULL, '12');
INSERT INTO `users` VALUES (19, '12121', '7fe4fc547319a1667a41a9c0121f82c0', '问问', '问问', '18945612312', 'admin', '2017-10-06 21:13:59', NULL, NULL, '12');

-- ----------------------------
-- Table structure for vehicles
-- ----------------------------
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles`  (
  `VEHICLE_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PLATE_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MODEL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ENGINE_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CAR_CHASSIS_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MANU_FACTURE_DATE` datetime(0) DEFAULT NULL,
  `CATEGORY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `WEIGHT` double DEFAULT NULL,
  `DATE` datetime(0) DEFAULT NULL,
  `USERS_ID` int(11) DEFAULT NULL,
  `USERS_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MAINTAIN_NUMBER` int(11) DEFAULT NULL,
  `OPERATION_STATUS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JUDGE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`VEHICLE_ID`) USING BTREE,
  INDEX `FKd26a9x9wpxe8ov5122abn8u8g`(`OPERATION_STATUS`) USING BTREE,
  INDEX `FKmkeooh6uluigwd4r8vlu7yaff`(`JUDGE`) USING BTREE,
  CONSTRAINT `FKd26a9x9wpxe8ov5122abn8u8g` FOREIGN KEY (`OPERATION_STATUS`) REFERENCES `base_dict` (`dict_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKf3dxu3j6ewqotv7tmo659lbfw` FOREIGN KEY (`OPERATION_STATUS`) REFERENCES `base_dict` (`dict_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKmkeooh6uluigwd4r8vlu7yaff` FOREIGN KEY (`JUDGE`) REFERENCES `base_dict` (`dict_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKtqmrfyld6xlqbef9t02xaokhu` FOREIGN KEY (`JUDGE`) REFERENCES `base_dict` (`dict_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vehicles
-- ----------------------------
INSERT INTO `vehicles` VALUES ('00001', '豫G2000U', '12', '12', '1212121', '2017-10-04 19:32:37', '货运', 12, '2017-10-25 19:33:15', 10, '谢亚飞', 2, '9', '12');
INSERT INTO `vehicles` VALUES ('00002', '豫G6200U', '121', '12', '1320121212', '2017-10-11 19:35:03', '货运', 12, '2017-10-25 19:35:07', 10, '谢亚飞', NULL, '9', '12');
INSERT INTO `vehicles` VALUES ('00003', '豫G7200U', '121', '121', '12121212', '2017-10-19 22:12:22', '货运', 121, '2018-02-02 22:12:29', 1, 'jerry', NULL, '9', '12');
INSERT INTO `vehicles` VALUES ('00004', '豫G2300U', '12121', '121', '131', '2017-10-27 22:31:23', '货运', 121, '2018-02-03 09:11:17', 1, 'jerry', NULL, '9', '12');
INSERT INTO `vehicles` VALUES ('00005', '豫G5200U', '121', '12121', '121', '2017-10-20 22:42:27', '货运', 121, '2018-02-02 22:42:33', 10, '谢亚飞', NULL, '9', '12');
INSERT INTO `vehicles` VALUES ('00006', '豫G2100U', '1212', '1212', '1212', '2017-10-26 08:24:33', '货运', 121, '2018-02-03 08:24:37', 1, 'jerry', NULL, '10', '12');
INSERT INTO `vehicles` VALUES ('00007', '豫G5100U', '1212', '1212', '1212', '2017-10-20 08:47:35', '货运', 1212, '2018-02-03 08:47:44', 1, 'jerry', 1, '9', '12');
INSERT INTO `vehicles` VALUES ('00008', '豫G2210U', '1212', '1212', '1212', '2017-10-12 08:51:58', '货运', 121, '2018-02-03 08:52:32', 1, 'jerry', NULL, '9', '12');
INSERT INTO `vehicles` VALUES ('00009', '豫G1234U', '545454', '1212', '1212', '2017-10-28 17:11:10', '货运', 121, '2018-02-03 17:11:15', 1, 'jerry', 1, '9', '11');

SET FOREIGN_KEY_CHECKS = 1;
