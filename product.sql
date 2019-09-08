/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50135
Source Host           : localhost:3306
Source Database       : product

Target Server Type    : MYSQL
Target Server Version : 50135
File Encoding         : 65001

Date: 2019-09-08 13:15:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for emp
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `ephoto` varchar(255) DEFAULT NULL,
  `ename` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES ('1', 'emp1.png', '张三', '2019-07-26', '北京', '12313');
INSERT INTO `emp` VALUES ('2', 'emp2.png', '李四', '2019-07-17', '上海', '1313');

-- ----------------------------
-- Table structure for nicedetail
-- ----------------------------
DROP TABLE IF EXISTS `nicedetail`;
CREATE TABLE `nicedetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `nice` tinyint(4) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nicedetail
-- ----------------------------
INSERT INTO `nicedetail` VALUES ('10', '1', '1', '2019-08-31 14:46:11');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `pnum` int(11) DEFAULT NULL,
  `pstatus` varchar(255) DEFAULT NULL,
  `pdescribe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '家具', '12.00', '1148', 'da', 'das');
INSERT INTO `product` VALUES ('2', '日用品', '13.00', '1', 'daq', 'aa');
INSERT INTO `product` VALUES ('3', '饮料', '14.00', '1', 'pp', 'pp');
INSERT INTO `product` VALUES ('4', '零食', '13.00', '4000', 'oo', 'oo');
INSERT INTO `product` VALUES ('5', '文具', '14.00', '2000', 'ii', 'ii');

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `caozuo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('1', '家具', '13', '2019-07-31', '进货');
INSERT INTO `record` VALUES ('2', '日用品', '33', '2019-07-31', '进货');
INSERT INTO `record` VALUES ('3', '家具', '10', '2019-08-05', '进货');
INSERT INTO `record` VALUES ('4', '好吃', '10', '2019-08-06', '进货');
INSERT INTO `record` VALUES ('6', '饮料', '10', '2019-08-06', '进货');
INSERT INTO `record` VALUES ('7', '饮料', '33', '2019-08-06', '进货');
INSERT INTO `record` VALUES ('8', '家具', '10', '2019-08-06', '进货');

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `sales_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `yuefen` int(11) DEFAULT NULL,
  PRIMARY KEY (`sales_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sales
-- ----------------------------
INSERT INTO `sales` VALUES ('1', '1', '1', '200', '1');
INSERT INTO `sales` VALUES ('2', '2', '1', '200', '1');
INSERT INTO `sales` VALUES ('3', '1', '1', '1000', '3');
INSERT INTO `sales` VALUES ('4', '1', '3', '2000', '3');
INSERT INTO `sales` VALUES ('5', '3', '3', '200', '4');

-- ----------------------------
-- Table structure for umessage
-- ----------------------------
DROP TABLE IF EXISTS `umessage`;
CREATE TABLE `umessage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `advice` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of umessage
-- ----------------------------
INSERT INTO `umessage` VALUES ('5', '1', 'da', 'da', 'da', '2019-08-31 00:35:53');
INSERT INTO `umessage` VALUES ('6', '1', '测试', '测试', '测试3', '2019-08-31 00:49:46');
INSERT INTO `umessage` VALUES ('26', '1', 'q', 'dadq', 'dada', '2019-09-01 00:41:13');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456', 'images/106a689d-ea5a-41c6-85ff-936ed83a358d.jpg');
INSERT INTO `user` VALUES ('2', 'admin1', '123456', 'images/user2.jpg');
