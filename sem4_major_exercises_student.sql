/*
 Navicat Premium Data Transfer

 Source Server         : DBLocal
 Source Server Type    : MySQL
 Source Server Version : 100134
 Source Host           : localhost:3306
 Source Schema         : sem4_major_exercises_student

 Target Server Type    : MySQL
 Target Server Version : 100134
 File Encoding         : 65001

 Date: 28/03/2020 09:05:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`  (
  `next_val` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES (1);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `birth_day` timestamp(0) NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 'FD343FF233', 'Dang Phong 3', '2019-05-23 00:00:00', '0974541523', 'phongnhao3@gmail.com', 'Dich Vong Ward- Cau Giay 3', 'upload/FDFDFDF_2013-Mercedes-Benz-G63-AMG-6x6-Show-Car-Side-Driving.jpg');
INSERT INTO `student` VALUES (2, 'FD343gfFF', 'Dang 1 Phong', '2019-05-22 00:00:00', '0965245844', 'gocmam16@gmail.com', 'VCC', 'upload/FDFDFDF_2013-Mercedes-Benz-G63-AMG-6x6-Show-Car-Side-Driving.jpg');
INSERT INTO `student` VALUES (3, 'FD346te43FF', 'Dang ', '2019-05-22 00:00:00', '0974002514', 'thuy@gmao.vn', 'Kien str - Dich Von', 'upload/FDFDFDF_2013-Mercedes-Benz-G63-AMG-6x6-Show-Car-Side-Driving.jpg');
INSERT INTO `student` VALUES (4, 'FD43ef343FF', 'Dang Phong 4', '2019-05-22 00:00:00', '0983691189', 'hongnhao1@gmail.com', 'Dich Vong Ward- Cau Giay District', 'upload/FDFDFDF_2013-Mercedes-Benz-G63-AMG-6x6-Show-Car-Side-Driving.jpg');
INSERT INTO `student` VALUES (18, 'H764T844321', 'Ngọc Phong', '1989-11-19 00:00:00', '0974541524', 'phongnhao1@gmail.com', 'NGuy nhu Kontum', 'upload/WFSDSDSD_09bmwx6_red_front.jpg');
INSERT INTO `student` VALUES (21, 'DV12', 'Lâm nhố iu Bì', '2016-02-17 00:00:00', '0965245844', 'gocmam16@gmail.com', 'Quy Kien str - Dic', 'upload/JHDKNFHJD&_bmw-x6xdrive35d.jpg');
INSERT INTO `student` VALUES (24, 'HNGJN', 'Thuy', '1999-01-11 00:00:00', '0974002514', 'thuy@gmao.vn', 'Cau Giay District', 'upload/FDFDFDF_2013-Mercedes-Benz-G63-AMG-6x6-Show-Car-Side-Driving.jpg');
INSERT INTO `student` VALUES (26, 'FDFDFDF', 'Dang Phong', '2019-05-22 00:00:00', '02145856256', 'phongnhao1@gmail.com', 'TB', 'upload/FDFDFDF_2013-Mercedes-Benz-G63-AMG-6x6-Show-Car-Side-Driving.jpg');
INSERT INTO `student` VALUES (27, 'WFSDSDSD', 'Dang Phong', '2018-11-16 00:00:00', '02141256256', 'gocmam16@gmail.com', 'Dich Vong Ward- Cau Giay ', 'upload/WFSDSDSD_09bmwx6_red_front.jpg');
INSERT INTO `student` VALUES (28, 'JHDKNFHJD&', 'Đặng Ngọc', '1999-06-24 00:00:00', '0983691189', 'thuy@gmao.vn', 'VCC', 'upload/JHDKNFHJD&_bmw-x6xdrive35d.jpg');
INSERT INTO `student` VALUES (29, 'FDFD343FDF', 'Dang Phong', '2019-05-22 00:00:00', '0965245844', 'thuy@gmao.vho', 'Kien str - Dich Von', 'upload/FDFDFDF_2013-Mercedes-Benz-G63-AMG-6x6-Show-Car-Side-Driving.jpg');
INSERT INTO `student` VALUES (30, 'FDFD343FDF3', 'Dang Phong2', '2019-05-22 00:00:00', '0974002514', 'phongnhao1@gmail.com', 'Dich Vong Ward- Cau Giay District', 'upload/FDFDFDF_2013-Mercedes-Benz-G63-AMG-6x6-Show-Car-Side-Driving.jpg');
INSERT INTO `student` VALUES (31, 'FD343FF', 'Dang Phong', '2019-05-22 00:00:00', '02145856256', 'gocmam16@gmail.com', 'NGuy nhu Kontum', 'upload/FDFDFDF_2013-Mercedes-Benz-G63-AMG-6x6-Show-Car-Side-Driving.jpg');
INSERT INTO `student` VALUES (32, 'FD3463FF', 'Dang 6', '2019-05-22 00:00:00', '0984741189', 'thuy@gmao.vn', 'Quy Kien str - Dic', 'upload/FDFDFDF_2013-Mercedes-Benz-G63-AMG-6x6-Show-Car-Side-Driving.jpg');
INSERT INTO `student` VALUES (33, 'FD343FF9', 'Dang Phong9', '2019-05-22 00:00:00', '0214586256', 'hongnhao1@gmail.com', 'Cau Giay District', 'upload/FDFDFDF_2013-Mercedes-Benz-G63-AMG-6x6-Show-Car-Side-Driving.jpg');
INSERT INTO `student` VALUES (35, 'HFGHGNF', 'Quan', '1999-01-11 00:00:00', '02145856256', 'phongnhao1@gmail.com', 'TB', 'upload/WFSDSDSD_09bmwx6_red_front.jpg');
INSERT INTO `student` VALUES (37, 'HFGHG3NF', 'Hoa', '2019-05-22 00:00:00', '02141256256', 'gocmam16@gmail.com', 'TB', 'upload/JHDKNFHJD&_bmw-x6xdrive35d.jpg');
INSERT INTO `student` VALUES (38, 'HOLPNF', 'Hoan', '1989-11-19 00:00:00', '02141289256', 'thuy@gmao.vn', 'TH', 'upload/FDFDFDF_2013-Mercedes-Benz-G63-AMG-6x6-Show-Car-Side-Driving.jpg');
INSERT INTO `student` VALUES (39, 'gjndhg', 'lam chui', '2012-02-29 00:00:00', '5322656232', 'emailtest@gj.vn', 'address test', 'upload/gjndhg_photo_2019-08-01_10-23-29.jpg');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'B1B8B320E54AF24B5A498EE2F41A23674A08A476EBB01C4FA4D6A33A4A0C4AB6', 'admin');

SET FOREIGN_KEY_CHECKS = 1;
