/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : zsdb

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2017-06-23 16:51:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `login_name` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', 'admin', 'admin', '12345');
INSERT INTO `employee` VALUES ('2', '组长张', 'zuzhang', '12345');
INSERT INTO `employee` VALUES ('3', '回收刘', 'huishouliu', '12345');
INSERT INTO `employee` VALUES ('4', '清洗李', 'qingxili', '12345');
INSERT INTO `employee` VALUES ('5', '消毒王', 'xiaoduwang', '12345');
INSERT INTO `employee` VALUES ('6', '科长钱', 'kezhangqian', '12345');

-- ----------------------------
-- Table structure for emp_role
-- ----------------------------
DROP TABLE IF EXISTS `emp_role`;
CREATE TABLE `emp_role` (
  `empId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_role
-- ----------------------------
INSERT INTO `emp_role` VALUES ('1', '6');
INSERT INTO `emp_role` VALUES ('2', '2');
INSERT INTO `emp_role` VALUES ('3', '3');
INSERT INTO `emp_role` VALUES ('4', '4');
INSERT INTO `emp_role` VALUES ('5', '5');
INSERT INTO `emp_role` VALUES ('6', '1');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', '0', '回收', 'module:huishou', '0');
INSERT INTO `resource` VALUES ('2', '0', '配包', 'module:peibao', '0');
INSERT INTO `resource` VALUES ('3', '0', '入库', 'module:ruku', '0');
INSERT INTO `resource` VALUES ('4', '0', '清洗', 'module:clean', '0');
INSERT INTO `resource` VALUES ('5', '0', '灭菌', 'module:miejun', '0');
INSERT INTO `resource` VALUES ('6', '0', '发放', 'module:fasong', '0');
INSERT INTO `resource` VALUES ('7', '0', '清洗审核', 'module:clean:shenhe', '0');
INSERT INTO `resource` VALUES ('8', '0', '灭菌审核', 'module:miejun:shenhe', '0');
INSERT INTO `resource` VALUES ('9', '0', '工单汇总', 'module:gongdan:huizong', '0');
INSERT INTO `resource` VALUES ('10', '0', '手术排班记录', 'module:shoushupaiban', '0');
INSERT INTO `resource` VALUES ('11', '0', '通告管理', 'module:tongzhi', '0');
INSERT INTO `resource` VALUES ('12', '0', '系统设置', 'module:setting', '0');
INSERT INTO `resource` VALUES ('13', '0', '追溯', 'module:zhuisu', '0');
INSERT INTO `resource` VALUES ('14', '0', '成本核算', 'module:chengben', '0');
INSERT INTO `resource` VALUES ('15', '0', '异常处理', 'module:warning', '0');
INSERT INTO `resource` VALUES ('16', '0', '清洗统计', 'module:clean:tongji', '0');
INSERT INTO `resource` VALUES ('17', '0', '统计报表', 'module:excel', '0');
INSERT INTO `resource` VALUES ('18', '0', '包监控', 'module:bao:jiankong', '0');
INSERT INTO `resource` VALUES ('19', '0', '灭菌统计', 'module:miejun:tongji', '0');
INSERT INTO `resource` VALUES ('20', '0', '清洗审核', 'module:clean:audit', '0');
INSERT INTO `resource` VALUES ('21', null, '员工查询', 'employee:list', null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'deper', '供应室科长');
INSERT INTO `role` VALUES ('2', 'zuzhanger', '组长');
INSERT INTO `role` VALUES ('3', 'huishouer', '回收负责人');
INSERT INTO `role` VALUES ('4', 'qingxisher', '清洗负责人');
INSERT INTO `role` VALUES ('5', 'xiaoduer', '消毒负责人');
INSERT INTO `role` VALUES ('6', 'admin', '系统管理员');

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `roleId` int(11) NOT NULL,
  `resourceId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES ('1', '1');
INSERT INTO `role_resource` VALUES ('1', '2');
INSERT INTO `role_resource` VALUES ('1', '3');
INSERT INTO `role_resource` VALUES ('1', '4');
INSERT INTO `role_resource` VALUES ('1', '5');
INSERT INTO `role_resource` VALUES ('1', '6');
INSERT INTO `role_resource` VALUES ('1', '7');
INSERT INTO `role_resource` VALUES ('1', '8');
INSERT INTO `role_resource` VALUES ('1', '9');
INSERT INTO `role_resource` VALUES ('1', '10');
INSERT INTO `role_resource` VALUES ('1', '11');
INSERT INTO `role_resource` VALUES ('1', '12');
INSERT INTO `role_resource` VALUES ('1', '13');
INSERT INTO `role_resource` VALUES ('1', '14');
INSERT INTO `role_resource` VALUES ('1', '15');
INSERT INTO `role_resource` VALUES ('1', '16');
INSERT INTO `role_resource` VALUES ('1', '17');
INSERT INTO `role_resource` VALUES ('1', '18');
INSERT INTO `role_resource` VALUES ('1', '19');
INSERT INTO `role_resource` VALUES ('1', '20');
INSERT INTO `role_resource` VALUES ('2', '4');
INSERT INTO `role_resource` VALUES ('2', '7');
INSERT INTO `role_resource` VALUES ('2', '16');
INSERT INTO `role_resource` VALUES ('3', '1');
INSERT INTO `role_resource` VALUES ('4', '4');
INSERT INTO `role_resource` VALUES ('5', '5');
INSERT INTO `role_resource` VALUES ('6', '1');
INSERT INTO `role_resource` VALUES ('6', '2');
INSERT INTO `role_resource` VALUES ('6', '3');
INSERT INTO `role_resource` VALUES ('6', '4');
INSERT INTO `role_resource` VALUES ('6', '5');
INSERT INTO `role_resource` VALUES ('6', '6');
INSERT INTO `role_resource` VALUES ('6', '7');
INSERT INTO `role_resource` VALUES ('6', '8');
INSERT INTO `role_resource` VALUES ('6', '9');
INSERT INTO `role_resource` VALUES ('6', '10');
INSERT INTO `role_resource` VALUES ('6', '11');
INSERT INTO `role_resource` VALUES ('6', '12');
INSERT INTO `role_resource` VALUES ('6', '13');
INSERT INTO `role_resource` VALUES ('6', '14');
INSERT INTO `role_resource` VALUES ('6', '15');
INSERT INTO `role_resource` VALUES ('6', '16');
INSERT INTO `role_resource` VALUES ('6', '17');
INSERT INTO `role_resource` VALUES ('6', '18');
INSERT INTO `role_resource` VALUES ('6', '19');
INSERT INTO `role_resource` VALUES ('6', '20');
INSERT INTO `role_resource` VALUES ('1', '21');
