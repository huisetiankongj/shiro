/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50136
Source Host           : localhost:3306
Source Database       : tianfang

Target Server Type    : MYSQL
Target Server Version : 50136
File Encoding         : 65001

Date: 2016-06-13 15:27:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for group_role
-- ----------------------------
DROP TABLE IF EXISTS `group_role`;
CREATE TABLE `group_role` (
  `groupId` varchar(32) DEFAULT NULL,
  `roleId` varchar(32) DEFAULT NULL,
  KEY `FK_Reference_3` (`groupId`),
  KEY `FK_Reference_4` (`roleId`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`groupId`) REFERENCES `usergroup` (`id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_role
-- ----------------------------

-- ----------------------------
-- Table structure for html
-- ----------------------------
DROP TABLE IF EXISTS `html`;
CREATE TABLE `html` (
  `id` varchar(32) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of html
-- ----------------------------

-- ----------------------------
-- Table structure for html_permit
-- ----------------------------
DROP TABLE IF EXISTS `html_permit`;
CREATE TABLE `html_permit` (
  `htmlId` varchar(32) DEFAULT NULL,
  `permitId` varchar(32) DEFAULT NULL,
  KEY `FK_Reference_10` (`htmlId`),
  KEY `FK_Reference_11` (`permitId`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`htmlId`) REFERENCES `html` (`id`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`permitId`) REFERENCES `permit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of html_permit
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` varchar(32) NOT NULL,
  `menuName` varchar(20) DEFAULT NULL,
  `url` varchar(80) DEFAULT NULL,
  `imgPath` varchar(100) DEFAULT NULL,
  `parentId` varchar(32) DEFAULT NULL,
  `parentIds` varchar(200) DEFAULT NULL,
  `pid` char(1) DEFAULT NULL,
  `orderNum` int(2) DEFAULT NULL,
  `isActive` char(1) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '系统管理', null, null, null, null, '0', '1', '1', null);
INSERT INTO `menu` VALUES ('101', '系统配置', 'baseData/sysConfigForm.do', null, ',1,', ',1,', '1', '1', '1', null);
INSERT INTO `menu` VALUES ('10101', '用户管理', 'baseData/usersList.do', null, ',101,', ',1,;,101,', '2', '1', '1', null);

-- ----------------------------
-- Table structure for permit
-- ----------------------------
DROP TABLE IF EXISTS `permit`;
CREATE TABLE `permit` (
  `id` varchar(32) NOT NULL,
  `permitType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permit
-- ----------------------------

-- ----------------------------
-- Table structure for permit_menu
-- ----------------------------
DROP TABLE IF EXISTS `permit_menu`;
CREATE TABLE `permit_menu` (
  `permitId` varchar(32) DEFAULT NULL,
  `menuId` varchar(32) DEFAULT NULL,
  KEY `FK_Reference_8` (`permitId`),
  KEY `FK_Reference_9` (`menuId`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`permitId`) REFERENCES `permit` (`id`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permit_menu
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` varchar(32) NOT NULL,
  `roleName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for role_permit
-- ----------------------------
DROP TABLE IF EXISTS `role_permit`;
CREATE TABLE `role_permit` (
  `permitId` varchar(32) DEFAULT NULL,
  `roleId` varchar(32) DEFAULT NULL,
  KEY `FK_Reference_12` (`roleId`),
  KEY `FK_Reference_13` (`permitId`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`permitId`) REFERENCES `permit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permit
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(32) NOT NULL,
  `loginuser` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INDEX_LOGINUSER` (`loginuser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'a123456', '421310742@qq.com', '15859445450');

-- ----------------------------
-- Table structure for usergroup
-- ----------------------------
DROP TABLE IF EXISTS `usergroup`;
CREATE TABLE `usergroup` (
  `id` varchar(32) NOT NULL,
  `groupName` varchar(20) DEFAULT NULL,
  `parentId` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usergroup
-- ----------------------------

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `userId` varchar(32) NOT NULL,
  `roleId` varchar(32) DEFAULT NULL,
  KEY `FK_Reference_5` (`userId`),
  KEY `FK_Reference_6` (`roleId`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------

-- ----------------------------
-- Table structure for user_usergroup
-- ----------------------------
DROP TABLE IF EXISTS `user_usergroup`;
CREATE TABLE `user_usergroup` (
  `groupId` varchar(32) NOT NULL,
  `userId` varchar(32) DEFAULT NULL,
  KEY `FK_Reference_1` (`userId`),
  KEY `FK_Reference_2` (`groupId`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`groupId`) REFERENCES `usergroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_usergroup
-- ----------------------------
