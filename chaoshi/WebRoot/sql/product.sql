/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50135
Source Host           : localhost:3306
Source Database       : product

Target Server Type    : MYSQL
Target Server Version : 50135
File Encoding         : 65001

Date: 2019-08-26 14:55:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for emp
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES ('1', '张三', '2019-07-26', '北京', '12313');
INSERT INTO `emp` VALUES ('2', '李四', '2019-07-17', '上海', '1313');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '家具', '12.00', '1138', 'da', 'das');
INSERT INTO `product` VALUES ('2', '日用品', '13.00', '1', 'daq', 'aa');
INSERT INTO `product` VALUES ('3', '饮料', '14.00', '1', 'pp', 'pp');
INSERT INTO `product` VALUES ('4', '零食', '13.00', '4000', 'oo', 'oo');
INSERT INTO `product` VALUES ('5', '文具', '14.00', '2000', 'ii', 'ii');
INSERT INTO `product` VALUES ('9', 'xixi', '12.00', '111', 'aa', 'dd');
INSERT INTO `product` VALUES ('12', '呵呵', '12.00', '111', 'dd', 'dd');

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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('1', '家具', '13', '2019-07-31', '进货');
INSERT INTO `record` VALUES ('2', '日用品', '33', '2019-07-31', '进货');
INSERT INTO `record` VALUES ('3', '家具', '10', '2019-08-05', '进货');
INSERT INTO `record` VALUES ('4', '好吃', '10', '2019-08-06', '进货');
INSERT INTO `record` VALUES ('5', 'daad', '13', '2019-08-06', '进货');
INSERT INTO `record` VALUES ('6', '饮料', '10', '2019-08-06', '进货');
INSERT INTO `record` VALUES ('7', '饮料', '33', '2019-08-06', '进货');
INSERT INTO `record` VALUES ('8', '家具', '10', '2019-08-06', '进货');
INSERT INTO `record` VALUES ('9', 'dadqq', '10', '2019-08-06', '进货');
INSERT INTO `record` VALUES ('10', 'dada', '10', '2019-08-06', '进货');
INSERT INTO `record` VALUES ('11', '零食', '2000', '2019-08-06', '进货');
INSERT INTO `record` VALUES ('12', '饮料', '33', '2019-08-06', '进货');
INSERT INTO `record` VALUES ('13', '日用品', '1000', '2019-08-06', '进货');
INSERT INTO `record` VALUES ('14', '家具', '273', '2019-08-17', '退货');
INSERT INTO `record` VALUES ('15', '家具', null, null, null);
INSERT INTO `record` VALUES ('16', '日用品', '13', null, null);
INSERT INTO `record` VALUES ('17', '家具', '10', '2019-08-17', '进货');
INSERT INTO `record` VALUES ('18', '家具', '10', '2019-08-17', '进货');
INSERT INTO `record` VALUES ('19', '家具', '140', '2019-08-17', '退货');
INSERT INTO `record` VALUES ('20', '家具', '10', '2019-08-17', '进货');
INSERT INTO `record` VALUES ('21', '家具', '10', '2019-08-17', '进货');
INSERT INTO `record` VALUES ('22', '家具', '10', '2019-08-17', '进货');
INSERT INTO `record` VALUES ('23', '家具', '10', '2019-08-17', '进货');
INSERT INTO `record` VALUES ('24', '家具', '10', '2019-08-17', '进货');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sales
-- ----------------------------
INSERT INTO `sales` VALUES ('1', '1', '1', '200', '1');
INSERT INTO `sales` VALUES ('2', '2', '1', '200', '1');
INSERT INTO `sales` VALUES ('3', '1', '1', '1000', '3');
INSERT INTO `sales` VALUES ('4', '1', '3', '2000', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456', 'images/photo1.png');
INSERT INTO `user` VALUES ('2', 'admin1', '123456', null);
