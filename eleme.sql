/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : eleme

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-02-26 10:19:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `aid` int(10) NOT NULL AUTO_INCREMENT,
  `linkman` varchar(20) NOT NULL,
  `sex` varchar(10) NOT NULL DEFAULT '',
  `utel` int(11) NOT NULL,
  `uaddress` varchar(255) NOT NULL,
  `uid` int(10) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `fk_address_uid` (`uid`),
  CONSTRAINT `fk_address_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adid` int(10) NOT NULL AUTO_INCREMENT,
  `adname` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`adid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `uid` int(11) NOT NULL,
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) NOT NULL,
  `ccontent` varchar(255) DEFAULT NULL,
  `cgrade` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`cid`,`uid`),
  KEY `FK_cmt_oid` (`oid`),
  KEY `FK_cmt_uid` (`uid`),
  CONSTRAINT `FK_cmt_oid` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`),
  CONSTRAINT `FK_cmt_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '1', '1', '1');
INSERT INTO `comment` VALUES ('1', '2', '1', '23423', '2');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `gid` int(10) NOT NULL AUTO_INCREMENT,
  `gname` varchar(20) NOT NULL,
  `gprice` decimal(10,2) NOT NULL,
  `gcount` int(10) NOT NULL,
  `ginfo` varchar(255) NOT NULL,
  `gimage` varchar(255) DEFAULT NULL,
  `gbox` decimal(10,1) DEFAULT '0.0',
  `gtid` int(10) NOT NULL,
  PRIMARY KEY (`gid`),
  KEY `fk_goods_gtid` (`gtid`),
  CONSTRAINT `fk_goods_gtid` FOREIGN KEY (`gtid`) REFERENCES `goodstype` (`gtid`)
) ENGINE=InnoDB AUTO_INCREMENT=1430 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '火山石烤肠', '4.50', '589', ' ', '//fuss10.elemecdn.com/12f425f59d6013841596b844ed41892bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('2', '香辣鸡腿堡', '9.90', '455', ' ', '//fuss10.elemecdn.com/877ff616449f705b15d8ae9d27397450jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('3', '香辣鸡腿汉堡+鸡肉卷+中可', '23.80', '426', ' ', '//fuss10.elemecdn.com/c171d53f160392f8e69d2a12bb8d1b04jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('4', '香辣鸡腿堡+烤全腿+中可', '23.80', '383', ' ', '//fuss10.elemecdn.com/e83171eaf2b88f078a2d7fab5d715fd0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('5', '蛋垯（1个）', '4.50', '316', '', '//fuss10.elemecdn.com/49e3130d5f4248f14679833e75c28f83jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('6', '薯条（大）', '9.80', '282', '', '//fuss10.elemecdn.com/73d81cce4b9617f60c7e20f4a6c3de3ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('7', '墨西哥鸡肉卷', '9.90', '265', '', '//fuss10.elemecdn.com/be17c5ef28e1a0b6e54e045498dad7d0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('8', '椒盐鸡排', '6.80', '251', '', '//fuss10.elemecdn.com/a1cdeaad30c081ad9f5d981fe614d25cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('9', '蜜汁手扒鸡', '26.00', '204', ' ', '//fuss10.elemecdn.com/68ba8d1715214bc77b5ae7096250b269jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('10', '翅中4个+翅根6个+香骨炸鸡腿2个+2可', '29.90', '196', '', '//fuss10.elemecdn.com/f76d8826d021f4dc2cc3f484274fd32fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('11', '套餐:汉堡2个+辣翅3对+大薯+奶茶2杯', '29.90', '105', '', '//fuss10.elemecdn.com/c830524b87586e94b82e2fc366587dc0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('12', '翅中4个+翅根6个+香骨炸鸡腿2个+2可', '29.90', '196', '', '//fuss10.elemecdn.com/f76d8826d021f4dc2cc3f484274fd32fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('13', '香辣鸡腿堡2个+香辣鸡翅3对+大薯+2中', '29.90', '110', '', '//fuss10.elemecdn.com/b952103a1c7df5956c680cb48fa067e5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('14', '2个香辣鸡腿堡+2川香+2炸鸡腿+2中可', '29.90', '92', '', '//fuss10.elemecdn.com/f76d8826d021f4dc2cc3f484274fd32fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('15', '经典双层牛肉堡2个+辣翅2对+大薯+2可', '28.80', '27', '', '//fuss10.elemecdn.com/bea403c55f25302e3a342e2ce68d1673png.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('16', '香辣鸡腿堡买一送一', '9.90', '144', '', '//fuss10.elemecdn.com/ca05f47edc805a4cbac5055797fc412ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('17', '鸡肉卷买一送一', '9.90', '89', '', '//fuss10.elemecdn.com/c6e55ee4aad94d18680115aaadd8e001jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('18', '鸡肉卷2个+香辣鸡翅2对+2中可', '24.00', '9', '', '//fuss10.elemecdn.com/c6e55ee4aad94d18680115aaadd8e001jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('19', '双层牛肉堡+香辣鸡翅+美年达', '19.90', '12', '', '//fuss10.elemecdn.com/55e3416511799d8b7562f0433ee0c18ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('20', '蜜汁手扒鸡+1杯中可套餐', '19.90', '81', ' ', '//fuss10.elemecdn.com/f6da5eaf45faa6143e233aa597855272jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('21', '密汁手扒鸡+鸡肉卷+1中可', '26.80', '30', '', '//fuss10.elemecdn.com/0abb17ab6b91c18e471e3c5cfd0a337ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('22', '蜜汁手扒鸡+1杯中可', '19.90', '70', ' ', '//fuss10.elemecdn.com/c6df562429cb9eeeb07692f9054c84f6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('23', '套餐(霸王全腿+2个翅中+2个翅根+中可', '19.90', '51', '', '//fuss10.elemecdn.com/179173f3c73ecc71e297125e5b34a525jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('24', '辣翅2对 大薯 上校 甜心 2中可', '29.90', '6', '香辣鸡翅2对 上校鸡块5块 大薯1份 香芋甜心5个 中可2杯', '//fuss10.elemecdn.com/c830524b87586e94b82e2fc366587dc0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('25', '香辣鸡腿堡买一送一', '9.90', '144', '', '//fuss10.elemecdn.com/ca05f47edc805a4cbac5055797fc412ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('26', '最高20元', '0.00', '42', '', '//fuss10.elemecdn.com/73c19e9b23f03fac36b3b1ffaee7ccc5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('27', '滕椒鸡腿堡 麻辣味', '12.80', '44', ' ', '//fuss10.elemecdn.com/dec874f005b1c3d3e305ee1a53a92503jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('28', '奥尔良烤鸡肉卷 不辣', '11.80', '65', ' ', '//fuss10.elemecdn.com/4b1797439219b6691fa27737152a1b9cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('29', '至珍虾堡', '12.00', '48', ' ', '//fuss10.elemecdn.com/2008069e1109194cfe128b738cf52578jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('30', '新奥尔良烤鸡腿堡', '11.80', '116', ' ', '//fuss10.elemecdn.com/eb3e78c9a7f2d1b77ba8cdd4e5ee9f6ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('31', '田园蔬菜堡', '10.80', '15', ' ', '//fuss10.elemecdn.com/3b5e047ab50688be7792123fc835006ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('32', '照烧米汉堡', '11.80', '41', ' ', '//fuss10.elemecdn.com/8c47f3b46df5c7a3095e6e284d1c13a2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('33', '双层鸡腿堡', '14.80', '83', ' ', '//fuss10.elemecdn.com/3ece0d2389061c7ff8433f8956aab841jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('34', '蟹黄堡', '11.80', '24', ' ', '//fuss10.elemecdn.com/6a6d8119b20e4d3581ae63ef04f5e0eejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('35', '深海鳕鱼堡', '11.80', '18', ' ', '//fuss10.elemecdn.com/88fbd5ebe2e962686077ff78a3067308jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('36', '香辣鸡腿堡', '9.90', '455', ' ', '//fuss10.elemecdn.com/877ff616449f705b15d8ae9d27397450jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('37', '牛肉堡', '9.90', '43', ' ', '//fuss10.elemecdn.com/7e9b03440e935ad1effce481a128adb8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('38', '两个奥尔良烤鸡肉卷', '19.80', '41', ' ', '//fuss10.elemecdn.com/4b1797439219b6691fa27737152a1b9cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('39', '2个鸡肉卷', '19.80', '26', ' ', '//fuss10.elemecdn.com/45ebb9589d44019ddb06f7082e68ca28jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('40', '玉米虾排汉堡', '12.90', '14', ' ', '//fuss10.elemecdn.com/2e4407cb377846dfc3eb27f4d6532b0cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('41', '墨西哥鸡肉卷', '9.90', '265', '', '//fuss10.elemecdn.com/be17c5ef28e1a0b6e54e045498dad7d0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('42', '2个香辣鸡腿堡', '18.80', '43', '', '//fuss10.elemecdn.com/855fe33d52b7f735a8735207ce877ef6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('43', '鸡肉卷买一送一', '9.90', '89', '', '//fuss10.elemecdn.com/c6e55ee4aad94d18680115aaadd8e001jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('44', '团餐订购量大面议', '88.00', '0', '', '//fuss10.elemecdn.com/be0693775010c21bc818684b255e0cdcjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('45', '双层牛肉堡', '16.00', '24', '', '//fuss10.elemecdn.com/0d6464b50d2b6d565cb4f61f55eb36cajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('46', '至尊七虾卷', '11.80', '37', '', '//fuss10.elemecdn.com/d96bc9e064633c836a1c7461b7fcddafjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('47', '雪花脆皮鸡柳（6条）', '11.80', '24', '外焦里嫩超好吃', '//fuss10.elemecdn.com/0881a67ec075833e9b93c12d9061e4ffjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('48', '那么大藤椒鸡排', '16.80', '43', '', '//fuss10.elemecdn.com/548b8d304f7d1b98c065f4a59a834d6djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('49', '火山石烤肠', '4.50', '589', ' ', '//fuss10.elemecdn.com/12f425f59d6013841596b844ed41892bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('50', '火山石烤肠(2根', '8.80', '119', ' ', '//fuss10.elemecdn.com/cd9502d23e6b2ab5bfd9fc62acfd0b05jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('51', '台湾盐酥鸡', '11.80', '66', ' ', '//fuss10.elemecdn.com/bb57a426ce8355f4e12864a001f043d5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('52', '上校鸡块 5个', '9.90', '42', ' ', '//fuss10.elemecdn.com/412a713283de4590ffed20a1bc3d4cd1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('53', '上校鸡块 10个', '13.80', '66', ' ', '//fuss10.elemecdn.com/e0b04530e78611c786f1a577dbd6cbc0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('54', '4串骨肉相连', '12.98', '55', ' ', '//fuss10.elemecdn.com/bf6a5e6b5a8fc965ee5454562bd95bf5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('55', '4串鱿鱼', '15.80', '19', ' ', '//fuss10.elemecdn.com/ed4c87a0540eced7bc2ba47e0bd88cf7jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('56', '西域孜然鸡柳 4条', '12.00', '19', ' ', '//fuss10.elemecdn.com/ab6f406abbb3b9a59d82b3bda37f1909jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('57', '香甜玉米杯', '9.00', '21', ' ', '//fuss10.elemecdn.com/a01de9dcb65b0c640f87bb3bc325f824jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('58', '英伦吮指鱼', '12.80', '22', ' ', '//fuss10.elemecdn.com/1e994ddb1b60e76d44acd43c59a2366fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('59', '紫薯球 4个', '8.80', '45', ' ', '//fuss10.elemecdn.com/485b013e1e891e25b916b5dd0acb0b2ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('60', '海皇星2个', '8.80', '7', ' ', '//fuss10.elemecdn.com/b382d8c4a8d4a56bd2d077c0d1ab08dcjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('61', '黄金蝴蝶虾5个', '12.80', '24', ' ', '//fuss10.elemecdn.com/404c1201e14df6013beea6b31ad6020djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('62', '黄金蝴蝶虾2个', '7.90', '32', ' ', '//fuss10.elemecdn.com/0135126715a5c5b2854ef748aa928fe9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('63', '川香鸡柳2串', '8.80', '62', ' ', '//fuss10.elemecdn.com/343981daa4d26b666d78dcb9f015b4bdjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('64', '海皇星4个', '13.80', '2', ' ', '//fuss10.elemecdn.com/46a4c8be6df8c91021b41abddbf0e3dejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('65', '香芋甜心', '8.80', '10', ' ', '//fuss10.elemecdn.com/5de0977314d781013ca6c86bb554cd0djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('66', '脆皮香蕉4个', '8.80', '20', ' ', '//fuss10.elemecdn.com/3688ca14d2327f8efdf591127a22544ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('67', '鱿鱼2串', '8.80', '51', ' ', '//fuss10.elemecdn.com/05461ac5a7ac1b0c1e5fb617db142124jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('68', '骨肉相连2串', '8.80', '25', ' ', '//fuss10.elemecdn.com/ccfc612a919f4a4b2a6984fba6cc50ddjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('69', '上校鸡块5个', '8.00', '83', ' ', '//fuss10.elemecdn.com/84191549f86c0316c6c56efdc771fccajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('70', '红豆派', '8.00', '32', ' ', '//fuss10.elemecdn.com/0fd4f87c86d41cd6741d50266197c6ecjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('71', '蛋挞4个', '15.00', '28', ' ', '//fuss10.elemecdn.com/77b06d4869b9352eb67746faf0fd60b6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('72', '香芋派', '8.00', '27', ' ', '//fuss10.elemecdn.com/44dd21abdfcf81ff57cdc7b99bf2196bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('73', '薯条（大）', '9.80', '282', '', '//fuss10.elemecdn.com/73d81cce4b9617f60c7e20f4a6c3de3ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('74', '蛋垯（1个）', '4.50', '316', '', '//fuss10.elemecdn.com/49e3130d5f4248f14679833e75c28f83jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('75', '菠萝派', '8.00', '24', '', '//fuss10.elemecdn.com/ae654d75c63f08cd07a0ff266a05777fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('76', '龙脆骨', '10.80', '56', '', '//fuss10.elemecdn.com/45e7e1a5c149bfd24d3b1571c074424bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('77', '这么大鸡排', '13.80', '79', '', '//fuss10.elemecdn.com/6ce39d9dc7c12c35afc75040baadddc3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('78', '布丁', '7.80', '20', '', '//fuss10.elemecdn.com/94f42b21e7a1a9b5a69f57d21302159fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '4');
INSERT INTO `goods` VALUES ('79', '香辣鸡翅 2对', '16.80', '73', ' ', '//fuss10.elemecdn.com/14c766ad0c93b460aa4d41d2e1232a1fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('80', '蜜恋香酥大鸡排', '16.80', '51', ' ', '//fuss10.elemecdn.com/49a284be6cd9be57a221c9a9aec4107djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('81', '香辣鸡翅3对', '23.80', '56', ' ', '//fuss10.elemecdn.com/ff95eb081d1d35577cf1357bb2f69d12jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('82', '香辣鸡翅2对', '19.80', '12', ' ', '//fuss10.elemecdn.com/4a30d5d9775a5940b20f91ea87078204jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('83', '脆皮手枪腿', '14.80', '73', ' ', '//fuss10.elemecdn.com/4a5c6c06407d0f8d15a7f0d711326f81jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('84', '鸡米花', '8.00', '352', ' ', '//fuss10.elemecdn.com/3a2d04c31b4c072948657ccf4b4986fdjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('85', '香辣鸡翅', '9.00', '97', ' ', '//fuss10.elemecdn.com/1b00bbf123053d6df3a0be1948ff1388jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('86', '孜然扒翅4个', '12.00', '60', ' ', '//fuss10.elemecdn.com/a56e7f83b2bd4469cd48bc1ffd04ff78jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('87', '香酥大鸡排', '16.80', '10', ' ', '//fuss10.elemecdn.com/b5545cdd7ce83d8669ca80cf25a6a733jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('88', '蜜汁手扒鸡', '26.00', '204', ' ', '//fuss10.elemecdn.com/68ba8d1715214bc77b5ae7096250b269jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('89', '新奥尔良烤翅', '10.80', '79', ' ', '//fuss10.elemecdn.com/75d546c63f58d6296e7f040efda4d772jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('90', '脆皮鸡腿', '9.80', '97', ' ', '//fuss10.elemecdn.com/4434519adb6b90e9aaac45dac48734cdjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('91', '新奥尔良烤全腿', '13.00', '38', ' ', '//fuss10.elemecdn.com/1e585a3667c44baa236aac4b5a4bb578jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('92', '藤椒小鸡腿 3个 麻辣味', '13.00', '9', ' ', '//fuss10.elemecdn.com/7bf23eae74fb1ff5f74c7a556cea7793jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('93', '藤椒鸡排 微麻辣', '9.90', '55', ' ', '//fuss10.elemecdn.com/8de2c3352871ef31890bd9d0c1d9f6a7jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('94', '脆皮童子鸡', '28.80', '93', ' ', '//fuss10.elemecdn.com/ec53d342ed77289b6747d3606185e959jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('95', '孜然扒翅（4个）', '12.00', '21', '', '//fuss10.elemecdn.com/f5e0f8c45f39adbf797d64d4f50e2abcjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('96', '无骨鸡柳', '7.80', '50', '', '//fuss10.elemecdn.com/14018aac1bfc1051f14b2d84b82f6430jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('97', '椒盐鸡排', '6.80', '251', '', '//fuss10.elemecdn.com/a1cdeaad30c081ad9f5d981fe614d25cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('98', '黄金翅中（1个）', '5.80', '89', '', '//fuss10.elemecdn.com/d86189facee70a8c7589da161b474796jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('99', '黄金翅根（1个）', '5.80', '57', '', '//fuss10.elemecdn.com/df965fa70af4c61bf5bdb85c2817a539jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('100', '原味脆皮炸鸡腿', '9.90', '79', '', '//fuss10.elemecdn.com/4c567adbcf68fe38906e79652a36d3e8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('101', '西域霸王腿(孜然烤味)', '14.90', '78', '', '//fuss10.elemecdn.com/f3296ff83c0d62bf6d3ded92d7195c92jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('102', '飞碟牛肉酥', '9.90', '9', '', '//fuss10.elemecdn.com/e03894af1efc5424265fe999fab2a0f2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('103', '蝴蝶腿(2个)', '16.80', '8', '', '//fuss10.elemecdn.com/2a22d9758c6d76f572af99ab2aac86b3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '5');
INSERT INTO `goods` VALUES ('104', '香辣鸡腿堡+奥尔良烤翅+大薯+中可', '46.00', '3', '', '//fuss10.elemecdn.com/3bd93b00913f0ee77100793bf9a72f41jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('105', '奥尔良烤鸡腿堡 奥尔良烤肉卷 中可', '24.80', '61', ' ', '//fuss10.elemecdn.com/cf6eb8e57eb13a94bde600f0318a07d8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('106', '鸡肉卷+鸡米花+中可', '20.80', '95', ' ', '//fuss10.elemecdn.com/8aed99d68b42f0deba39bb26635483d1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('107', '香酥鸡排+大薯条 中可', '26.80', '13', ' ', '//fuss10.elemecdn.com/c62e2490c185f91cd571d132bcd5a55ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('108', '双层鸡腿堡+2串骨肉+中可', '24.80', '27', ' ', '//fuss10.elemecdn.com/2f9dd91394b56fccd13fef4398e436f1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('109', '香辣鸡腿汉堡+鸡肉卷+中可', '23.80', '426', ' ', '//fuss10.elemecdn.com/c171d53f160392f8e69d2a12bb8d1b04jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('110', '香辣汉堡+鸡米花+烤翅', '24.80', '40', ' ', '//fuss10.elemecdn.com/42a2e8a361f5d10ebee8ceee5edcd7d3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('111', '蟹黄堡+黄金蝴蝶虾 2个 中可', '25.00', '10', ' ', '//fuss10.elemecdn.com/29b0733e4efb9c4ab6fb115a6e964087jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('112', '鸡肉卷+新奥尔良烤翅+中可', '22.80', '61', ' ', '//fuss10.elemecdn.com/aed1847e38d844667958440f13e15cf0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('113', '新奥尔良烤鸡腿堡+大薯条+中可', '22.80', '67', ' ', '//fuss10.elemecdn.com/d499d723038722f7a6abdb84ff9723a6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('114', '牛肉堡+上校鸡块+中可', '21.00', '16', ' ', '//fuss10.elemecdn.com/b460a3f5282dcb2949156ca52c76881fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('115', '奥尔良烤鸡腿堡+上校鸡块+无骨鸡柳', '23.80', '36', ' ', '//fuss10.elemecdn.com/aac566e16d86f99dd136e555d90c8d44jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('116', '鸡米花+上校鸡块 5块 大薯条', '23.80', '23', ' ', '//fuss10.elemecdn.com/cfd970c98cf5feb5011269e9b6b7947bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('117', '香辣鸡腿堡+中七喜', '14.80', '33', ' ', '//fuss10.elemecdn.com/8b262f487090303a960b15d1a302fb4cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('118', '鸡肉卷+中美年达', '14.80', '14', ' ', '//fuss10.elemecdn.com/043b30b841418092a7d5dc0e674f4a60jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('119', '鸡肉卷+辣翅 鸡米花 中可', '27.80', '16', ' ', '//fuss10.elemecdn.com/0d2f9f4680b2e5aa3ab17110a456a05ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('120', '玉米虾堡 上校鸡块5个 中可', '22.00', '9', ' ', '//fuss10.elemecdn.com/b272cc00938ec80c1aa034b471c0e4aejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('121', '香辣鸡腿堡+大薯条+中可', '23.00', '14', ' ', '//fuss10.elemecdn.com/b48be5e85f618a935fede348aa612e21jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('122', '脆皮手枪腿 香辣鸡腿堡+中可', '25.80', '79', ' ', '//fuss10.elemecdn.com/6f40d18ed22ff1d3eb017cbc9b626f47jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('123', '牛肉堡+上校+中可套餐', '19.00', '15', ' ', '//fuss10.elemecdn.com/02ca633a5c27c106b43f2c66501e2714jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('124', '香辣鸡腿堡+烤全腿+中可', '23.80', '383', ' ', '//fuss10.elemecdn.com/e83171eaf2b88f078a2d7fab5d715fd0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('125', '香辣鸡腿堡+香辣鸡翅+中可', '23.00', '29', ' ', '//fuss10.elemecdn.com/dee0def216d44928f71b421b971868d1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('126', '鸡肉卷+烤全腿+中可', '24.80', '33', ' ', '//fuss10.elemecdn.com/c45504d954dc26ae192691f52d5fa488jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('127', '鸡肉卷+辣翅+中可', '21.80', '11', ' ', '//fuss10.elemecdn.com/9a39e3fd4b335c37f582010121a06868jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('128', '照烧米汉堡+鱿鱼 2串 +中可', '21.80', '10', ' ', '//fuss10.elemecdn.com/ba1f6c144b34ddc75fd38cf1f60100d3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('129', '鸡肉卷+川香鸡柳+中可', '21.00', '3', ' ', '//fuss10.elemecdn.com/ab61acda9a29a54a9a651743fb014496jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('130', '香辣鸡腿堡+新奥尔良烤翅+中可', '22.80', '8', ' ', '//fuss10.elemecdn.com/87b2799ce2b2aec4565d48ab9153e38ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('131', '鸡肉卷+大薯 中可', '21.80', '15', ' ', '//fuss10.elemecdn.com/ce3efbda6cfa8676e32af87e0882a5fbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('132', '藤椒麻辣鸡腿堡 上校鸡块 5个 中可', '23.80', '6', ' ', '//fuss10.elemecdn.com/86b33200729c2c0cc98060cff60661acjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('133', '奥尔良烤全腿+香辣鸡腿堡+中可', '24.80', '12', ' ', '//fuss10.elemecdn.com/e83171eaf2b88f078a2d7fab5d715fd0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('134', '套餐(霸王全腿+2个翅中+2个翅根+中可', '19.90', '51', '', '//fuss10.elemecdn.com/179173f3c73ecc71e297125e5b34a525jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('135', '翅中1个+翅根2个+香骨炸鸡腿+中可', '29.90', '13', '', '//fuss10.elemecdn.com/f76d8826d021f4dc2cc3f484274fd32fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('136', '密汁手扒鸡+鸡肉卷+1中可', '26.80', '30', '', '//fuss10.elemecdn.com/0abb17ab6b91c18e471e3c5cfd0a337ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('137', '香辣鸡腿堡+奥尔良烤全腿+上校鸡块+中可', '29.90', '20', '', '//fuss10.elemecdn.com/f1a32d1e79b45f17b014d0d00f5f8229jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('138', '双层牛肉堡+香辣鸡翅+美年达', '19.90', '12', '', '//fuss10.elemecdn.com/55e3416511799d8b7562f0433ee0c18ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('139', '脆皮炸鸡+墨西哥鸡肉卷+中可', '48.00', '7', '', '//fuss10.elemecdn.com/d24f49e4c833d6090153791915a95720jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('140', '墨西哥鸡肉卷+脆皮手抢腿+中可', '24.90', '35', '', '//fuss10.elemecdn.com/16800603505b775a412d143dff59ab4djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '6');
INSERT INTO `goods` VALUES ('141', '蜜汁手扒鸡+1杯中可', '19.90', '70', ' ', '//fuss10.elemecdn.com/c6df562429cb9eeeb07692f9054c84f6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '7');
INSERT INTO `goods` VALUES ('142', '蜜汁手扒鸡+1杯中可套餐', '19.90', '81', ' ', '//fuss10.elemecdn.com/f6da5eaf45faa6143e233aa597855272jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '7');
INSERT INTO `goods` VALUES ('143', '2脆皮鸡腿 2鸡腿堡 2川香鸡柳 2中可', '58.00', '10', ' ', '//fuss10.elemecdn.com/51f2f986443a92156dfa7f4bc8cff609jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '7');
INSERT INTO `goods` VALUES ('144', '辣翅2对 大薯 上校 甜心 2中可', '29.90', '6', '香辣鸡翅2对 上校鸡块5块 大薯1份 香芋甜心5个 中可2杯', '//fuss10.elemecdn.com/c830524b87586e94b82e2fc366587dc0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '7');
INSERT INTO `goods` VALUES ('145', '香酥大鸡排+2个鸡肉卷+大薯+2杯可乐', '45.00', '20', ' ', '//fuss10.elemecdn.com/c65cf672425d8c5f12e33d266ddbf69ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '7');
INSERT INTO `goods` VALUES ('146', '蜜汁手扒鸡＋4串骨肉＋两个汉堡＋2中可', '59.80', '33', '', '//fuss10.elemecdn.com/73cb43a938b8b885d226817e2a13820cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '7');
INSERT INTO `goods` VALUES ('147', '汉堡2个＋烤全腿＋上校鸡块5个＋2杯中可', '46.00', '7', '', '//fuss10.elemecdn.com/1f4b95c0271a9ff88b9a04f23a7c084bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '7');
INSERT INTO `goods` VALUES ('148', '2个奥尔良烤堡＋上校鸡块＋大薯＋2杯中可', '37.80', '58', '', '//fuss10.elemecdn.com/14198b6f7b92ed8d3ceae407a1578adajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '7');
INSERT INTO `goods` VALUES ('149', '套餐:汉堡2个+辣翅3对+大薯+奶茶2杯', '29.90', '105', '', '//fuss10.elemecdn.com/c830524b87586e94b82e2fc366587dc0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '7');
INSERT INTO `goods` VALUES ('150', '翅中4个+翅根6个+香骨炸鸡腿2个+2可', '29.90', '196', '', '//fuss10.elemecdn.com/f76d8826d021f4dc2cc3f484274fd32fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '7');
INSERT INTO `goods` VALUES ('151', '鸡肉卷2个+香辣鸡翅2对+2中可', '24.00', '9', '', '//fuss10.elemecdn.com/c6e55ee4aad94d18680115aaadd8e001jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '7');
INSERT INTO `goods` VALUES ('152', '2个香辣鸡腿堡+2川香+2炸鸡腿+2中可', '29.90', '92', '', '//fuss10.elemecdn.com/f76d8826d021f4dc2cc3f484274fd32fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '7');
INSERT INTO `goods` VALUES ('153', '经典双层牛肉堡2个+辣翅2对+大薯+2可', '28.80', '27', '', '//fuss10.elemecdn.com/bea403c55f25302e3a342e2ce68d1673png.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '7');
INSERT INTO `goods` VALUES ('154', '脆皮炸鸡+香辣鸡腿堡2个+骨肉4串+2可', '58.00', '10', '', '//fuss10.elemecdn.com/6447abc51e891cd6d4a55c6adbe9cf3fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '7');
INSERT INTO `goods` VALUES ('155', '香辣鸡腿堡2个+香辣鸡翅3对+大薯+2中', '29.90', '110', '', '//fuss10.elemecdn.com/b952103a1c7df5956c680cb48fa067e5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '7');
INSERT INTO `goods` VALUES ('156', '超级全家福', '148.00', '5', '香辣鸡腿堡2个 奥尔良烤堡2个 蜜汁鸡 香辣鸡翅3对 4串尤鱼 4串骨肉相连 上校鸡块10个 大薯条 2杯中可 2杯原味奶茶', '//fuss10.elemecdn.com/90f7984fc5d9c9ad90c0fe92566075a0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '8');
INSERT INTO `goods` VALUES ('157', '超值全家福', '79.80', '17', '香辣鸡腿堡2个＋虾堡＋辣翅2对＋骨肉相连2串＋尤鱼2串＋大薯条＋上校鸡块5个＋3杯中可', '//fuss10.elemecdn.com/0a0d74c294ea079c3b9c353ee970e816jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '8');
INSERT INTO `goods` VALUES ('158', '超大全家福', '118.00', '3', '汉堡2个＋鸡肉卷2个＋蜜汁手扒鸡＋香酥大鸡排＋上校鸡块＋大薯条＋扒翅4个＋中可4杯', '//fuss10.elemecdn.com/73cb43a938b8b885d226817e2a13820cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '8');
INSERT INTO `goods` VALUES ('159', '意式海鲜烩饭', '19.80', '62', ' ', '//fuss10.elemecdn.com/c1778e3ae482c73728a43d12afea13cajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '9');
INSERT INTO `goods` VALUES ('160', '意式红葱鸡肉饭', '19.80', '14', ' ', '//fuss10.elemecdn.com/bd7b2a5d4a79a35892054d36bee8fb4ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '9');
INSERT INTO `goods` VALUES ('161', '意大利黑椒鸡丝面', '19.80', '19', ' ', '//fuss10.elemecdn.com/83159ad9db644abd1d36cfdf0b6a8fa5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '9');
INSERT INTO `goods` VALUES ('162', '意大利茄汁海鲜面', '19.80', '12', ' ', '//fuss10.elemecdn.com/e7b2c0f42918b8b575c4fc25abf2f548jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '9');
INSERT INTO `goods` VALUES ('163', '意大利黑椒烤肠面', '18.80', '13', ' ', '//fuss10.elemecdn.com/1be31c7849e0fb45f9b29f93de9c7541jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '9');
INSERT INTO `goods` VALUES ('164', '意大利黑椒蘑菇面', '18.80', '2', ' ', '//fuss10.elemecdn.com/1b1462273b49a8c3a28ef92922d0c63cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '9');
INSERT INTO `goods` VALUES ('165', '意大利茄汁玉米面', '18.80', '5', ' ', '//fuss10.elemecdn.com/16ddd416d901fc27a6485570ef945ad3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '9');
INSERT INTO `goods` VALUES ('166', '意大利肉酱面', '15.80', '27', ' ', '//fuss10.elemecdn.com/a0da62216fe89a4f4f3ca241b1708536jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '9');
INSERT INTO `goods` VALUES ('167', '意大利黑椒牛柳面', '19.80', '20', ' ', '//fuss10.elemecdn.com/afd198c68526c395d380a7a9ec153c4ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '9');
INSERT INTO `goods` VALUES ('168', '意大利茄汁培根面', '18.80', '8', ' ', '//fuss10.elemecdn.com/f8c558e2a0c6d67544e5762cd1bc2f5bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '9');
INSERT INTO `goods` VALUES ('169', '意式黑椒牛柳烩饭', '19.80', '7', ' ', '//fuss10.elemecdn.com/ac8c2d559c7a6952c294a2f1542a6057jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '9');
INSERT INTO `goods` VALUES ('170', '意式黑椒烤肠烩饭', '18.00', '10', ' ', '//fuss10.elemecdn.com/600f84043aead43966f20cac0092e326jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '9');
INSERT INTO `goods` VALUES ('171', '红葱海鲜烩饭 藤椒鸡排 中可', '27.80', '14', ' ', '//fuss10.elemecdn.com/9431787b1cb64b0c2f7d3c19db66daf3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '10');
INSERT INTO `goods` VALUES ('172', '黑椒烤肠饭 烤全腿 中可', '27.80', '16', ' ', '//fuss10.elemecdn.com/c806f9da2bb3f27d4c21db0faedef931jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '10');
INSERT INTO `goods` VALUES ('173', '红葱鸡肉饭 烤全腿 中可', '27.80', '17', ' ', '//fuss10.elemecdn.com/83ce2b44bb5a0084da9f1fcfc4b646cfjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '10');
INSERT INTO `goods` VALUES ('174', '黑椒牛柳饭 藤椒鸡排+中可', '27.80', '8', ' ', '//fuss10.elemecdn.com/ac8c2d559c7a6952c294a2f1542a6057jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '10');
INSERT INTO `goods` VALUES ('175', '黑椒鸡丝面 烤鸡翅 中可', '27.80', '3', ' ', '//fuss10.elemecdn.com/8e75d3cecdb728ca4794cdb0645851cejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '10');
INSERT INTO `goods` VALUES ('176', '牛柳面+烤翅1对+可乐', '27.80', '6', ' ', '//fuss10.elemecdn.com/839b295e662e7b30e817071cc1dfcaffjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '10');
INSERT INTO `goods` VALUES ('177', '海鲜面+烤翅1对+可乐', '27.80', '11', ' ', '//fuss10.elemecdn.com/c3ff0448427ba226e900b28de3edfe4ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '10');
INSERT INTO `goods` VALUES ('178', '玉米面+蛋挞1个+可乐', '23.80', '3', ' ', '//fuss10.elemecdn.com/acfdcb96458b909f6fb7c888e44cfa55jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '10');
INSERT INTO `goods` VALUES ('179', '烤肠面+烤翅1对+可乐', '27.80', '5', ' ', '//fuss10.elemecdn.com/1922443d0c69b5cd0f2087db945013a1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '10');
INSERT INTO `goods` VALUES ('180', '培根面+蛋挞1个+可乐', '24.99', '1', ' ', '//fuss10.elemecdn.com/5f8dec1ba2932f1b315e5df63696a84fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '10');
INSERT INTO `goods` VALUES ('181', '蘑菇面+蛋挞1个+可乐', '24.99', '2', ' ', '//fuss10.elemecdn.com/dc9a1f1d2ecdbe9b000a03cd9194aed6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '10');
INSERT INTO `goods` VALUES ('182', '红葱鸡肉烩饭 芙蓉蛋汤', '23.00', '1', ' ', '//fuss10.elemecdn.com/bd7b2a5d4a79a35892054d36bee8fb4ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '10');
INSERT INTO `goods` VALUES ('183', '深海鳕鱼堡+海皇星+小可', '23.00', '3', ' ', '//fuss10.elemecdn.com/fb3e20ed4aba6b671f7de20e062090e1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '11');
INSERT INTO `goods` VALUES ('184', '田园蔬菜堡+海皇星+小可', '21.80', '3', ' ', '//fuss10.elemecdn.com/2e516d2b8a5fd476ea4561877baf64e2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '11');
INSERT INTO `goods` VALUES ('185', '至珍虾堡+海皇星+小可', '22.80', '2', ' ', '//fuss10.elemecdn.com/5879bb6669637564776f0cfea8c3582bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '11');
INSERT INTO `goods` VALUES ('186', '冰镇酸梅汤', '6.00', '49', ' ', '//fuss10.elemecdn.com/2a917374d8daaf0a2fa210df6ec5672ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '12');
INSERT INTO `goods` VALUES ('187', '新鲜百香果汁', '10.00', '27', ' ', '//fuss10.elemecdn.com/1348701662d265a0e0d8e93a4abf0619jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '12');
INSERT INTO `goods` VALUES ('188', '飞舞奇橘', '11.00', '4', ' ', '//fuss10.elemecdn.com/089edbee279250d0b78b410c904beffajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '12');
INSERT INTO `goods` VALUES ('189', '菠菜蛋汤', '6.00', '19', ' ', '//fuss10.elemecdn.com/6fafe910ba5d4459ee12d68f93f2f128jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '12');
INSERT INTO `goods` VALUES ('190', '一棵柠檬茶', '11.00', '9', ' ', '//fuss10.elemecdn.com/549e93e55ee812d5e9bea1fe16b24170jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '12');
INSERT INTO `goods` VALUES ('191', '蜜桃乌龙茶', '8.00', '3', ' ', '//fuss10.elemecdn.com/5718262d2ecafe4cf685d0f573849572jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '12');
INSERT INTO `goods` VALUES ('192', '金橘泡泡', '11.00', '4', ' ', '//fuss10.elemecdn.com/590db2d1bf5833a7fc06bd60a7e3067ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '12');
INSERT INTO `goods` VALUES ('193', '桂圆红枣茶', '7.00', '4', ' ', '//fuss10.elemecdn.com/2edb21c0626beefc2aa877e902c53a6ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '12');
INSERT INTO `goods` VALUES ('194', '美年达中', '5.80', '33', ' ', '//fuss10.elemecdn.com/6055c91717e6298569d87d0f0f6e6b97jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '12');
INSERT INTO `goods` VALUES ('195', '七喜中', '5.80', '44', ' ', '//fuss10.elemecdn.com/6409937f3a905e2e0be77144dd393b14jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '12');
INSERT INTO `goods` VALUES ('196', '咖啡', '6.80', '3', ' ', '//fuss10.elemecdn.com/c53ffba833d8f515621abe4136e9395bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '12');
INSERT INTO `goods` VALUES ('197', '牛奶', '7.00', '34', ' ', '//fuss10.elemecdn.com/a3ab41041ec7c58bbfffd7bdce518ee6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '12');
INSERT INTO `goods` VALUES ('198', '可乐', '5.80', '194', '', '//fuss10.elemecdn.com/10c07b1ab79b37310e7fc25f4128cc11jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '12');
INSERT INTO `goods` VALUES ('199', '果维C(橙汁味)', '8.80', '15', '', '//fuss10.elemecdn.com/100702ba53a0b6dc4b050f816fceaa86jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '12');
INSERT INTO `goods` VALUES ('200', '金桔柠檬', '11.00', '26', '', '//fuss10.elemecdn.com/1e6b30a45d3d3f27dad09920f58cc767jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '12');
INSERT INTO `goods` VALUES ('201', '青瓜芒果汁', '11.00', '6', '', '//fuss10.elemecdn.com/5d5000373460a85201029508d951c4f9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '12');
INSERT INTO `goods` VALUES ('202', '莓力四射', '11.80', '12', '', '//fuss10.elemecdn.com/b4c1bb1badbf9360542dd8ebfd8ed5fejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '12');
INSERT INTO `goods` VALUES ('203', '爆爆蛋奶绿', '8.00', '37', ' ', '//fuss10.elemecdn.com/4d2716c251426acf2a40fe0d85a3d191jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '13');
INSERT INTO `goods` VALUES ('204', '爆爆蛋奶茶', '8.00', '28', ' ', '//fuss10.elemecdn.com/4d2716c251426acf2a40fe0d85a3d191jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '13');
INSERT INTO `goods` VALUES ('205', '仙草奶茶', '8.00', '103', ' ', '//fuss10.elemecdn.com/8b81adafcce56cb1a9b3dda28e398b2djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '13');
INSERT INTO `goods` VALUES ('206', '红豆奶茶', '8.00', '48', ' ', '//fuss10.elemecdn.com/c7bce7c4cdf9ae2b3503128604e066acjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '13');
INSERT INTO `goods` VALUES ('207', '红豆奶绿', '8.00', '19', ' ', '//fuss10.elemecdn.com/318bddebb88f36265edea13564b4e419jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '13');
INSERT INTO `goods` VALUES ('208', '椰果奶绿', '8.00', '24', ' ', '//fuss10.elemecdn.com/b4a67630f4e4c332a6f717f6a79a5be4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '13');
INSERT INTO `goods` VALUES ('209', '原味奶绿', '6.80', '14', ' ', '//fuss10.elemecdn.com/be4b06a6f549aa554b0b0987cc7fff70jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '13');
INSERT INTO `goods` VALUES ('210', '苿香绿茶', '6.00', '12', ' ', '//fuss10.elemecdn.com/b20da03cb9f45ec8c47db63a0b592e92jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '13');
INSERT INTO `goods` VALUES ('211', '布丁奶绿', '8.00', '6', ' ', '//fuss10.elemecdn.com/13b88b210dd91755b520a301116a1d86jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '13');
INSERT INTO `goods` VALUES ('212', '布丁奶茶', '8.00', '19', ' ', '//fuss10.elemecdn.com/09fc4e04df858b656d1238201e1c6a81jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '13');
INSERT INTO `goods` VALUES ('213', '仙草奶绿', '8.00', '9', ' ', '//fuss10.elemecdn.com/cd4c542051b5e90c143726131c5f8be6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '13');
INSERT INTO `goods` VALUES ('214', '椰果奶茶', '8.00', '19', ' ', '//fuss10.elemecdn.com/f6b9be8aa2a64feaf605109800093c8ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '13');
INSERT INTO `goods` VALUES ('215', '原味奶茶', '6.80', '26', ' ', '//fuss10.elemecdn.com/8ae25da183acf4f0f05c7ac12979c89ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '13');
INSERT INTO `goods` VALUES ('216', '阿萨姆红茶', '6.00', '14', '', '//fuss10.elemecdn.com/bcaaab02c19b6572cd0d1e7f77e9783djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '13');
INSERT INTO `goods` VALUES ('217', '皮蛋瘦肉粥', '16.00', '302', '', '//fuss10.elemecdn.com/028d8c7e7a000926a6c979abeaf341c3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('218', '咸鸭蛋', '3.50', '84', '', '//fuss10.elemecdn.com/1a243a37874dc5b3e126794c6828dc18jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('219', '香酥春卷', '5.00', '69', '', '//fuss10.elemecdn.com/73c20c466b0a07794cd1cd7f87dbd937jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('220', '梅菜笋丝', '4.00', '68', '', '//fuss10.elemecdn.com/e5a0f65746d083b18f338f7373f96171jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('221', '蠔干粥', '18.00', '59', '', '//fuss10.elemecdn.com/26f615efb8c45c6086345f48d54c4c7bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('222', '豆干', '2.00', '56', '', '//fuss10.elemecdn.com/9a4e9e7ddff96c5f1be4efed254fa532jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('223', '生蚝瘦肉粥', '20.00', '54', '', '//fuss10.elemecdn.com/13374610365b50c2554c7586a8b2ca4bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('224', '瘦肉粥', '14.08', '45', '', '//fuss10.elemecdn.com/b4ebe0421dc7f165b85677396a03ebeajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('225', '玉米', '3.00', '38', '', '//fuss10.elemecdn.com/e36344e15759d8465dbd4aa5ed5bba0bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('226', '拌皮蛋', '6.00', '24', '', '//fuss10.elemecdn.com/9e6103b94bd9acc747305ae1f5a1c253jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('227', '瘦肉粥', '14.08', '45', '', '//fuss10.elemecdn.com/b4ebe0421dc7f165b85677396a03ebeajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('228', '珍珠贝粥', '14.08', '22', '', '//fuss10.elemecdn.com/d6a910bd5ddaef507ef1177ad1be346cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('229', '扫码送红包', '0.00', '0', '', '//fuss10.elemecdn.com/5ead09d1db7601cc0b580178c50b6a0ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '16');
INSERT INTO `goods` VALUES ('230', '加芹菜', '0.00', '0', '', '//fuss10.elemecdn.com/73ce20a1e7643e99889ec9bcf9410d04jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '17');
INSERT INTO `goods` VALUES ('231', '不加花菜', '0.00', '0', '', '//fuss10.elemecdn.com/4b75247e3ffce2e915aeaf425ba38c95jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '17');
INSERT INTO `goods` VALUES ('232', '不加芋头', '0.00', '0', '', '//fuss10.elemecdn.com/0aa06bcfd053d3dbe3097ea5b41fab6ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '17');
INSERT INTO `goods` VALUES ('233', '蠔干粥', '18.00', '59', '', '//fuss10.elemecdn.com/26f615efb8c45c6086345f48d54c4c7bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('234', '鱼翅粥', '24.00', '5', '', '//fuss10.elemecdn.com/a00a1b72a466f69c715378a3618cf721jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('235', '生蚝瘦肉粥', '20.00', '54', '', '//fuss10.elemecdn.com/13374610365b50c2554c7586a8b2ca4bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('236', '虾仁粥', '18.00', '46', '', '//fuss10.elemecdn.com/1507af22c3f3cf03a5a2c0d18170a21ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('237', '猪肚粥', '18.00', '27', '', '//fuss10.elemecdn.com/02ed063aedb3cbdab2c447a7cfbf184djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('238', '皮蛋瘦肉粥', '16.00', '302', '', '//fuss10.elemecdn.com/028d8c7e7a000926a6c979abeaf341c3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('239', '筒骨肉粥', '19.00', '33', '', '//fuss10.elemecdn.com/b4ebe0421dc7f165b85677396a03ebeajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('240', '小肠粥', '15.00', '48', '', '//fuss10.elemecdn.com/f92d267a28a04238252f079c6ae76627jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('241', '鸭心粥', '15.00', '8', '', '//fuss10.elemecdn.com/ceaee11d66cdc08f78def551c442c9adjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('242', '瘦肉粥', '14.08', '45', '', '//fuss10.elemecdn.com/b4ebe0421dc7f165b85677396a03ebeajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('243', '卤鸭肉粥', '15.00', '6', '', '//fuss10.elemecdn.com/a4f70a4d7a3911885d7cf01dc17e2b1fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('244', '鸡肉粥', '15.00', '15', '', '//fuss10.elemecdn.com/a7bcb285a2f79ee1726eff174567f822jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('245', '卤鸭肚粥', '17.00', '1', '', '//fuss10.elemecdn.com/a4f70a4d7a3911885d7cf01dc17e2b1fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('246', '石斑鱼粥', '18.00', '19', '', '//fuss10.elemecdn.com/1aee2854f5db7684ad27988c6afb62b1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('247', '排骨粥', '18.00', '22', '', '//fuss10.elemecdn.com/0869a40534e7dbd8abeb427c47abed74jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('248', '鳕鱼粥', '19.00', '5', '', '//fuss10.elemecdn.com/6d8f7f3fcce0e25739108c8e9f6e98e8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('249', '花蟹粥', '19.00', '8', '', '//fuss10.elemecdn.com/7e34cc00fe92fbaa198ebcbbb1d3bb0djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('250', '牛肉粥', '20.00', '22', '', '//fuss10.elemecdn.com/d0480a34ebdec80b43dbc9c9919b21a1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('251', '鸭腱粥', '15.00', '13', '', '//fuss10.elemecdn.com/518db3c82b9875b2c94d20e5cfa8ce58jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('252', '大肠头粥', '19.00', '11', '', '//fuss10.elemecdn.com/d044bb2822e75718edef6a4013b3fae9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('253', '虾姑肉粥', '26.00', '3', '', '//fuss10.elemecdn.com/0288b13bc25da5bbe2909d64956c18b0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('254', '花蛤火腿粥', '16.00', '4', '', '//fuss10.elemecdn.com/3f092a5539dd5a6709c1e88ee1ebee8cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('255', '珍珠贝粥', '14.08', '22', '', '//fuss10.elemecdn.com/d6a910bd5ddaef507ef1177ad1be346cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('256', '猪舌粥', '19.00', '2', '', '//fuss10.elemecdn.com/f1249cf7359553280c4fc32ba9f5d57cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('257', '鸭舌粥', '20.00', '0', '', '//fuss10.elemecdn.com/b17cfb0332beab954b2f7e7d3814b69ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('258', '鲍鱼粥', '26.00', '23', '', '//fuss10.elemecdn.com/6b78aee811482071b664a270926ca383jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('259', '鲜虾粥', '20.00', '7', '\n主要原料: 红虾', '//fuss10.elemecdn.com/a064f28589bac6abbc0fe77f86e748c5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '18');
INSERT INTO `goods` VALUES ('260', '沃头一品粥', '55.00', '12', '添加鲍鱼，鱼翅，虾菇，海参', '//fuss10.elemecdn.com/fd963d6105db4dfcfec3c51fab4e9c83jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '19');
INSERT INTO `goods` VALUES ('261', '莲子小肠粥', '20.00', '12', '', '//fuss10.elemecdn.com/34929ee425e381005bbc51e54cfbb2b5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '20');
INSERT INTO `goods` VALUES ('262', '莲子瘦肉粥', '20.00', '8', '', '//fuss10.elemecdn.com/c6a62ad2d075aabfa9b327180d90c6ddjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '20');
INSERT INTO `goods` VALUES ('263', '莲子猪肚粥', '22.00', '13', '', '//fuss10.elemecdn.com/1ccb9b987c10d70f61d2367025d9f441jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '20');
INSERT INTO `goods` VALUES ('264', '莲子排骨粥', '22.00', '10', '', '//fuss10.elemecdn.com/a30f718e6ed45e1d6c53bef0a5f0b5d6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '20');
INSERT INTO `goods` VALUES ('265', '莲子干贝排骨粥', '28.00', '4', '', '//fuss10.elemecdn.com/88bdab6f43baa55719264082e36354bdjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '20');
INSERT INTO `goods` VALUES ('266', '莲子干贝猪肚粥', '28.00', '4', '', '//fuss10.elemecdn.com/404fdd82fd0d1fdc26e8aca465396529jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '20');
INSERT INTO `goods` VALUES ('267', '香甜芋头卷', '5.00', '4', '', '//fuss10.elemecdn.com/fbe9dc30588344d32788f33c14fa685ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '21');
INSERT INTO `goods` VALUES ('268', '香芋地瓜丸（6个）', '7.00', '13', '', '//fuss10.elemecdn.com/b0ff13bcb3a297f9626030c5eb743652jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '21');
INSERT INTO `goods` VALUES ('269', '香酥春卷', '5.00', '69', '', '//fuss10.elemecdn.com/73c20c466b0a07794cd1cd7f87dbd937jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '21');
INSERT INTO `goods` VALUES ('270', '芥菜猪肉煎饺（5个）', '10.00', '29', '', '//fuss10.elemecdn.com/002e12d570df55cc0f1e0df7085f3cfajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '21');
INSERT INTO `goods` VALUES ('271', '薯条', '6.00', '7', '', '//fuss10.elemecdn.com/495d8a5fe41651abb6e018f4ae1a7361jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '21');
INSERT INTO `goods` VALUES ('272', '玉米蔬菜猪肉煎饺（5个）', '10.00', '24', '', '//fuss10.elemecdn.com/002e12d570df55cc0f1e0df7085f3cfajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '21');
INSERT INTO `goods` VALUES ('273', '香炸南瓜饼（3个）', '5.00', '18', '', '//fuss10.elemecdn.com/9705ab832a1b0eb01c8ff528c64ca708jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '21');
INSERT INTO `goods` VALUES ('274', '金牌虾仁卷（4个）', '10.00', '8', '', '//fuss10.elemecdn.com/580e84da02e583a8bb163c53efe8d667jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '21');
INSERT INTO `goods` VALUES ('275', '清香玉米饼（3个）', '12.00', '3', '', '//fuss10.elemecdn.com/31805ba7f0fde9e0aeb8a2d31aca595djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '21');
INSERT INTO `goods` VALUES ('276', '绿茶佛饼3个', '5.00', '18', '', '//fuss10.elemecdn.com/5f3a1682e739546f720c4cc1ef84d4f8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '21');
INSERT INTO `goods` VALUES ('277', '骨肉相连2串', '6.00', '14', '', '//fuss10.elemecdn.com/813b95f5c0b2a6661acee1f7c8ae8e80jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '21');
INSERT INTO `goods` VALUES ('278', '箘菇三鲜饺（5个）', '10.00', '15', '', '//fuss10.elemecdn.com/002e12d570df55cc0f1e0df7085f3cfajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '21');
INSERT INTO `goods` VALUES ('279', '玉米猪肉烧卖5个', '11.00', '8', '', '//fuss10.elemecdn.com/4201ae1fc1dc742188bd1c741e7f3571jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '21');
INSERT INTO `goods` VALUES ('280', '美味虾饺', '10.00', '11', '', '//fuss10.elemecdn.com/57a0d06c3930723d799ca9d35b447b12jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '21');
INSERT INTO `goods` VALUES ('281', '清香鸡米花', '9.00', '8', '', '//fuss10.elemecdn.com/55cba7bc76fea630bff1bbf6dd456231jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '21');
INSERT INTO `goods` VALUES ('282', '炸五香条', '6.00', '25', '', '//fuss10.elemecdn.com/48cff33931ea7b6bf4c5761a9754a7fdjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '21');
INSERT INTO `goods` VALUES ('283', '虾菇', '12.00', '4', '', '//fuss10.elemecdn.com/6587f091c723d202b5952dacaecbbc58jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('284', '鸭心', '7.00', '2', '', '//fuss10.elemecdn.com/84e4e1b861d41a54c70f8c189e4ab5c2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('285', '生蚝', '8.00', '4', '', '//fuss10.elemecdn.com/955e686df12034595e5f217efd6e406cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('286', '莲子', '4.00', '17', '', '//fuss10.elemecdn.com/0c07645c2abcecde15d2e50f8636ef8djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('287', '石斑鱼', '10.00', '2', '', '//fuss10.elemecdn.com/c1c6bea737220205f084643c036f37a0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('288', '苦瓜', '3.00', '17', '', '//fuss10.elemecdn.com/d5b4be8324a841f3128f58618f1e83adjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('289', '玉米', '3.00', '38', '', '//fuss10.elemecdn.com/e36344e15759d8465dbd4aa5ed5bba0bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('290', '筒骨肉', '8.00', '5', '', '//fuss10.elemecdn.com/1126e1261d680cf70849196f0be3b8e3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('291', '大肠头加粥里', '11.00', '4', '', '//fuss10.elemecdn.com/8a2e8624e5d8760bedacc30a412e7353jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('292', '瘦肉', '5.00', '9', '', '//fuss10.elemecdn.com/f193ccc928fbee4a93ed3465e0a02851jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('293', '鸡肉', '7.00', '2', '', '//fuss10.elemecdn.com/a57fe499a06ec32514fb0ea8a412e821jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('294', '猪舌', '9.00', '1', '', '//fuss10.elemecdn.com/60d83a9c0e275f5ec08f18aa4d0bf75djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('295', '排骨', '10.00', '6', '', '//fuss10.elemecdn.com/8071f946d39a0f5f414ee4c9052c7a97jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('296', '皮蛋', '4.00', '21', '', '//fuss10.elemecdn.com/ce98b09aaf29e342b6f2fbe095c84690jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('297', '鸭腱', '8.00', '3', '', '//fuss10.elemecdn.com/ee3b549beba6a3c4e7b371459929924cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('298', '花蛤', '7.00', '5', '', '//fuss10.elemecdn.com/82da53799de40db67d87b5671d3c8b06jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('299', '虾仁', '10.00', '9', '', '//fuss10.elemecdn.com/23b3c94cca56ba01f49fed2dc6c39287jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('300', '鳕鱼', '10.00', '1', '', '//fuss10.elemecdn.com/e6b4b3ba4c17ac17b96862470f1e75d7jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('301', '牛肉', '10.00', '2', '', '//fuss10.elemecdn.com/4ec24749e48e328d445472a208fac1fcjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('302', '小肠', '7.00', '9', '', '//fuss10.elemecdn.com/809919aea10950e052712948adbb9ee3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('303', '鸭肉', '8.00', '12', '', '//fuss10.elemecdn.com/8ec77499fab369f03bbe2930304db4a0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('304', '螺肉', '8.00', '1', '', '//fuss10.elemecdn.com/7c3ad8d0f536bdca172155d2883df0d5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('305', '花蟹', '10.00', '4', '', '//fuss10.elemecdn.com/7826d319ab4eb6624f286863e8fc0475jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('306', '海参', '13.00', '4', '', '//fuss10.elemecdn.com/c8c057d005dfa986c30eda03dcc6b7bcjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('307', '蠔干', '9.00', '3', '', '//fuss10.elemecdn.com/50b2557f4fb7fdbbd8fa753bcfc75a9ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('308', '珍珠贝', '8.00', '2', '', '//fuss10.elemecdn.com/96355e8532051d272efcddbe1b5392c8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('309', '澳洲鲜贝', '13.00', '0', '', '//fuss10.elemecdn.com/621b02c13dc910d8a0d7e77dcbfa8cf0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('310', '鱼翅', '15.00', '1', '', '//fuss10.elemecdn.com/feeee69c714cf0b358c0199abf84debfjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('311', '干贝', '11.00', '4', '', '//fuss10.elemecdn.com/8c4634ddd23962b7e16380f0a87adf88jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('312', '猪肚', '10.00', '2', '', '//fuss10.elemecdn.com/8e943831c766655a9e9dc667603c3c8cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('313', '鸭舌', '11.00', '0', '', '//fuss10.elemecdn.com/dfe26fd5f8b9c0aed1ec80633d87aa81jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('314', '鲜虾三只', '10.00', '4', '活虾', '//fuss10.elemecdn.com/6e50eed2142c75b72877b3fe8bdcc46ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '22');
INSERT INTO `goods` VALUES ('315', '鲜脆榨菜', '4.50', '8', '', '//fuss10.elemecdn.com/ae9dccf62ddc004250f04eed507a49a3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '23');
INSERT INTO `goods` VALUES ('316', '盐水花生', '4.00', '3', '', '//fuss10.elemecdn.com/c51d5cf4359a85822b3c8175d7506de4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '23');
INSERT INTO `goods` VALUES ('317', '拌皮蛋', '6.00', '24', '', '//fuss10.elemecdn.com/9e6103b94bd9acc747305ae1f5a1c253jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '23');
INSERT INTO `goods` VALUES ('318', '泡椒凤爪', '8.00', '8', '', '//fuss10.elemecdn.com/7ad15b76e949310e5123ecad5e26ad86jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '23');
INSERT INTO `goods` VALUES ('319', '梅菜笋丝', '4.00', '68', '', '//fuss10.elemecdn.com/e5a0f65746d083b18f338f7373f96171jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '23');
INSERT INTO `goods` VALUES ('320', '豆干', '2.00', '56', '', '//fuss10.elemecdn.com/9a4e9e7ddff96c5f1be4efed254fa532jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '23');
INSERT INTO `goods` VALUES ('321', '凉拌海带丝', '5.00', '20', '', '//fuss10.elemecdn.com/badff5ed9963289e2f6f741dc922eb4cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '23');
INSERT INTO `goods` VALUES ('322', '香带鱼', '11.00', '8', '', '//fuss10.elemecdn.com/22687c170b60735df79c5eb82330ee79jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '23');
INSERT INTO `goods` VALUES ('323', '炸花生米', '4.00', '14', '', '//fuss10.elemecdn.com/85b432b48ffc6eea57b240c9febb073ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '23');
INSERT INTO `goods` VALUES ('324', '卤蛋', '2.50', '69', '', '//fuss10.elemecdn.com/798a454bceb6569bbf89c809ecb52d77jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '23');
INSERT INTO `goods` VALUES ('325', '纯香肉肠', '5.00', '11', '', '//fuss10.elemecdn.com/56e40d5322afb1974f40dd066fae3ccdjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '23');
INSERT INTO `goods` VALUES ('326', '皮蛋鸭卷', '6.00', '14', '', '//fuss10.elemecdn.com/5de1a6a5058ccafa491d01548ba1b33fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '23');
INSERT INTO `goods` VALUES ('327', '煎蛋', '3.00', '86', '', '//fuss10.elemecdn.com/ca377d9a8d4257f5db4044b93077f4c5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '23');
INSERT INTO `goods` VALUES ('328', '咸鸭蛋', '3.50', '84', '', '//fuss10.elemecdn.com/1a243a37874dc5b3e126794c6828dc18jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '23');
INSERT INTO `goods` VALUES ('329', '凉拌黄瓜', '5.00', '13', '', '//fuss10.elemecdn.com/8612d9be0326a064051c809285078c00jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '23');
INSERT INTO `goods` VALUES ('330', '凉拌金针菇', '4.50', '14', '', '//fuss10.elemecdn.com/1a9703e892c190ed7bc18085c2c95008jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '23');
INSERT INTO `goods` VALUES ('331', '酸辣萝卜条', '4.50', '9', '', '//fuss10.elemecdn.com/dd1467cf940e8ef41a23f715d7623885jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '23');
INSERT INTO `goods` VALUES ('332', '韩国泡菜', '5.00', '18', '', '//fuss10.elemecdn.com/458483b898473bfc8d54d06071d78acbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '23');
INSERT INTO `goods` VALUES ('333', '虾仁鸭心粥', '21.00', '3', '', '//fuss10.elemecdn.com/8ef251f0bfc024ae5784886bb9608ed3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '24');
INSERT INTO `goods` VALUES ('334', '虾仁鸭肉粥', '23.00', '4', '', '//fuss10.elemecdn.com/b31693696700d9438ec4a0b6f06bdd86jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '24');
INSERT INTO `goods` VALUES ('335', '虾仁鸡肉粥', '21.00', '5', '', '//fuss10.elemecdn.com/1d5e189467b06fec7f0cdfd584c2b615jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '24');
INSERT INTO `goods` VALUES ('336', '虾仁猪舌粥', '21.00', '1', '', '//fuss10.elemecdn.com/89fe286260e2e520a7acb391d317bafcjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '24');
INSERT INTO `goods` VALUES ('337', '虾仁排骨粥', '23.00', '7', '', '//fuss10.elemecdn.com/aedc4b847d7d9461718374cffd63fd6ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '24');
INSERT INTO `goods` VALUES ('338', '虾仁大肠头粥', '24.00', '10', '', '//fuss10.elemecdn.com/9d117210f25c8f3a7d289847d344ee8bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '24');
INSERT INTO `goods` VALUES ('339', '虾仁鸭腱粥', '23.00', '1', '', '//fuss10.elemecdn.com/5067b460767826790932528f9f65741cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '24');
INSERT INTO `goods` VALUES ('340', '虾仁猪肚粥', '23.00', '6', '', '//fuss10.elemecdn.com/da2724686f6957c31cdb171808b74992jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '24');
INSERT INTO `goods` VALUES ('341', '虾仁鸭肚粥', '21.00', '0', '', '//fuss10.elemecdn.com/d8e8d7dc855c4d9e51d9e617a1341124jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '24');
INSERT INTO `goods` VALUES ('342', '虾仁鸭舌粥', '25.00', '1', '', '//fuss10.elemecdn.com/7027d016f8896e5ccf451598b46de010jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '24');
INSERT INTO `goods` VALUES ('343', '螺肉筒骨肉粥', '22.00', '1', '', '//fuss10.elemecdn.com/a89429c1bab52e92e33958b6f561136ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '25');
INSERT INTO `goods` VALUES ('344', '虾仁筒骨肉粥', '27.00', '5', '', '//fuss10.elemecdn.com/3de43991e74642a2ea898c18e5467a9ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '25');
INSERT INTO `goods` VALUES ('345', '花蛤筒骨肉粥', '23.00', '0', '', '//fuss10.elemecdn.com/78aa69a98208410bd6d4f4a06cdaf201jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '25');
INSERT INTO `goods` VALUES ('346', '海参筒骨肉粥', '25.00', '1', '', '//fuss10.elemecdn.com/e0023014fb7872aab1028fa17cdf3bbcjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '25');
INSERT INTO `goods` VALUES ('347', '生蠔筒骨肉粥', '26.00', '2', '', '//fuss10.elemecdn.com/170d2d4cf10e8d3a07d49f3a5d0ea003jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '25');
INSERT INTO `goods` VALUES ('348', '珍珠贝筒骨肉粥', '26.00', '1', '', '//fuss10.elemecdn.com/95d4205d497f3dfcab5ff6e03b734761jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '25');
INSERT INTO `goods` VALUES ('349', '蠔干筒骨肉粥', '25.00', '2', '', '//fuss10.elemecdn.com/a681933a874e0922d9ed39a3cc36b79cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '25');
INSERT INTO `goods` VALUES ('350', '干贝筒骨肉粥', '28.00', '1', '', '//fuss10.elemecdn.com/fac84225d528ab8faff46e32fadd9c51jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '25');
INSERT INTO `goods` VALUES ('351', '鱼翅筒骨肉粥', '28.00', '1', '', '//fuss10.elemecdn.com/8fa86fbf3f33f2ac61b198448917ff92jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '25');
INSERT INTO `goods` VALUES ('352', '石斑鱼筒骨肉粥', '25.00', '3', '', '//fuss10.elemecdn.com/aa24b4cc87d8a4a305bb2db6f534f9abjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '25');
INSERT INTO `goods` VALUES ('353', '花蟹筒骨肉粥', '27.00', '2', '', '//fuss10.elemecdn.com/3e390b22472c532e680585e8a4a6b803jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '25');
INSERT INTO `goods` VALUES ('354', '鳕鱼筒骨肉粥', '29.00', '1', '', '//fuss10.elemecdn.com/108811c1d5332aafa44363d57984e0a2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '25');
INSERT INTO `goods` VALUES ('355', '鲍鱼筒骨肉粥', '38.00', '2', '', '//fuss10.elemecdn.com/7536d4a5bc6d127db55ca61cb917eed5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '25');
INSERT INTO `goods` VALUES ('356', '澳洲鲜贝筒骨肉粥', '30.00', '1', '', '//fuss10.elemecdn.com/0f285710b63aec09cbfee5f6ce778b00jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '25');
INSERT INTO `goods` VALUES ('357', '虾姑筒骨肉粥', '31.00', '0', '', '//fuss10.elemecdn.com/fc71dd97ddeecbbfc8ab72ab43834463jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '25');
INSERT INTO `goods` VALUES ('358', '干贝鸡肉粥', '21.00', '15', '', '//fuss10.elemecdn.com/4ba3010034fc47e1308c63017ae6888ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '26');
INSERT INTO `goods` VALUES ('359', '干贝瘦肉粥', '21.00', '16', '', '//fuss10.elemecdn.com/7b4bbf5bf23c573e5a145f22721070b2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '26');
INSERT INTO `goods` VALUES ('360', '干贝鸭肉粥', '21.00', '3', '', '//fuss10.elemecdn.com/9ab61f6682e5e0c22b43ba200dc16d4fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '26');
INSERT INTO `goods` VALUES ('361', '干贝鸭肚粥', '23.00', '0', '', '//fuss10.elemecdn.com/174be2cfb15151509e5900c0b86d72ecjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '26');
INSERT INTO `goods` VALUES ('362', '干贝鸭腱粥', '23.00', '1', '', '//fuss10.elemecdn.com/29e327e6e2487a0a79d95e874cc21898jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '26');
INSERT INTO `goods` VALUES ('363', '干贝猪肚粥', '23.00', '2', '', '//fuss10.elemecdn.com/87f4be92d51fdee70d770961ec2e03dcjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '26');
INSERT INTO `goods` VALUES ('364', '干贝排骨粥', '23.00', '1', '', '//fuss10.elemecdn.com/5978c3763499356e781a947dfc5463efjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '26');
INSERT INTO `goods` VALUES ('365', '干贝猪舌粥', '23.00', '1', '', '//fuss10.elemecdn.com/113cd7fc919c992b8c8dd28b978b2cdejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '26');
INSERT INTO `goods` VALUES ('366', '干贝大肠头粥', '26.00', '1', '', '//fuss10.elemecdn.com/e8d489c762a9813b1555e854ea23dfacjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '26');
INSERT INTO `goods` VALUES ('367', '螺肉鸭腱粥', '18.00', '2', '', '//fuss10.elemecdn.com/b43e70ffbbc736fc61ef56bbe7ce961bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '27');
INSERT INTO `goods` VALUES ('368', '螺肉猪肚粥', '23.00', '2', '', '//fuss10.elemecdn.com/1a17e1e761b9a4ba85c2461ee05f8c28jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '27');
INSERT INTO `goods` VALUES ('369', '螺肉排骨粥', '23.00', '1', '', '//fuss10.elemecdn.com/1289925ff49951dbf3801e2be7c71debjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '27');
INSERT INTO `goods` VALUES ('370', '螺肉鸡肉粥', '20.00', '0', '', '//fuss10.elemecdn.com/6482c2a4c9ca025dd8d8dd7592eb6856jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '27');
INSERT INTO `goods` VALUES ('371', '螺肉鸭肉粥', '19.00', '0', '', '//fuss10.elemecdn.com/177ac7b2f5bf4451dcce6a2fc49f654bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '27');
INSERT INTO `goods` VALUES ('372', '螺肉鸭肚粥', '19.00', '1', '', '//fuss10.elemecdn.com/c278d24e209f8973778c0aad9e70d2d9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '27');
INSERT INTO `goods` VALUES ('373', '螺肉鸭心粥', '19.00', '0', '', '//fuss10.elemecdn.com/9b416aac0dca0f5962e7db0f90203bc5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '27');
INSERT INTO `goods` VALUES ('374', '螺肉鸭舌粥', '24.00', '0', '', '//fuss10.elemecdn.com/1b9daed572de79312097da3d05945bf0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '27');
INSERT INTO `goods` VALUES ('375', '螺肉大肠头粥', '24.00', '0', '', '//fuss10.elemecdn.com/0030794c57f2652ce6bfae235e58df5bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '27');
INSERT INTO `goods` VALUES ('376', '海参瘦肉粥', '23.00', '1', '', '//fuss10.elemecdn.com/da2320a200f46de90feddcbba76bf31ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '28');
INSERT INTO `goods` VALUES ('377', '海参鸭心粥', '23.00', '1', '', '//fuss10.elemecdn.com/14fc61dc127113bece6bb0fb2309f62djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '28');
INSERT INTO `goods` VALUES ('378', '海参鸭肉粥', '23.00', '0', '', '//fuss10.elemecdn.com/3c1c55703a930b2a8f6448fa877b4836jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '28');
INSERT INTO `goods` VALUES ('379', '海参鸭肚粥', '25.00', '0', '', '//fuss10.elemecdn.com/5a2c4ca957b48a697ca15c8972d9ffe8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '28');
INSERT INTO `goods` VALUES ('380', '海参猪肚粥', '26.00', '1', '', '//fuss10.elemecdn.com/035171e0f974c2d6e016235cf4236f41jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '28');
INSERT INTO `goods` VALUES ('381', '海参大肠头粥', '29.00', '0', '', '//fuss10.elemecdn.com/8bac97b986054e7a2a4ed93ac1d2374cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '28');
INSERT INTO `goods` VALUES ('382', '海参鸭舌粥', '31.00', '0', '', '//fuss10.elemecdn.com/808cd15e98a4e8473c36748dda2a73bbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '28');
INSERT INTO `goods` VALUES ('383', '海参鸡肉粥', '23.00', '0', '', '//fuss10.elemecdn.com/81f9fab1ebe517bd680bd4a175c314a3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '28');
INSERT INTO `goods` VALUES ('384', '海参鸭腱粥', '26.00', '0', '', '//fuss10.elemecdn.com/1ac6a445fd664aecd30fd07b8ff44933jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '28');
INSERT INTO `goods` VALUES ('385', '海参排骨粥', '27.00', '1', '', '//fuss10.elemecdn.com/5026e65976d91ea55113f322d5d7f078jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '28');
INSERT INTO `goods` VALUES ('386', '海参猪舌粥', '27.00', '0', '', '//fuss10.elemecdn.com/86c9b89697aef3d50c17ae9efbbc3d1ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '28');
INSERT INTO `goods` VALUES ('387', '花蛤鸭肉粥', '18.00', '0', '', '//fuss10.elemecdn.com/4330100676a0531cb12c41d25a698b9fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '29');
INSERT INTO `goods` VALUES ('388', '花蛤排骨粥', '23.00', '3', '', '//fuss10.elemecdn.com/cb056f597f87edcc91b00f71a350f650jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '29');
INSERT INTO `goods` VALUES ('389', '花蛤鸭腱粥', '18.00', '1', '', '//fuss10.elemecdn.com/e436f09a23f949d1c735550b0c94fa39jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '29');
INSERT INTO `goods` VALUES ('390', '花蛤猪肚粥', '18.00', '0', '', '//fuss10.elemecdn.com/237668a276bf399d201bfcc670bf4ff7jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '29');
INSERT INTO `goods` VALUES ('391', '花蛤鸭肚粥', '17.00', '0', '', '//fuss10.elemecdn.com/af9f49ff88e9bb22c45d8b79de8c6cc8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '29');
INSERT INTO `goods` VALUES ('392', '花蛤猪舌粥', '18.00', '0', '', '//fuss10.elemecdn.com/6ac47125d8fe0b4f10e6709dcb8caffcjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '29');
INSERT INTO `goods` VALUES ('393', '花蛤鸭舌粥', '32.00', '0', '', '//fuss10.elemecdn.com/3553813512c1d26b7f45eeaac4cf65f1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '29');
INSERT INTO `goods` VALUES ('394', '花蛤大肠头粥', '24.00', '0', '', '//fuss10.elemecdn.com/9514b4ed31f1251f159cf38f60dc0c7fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '29');
INSERT INTO `goods` VALUES ('395', '珍珠贝鸭肚粥', '18.00', '0', '', '//fuss10.elemecdn.com/5764bb05c3aa65b87840180883e534d6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '30');
INSERT INTO `goods` VALUES ('396', '珍珠贝鸡肉粥', '18.00', '0', '', '//fuss10.elemecdn.com/6364aadace61b0517e24b6b5ad92e5f7jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '30');
INSERT INTO `goods` VALUES ('397', '珍珠贝鸭心粥', '18.00', '0', '', '//fuss10.elemecdn.com/ca044fd8a7328db245d66425aa59ccedjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '30');
INSERT INTO `goods` VALUES ('398', '珍珠贝鸭肉粥', '18.00', '0', '', '//fuss10.elemecdn.com/df5f108b56cb2ffb81d9dd50889ea765jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '30');
INSERT INTO `goods` VALUES ('399', '珍珠贝排骨粥', '22.00', '1', '', '//fuss10.elemecdn.com/35b535ac43dc2d56591b6b85750ce00djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '30');
INSERT INTO `goods` VALUES ('400', '珍珠贝鸭腱粥', '21.00', '0', '', '//fuss10.elemecdn.com/2068fa52ec76bf6ed5754fcce244d516jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '30');
INSERT INTO `goods` VALUES ('401', '珍珠贝猪肚粥', '19.00', '1', '', '//fuss10.elemecdn.com/61e5b6770d9bbcba4e691da498133682jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '30');
INSERT INTO `goods` VALUES ('402', '生蠔猪舌粥', '21.00', '2', '', '//fuss10.elemecdn.com/5111869f41b4acbeda68bcfd30397fa3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '31');
INSERT INTO `goods` VALUES ('403', '生蠔鸡肉粥', '21.00', '3', '', '//fuss10.elemecdn.com/fabb37bb8b5f184822cf38e26fa37455jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '31');
INSERT INTO `goods` VALUES ('404', '生蠔鸭心粥', '21.00', '1', '', '//fuss10.elemecdn.com/7a1ae0330a89940d72b9383efb9bc694jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '31');
INSERT INTO `goods` VALUES ('405', '生蠔鸭肚粥', '23.00', '0', '', '//fuss10.elemecdn.com/6a8abf6a8a31b2373b39d7b81de1c1e8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '31');
INSERT INTO `goods` VALUES ('406', '生蠔鸭肉粥', '21.00', '0', '', '//fuss10.elemecdn.com/31965147104219b2b1ea80c787bfe116jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '31');
INSERT INTO `goods` VALUES ('407', '生蠔鸭腱粥', '22.00', '0', '', '//fuss10.elemecdn.com/413b400c17e8fd197e97cda8b3159a6fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '31');
INSERT INTO `goods` VALUES ('408', '生蠔猪肚粥', '21.00', '1', '', '//fuss10.elemecdn.com/8ea544bbf103cec687d87a2fe1032d0cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '31');
INSERT INTO `goods` VALUES ('409', '生蠔排骨粥', '23.00', '1', '', '//fuss10.elemecdn.com/1899d7c212a5a4c61f8b93d016833a55jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '31');
INSERT INTO `goods` VALUES ('410', '生蠔大肠头粥', '24.00', '1', '', '//fuss10.elemecdn.com/91df8b68a49c5caae310602b21de9d22jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '31');
INSERT INTO `goods` VALUES ('411', '花蟹鸭心粥', '23.00', '1', '', '//fuss10.elemecdn.com/81a82c76d0ba384b6c15f986f5604a97jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '32');
INSERT INTO `goods` VALUES ('412', '花蟹鸭肚粥', '23.00', '1', '', '//fuss10.elemecdn.com/27558bc5340124b8e07dfecf56f4ff09jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '32');
INSERT INTO `goods` VALUES ('413', '花蟹猪肚粥', '23.00', '3', '', '//fuss10.elemecdn.com/94f4aece4964d7f895001ab0d913582fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '32');
INSERT INTO `goods` VALUES ('414', '花蟹猪舌粥', '23.00', '1', '', '//fuss10.elemecdn.com/4985055059e1ec4e7ac90ad3f70d11eejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '32');
INSERT INTO `goods` VALUES ('415', '花蟹鸡肉粥', '23.00', '2', '', '//fuss10.elemecdn.com/3b31a970237936581331fa8fae408bdbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '32');
INSERT INTO `goods` VALUES ('416', '花蟹大肠头粥', '24.00', '3', '', '//fuss10.elemecdn.com/8ee8d19fbf2258a305610578f92b9686jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '32');
INSERT INTO `goods` VALUES ('417', '虾菇排骨粥', '29.00', '1', '', '//fuss10.elemecdn.com/d7f654a600715641b8e0eed6fe131095jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '33');
INSERT INTO `goods` VALUES ('418', '虾菇鸭心粥', '26.00', '0', '', '//fuss10.elemecdn.com/23fb2496a3d5d35d5619c6af100cccc9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '33');
INSERT INTO `goods` VALUES ('419', '虾菇猪肚粥', '26.00', '2', '', '//fuss10.elemecdn.com/a25af6c814a0ead89bb20e8735d41b2ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '33');
INSERT INTO `goods` VALUES ('420', '虾菇猪舌粥', '26.00', '1', '', '//fuss10.elemecdn.com/515493a775b5d396aeebabafc624bf41jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '33');
INSERT INTO `goods` VALUES ('421', '虾菇大肠头粥', '32.00', '0', '', '//fuss10.elemecdn.com/7e89433429fad0068ac2f57ac23e94f3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '33');
INSERT INTO `goods` VALUES ('422', '虾菇鸭舌粥', '32.00', '0', '', '//fuss10.elemecdn.com/ca55489dedc6bd6e27e6fc8b2d7d3ae4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '33');
INSERT INTO `goods` VALUES ('423', '鱼翅猪肚粥', '28.00', '3', '', '//fuss10.elemecdn.com/910718d8d839c095ac631e5bf17db357jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '34');
INSERT INTO `goods` VALUES ('424', '鱼翅排骨粥', '25.00', '3', '', '//fuss10.elemecdn.com/71b248646b3504b334d1cb7ca77c158cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '34');
INSERT INTO `goods` VALUES ('425', '鱼翅猪舌粥', '23.00', '1', '', '//fuss10.elemecdn.com/753f5fe05666b7760cf99cd78656d86cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '34');
INSERT INTO `goods` VALUES ('426', '鱼翅鸭舌粥', '32.00', '0', '', '//fuss10.elemecdn.com/b8e73bd1fba9db91e1f4d8fd9ad6e5c2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '34');
INSERT INTO `goods` VALUES ('427', '鲍鱼排骨粥', '39.00', '1', '', '//fuss10.elemecdn.com/9bf3c5f17925ab88b614b52eeb22f1a7jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '35');
INSERT INTO `goods` VALUES ('428', '鲍鱼鸭舌粥', '30.00', '0', '', '//fuss10.elemecdn.com/7143a7271ac540638a8fd7f54f9e79aejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '35');
INSERT INTO `goods` VALUES ('429', '鲍鱼（3只）', '16.00', '1', '', '//fuss10.elemecdn.com/7d2ac2f1cf4340f2759f0f7897fedf9cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '35');
INSERT INTO `goods` VALUES ('430', '鳕鱼排骨粥', '23.00', '3', '', '//fuss10.elemecdn.com/eea7424b31588fc24748ad9cbfd4da45jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '36');
INSERT INTO `goods` VALUES ('431', '鳕鱼猪肚粥', '21.00', '1', '', '//fuss10.elemecdn.com/b37333fa34661469458f3411fa005285jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '36');
INSERT INTO `goods` VALUES ('432', '鳕鱼猪舌粥', '21.00', '0', '', '//fuss10.elemecdn.com/1440474dfaa750e37cc73e9db5abdb5ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '36');
INSERT INTO `goods` VALUES ('433', '鳕鱼鸭舌粥', '23.00', '0', '', '//fuss10.elemecdn.com/6201b3bf5e6b5bc19a1373a47733f89ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '36');
INSERT INTO `goods` VALUES ('434', '鳕鱼大肠头粥', '24.00', '0', '', '//fuss10.elemecdn.com/24ff49a027730e3b07318abad611441bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '36');
INSERT INTO `goods` VALUES ('435', '澳洲鲜贝鸭腱粥', '28.00', '0', '', '//fuss10.elemecdn.com/db13ae3be6a311387a443ae2a09aa773jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '37');
INSERT INTO `goods` VALUES ('436', '澳洲鲜贝鸭舌粥', '29.00', '0', '', '//fuss10.elemecdn.com/7d82bf4a49f52051d4a3f3727755f94ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '37');
INSERT INTO `goods` VALUES ('437', '澳洲鲜贝大肠头粥', '32.00', '0', '', '//fuss10.elemecdn.com/4d8a78056b54b143a7ed5816c66237a0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '37');
INSERT INTO `goods` VALUES ('438', '澳洲鲜贝鸭心粥', '28.00', '0', '', '//fuss10.elemecdn.com/94d5fcad131d16630fe00bc5b58d11c8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '37');
INSERT INTO `goods` VALUES ('439', '澳洲鲜贝猪肚粥', '28.00', '0', '', '//fuss10.elemecdn.com/8cc2b49e6a8285b2ce9700202a674e8ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '37');
INSERT INTO `goods` VALUES ('440', '澳洲鲜贝猪舌粥', '28.00', '0', '', '//fuss10.elemecdn.com/46394ed8c89e455dff427e237c9fc7a8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '37');
INSERT INTO `goods` VALUES ('441', '澳洲鲜贝排骨粥', '28.00', '1', '', '//fuss10.elemecdn.com/2bb7a591f438238b9291df6dc48447eajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '37');
INSERT INTO `goods` VALUES ('442', '蠔干瘦肉粥', '18.00', '8', '', '//fuss10.elemecdn.com/27d61218756f61e6892a655c0e1be811jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '38');
INSERT INTO `goods` VALUES ('443', '蠔干鸡肉粥', '21.00', '1', '', '//fuss10.elemecdn.com/7df65a7188777e282849bf9891fd0d19jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '38');
INSERT INTO `goods` VALUES ('444', '蠔干鸭心粥', '21.00', '0', '', '//fuss10.elemecdn.com/a653b73d18402bbbcb86fc14fae71a80jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '38');
INSERT INTO `goods` VALUES ('445', '蠔干鸭肉粥', '21.00', '3', '', '//fuss10.elemecdn.com/5de56496a8e28913a25d7acd2871f3c2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '38');
INSERT INTO `goods` VALUES ('446', '蠔干小肠粥', '18.00', '2', '', '//fuss10.elemecdn.com/bdf86e8b5376af3195ae5193b134b894jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '38');
INSERT INTO `goods` VALUES ('447', '蠔干皮蛋瘦肉粥', '18.00', '3', '', '//fuss10.elemecdn.com/a66e2016dca9cccc8ed374b493f1858bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '38');
INSERT INTO `goods` VALUES ('448', '蠔干猪肚粥', '23.00', '1', '', '//fuss10.elemecdn.com/0876ac770b77c47152fd7d89c3a08ebbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '38');
INSERT INTO `goods` VALUES ('449', '蠔干鸭舌粥', '22.00', '2', '', '//fuss10.elemecdn.com/2d1bd8f665977a1bbbc6dd0d83312762jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '38');
INSERT INTO `goods` VALUES ('450', '蠔干排骨粥', '23.00', '2', '', '//fuss10.elemecdn.com/112873919f31537fdd6bbd5cfc2d54c8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '38');
INSERT INTO `goods` VALUES ('451', '蠔干大肠头粥', '25.00', '1', '', '//fuss10.elemecdn.com/6364ba20009c7a4083f96ead0c0f4f22jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '38');
INSERT INTO `goods` VALUES ('452', '虾仁玉米粥', '20.00', '19', '', '//fuss10.elemecdn.com/d8bac57fc9d58664b9cb789f8dd501c1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '39');
INSERT INTO `goods` VALUES ('453', '玉米鸡肉粥', '18.00', '1', '', '//fuss10.elemecdn.com/c0f0ffeda0eec9f964f9116c7bffde2cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '39');
INSERT INTO `goods` VALUES ('454', '玉米小肠粥', '18.00', '1', '', '//fuss10.elemecdn.com/4b4306edd05eab4e538c0054f14e8b19jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '39');
INSERT INTO `goods` VALUES ('455', '玉米排骨粥', '20.00', '2', '', '//fuss10.elemecdn.com/faaceb90aab64437759bbb37fc527671jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '39');
INSERT INTO `goods` VALUES ('456', '玉米瘦肉粥', '18.00', '2', '', '//fuss10.elemecdn.com/dbd9c09c8a0c1769a59c71644d01bca2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '39');
INSERT INTO `goods` VALUES ('457', '苦瓜小肠粥', '18.00', '1', '', '//fuss10.elemecdn.com/a56097e807bb90f54f75cc3aa8e156d2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '40');
INSERT INTO `goods` VALUES ('458', '苦瓜瘦肉粥', '18.00', '2', '', '//fuss10.elemecdn.com/3c1c5b8a8ebbf84ac7473b2f0ffe28dajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '40');
INSERT INTO `goods` VALUES ('459', '苦瓜排骨粥', '20.00', '4', '', '//fuss10.elemecdn.com/bdf5fada4f434df28999a36ded1bce8fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '40');
INSERT INTO `goods` VALUES ('460', '鸡腿堡+鸡腿+中可', '13.50', '181', '', '//fuss10.elemecdn.com/ded206078ee2f9c5adbcee327b679170jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('461', '鸡腿堡+鸡肉卷+中可', '15.00', '139', '', '//fuss10.elemecdn.com/63367b5ca6695d98a8cefb1934b3b709jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('462', '中可换大可', '1.00', '134', '', '//fuss10.elemecdn.com/495dbfe11548f1ab9720c4e7ebf36f53jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('463', '大可乐', '3.00', '82', '', '//fuss10.elemecdn.com/ca6d566113dd135da1711ae860d866bajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('464', '小可换中可', '1.00', '77', '', '//fuss10.elemecdn.com/495dbfe11548f1ab9720c4e7ebf36f53jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('465', '半只蜜汁鸡+鸡排堡+中可', '16.80', '57', '', '//fuss10.elemecdn.com/bd8244a46883b93a2288e7f8f95b9626jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('466', '牛肉堡+脆鸡块+小可', '9.80', '54', '', '//fuss10.elemecdn.com/0c270969f8fcef55b77e06937df5ac8cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('467', '烤全腿', '8.00', '50', '', '//fuss10.elemecdn.com/e6ca4ac55a2a6d8a6444e27efbd8b64bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('468', '上校鸡块一份', '5.00', '44', '', '//fuss10.elemecdn.com/0e500fecd26f8838e536962c5f9948dejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('469', '3个大鸡腿', '15.00', '36', '', '//fuss10.elemecdn.com/2101c9410524758437bda7fbf1ccf651jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('470', '鸡肉卷+玉米杯+小可', '9.80', '41', '', '//fuss10.elemecdn.com/c6e55ee4aad94d18680115aaadd8e001jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('471', '川香堡+炸肉串+小可', '9.80', '20', '', '//fuss10.elemecdn.com/dabe26352e54a25edf28a25367946cb2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('472', '牛肉堡+脆鸡块+小可', '9.80', '54', '', '//fuss10.elemecdn.com/0c270969f8fcef55b77e06937df5ac8cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('473', '田园堡+骨肉相连+小可', '9.80', '16', '', '//fuss10.elemecdn.com/dabe26352e54a25edf28a25367946cb2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('474', '酱爆鸡排', '10.00', '33', '外卖必点酱爆鸡排，表皮香酥肉，肉质香嫩多汁，切开中间夹带着有融化的香味浓香的奶酪，让人欲罢不能。', '//fuss10.elemecdn.com/ee71de332f55314175a3659505ff6ccbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('475', '童子鸡+川香鸡柳+小可', '15.00', '36', '', '//fuss10.elemecdn.com/a587d62e7ced0708634ff93f5ff83c37jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('476', '鸡腿堡+骨肉相连+小可', '11.50', '15', '', '//fuss10.elemecdn.com/ee4b432b2e2ff89663ce42f539c80849jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('477', '辣翅+薯条+小可', '10.50', '50', '', '//fuss10.elemecdn.com/fccf8a6425742f759fa3844425ee1c54jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('478', '鸡米花+薯条+小可', '10.50', '26', '', '//fuss10.elemecdn.com/8e33210b8f7b653244011e242edfb88djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('479', '鸡腿堡+2个蛋挞+小可', '11.50', '14', '', '//fuss10.elemecdn.com/fe406c563ad1fb854f218857afa54102jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('480', '童子鸡送小可', '12.50', '77', '', '//fuss10.elemecdn.com/a587d62e7ced0708634ff93f5ff83c37jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('481', '连心骨', '3.50', '40', '', '//fuss10.elemecdn.com/1dd34ea3aae01eaf3d68a86a2ccdb4a6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('482', '童子鸡+鸡排堡+小可', '18.00', '23', '', '//fuss10.elemecdn.com/a587d62e7ced0708634ff93f5ff83c37jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('483', '鸡排堡+川香卷', '12.00', '34', '微辣', '//fuss10.elemecdn.com/110082b6d852b4d2cd31cdf8acd72a2bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('484', '半只蜜汁鸡+鸡排堡+中可', '16.80', '57', '', '//fuss10.elemecdn.com/bd8244a46883b93a2288e7f8f95b9626jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('485', '半只烤鸡+牛肉卷+小可', '16.80', '34', '', '//fuss10.elemecdn.com/4347e524355fba37801b74ad82de61adjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('486', '鸡腿堡+3个上校鸡块+小可', '11.50', '15', '', '//fuss10.elemecdn.com/0a611517a276209d36612bb7bc8e67a9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('487', '补差价', '1.00', '4', '', '//fuss10.elemecdn.com/cc6f78972c2c4def7acdab68eb064ac1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '43');
INSERT INTO `goods` VALUES ('488', '小可换中可', '1.00', '77', '', '//fuss10.elemecdn.com/495dbfe11548f1ab9720c4e7ebf36f53jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '43');
INSERT INTO `goods` VALUES ('489', '中可换大可', '1.00', '134', '', '//fuss10.elemecdn.com/495dbfe11548f1ab9720c4e7ebf36f53jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '43');
INSERT INTO `goods` VALUES ('490', '可乐换雪碧', '0.10', '12', '', '//fuss10.elemecdn.com/0cef30ab4e1deee335a94f3881e79c0ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '43');
INSERT INTO `goods` VALUES ('491', '香辣孜然粉(3包)', '1.00', '2', '', '//fuss10.elemecdn.com/8b412a8b2b046fcb89045b285cfe1935jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '43');
INSERT INTO `goods` VALUES ('492', '番茄酱(3包)', '1.00', '6', '', '//fuss10.elemecdn.com/646b5ac5cb97e35beaf579e267470e10jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '43');
INSERT INTO `goods` VALUES ('493', '胡椒粉(4)', '1.00', '2', '', '//fuss10.elemecdn.com/409cf892db4fc3d540333318d8777fd5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '43');
INSERT INTO `goods` VALUES ('494', '抽纸（300抽）', '3.00', '5', '', '//fuss10.elemecdn.com/6b09bfaef058a1ad04622badeaa1cb29jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '43');
INSERT INTO `goods` VALUES ('495', '连心骨', '3.50', '40', '', '//fuss10.elemecdn.com/1dd34ea3aae01eaf3d68a86a2ccdb4a6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '44');
INSERT INTO `goods` VALUES ('496', '扫码送红包', '0.10', '10', '', '//fuss10.elemecdn.com/db9eada992b3f1374b092ae4a5723b5bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '44');
INSERT INTO `goods` VALUES ('497', '芝士爆浆鸡排（买一送一）', '11.00', '35', '酥脆爽口，肉质弹嫩', '//fuss10.elemecdn.com/a51407fef3677fa99c2d823cbc3ac71bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '44');
INSERT INTO `goods` VALUES ('498', '鸡排堡+川香卷', '12.00', '34', '微辣', '//fuss10.elemecdn.com/110082b6d852b4d2cd31cdf8acd72a2bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '44');
INSERT INTO `goods` VALUES ('499', '半只蜜汁鸡+鸡排堡+中可', '16.80', '57', '', '//fuss10.elemecdn.com/bd8244a46883b93a2288e7f8f95b9626jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '44');
INSERT INTO `goods` VALUES ('500', '鸡翅包饭', '10.00', '28', '', '//fuss10.elemecdn.com/f879b5f4860f36bf9d945aeb8f8efc1djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '44');
INSERT INTO `goods` VALUES ('501', '半只烤鸡+牛肉卷+小可', '16.80', '34', '', '//fuss10.elemecdn.com/4347e524355fba37801b74ad82de61adjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '44');
INSERT INTO `goods` VALUES ('502', '鸡腿堡+3个上校鸡块+小可', '11.50', '15', '', '//fuss10.elemecdn.com/0a611517a276209d36612bb7bc8e67a9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '44');
INSERT INTO `goods` VALUES ('503', '辣翅+薯条+小可', '10.50', '50', '', '//fuss10.elemecdn.com/fccf8a6425742f759fa3844425ee1c54jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '44');
INSERT INTO `goods` VALUES ('504', '鸡腿堡+2个蛋挞+小可', '11.50', '14', '', '//fuss10.elemecdn.com/fe406c563ad1fb854f218857afa54102jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '44');
INSERT INTO `goods` VALUES ('505', '鸡米花+薯条+小可', '10.50', '26', '', '//fuss10.elemecdn.com/8e33210b8f7b653244011e242edfb88djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '44');
INSERT INTO `goods` VALUES ('506', '鸡腿堡+骨肉相连+小可', '11.50', '15', '', '//fuss10.elemecdn.com/ee4b432b2e2ff89663ce42f539c80849jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '44');
INSERT INTO `goods` VALUES ('507', '童子鸡送小可', '12.50', '77', '', '//fuss10.elemecdn.com/a587d62e7ced0708634ff93f5ff83c37jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '44');
INSERT INTO `goods` VALUES ('508', '童子鸡+鸡排堡+小可', '18.00', '23', '', '//fuss10.elemecdn.com/a587d62e7ced0708634ff93f5ff83c37jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '44');
INSERT INTO `goods` VALUES ('509', '童子鸡+川香鸡柳+小可', '15.00', '36', '', '//fuss10.elemecdn.com/a587d62e7ced0708634ff93f5ff83c37jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '44');
INSERT INTO `goods` VALUES ('510', '童子鸡+板烧堡+小可', '19.00', '2', '', '//fuss10.elemecdn.com/a587d62e7ced0708634ff93f5ff83c37jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '44');
INSERT INTO `goods` VALUES ('511', '鸡肉卷+玉米杯+小可', '9.80', '41', '', '//fuss10.elemecdn.com/c6e55ee4aad94d18680115aaadd8e001jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '45');
INSERT INTO `goods` VALUES ('512', '川香堡+炸肉串+小可', '9.80', '20', '', '//fuss10.elemecdn.com/dabe26352e54a25edf28a25367946cb2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '45');
INSERT INTO `goods` VALUES ('513', '牛肉堡+脆鸡块+小可', '9.80', '54', '', '//fuss10.elemecdn.com/0c270969f8fcef55b77e06937df5ac8cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '45');
INSERT INTO `goods` VALUES ('514', '田园堡+骨肉相连+小可', '9.80', '16', '', '//fuss10.elemecdn.com/dabe26352e54a25edf28a25367946cb2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '45');
INSERT INTO `goods` VALUES ('515', '牛肉堡+鸡肉卷+中可', '15.00', '12', '', '//fuss10.elemecdn.com/fc7af8ead27a6aa4f96bdfd33efb530ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '46');
INSERT INTO `goods` VALUES ('516', '鸡腿堡+鸡腿+中可', '13.50', '181', '', '//fuss10.elemecdn.com/ded206078ee2f9c5adbcee327b679170jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '46');
INSERT INTO `goods` VALUES ('517', '鸡肉卷+薯条+中可', '14.00', '8', '', '//fuss10.elemecdn.com/963a2f1a96d6339d071ff29b727243a8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '46');
INSERT INTO `goods` VALUES ('518', '鸡腿堡+鸡肉卷+中可', '15.00', '139', '', '//fuss10.elemecdn.com/63367b5ca6695d98a8cefb1934b3b709jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '46');
INSERT INTO `goods` VALUES ('519', '鸡肉卷+烤翅+中可', '15.00', '12', '', '//fuss10.elemecdn.com/b2d6809a80173d895171fd6c8015c6edjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '46');
INSERT INTO `goods` VALUES ('520', '鸡肉卷+辣翅+中可', '15.00', '13', '', '//fuss10.elemecdn.com/5e3c7bf8ef39b8f138303a49dc87449ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '46');
INSERT INTO `goods` VALUES ('521', '板烧堡+鸡肉卷+中可', '16.00', '4', '', '//fuss10.elemecdn.com/33055048f6781a42f5667c95836e5c6djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '46');
INSERT INTO `goods` VALUES ('522', '米汉堡+烤翅+中可', '16.00', '1', '不上火系列', '//fuss10.elemecdn.com/d8a5399d96caf194c1424c9887ad3754jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '46');
INSERT INTO `goods` VALUES ('523', '米汉堡+鸡肉卷+中可', '15.00', '13', '', '//fuss10.elemecdn.com/8ecfa45112249662f39fbfd8c7e108b4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '46');
INSERT INTO `goods` VALUES ('524', '板烧堡+烤翅+中可', '15.00', '13', '不上火系列', '//fuss10.elemecdn.com/bf518efc1b5ae4be138654fd18f9e3d1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '46');
INSERT INTO `goods` VALUES ('525', '米汉堡+烤卷+中可', '17.00', '1', '不上火系列', '//fuss10.elemecdn.com/031a838233805baf689b029e0c886cdfjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '46');
INSERT INTO `goods` VALUES ('526', '鸡腿堡+烤全腿+中可', '17.00', '11', '', '//fuss10.elemecdn.com/cb1581e6449aff663bc52a6199e1ec82jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '46');
INSERT INTO `goods` VALUES ('527', '鸡肉卷+考全腿+中可', '18.00', '13', '', '//fuss10.elemecdn.com/23e937a249a0e562872031da6708c5b5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '46');
INSERT INTO `goods` VALUES ('528', '板烧堡+鸡肉卷+鸡腿+中可', '20.00', '6', '', '//fuss10.elemecdn.com/891b632132795f4b91a46fe97eb343d3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '46');
INSERT INTO `goods` VALUES ('529', '米汉堡+上校鸡块+鸡腿+中可', '20.00', '5', '', '//fuss10.elemecdn.com/d252b83f7f93a2c56e760ff9795cfee2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '46');
INSERT INTO `goods` VALUES ('530', '七虾堡+鸡腿+香辣鸡排+中可', '25.00', '1', '', '//fuss10.elemecdn.com/a4cc9e09425d5c90483d47f88129fc59jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '46');
INSERT INTO `goods` VALUES ('531', '2个汉堡香芋甜心薯条2串骨肉相连2杯中可', '26.00', '1', '', '//fuss10.elemecdn.com/1ee12f0eda5db714834de7bfdf418275jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '46');
INSERT INTO `goods` VALUES ('532', '手扒鸡+汉堡+鸡肉卷+薯', '34.00', '2', '', '//fuss10.elemecdn.com/077708e5ba822feff805171355db6221jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '46');
INSERT INTO `goods` VALUES ('533', '手扒鸡+板烧堡+泰式卷+2杯可乐', '35.00', '1', '', '//fuss10.elemecdn.com/39006e9a3eccb85b630e83cc196140d1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '46');
INSERT INTO `goods` VALUES ('534', '迷你套餐', '55.00', '1', '手扒鸡+2个鸡腿堡+鸡肉卷+鸡米花+薯条+3串骨肉相连+3杯中可', '//fuss10.elemecdn.com/5b484f0a3acb7c558aaac4b058132209jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '46');
INSERT INTO `goods` VALUES ('535', '全家桶', '78.00', '2', '炸鸡+3个鸡腿堡+3个大鸡腿+4个辣翅+薯条+香芋甜心+上校鸡块+鸡米花+1.25升可乐', '//fuss10.elemecdn.com/f4ebe4c8ce2b00cd1cbf9b471b9873fbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '46');
INSERT INTO `goods` VALUES ('536', '鸡腿堡+芝士鸡排+中可', '13.00', '7', '', '//fuss10.elemecdn.com/eeb3e5f9763f486124ed3a5293658393jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '46');
INSERT INTO `goods` VALUES ('537', '鸡肉卷+芝士鸡排+中可', '13.00', '11', '', '//fuss10.elemecdn.com/ddf59d51312e27608f2022260acac6f5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '46');
INSERT INTO `goods` VALUES ('538', '板烧堡+芝士鸡排+中可', '15.00', '2', '', '//fuss10.elemecdn.com/20e2788fdc8564b71f3ea0644f92ae4djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '46');
INSERT INTO `goods` VALUES ('539', '滋味牛肉堡+上校鸡块+中可', '12.00', '2', '浓浓的欧式奶香滋味牛肉堡不一样感觉', '//fuss10.elemecdn.com/f01bca6d06fa1f1d3d2445f3122f7125jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '47');
INSERT INTO `goods` VALUES ('540', '滋味鸡腿堡+鸡米花+中可', '13.00', '4', '浓浓的欧式奶香滋味鸡腿堡不一样的风味', '//fuss10.elemecdn.com/082f9fedf9d1bb5b960f7c3d9124f138jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '47');
INSERT INTO `goods` VALUES ('541', '滋味鸡肉卷+薯条+中可', '15.00', '8', '浓浓的欧式奶香滋味鸡肉卷给你带来不一样感觉', '//fuss10.elemecdn.com/bc3e235f17445be1affe97dcd565afedjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '47');
INSERT INTO `goods` VALUES ('542', '滋味板烧堡+滋味鸡肉卷+中可', '16.00', '15', '浓浓的欧式奶香滋味板烧堡搭配滋味卷给你带来不一样口感', '//fuss10.elemecdn.com/8ddb53bd6e195efb66258cc0badee228jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '47');
INSERT INTO `goods` VALUES ('543', '滋味鸡腿堡+薯条+中可', '14.00', '4', '浓浓的欧式奶香滋味鸡腿堡给你带来不一样感觉', '//fuss10.elemecdn.com/bea83df5aa5dd0141dd2785a55b6dd2ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '47');
INSERT INTO `goods` VALUES ('544', '滋味鸡腿堡+辣翅+中可', '15.00', '7', '浓浓的欧式奶香滋味鸡腿堡搭配鲜脆辣翅给你带来不一样口味', '//fuss10.elemecdn.com/8c14196f790fb7aeccf37a1f9a227b51jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '47');
INSERT INTO `goods` VALUES ('545', '滋味鸡腿堡+芝士鸡排+中可', '14.00', '5', '浓浓的欧式奶香滋味不一样口感', '//fuss10.elemecdn.com/61463eb5cb4a25f08fb6f3be55bc73b2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '47');
INSERT INTO `goods` VALUES ('546', '滋味鸡肉卷+芝士鸡排+中可', '15.00', '9', '浓浓的欧式奶香滋味不一样口感', '//fuss10.elemecdn.com/4ed670db58a2e1c407e6c1321a47637cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '47');
INSERT INTO `goods` VALUES ('547', '滋味板烧堡+芝士鸡排+中可', '16.00', '2', '浓浓的欧式奶香滋味不一样口感', '//fuss10.elemecdn.com/103bfe6f1ad5b45ad426ca133c9d77e1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '47');
INSERT INTO `goods` VALUES ('548', '滋味鸡腿堡+滋味鸡肉卷+中可', '16.00', '3', '浓浓的欧式奶香滋味鸡腿堡搭配滋味鸡肉卷不一样的风味不一样的口感', '//fuss10.elemecdn.com/7eff65eebf5b29ce103c6d79f6c65e5cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '47');
INSERT INTO `goods` VALUES ('549', '半只蜜汁鸡+中可', '12.00', '29', '', '//fuss10.elemecdn.com/5ba14f8d391162aa2139506990d3fb21jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '48');
INSERT INTO `goods` VALUES ('550', '3个汉堡', '15.00', '24', '', '//fuss10.elemecdn.com/ced9257d8d0c87f3aa1a195f2fee8cb6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '48');
INSERT INTO `goods` VALUES ('551', '3个大鸡腿', '15.00', '36', '', '//fuss10.elemecdn.com/2101c9410524758437bda7fbf1ccf651jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '48');
INSERT INTO `goods` VALUES ('552', '6个辣翅', '14.00', '30', '', '//fuss10.elemecdn.com/24bd41b15468ce4887fbc6c92223e731jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '48');
INSERT INTO `goods` VALUES ('553', '3个鸡肉卷', '16.00', '9', '', '//fuss10.elemecdn.com/adb9a04bc1a2a78447073a5ed5e0848ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '48');
INSERT INTO `goods` VALUES ('554', '手扒鸡送中可', '19.00', '43', '', '//fuss10.elemecdn.com/bfbf27470877e98b61169f427b214f40jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '48');
INSERT INTO `goods` VALUES ('555', '炸鸡送中可', '19.00', '4', '炸鸡送中可', '//fuss10.elemecdn.com/f5fe02ce6a9f18804bda242acca7480cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '48');
INSERT INTO `goods` VALUES ('556', '鸡腿堡+中可', '9.00', '3', '鸡腿堡+中可', '//fuss10.elemecdn.com/571fa5ae3c9f92dcb18965bbecc45181jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '48');
INSERT INTO `goods` VALUES ('557', '香辣鸡排堡买一送一', '8.00', '19', '香辣鸡排堡买一送一', '//fuss10.elemecdn.com/6b6b65c580da380f8e58f4d9101f6aaejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '48');
INSERT INTO `goods` VALUES ('558', '川香卷买一送一', '9.00', '14', '川香卷买一送一', '//fuss10.elemecdn.com/cec89c667529690661472990e9a363d3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '48');
INSERT INTO `goods` VALUES ('559', '新奥尔良烤翅', '6.00', '40', '', '//fuss10.elemecdn.com/ee0c1b2dc86f21ccae0b7a9e422de187jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '49');
INSERT INTO `goods` VALUES ('560', '上校鸡块一份', '5.00', '44', '', '//fuss10.elemecdn.com/0e500fecd26f8838e536962c5f9948dejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '49');
INSERT INTO `goods` VALUES ('561', '鸡米花', '5.00', '28', '', '//fuss10.elemecdn.com/dc23d37b79962873e5ec5719ffef941cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '49');
INSERT INTO `goods` VALUES ('562', '3串骨肉相连', '5.00', '44', '', '//fuss10.elemecdn.com/9e26a8f9e772238da76bbe25f6223a04jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '49');
INSERT INTO `goods` VALUES ('563', '玉米杯', '3.00', '8', '', '//fuss10.elemecdn.com/f5857089ea389146a4ec208b4bb76097jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '49');
INSERT INTO `goods` VALUES ('564', '玉米杯（大）', '6.00', '8', '', '//fuss10.elemecdn.com/572c7f95e65c9e4ac9cd731521eb40ffjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '49');
INSERT INTO `goods` VALUES ('565', '烤全腿', '8.00', '50', '', '//fuss10.elemecdn.com/e6ca4ac55a2a6d8a6444e27efbd8b64bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '49');
INSERT INTO `goods` VALUES ('566', '2串川香鸡柳', '5.00', '24', '', '//fuss10.elemecdn.com/b23796a4aa6b70a7c306abde7d9efbd1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '49');
INSERT INTO `goods` VALUES ('567', '大鸡腿', '6.00', '23', '', '//fuss10.elemecdn.com/f4aca0c801d24b1832ac1ed119c16032jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '49');
INSERT INTO `goods` VALUES ('568', '无骨鸡柳', '5.00', '34', '', '//fuss10.elemecdn.com/88a9857917d5ab094e59586149ad7ef4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '49');
INSERT INTO `goods` VALUES ('569', '2串鱿鱼串', '5.00', '4', '', '//fuss10.elemecdn.com/17d62a56cc7dc9fb8ad6d78878fc40cajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '49');
INSERT INTO `goods` VALUES ('570', '薯条-小薯条', '5.00', '24', '', '//fuss10.elemecdn.com/031cfd18305bd6e6666af125b9cfa30cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '49');
INSERT INTO `goods` VALUES ('571', '薯条-大薯条', '6.00', '37', '', '//fuss10.elemecdn.com/73d81cce4b9617f60c7e20f4a6c3de3ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '49');
INSERT INTO `goods` VALUES ('572', '香芋甜心', '5.00', '2', '', '//fuss10.elemecdn.com/9e96beccb40d81d3b92dd9501c5bda1ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '49');
INSERT INTO `goods` VALUES ('573', '炸肉串1串', '3.00', '11', '', '//fuss10.elemecdn.com/4db684b96b0506f9b01013c2df6f9163jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '49');
INSERT INTO `goods` VALUES ('574', '2个蛋挞', '5.00', '23', '', '//fuss10.elemecdn.com/0ffe2290399ed0a6eb2813f9443f1694jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '49');
INSERT INTO `goods` VALUES ('575', '脆皮香蕉', '5.00', '3', '', '//fuss10.elemecdn.com/dd8ee5b713f80ce6608c50693516925djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '49');
INSERT INTO `goods` VALUES ('576', '辣翅', '6.00', '22', '', '//fuss10.elemecdn.com/fccf8a6425742f759fa3844425ee1c54jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '49');
INSERT INTO `goods` VALUES ('577', '鸡腿堡', '6.00', '40', '口味微辣', '//fuss10.elemecdn.com/b6cbef4ea827aac6e234ea73f5146266jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '50');
INSERT INTO `goods` VALUES ('578', '米汉堡', '7.00', '10', '不会辣', '//fuss10.elemecdn.com/366ff0f32ad92d31d3ffadbb1a6c3893jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '50');
INSERT INTO `goods` VALUES ('579', '板烧堡', '7.00', '9', '选用超大无骨鸡腿肉烤制，鲜嫩多汁，甜中带辣。', '//fuss10.elemecdn.com/3faac7d4832d2e2e8d9b09e13863e540jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '50');
INSERT INTO `goods` VALUES ('580', '牛肉堡', '6.00', '1', '不会辣', '//fuss10.elemecdn.com/9b13c74f41cd4d4b8100745f68ad31fajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '50');
INSERT INTO `goods` VALUES ('581', '鲜虾堡', '6.00', '1', '鲜虾堡', '//fuss10.elemecdn.com/e8c72b9895c04393e104f34c1b655218jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '50');
INSERT INTO `goods` VALUES ('582', '田园堡', '6.00', '1', '田园堡', '//fuss10.elemecdn.com/d296c18b6e0bada7524e23c546c120a7jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '50');
INSERT INTO `goods` VALUES ('583', '七虾堡', '8.00', '3', '七虾堡', '//fuss10.elemecdn.com/bc0bdbfebf3cdb6f1271ccd86936b752jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '50');
INSERT INTO `goods` VALUES ('584', '虾米花', '8.00', '3', '', '//fuss10.elemecdn.com/55cba7bc76fea630bff1bbf6dd456231jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '51');
INSERT INTO `goods` VALUES ('585', '老北京鸡肉卷', '7.00', '33', '', '//fuss10.elemecdn.com/a285b364ca04c241309e59e971ed5ec5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '51');
INSERT INTO `goods` VALUES ('586', '泰式鸡肉卷', '7.00', '10', '', '//fuss10.elemecdn.com/b0f7bfcb801c32c6834b106a7b533f4ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '51');
INSERT INTO `goods` VALUES ('587', '七虾卷', '8.00', '6', '', '//fuss10.elemecdn.com/d63fd9a1ba79893e0ec19d65d1f895cejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '51');
INSERT INTO `goods` VALUES ('588', '鲜虾卷', '7.00', '2', '', '//fuss10.elemecdn.com/9e45809225633e6b43626bc667015cc9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '51');
INSERT INTO `goods` VALUES ('589', '牛肉卷', '7.00', '1', '', '//fuss10.elemecdn.com/320b1cb6c20f1e55aeca4f0505b69189jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '51');
INSERT INTO `goods` VALUES ('590', '香辣鸡排，', '6.00', '20', '', '//fuss10.elemecdn.com/5cacc341656db316cf1c91507b92a00fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '52');
INSERT INTO `goods` VALUES ('591', '甘梅鸡排', '7.00', '27', '外酥里嫩，吃完口齿带有甘梅的留香，真正满足吃货挑剔的胃口。', '//fuss10.elemecdn.com/1006f78c39a8428212a4cb2e9a80f2acjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '52');
INSERT INTO `goods` VALUES ('592', '酱爆鸡排', '10.00', '33', '外卖必点酱爆鸡排，表皮香酥肉，肉质香嫩多汁，切开中间夹带着有融化的香味浓香的奶酪，让人欲罢不能。', '//fuss10.elemecdn.com/ee71de332f55314175a3659505ff6ccbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '52');
INSERT INTO `goods` VALUES ('593', '台冠鸡排', '10.00', '5', '', '//fuss10.elemecdn.com/4954abee5de2210f803e08507bfc106fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '52');
INSERT INTO `goods` VALUES ('594', '甘梅鸡排+鸡排堡+中可', '15.00', '7', '', '//fuss10.elemecdn.com/8d451c9ec9acc414e32af93c3d2bcf66jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '52');
INSERT INTO `goods` VALUES ('595', '香辣鸡排+鸡排堡+中可', '14.00', '1', '', '//fuss10.elemecdn.com/ffc41a66aab1922f5de0cb1b75b9c01djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '52');
INSERT INTO `goods` VALUES ('596', '香辣鸡排', '6.00', '10', '表皮香酥，肉质香嫩的香辣鸡排味道很不错哦(⊙o⊙)哦', '//fuss10.elemecdn.com/5d9d14ddd12dae1eda69aacc12748423jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '52');
INSERT INTO `goods` VALUES ('597', '9寸美味披萨（牛肉味）', '35.00', '1', '送中可一杯', '//fuss10.elemecdn.com/336eb21904ca387cc861d6372d109c76jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '53');
INSERT INTO `goods` VALUES ('598', '大可乐', '3.00', '82', '', '//fuss10.elemecdn.com/ca6d566113dd135da1711ae860d866bajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '54');
INSERT INTO `goods` VALUES ('599', '大芬达', '3.00', '35', '', '//fuss10.elemecdn.com/c815aa4d721acac2a9c71eaacacba69fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '54');
INSERT INTO `goods` VALUES ('600', '大雪碧', '3.00', '13', '', '//fuss10.elemecdn.com/0cef30ab4e1deee335a94f3881e79c0ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '54');
INSERT INTO `goods` VALUES ('601', '热巧克力', '4.00', '2', '', '//fuss10.elemecdn.com/c928dff13abc54f5a621f07f2629b71bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '54');
INSERT INTO `goods` VALUES ('602', '大矿泉水', '3.50', '2', '', '//fuss10.elemecdn.com/dce82eb756b3211e5f691c31522639d8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '54');
INSERT INTO `goods` VALUES ('603', '炒油面', '10.00', '2', '', '//fuss10.elemecdn.com/60bd85c68c687e57fc3cac0d1c8a8f14jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '55');
INSERT INTO `goods` VALUES ('604', '炒刀削面', '12.00', '5', '', '//fuss10.elemecdn.com/700beac536a297f6fccbf901c6bb1a8ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '55');
INSERT INTO `goods` VALUES ('605', '白米饭', '2.00', '1', '', '//fuss10.elemecdn.com/56866c18cbf7212ff34b23ad63c71a3fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '55');
INSERT INTO `goods` VALUES ('606', '蛋炒饭', '10.00', '9', '', '//fuss10.elemecdn.com/34d78ab75da26146183eeea35f745629jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '55');
INSERT INTO `goods` VALUES ('607', '盐酥鸡套餐', '11.00', '2', '送饮料一盒', '//fuss10.elemecdn.com/f7bb64ed2d09fd60296a2e7d50756a0fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '55');
INSERT INTO `goods` VALUES ('608', '炸鸡腿饭套餐', '11.00', '8', '送饮料一盒', '//fuss10.elemecdn.com/e50fa79eaa0b3456b887b251786a3406jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '55');
INSERT INTO `goods` VALUES ('609', '炸鸡排套餐', '12.00', '1', '送饮料一盒', '//fuss10.elemecdn.com/06d20826af33cbdb4c4fe8e60180a713jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '55');
INSERT INTO `goods` VALUES ('610', '卤肉饭套餐', '12.00', '2', '送饮料一盒', '//fuss10.elemecdn.com/6f5d52d261e191ca8ffc9afbd23701d9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '55');
INSERT INTO `goods` VALUES ('611', '全腿饭套餐', '13.00', '3', '送饮料一盒', '//fuss10.elemecdn.com/7176417bb8b1c5b614e1988a76c29837jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '55');
INSERT INTO `goods` VALUES ('612', '听装青岛啤酒', '3.00', '27', '', '//fuss10.elemecdn.com/1d799944f92f3032c5ad76331489beaejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '56');
INSERT INTO `goods` VALUES ('613', '酸辣土豆丝', '15.00', '18', '', '//fuss10.elemecdn.com/d49c2206505161f14c1575ef11f9d3bajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('614', '东北酱骨架', '10.00', '29', '', '//fuss10.elemecdn.com/485bd788364b6d62c831a6a80473d0d2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('615', '茄角之恋', '25.00', '15', '', '//fuss10.elemecdn.com/a8f3131f026c9509d78187aadf237f5djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('616', '酱猪手', '32.00', '9', '', '//fuss10.elemecdn.com/48669b61a5741f9ae315745106dc9150jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('617', '麻辣小龙虾1.5斤', '88.00', '3', '适合2—3人', '//fuss10.elemecdn.com/fabf6bfd33ee4db9a5b05b4967d31c1ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('618', '蒜香小龙虾1.5斤', '88.00', '3', '', '//fuss10.elemecdn.com/25aec821eb3942fb0a9943f65bc5e1e4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('619', '麻辣小龙虾1.5斤', '88.00', '3', '适合2—3人', '//fuss10.elemecdn.com/fabf6bfd33ee4db9a5b05b4967d31c1ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '58');
INSERT INTO `goods` VALUES ('620', '麻辣小龙虾2斤', '108.00', '1', '', '//fuss10.elemecdn.com/fabf6bfd33ee4db9a5b05b4967d31c1ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '58');
INSERT INTO `goods` VALUES ('621', '蒜香小龙虾1.5斤', '88.00', '3', '', '//fuss10.elemecdn.com/25aec821eb3942fb0a9943f65bc5e1e4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '58');
INSERT INTO `goods` VALUES ('622', '蒜香小龙虾2斤', '108.00', '1', '适合3—5人', '//fuss10.elemecdn.com/25aec821eb3942fb0a9943f65bc5e1e4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '58');
INSERT INTO `goods` VALUES ('623', '青岛啤酒（大优）500ML', '2.90', '50', '不赚钱，真的不赚钱！', '//fuss10.elemecdn.com/995bed93571b90f0a94b8d7925ee6798jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '58');
INSERT INTO `goods` VALUES ('624', '白米饭', '2.00', '255', '', '//fuss10.elemecdn.com/e5131f004a090601e453c1d413d5999ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '59');
INSERT INTO `goods` VALUES ('625', '厨师团队◆想吃什你留言，如果不会我们去学', '0.00', '0', '', '//fuss10.elemecdn.com/0a1baa8b25336a690467aad165cb3cbdjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '60');
INSERT INTO `goods` VALUES ('626', '我们店位置▋软件园三期B02栋', '0.00', '0', '', '//fuss10.elemecdn.com/e4c6afe7b600692d06e900f65f13fab6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '60');
INSERT INTO `goods` VALUES ('627', '我们有包厢●要是重要接待和聚会记得提预订', '0.00', '0', '', '//fuss10.elemecdn.com/2ffcc2480f8e848d5160277da614a393jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '60');
INSERT INTO `goods` VALUES ('628', '我们店实景▋拍的没有实景漂亮', '0.00', '0', '', '//fuss10.elemecdn.com/c5dc73c6360308cefad1afbd2ebe2076jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '60');
INSERT INTO `goods` VALUES ('629', '我们店环境★拍的没有真景漂亮', '0.00', '0', '', '//fuss10.elemecdn.com/8c3d87b3f86f01f56fe8e7d03fdb871ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '60');
INSERT INTO `goods` VALUES ('630', '很多人说是小东北大厦，真不想解释了◆苦啊', '0.00', '0', '', '//fuss10.elemecdn.com/ef6f8235ceace191de7247fe7c92512cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '60');
INSERT INTO `goods` VALUES ('631', '我们一共有五家店', '0.00', '0', '翔安店：汇景购物中心三楼\n同安店：乐海城市广场四楼\n集美店：软件园三期B02栋\n泉州店：石狮市摩天城三楼\n思明店：建发悦享中心三楼', '//fuss10.elemecdn.com/6cd198a989601d6b9f1e053625a100edjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '60');
INSERT INTO `goods` VALUES ('632', '麻婆豆腐', '9.90', '21', '', '//fuss10.elemecdn.com/903af477770d441b6d0927c9bf0ca5e9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '61');
INSERT INTO `goods` VALUES ('633', '拌三丝', '9.90', '9', '', '//fuss10.elemecdn.com/3deb093713c5bc1765ac0a1e022c2eb9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '61');
INSERT INTO `goods` VALUES ('634', '拍黄瓜', '9.90', '11', '', '//fuss10.elemecdn.com/78204dc0c963097260efa0e20c6d19e4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '61');
INSERT INTO `goods` VALUES ('635', '五香花生米', '9.90', '4', '', '//fuss10.elemecdn.com/e00a7051967763374c16bf974001dd89jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '61');
INSERT INTO `goods` VALUES ('636', '松鼠鱼', '58.00', '1', '', '//fuss10.elemecdn.com/519297f2e5f03f67c25f55b597ce0c57jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '62');
INSERT INTO `goods` VALUES ('637', '东北酱骨架', '10.00', '29', '', '//fuss10.elemecdn.com/485bd788364b6d62c831a6a80473d0d2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '62');
INSERT INTO `goods` VALUES ('638', '锅包肉', '36.00', '16', '', '//fuss10.elemecdn.com/4af68744674d8065e6cb8dd367755dabjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '62');
INSERT INTO `goods` VALUES ('639', '东北自制熏鸡 半只', '29.00', '3', '', '//fuss10.elemecdn.com/cac9eb0490fb8a0c4c248aeb1e91459ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '62');
INSERT INTO `goods` VALUES ('640', '酱猪手', '32.00', '9', '', '//fuss10.elemecdn.com/48669b61a5741f9ae315745106dc9150jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '62');
INSERT INTO `goods` VALUES ('641', '新京酱肉丝', '42.00', '3', '', '//fuss10.elemecdn.com/98b2192b2074bc8e3aaf434defab969djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '62');
INSERT INTO `goods` VALUES ('642', '红烧肉', '39.00', '3', '', '//fuss10.elemecdn.com/cce2c4b79c00237e32655ccc64cd59ecjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '62');
INSERT INTO `goods` VALUES ('643', '东坡肘子', '55.00', '1', '', '//fuss10.elemecdn.com/fe15049de0c389cd793bbbd49150508djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '62');
INSERT INTO `goods` VALUES ('644', '东北自制熏鸡', '60.00', '1', '', '//fuss10.elemecdn.com/b6b62edf7a65d315e7d8f4c56d28269fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '62');
INSERT INTO `goods` VALUES ('645', '小东北肉夹馍', '39.00', '5', '', '//fuss10.elemecdn.com/9656842dc9f959020893c34d82aee4a0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '62');
INSERT INTO `goods` VALUES ('646', '土匪鸭', '62.00', '1', '', '//fuss10.elemecdn.com/e6ba1107744fbb1db92bf8205f5de584jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '62');
INSERT INTO `goods` VALUES ('647', '飘香田鸡', '69.00', '2', '', '//fuss10.elemecdn.com/ace03914fb2cc2bbc8a7e5df2dbe8275jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '63');
INSERT INTO `goods` VALUES ('648', '水煮鱼片', '42.00', '8', '', '//fuss10.elemecdn.com/64ac1dfd120a606d19050f6b3bb887cajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '63');
INSERT INTO `goods` VALUES ('649', '酸菜鱼', '68.00', '4', '', '//fuss10.elemecdn.com/07364ed45043082e410abad6f18ce0aajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '63');
INSERT INTO `goods` VALUES ('650', '泡椒田鸡', '69.00', '8', '', '//fuss10.elemecdn.com/c4ab3653d3fc8534ce44bd1a72ea52ecjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '63');
INSERT INTO `goods` VALUES ('651', '水煮牛肉', '69.00', '1', '', '//fuss10.elemecdn.com/8448682db06597ecf228724325825034jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '63');
INSERT INTO `goods` VALUES ('652', '飘香羊肉', '49.00', '1', '', '//fuss10.elemecdn.com/416e37f627db2271c29630d0daf40108jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '63');
INSERT INTO `goods` VALUES ('653', '水煮牛杂', '69.00', '1', '', '//fuss10.elemecdn.com/2baaf091e6ba4dbaee230b55310591bejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '63');
INSERT INTO `goods` VALUES ('654', '醇香白切鸡（半只）', '29.00', '4', '', '//fuss10.elemecdn.com/96e1a67029de2516aa98553e886b134ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '63');
INSERT INTO `goods` VALUES ('655', '醇香白切鸡（整只）', '56.00', '1', '', '//fuss10.elemecdn.com/562cfa95d1c6602ea720e1c06ac08c41jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '63');
INSERT INTO `goods` VALUES ('656', '口水鸡（半只）', '29.00', '14', '', '//fuss10.elemecdn.com/8dc0d9124cf788b6c1b3df0d51f094b3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '63');
INSERT INTO `goods` VALUES ('657', '口水鸡（整只）', '56.00', '4', '', '//fuss10.elemecdn.com/8dc0d9124cf788b6c1b3df0d51f094b3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '63');
INSERT INTO `goods` VALUES ('658', '地三鲜', '21.00', '9', '', '//fuss10.elemecdn.com/9897e53687644f929c495ce8986d7f0ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '64');
INSERT INTO `goods` VALUES ('659', '夫妻肺片', '36.00', '2', '', '//fuss10.elemecdn.com/80d8158431347516303f6594fd7320f5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '64');
INSERT INTO `goods` VALUES ('660', '葱爆羊肉', '32.00', '5', '', '//fuss10.elemecdn.com/f42988f1013dde6b36c49ec51a9a4276jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '64');
INSERT INTO `goods` VALUES ('661', '杂粮包', '32.00', '1', '', '//fuss10.elemecdn.com/487b6a6c34c5af830420ef33945e2118jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '64');
INSERT INTO `goods` VALUES ('662', '香椿煎蛋', '21.00', '3', '', '//fuss10.elemecdn.com/b25c700d43a19be95904c7140c011986jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '64');
INSERT INTO `goods` VALUES ('663', '酱汁干豆腐丝', '18.00', '3', '', '//fuss10.elemecdn.com/f39c83ce01d6a909b6e2bdc33c89d019jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '64');
INSERT INTO `goods` VALUES ('664', '辣白菜', '12.00', '2', '', '//fuss10.elemecdn.com/030dee7a4c9114839ec523083098b3a5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '64');
INSERT INTO `goods` VALUES ('665', '蒜泥茄子', '15.00', '6', '', '//fuss10.elemecdn.com/82f404d6f1114f6fdbe32e3fbadcfc21jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '64');
INSERT INTO `goods` VALUES ('666', '拌干豆腐丝', '18.00', '1', '', '//fuss10.elemecdn.com/53cd151a017e625a62e7317cbd33347cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '64');
INSERT INTO `goods` VALUES ('667', '熏干豆腐卷', '18.00', '3', '', '//fuss10.elemecdn.com/fcf5b8cd593de34261dfa7b8acd8a2b4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '64');
INSERT INTO `goods` VALUES ('668', '大拉皮', '22.00', '2', '', '//fuss10.elemecdn.com/f1dc91b97f5cd1326c717c879f0aba2ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '64');
INSERT INTO `goods` VALUES ('669', '酸辣蕨根粉', '18.00', '2', '', '//fuss10.elemecdn.com/fa0237e060c9e3813f7a077533687559jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '64');
INSERT INTO `goods` VALUES ('670', '水晶皮冻', '18.00', '1', '', '//fuss10.elemecdn.com/4659736015ffef4c5026e106329c0ff6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '64');
INSERT INTO `goods` VALUES ('671', '大丰收', '21.00', '2', '', '//fuss10.elemecdn.com/e4cf000e1f0af23446c17e7ab56f6794jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '64');
INSERT INTO `goods` VALUES ('672', '哈尔滨红肠', '21.00', '5', '', '//fuss10.elemecdn.com/92d5cfba942f2a0c85817f019ae6bb87jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '64');
INSERT INTO `goods` VALUES ('673', '尖椒皮蛋', '21.00', '1', '', '//fuss10.elemecdn.com/bd8c5d939020cf19aca0febb6b58fb99jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '64');
INSERT INTO `goods` VALUES ('674', '小酥肉', '22.00', '7', '', '//fuss10.elemecdn.com/57325fc28d9759825e8b7e40bca6025fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '64');
INSERT INTO `goods` VALUES ('675', '酱牛肉', '36.00', '9', '', '//fuss10.elemecdn.com/392ff1118038dbdcaf9ab4bbd3e83b5ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '64');
INSERT INTO `goods` VALUES ('676', '松仁玉米', '25.00', '2', '', '//fuss10.elemecdn.com/6a3c128d2c4e21f50cd632caf70ab211jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '64');
INSERT INTO `goods` VALUES ('677', '牛肉拍黄瓜', '25.00', '6', '', '//fuss10.elemecdn.com/efe1912316871c256cae1cf6068ab4b9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '64');
INSERT INTO `goods` VALUES ('678', '麻辣牛肉', '42.00', '1', '', '//fuss10.elemecdn.com/3966824c43423521540897cc55848a46jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '64');
INSERT INTO `goods` VALUES ('679', '溜肉段', '35.00', '5', '', '//fuss10.elemecdn.com/3201bfa0ffca30cf73791c5cddf2cbe7jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '64');
INSERT INTO `goods` VALUES ('680', '四喜拼盘', '38.00', '6', '', '//fuss10.elemecdn.com/cd2348babc8781051aa8d9344d971223jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '64');
INSERT INTO `goods` VALUES ('681', '板栗烧猪手', '39.00', '1', '', '//fuss10.elemecdn.com/c7d348e5e73ce9158a819d13403a70edjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '64');
INSERT INTO `goods` VALUES ('682', '尖椒干豆腐', '24.00', '1', '', '//fuss10.elemecdn.com/9f134f676e9662d0a8b2a23d2e1b86aajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('683', '酸辣土豆丝', '15.00', '18', '', '//fuss10.elemecdn.com/d49c2206505161f14c1575ef11f9d3bajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('684', '酸辣白菜', '15.00', '12', '', '//fuss10.elemecdn.com/7305fc252fa5d17611a61b59b57de341jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('685', '木耳炒肉', '22.00', '1', '', '//fuss10.elemecdn.com/797a70597d83d11bd337a948e41c62e0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('686', '茄角之恋', '25.00', '15', '', '//fuss10.elemecdn.com/a8f3131f026c9509d78187aadf237f5djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('687', '红烧日本豆腐', '25.00', '3', '', '//fuss10.elemecdn.com/43a15b2ba65ba134b0afd0692f4b98f6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('688', '家常豆腐', '25.00', '1', '', '//fuss10.elemecdn.com/34fd90da78913bea7fc740794b5ca31djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('689', '木须肉', '25.00', '2', '', '//fuss10.elemecdn.com/ea9ddd7766a5ab6528d1b024f17285a5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('690', '红烧鸡块', '29.00', '1', '', '//fuss10.elemecdn.com/32410dc01699d988f30e309393a111f5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('691', '回锅肉', '31.00', '6', '', '//fuss10.elemecdn.com/17ff5d48020a7fef44f7356d651c5f5ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('692', '三鲜日本豆腐', '32.00', '2', '', '//fuss10.elemecdn.com/37e8544dc8f7d6a769e8f4a761385e3ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('693', '鱼香肉丝', '29.00', '1', '', '//fuss10.elemecdn.com/9d65c76153a9dc05bbd2228631fbd43cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('694', '孜然羊肉', '35.00', '3', '', '//fuss10.elemecdn.com/54e24501b24889cc5a563e967598e715jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('695', '溜肥肠', '35.00', '3', '', '//fuss10.elemecdn.com/dd4e9adc8f7535ea6b5370f8243129dcjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('696', '野山椒炒牛肉', '36.00', '3', '', '//fuss10.elemecdn.com/cbdc1ddd6b46dc815af51415cc32ff96jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('697', '土豆烧牛肉', '36.00', '4', '', '//fuss10.elemecdn.com/7a1a7dccb5f86d23049a8f95208d6eadjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('698', '干煸四季豆', '25.00', '7', '', '//fuss10.elemecdn.com/fdfd3e58f097ef339dfe3e4bd3680bc8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('699', '金针菇日本豆腐', '25.00', '3', '', '//fuss10.elemecdn.com/8338cfed8afe8d2c88fe92b375c485f5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('700', '大盆花菜', '25.00', '8', '', '//fuss10.elemecdn.com/bb4241d1614736f3145414e6421c4732jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('701', '农家小炒肉', '25.00', '12', '', '//fuss10.elemecdn.com/fa801f70d6bed9b71ecb0b608d2c99eajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('702', '鱼香茄子煲', '25.00', '5', '', '//fuss10.elemecdn.com/49d28b43b1972ab60bef816d7f209de0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('703', '虎皮尖椒', '25.00', '1', '', '//fuss10.elemecdn.com/e26d5a6425d22f607d209838e8df491djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('704', '大盆千叶豆腐', '28.00', '1', '', '//fuss10.elemecdn.com/163f223872518373bb31e3888ddb329cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('705', '水煮肉片', '32.00', '2', '', '//fuss10.elemecdn.com/17cc910a3627317d23093d3995a3cfb4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('706', '烧汁牛肉桶', '35.00', '1', '', '//fuss10.elemecdn.com/2be01bb31bac258b9bb7287607199e2ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('707', '香辣鱿鱼须', '39.00', '1', '', '//fuss10.elemecdn.com/c6b1928227e7ccc92cc6c3ee596d037bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('708', '上汤菜心', '18.00', '1', '', '//fuss10.elemecdn.com/4105d48551385281cf3f070dc8e6740ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('709', '上汤大白菜', '18.00', '4', '', '//fuss10.elemecdn.com/19886ab620ea20523c309e4c5c660532jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('710', '上汤娃娃菜', '18.00', '7', '', '//fuss10.elemecdn.com/b278d5cef15d853c521f1bbf84f995ccjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '65');
INSERT INTO `goods` VALUES ('711', '剁椒鱼头', '56.00', '1', '', '//fuss10.elemecdn.com/a04c44445b97c0b07edc82138ed06d4bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '66');
INSERT INTO `goods` VALUES ('712', '糖醋鱼条', '25.00', '1', '', '//fuss10.elemecdn.com/3d7ba51aff81f4c77bbc043c364681bejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '66');
INSERT INTO `goods` VALUES ('713', '炸黄花鱼', '25.00', '1', '', '//fuss10.elemecdn.com/90d9be622b91a7060acaeea195c60759jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '66');
INSERT INTO `goods` VALUES ('714', '鲜虾仁炒鸡蛋', '25.00', '5', '', '//fuss10.elemecdn.com/aae4f290ade51bdfc0ff3541b21085a0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '66');
INSERT INTO `goods` VALUES ('715', '清蒸皖鱼', '56.00', '1', '', '//fuss10.elemecdn.com/78d1db16b9845ecb9eb1bc518a194c12jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '66');
INSERT INTO `goods` VALUES ('716', '剁椒豆豉蒸皖鱼', '56.00', '1', '', '//fuss10.elemecdn.com/1d5aaf75e1015e26a01cf060ee7df05fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '66');
INSERT INTO `goods` VALUES ('717', '家乡焖鱼头', '56.00', '1', '', '//fuss10.elemecdn.com/8b82deec724db9f4d6ca8650385a38d8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '66');
INSERT INTO `goods` VALUES ('718', '双色鱼头', '56.00', '1', '', '//fuss10.elemecdn.com/6deac4576a6ed7da90fde34e6e6af5c5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '66');
INSERT INTO `goods` VALUES ('719', '酱椒鱼头', '56.00', '1', '', '//fuss10.elemecdn.com/b4b4af2a1541162323703c7d2109db10jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '66');
INSERT INTO `goods` VALUES ('720', '椒盐基围虾', '61.00', '1', '', '//fuss10.elemecdn.com/343a03a502092320d1e903ea3e0dfd71jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '66');
INSERT INTO `goods` VALUES ('721', '香辣基围虾', '61.00', '0', '', '//fuss10.elemecdn.com/35c0f77ef6f5b897d20386748ff8b354jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '66');
INSERT INTO `goods` VALUES ('722', '干锅包菜', '22.00', '8', '', '//fuss10.elemecdn.com/2a7881fbc2bd634eab1ad17ae8ade037jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '67');
INSERT INTO `goods` VALUES ('723', '干锅千叶豆腐', '25.00', '1', '', '//fuss10.elemecdn.com/767ca7b523682ed12564aad7699e82aajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '67');
INSERT INTO `goods` VALUES ('724', '干锅板栗鸡', '36.00', '2', '', '//fuss10.elemecdn.com/6b72352d7aa8fbb1c203ec31e0657256jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '67');
INSERT INTO `goods` VALUES ('725', '干锅肥肠', '36.00', '5', '', '//fuss10.elemecdn.com/2da50a84ed5a9bde42399fae74e13ce7jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '67');
INSERT INTO `goods` VALUES ('726', '干锅牛杂', '42.00', '1', '', '//fuss10.elemecdn.com/70332a9d37c5c564461995fe3ccbbe59jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '67');
INSERT INTO `goods` VALUES ('727', '干锅田鸡', '42.00', '1', '', '//fuss10.elemecdn.com/34e5fd021e697abe25d7be24c541154bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '67');
INSERT INTO `goods` VALUES ('728', '铁板水晶粉', '22.00', '2', '', '//fuss10.elemecdn.com/60b73081f6d771bc0bc6c6a86b2afdd2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '67');
INSERT INTO `goods` VALUES ('729', '炒烤羊肉', '35.00', '1', '', '//fuss10.elemecdn.com/98351e0807dfbf772e0025bf88208ccejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '67');
INSERT INTO `goods` VALUES ('730', '铁板牛肉', '39.00', '1', '', '//fuss10.elemecdn.com/e0be965b64c4ae4f9be699c6be8c701djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '67');
INSERT INTO `goods` VALUES ('731', '铁板鱿鱼须', '39.00', '1', '', '//fuss10.elemecdn.com/22c5054760c7361379c55901ae39b9e0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '67');
INSERT INTO `goods` VALUES ('732', '小鸡炖蘑菇', '36.00', '1', '', '//fuss10.elemecdn.com/775ddfc5ebc04032166cbfbba5db63e1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '68');
INSERT INTO `goods` VALUES ('733', '猪肉白菜炖粉条', '28.00', '11', '', '//fuss10.elemecdn.com/f353f33db2197e7a9f3db886b8b48c6djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '68');
INSERT INTO `goods` VALUES ('734', '东北乱炖', '35.00', '4', '', '//fuss10.elemecdn.com/b82bccff4f1d0d448099dbd061dbd7e3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '68');
INSERT INTO `goods` VALUES ('735', '杀猪菜（猪红）', '36.00', '2', '', '//fuss10.elemecdn.com/dd116f88cd74bab55613ffdb9b379cb5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '68');
INSERT INTO `goods` VALUES ('736', '梅菜扣肉', '39.00', '1', '', '//fuss10.elemecdn.com/c8e61e095366c77c76e2936dc26f4212jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '68');
INSERT INTO `goods` VALUES ('737', '矿泉水', '3.00', '1', '', '//fuss10.elemecdn.com/8b8b4c0f913234c3298440fb84b4c2a0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '69');
INSERT INTO `goods` VALUES ('738', '加多宝', '5.00', '2', '', '//fuss10.elemecdn.com/863aa2fb89fc5ab1eed720113f695d5ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '69');
INSERT INTO `goods` VALUES ('739', '大雪碧', '10.00', '3', '', '//fuss10.elemecdn.com/29c39307ed927a861538c60f6230a8a0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '69');
INSERT INTO `goods` VALUES ('740', '果粒橙', '12.00', '3', '', '//fuss10.elemecdn.com/087a02fe1cd310533c12c4590cc787d3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '69');
INSERT INTO `goods` VALUES ('741', '大瓶椰汁', '15.00', '1', '', '//fuss10.elemecdn.com/e9034da1bf3383809a9db1cfeecb6339jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '69');
INSERT INTO `goods` VALUES ('742', '老青岛', '7.00', '1', '', '//fuss10.elemecdn.com/b090d309b7b9cb00a64f067f87584fe2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '69');
INSERT INTO `goods` VALUES ('743', '哈尔滨啤酒', '8.00', '1', '', '//fuss10.elemecdn.com/527bcd66d7208f96a70cd91b3a89752djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '69');
INSERT INTO `goods` VALUES ('744', '百威啤酒', '10.00', '4', '', '//fuss10.elemecdn.com/52168eda00ad58b2217e79a24a07e97cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '69');
INSERT INTO `goods` VALUES ('745', '小二锅头', '10.00', '1', '', '//fuss10.elemecdn.com/a4fb0c757d8d5140b1d1dfb455ce034djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '69');
INSERT INTO `goods` VALUES ('746', '劲酒', '12.00', '1', '', '//fuss10.elemecdn.com/c8970fb48319ba90ffb84dffe3eac81ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '69');
INSERT INTO `goods` VALUES ('747', '江小白', '29.00', '0', '', '//fuss10.elemecdn.com/52ede641ae42b680284f89f734c06729jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '69');
INSERT INTO `goods` VALUES ('748', '紫菜蛋花汤', '15.00', '4', '', '//fuss10.elemecdn.com/c413feb4c8b126c77931ef2c08ccc384jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '70');
INSERT INTO `goods` VALUES ('749', '蔬菜羹', '15.00', '1', '', '//fuss10.elemecdn.com/ba7e44bdf754746a5dc5e6184c281801jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '70');
INSERT INTO `goods` VALUES ('750', '酸辣汤', '18.00', '2', '', '//fuss10.elemecdn.com/24aeb2119d0ee19672e285ee686aa601jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '70');
INSERT INTO `goods` VALUES ('751', '蛋花玉米羹', '15.00', '1', '', '//fuss10.elemecdn.com/eb300f2fe0873391ba2a3ce45c98654ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '70');
INSERT INTO `goods` VALUES ('752', '鱼头豆腐汤', '22.00', '1', '', '//fuss10.elemecdn.com/1d89ca274254afeeaac2fa8130113ce3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '70');
INSERT INTO `goods` VALUES ('753', '小白菜汆丸子汤', '22.00', '1', '', '//fuss10.elemecdn.com/b4e6c7c61616d82b46d21a8e85ada3a4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '70');
INSERT INTO `goods` VALUES ('754', '萝卜牛腩汤', '29.00', '1', '', '//fuss10.elemecdn.com/292a3a7fe86f9cfe2d1a6529a4144ba5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '70');
INSERT INTO `goods` VALUES ('755', '玉米排骨汤', '29.00', '1', '', '//fuss10.elemecdn.com/5900f7b61640baee8a520679df84d8dajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '70');
INSERT INTO `goods` VALUES ('756', '茶树菇排骨汤', '29.00', '1', '', '//fuss10.elemecdn.com/3ff35eee5edc6e41f4aee80a49b2e6e1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '70');
INSERT INTO `goods` VALUES ('757', '猪肉大葱水饺', '16.00', '2', '', '//fuss10.elemecdn.com/45fef4f3be2168336b016cb8a8c39a6ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '71');
INSERT INTO `goods` VALUES ('758', '酸菜肉水饺', '16.00', '2', '', '//fuss10.elemecdn.com/cd31ca275577b2fe51576924fdf47c15jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '71');
INSERT INTO `goods` VALUES ('759', '韭菜肉水饺', '16.00', '5', '', '//fuss10.elemecdn.com/62b19bc9f923066150ed49b283580fe7jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '71');
INSERT INTO `goods` VALUES ('760', '白菜肉水饺', '16.00', '7', '', '//fuss10.elemecdn.com/1f89561fed5815da21088702305d276ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '71');
INSERT INTO `goods` VALUES ('761', '香菇肉水饺', '16.00', '4', '', '//fuss10.elemecdn.com/a6859c573ef469e2682e820fc736069ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '71');
INSERT INTO `goods` VALUES ('762', '扬州炒饭', '15.00', '3', '', '//fuss10.elemecdn.com/de1a0331558d7abb61d7db12e78fe8b4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '71');
INSERT INTO `goods` VALUES ('763', '香芋地瓜丸', '19.00', '1', '', '//fuss10.elemecdn.com/c49e90a22d70d1ede729f4f1c6bd0d6fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '71');
INSERT INTO `goods` VALUES ('764', '港式奶黄包', '19.00', '1', '', '//fuss10.elemecdn.com/6d189433d7602353df8556a653e462e1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '71');
INSERT INTO `goods` VALUES ('765', '黄金南瓜饼', '19.00', '1', '', '//fuss10.elemecdn.com/9705ab832a1b0eb01c8ff528c64ca708jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '71');
INSERT INTO `goods` VALUES ('766', '金银馒头', '22.00', '1', '', '//fuss10.elemecdn.com/3985041125af4faacb5ac70bebb1afd5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '71');
INSERT INTO `goods` VALUES ('767', '生煎包(4个)', '6.00', '2098', '\n主要原料: 猪肉, 韭菜', '//fuss10.elemecdn.com/c79b4b90888679fb20011df16fae73bbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('768', '茶叶蛋', '2.00', '895', '', '//fuss10.elemecdn.com/858b2cf91295915244dfe9439ef93a56jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('769', '水饺(干捞)', '8.00', '750', '特色水饺、皮薄馅满、馅采用新鲜腿肉 白菜 葱 生姜。', '//fuss10.elemecdn.com/c02ce72923bca5dc6d8760cbd7085c7fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('770', '扁食汤', '7.00', '625', '采用新鲜的后腿肉  全瘦的  请放心食喲', '//fuss10.elemecdn.com/ed166b3e90b44bc17ab0094da500171djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('771', '绿豆汤(甜)', '3.00', '506', '炎炎夏日来一碗冰冰的绿豆汤吧 清热解暑', '//fuss10.elemecdn.com/e359191e9ee845765e55ccd9b6044cb9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('772', '拌粉(葱油)', '6.00', '300', '', '//fuss10.elemecdn.com/8c7a25d4c000b13a97586b8d014b09e1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('773', '拌青菜', '7.00', '259', '\n主要原料: 生菜, 蒜薹', '//fuss10.elemecdn.com/51d1f5b8a82e9c646fe915690d9f06e4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('774', '拌粉(花生酱)', '6.00', '257', '', '//fuss10.elemecdn.com/8c7a25d4c000b13a97586b8d014b09e1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('775', '鱼丸汤', '7.00', '214', '正宗福州鱼丸', '//fuss10.elemecdn.com/2d0b3f9d198b213fb2f779314266420djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('776', '白米粥', '3.00', '191', '', '//fuss10.elemecdn.com/967284af9fb1b499192d2476648c3ccfjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('777', '萝卜干', '0.99', '76', '', '//fuss10.elemecdn.com/7acb7a375b285c9e12591d62715a5d89jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('778', '生煎包(4个)', '6.00', '2098', '\n主要原料: 猪肉, 韭菜', '//fuss10.elemecdn.com/c79b4b90888679fb20011df16fae73bbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('779', '水饺(干捞)', '8.00', '750', '特色水饺、皮薄馅满、馅采用新鲜腿肉 白菜 葱 生姜。', '//fuss10.elemecdn.com/c02ce72923bca5dc6d8760cbd7085c7fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('780', '拌扁食', '7.00', '116', '', '//fuss10.elemecdn.com/833d51b34ea59b5a25ed0a48b711a3f1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('781', '拌粗面(花生酱)', '7.00', '150', '采用特精面粉自作面条，默认是放花生酱、韭菜、豆芽、不放什么要备注哦!\n主要原料: 面粉, 韭菜, 豆芽', '//fuss10.elemecdn.com/85c43aea7e1926c0273aab0213130a4fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('782', '拌粗面(葱油)', '7.00', '147', '', '//fuss10.elemecdn.com/85c43aea7e1926c0273aab0213130a4fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('783', '拌粉(花生酱)', '6.00', '257', '', '//fuss10.elemecdn.com/8c7a25d4c000b13a97586b8d014b09e1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('784', '拌粉(葱油)', '6.00', '300', '', '//fuss10.elemecdn.com/8c7a25d4c000b13a97586b8d014b09e1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('785', '拌青菜', '7.00', '259', '\n主要原料: 生菜, 蒜薹', '//fuss10.elemecdn.com/51d1f5b8a82e9c646fe915690d9f06e4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('786', '茶叶蛋', '2.00', '895', '', '//fuss10.elemecdn.com/858b2cf91295915244dfe9439ef93a56jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '3');
INSERT INTO `goods` VALUES ('787', '紫菜汤', '3.00', '76', '', '//fuss10.elemecdn.com/ec0c3548418035cb9c4be691c66c84edjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '70');
INSERT INTO `goods` VALUES ('788', '水饺汤', '8.00', '51', '里面是包白菜 和葱花', '//fuss10.elemecdn.com/0b4ba9f53c436b5664d228a471568f3ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '70');
INSERT INTO `goods` VALUES ('789', '扁食汤', '7.00', '625', '采用新鲜的后腿肉  全瘦的  请放心食喲', '//fuss10.elemecdn.com/ed166b3e90b44bc17ab0094da500171djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '70');
INSERT INTO `goods` VALUES ('790', '清汤粉+扁食', '11.00', '39', '', '//fuss10.elemecdn.com/47de9057669a7decfb7455137840f09fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '70');
INSERT INTO `goods` VALUES ('791', '鱼丸汤', '7.00', '214', '正宗福州鱼丸', '//fuss10.elemecdn.com/2d0b3f9d198b213fb2f779314266420djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '70');
INSERT INTO `goods` VALUES ('792', '清汤面+扁食', '11.00', '23', '', '//fuss10.elemecdn.com/ed166b3e90b44bc17ab0094da500171djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '70');
INSERT INTO `goods` VALUES ('793', '清汤粉', '7.00', '37', '桂林米粉 ', '//fuss10.elemecdn.com/184ede64e9f00fefc6822bb2e15819dfjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '70');
INSERT INTO `goods` VALUES ('794', '清汤面', '7.00', '10', '传统手工面', '//fuss10.elemecdn.com/34a21a5b8f32602e636a596aca4a6e44jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '70');
INSERT INTO `goods` VALUES ('795', '白米粥', '3.00', '191', '', '//fuss10.elemecdn.com/967284af9fb1b499192d2476648c3ccfjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '76');
INSERT INTO `goods` VALUES ('796', '黑米粥(甜)', '4.00', '166', '黑色入肾，黑米具有滋阴补肾、健脾开胃、补中益气、活血化淤等功效，与普通稻米相比，黑米不仅蛋白质的含量相当高，必需氨基酸齐全，还含有大量的天然黑米色素、多种微量元素和维生素，素有‘贡米’、‘药米’、‘长寿米’之誉', '//fuss10.elemecdn.com/c65b3900b114508ce55fb1470403b44ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '76');
INSERT INTO `goods` VALUES ('797', '花生汤(甜)', '4.00', '117', '需要慢慢的熬  十几个小时熬的花生高汤', '//fuss10.elemecdn.com/9a0d4054a9d42407435213bd39b0f0ddjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '76');
INSERT INTO `goods` VALUES ('798', '绿豆汤(甜)', '3.00', '506', '炎炎夏日来一碗冰冰的绿豆汤吧 清热解暑', '//fuss10.elemecdn.com/e359191e9ee845765e55ccd9b6044cb9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '76');
INSERT INTO `goods` VALUES ('799', '玉米排骨汤', '12.00', '48', '夏天来一碗清淡点的汤  胃口十足', '//fuss10.elemecdn.com/4afbee85fabd3bc81ede159e1471ca71jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '77');
INSERT INTO `goods` VALUES ('800', '当归猪心汤', '12.00', '49', '猪心为猪的心脏，是补益食品，适用于气血不足，心烦易惊，神经衰弱，失眠多梦等症，动物的脏器较草本药物更易被人体吸收，在调养.', '//fuss10.elemecdn.com/08136cb36533f613f55ef523f343b343jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '77');
INSERT INTO `goods` VALUES ('801', '猪肝沿石橄榄', '12.00', '55', '之所以炖这个汤，因为家人都喉咙痛，石橄榄是长在山林岩壁上或附生在老树上的草本植物，具有止咳化痰、清热养阴、利湿消瘀等功效，用来煲汤，清热去火，味道清香，是闽南民间流行的一种汤类。猪肝沿是猪肝边上有筋有肉的部位，是闽南这里小吃店基本都会有的肉类', '//fuss10.elemecdn.com/cb1302eee52d69731b8347987ccd0b65jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '77');
INSERT INTO `goods` VALUES ('802', '海带丝', '1.00', '106', '袋装的哦，不是自己做的', '//fuss10.elemecdn.com/653ea9c3b15714442ececb7d74f0c97cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '78');
INSERT INTO `goods` VALUES ('803', '萝卜干', '0.99', '76', '', '//fuss10.elemecdn.com/7acb7a375b285c9e12591d62715a5d89jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '78');
INSERT INTO `goods` VALUES ('804', '榨菜', '1.00', '117', '', '//fuss10.elemecdn.com/7acb7a375b285c9e12591d62715a5d89jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '78');
INSERT INTO `goods` VALUES ('805', '花生米', '1.00', '151', '', '//fuss10.elemecdn.com/ab293a8ec87a11887ca3a2cb96882fe1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '78');
INSERT INTO `goods` VALUES ('806', '醋', '0.00', '0', '', '//fuss10.elemecdn.com/710204b8d20982a809278d1cd7ee8584jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '78');
INSERT INTO `goods` VALUES ('807', '酸菜', '1.00', '99', '', '//fuss10.elemecdn.com/1cfc1bd1295e96ed881f607fb4701637jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '78');
INSERT INTO `goods` VALUES ('808', '花生酱', '1.00', '39', '', '//fuss10.elemecdn.com/74647c77a9b191bd76452ef34e55d3a5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '78');
INSERT INTO `goods` VALUES ('809', '醋+蒜头酱', '0.00', '0', '', '//fuss10.elemecdn.com/f667b711bd8105535958308fe9bed97cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '78');
INSERT INTO `goods` VALUES ('810', '醋+辣椒酱', '0.00', '0', '', '//fuss10.elemecdn.com/a839c2fe722fb1c066bf3b0010948742jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '78');
INSERT INTO `goods` VALUES ('811', '加多宝', '5.00', '31', '', '//fuss10.elemecdn.com/3abd95adf8af8a65c2b8092f226145abjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '79');
INSERT INTO `goods` VALUES ('812', '雪碧(摩登款)', '4.50', '30', '', '//fuss10.elemecdn.com/26c5b58ea7a528f826b4a57dff85b217jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '79');
INSERT INTO `goods` VALUES ('813', '可乐(摩登款)', '4.50', '13', '', '//fuss10.elemecdn.com/9ffb66d319358aec49db76ccaa661d9bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '79');
INSERT INTO `goods` VALUES ('814', '香浓大骨汤（不辣的）', '0.10', '138', '大骨汤是不辣的', '//fuss10.elemecdn.com/e488c88e8307b2784c97d6fe991da8ebjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '80');
INSERT INTO `goods` VALUES ('815', '微辣', '0.10', '309', '', '//fuss10.elemecdn.com/e574ddeb495839148ba00366fb5c5227jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '80');
INSERT INTO `goods` VALUES ('816', '中辣', '0.10', '101', '', '//fuss10.elemecdn.com/9cb01591b9a1787b07f573740e1be03ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '80');
INSERT INTO `goods` VALUES ('817', '特辣', '0.10', '20', '', '//fuss10.elemecdn.com/9cb01591b9a1787b07f573740e1be03ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '80');
INSERT INTO `goods` VALUES ('818', '微辣微麻', '0.10', '143', '', '//fuss10.elemecdn.com/9cb01591b9a1787b07f573740e1be03ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '80');
INSERT INTO `goods` VALUES ('819', '中辣中麻', '0.10', '80', '', '//fuss10.elemecdn.com/9cb01591b9a1787b07f573740e1be03ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '80');
INSERT INTO `goods` VALUES ('820', '特辣特麻', '0.10', '26', '', '//fuss10.elemecdn.com/9cb01591b9a1787b07f573740e1be03ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '80');
INSERT INTO `goods` VALUES ('821', '米饭＊＊', '2.00', '760', '', '//fuss10.elemecdn.com/8756fce876c46eb749726f9330fd58c4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('822', '金针菇', '1.80', '741', '', '//fuss10.elemecdn.com/cb4c6c270bcc7099fa87c325fbdbc281jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('823', '娃娃菜', '1.80', '717', '', '//fuss10.elemecdn.com/5e976a023cd3e187a16bbe57854e1eb7jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('824', '牛肉卷', '3.80', '717', '', '//fuss10.elemecdn.com/2a04fc9ea2a2f7a4d9892ca9b38ee82djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('825', '豆泡', '1.80', '510', '', '//fuss10.elemecdn.com/d86a2a4151219a85bb34a06bf74b5071jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('826', '空心菜', '1.80', '509', '', '//fuss10.elemecdn.com/42fd759c72dd26ec3087fffce9a2d73ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('827', '鸭血', '1.80', '505', '', '//fuss10.elemecdn.com/04182816eae8ec372b61c999fdd83f43jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('828', '土豆片', '1.80', '438', '', '//fuss10.elemecdn.com/558cf829751ce5b037d05d500f6fcdb7jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('829', '腐竹', '1.80', '391', '', '//fuss10.elemecdn.com/364d479907660906e75cf96ee88202adjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('830', '生菜', '1.80', '385', '', '//fuss10.elemecdn.com/bbe2489467df0a1693586745c10c6ba8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('831', '蛋饺', '2.17', '150', '', '//fuss10.elemecdn.com/342ea2273f7e0432f14cd5394f0fdf83jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('832', '豆皮', '1.03', '290', '', '//fuss10.elemecdn.com/a0fd27447c2d573aeb575f165e48d1cajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('833', '千叶豆腐', '2.17', '105', '', '//fuss10.elemecdn.com/5d2fb0002b9ea1dbe9aa80f8d567fd8fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('834', '米饭＊＊', '2.00', '760', '', '//fuss10.elemecdn.com/8756fce876c46eb749726f9330fd58c4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '83');
INSERT INTO `goods` VALUES ('835', '泡面＊', '3.00', '270', '', '//fuss10.elemecdn.com/4f19d71322823b6e1e5e2217d9261278jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '83');
INSERT INTO `goods` VALUES ('836', '米粉', '3.00', '106', '', '//fuss10.elemecdn.com/041f2fbc5545d5e7bbd5098e3e6c4a71jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '83');
INSERT INTO `goods` VALUES ('837', '牛肉卷冒菜', '36.00', '54', '牛肉卷，千叶豆腐，墨鱼腰花，豆腐泡，金针菇，木耳，士豆片，生菜，豆芽，1份米饭', '//fuss10.elemecdn.com/e80926d9afb160e21c290b1f3894701fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '84');
INSERT INTO `goods` VALUES ('838', '锦绣鸭胗冒菜', '36.00', '7', '鸭胗，千叶豆腐，墨鱼腰花，豆腐泡，金针菇，木耳，士豆片，空心菜，豆芽，1份米饭', '//fuss10.elemecdn.com/754dd615d83678c12c93d901d3d6a76bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '84');
INSERT INTO `goods` VALUES ('839', '翡翠肉片冒菜', '36.00', '23', '瘦肉片，千叶豆腐，墨鱼腰花，鹌鹑蛋，豆腐泡，金针菇，木耳，士豆片，空心菜，豆芽，1份米饭', '//fuss10.elemecdn.com/47029eb0d3584e43946898b2fe4bdc85jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '84');
INSERT INTO `goods` VALUES ('840', '羊肉卷冒菜套餐', '36.00', '15', '羊肉卷，千页豆腐，墨鱼腰花，豆腐泡，金针菇，豆芽，豆皮，生菜，1份米饭', '//fuss10.elemecdn.com/48cf13596c7faaae3da0faa892f3aca7jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '84');
INSERT INTO `goods` VALUES ('841', '四喜冒菜', '36.00', '1', '鱼丸，牛肉丸，虾味丸，香菇贡丸，墨鱼腰花，千页豆腐，豆皮，豆腐泡，金针菇，木耳，豆芽，1份米饭', '//fuss10.elemecdn.com/c3d0b452c58297f14062d4a72b7f3bfejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '84');
INSERT INTO `goods` VALUES ('842', '面筋', '1.80', '0', '', '//fuss10.elemecdn.com/95edf9845d7b72743dd4922d3c2ea466jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('843', '海鲜菇', '1.80', '9', '', '//fuss10.elemecdn.com/dfeb958284739160529526aed658e063jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('844', '芋头', '1.80', '203', '', '//fuss10.elemecdn.com/0aa06bcfd053d3dbe3097ea5b41fab6ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('845', '干笋', '1.80', '71', '', '//fuss10.elemecdn.com/b0475c7a16804d97914a84b5716754dbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('846', '日本豆腐', '1.80', '159', '', '//fuss10.elemecdn.com/959823589e55ab6722466e2b9786ebd1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('847', '魔芋结', '1.80', '284', '', '//fuss10.elemecdn.com/5c06e5e02f577af63348c22ed2f7bf76jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('848', '藕片', '1.80', '237', '', '//fuss10.elemecdn.com/679e1323cd014d73209355e0bd56df57jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('849', '毛竹笋', '1.80', '219', '', '//fuss10.elemecdn.com/333583a8397a569232e3b0a88d0f3f96jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('850', '腐竹', '1.80', '391', '', '//fuss10.elemecdn.com/364d479907660906e75cf96ee88202adjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('851', '豆腐', '1.80', '186', '', '//fuss10.elemecdn.com/3631ebe5280d480184fa8e57c87b1d48jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('852', '土豆片', '1.80', '438', '', '//fuss10.elemecdn.com/558cf829751ce5b037d05d500f6fcdb7jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('853', '千张', '1.80', '259', '', '//fuss10.elemecdn.com/23624a1e9f7ab1466829dcad1e926bc5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('854', '鸭血', '1.80', '505', '', '//fuss10.elemecdn.com/04182816eae8ec372b61c999fdd83f43jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('855', '海带结', '1.80', '321', '', '//fuss10.elemecdn.com/a6b69385932ba3e9ff736fc7a00e452ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('856', '魔芋', '1.80', '66', '', '//fuss10.elemecdn.com/fc496ac8c3b58bfab244af4e65ee100ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('857', '蕨菜', '1.80', '89', '', '//fuss10.elemecdn.com/057857f4c698d9c73570cc64ca978a4bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('858', '豆泡', '1.80', '510', '', '//fuss10.elemecdn.com/d86a2a4151219a85bb34a06bf74b5071jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('859', '金针菇', '1.80', '741', '', '//fuss10.elemecdn.com/cb4c6c270bcc7099fa87c325fbdbc281jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('860', '木耳', '1.80', '179', '', '//fuss10.elemecdn.com/4de30a76302162bcddbebfc1b0c67639jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('861', '冬瓜', '1.80', '221', '', '//fuss10.elemecdn.com/b04bff092f769407dc88195aaa2cda8ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('862', '白萝卜', '1.80', '235', '', '//fuss10.elemecdn.com/ff1943b5f1afe12e938ec43520596836jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('863', '玉米', '1.80', '197', '', '//fuss10.elemecdn.com/ba22c0c57cb648c908197ac1bfe8806ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('864', '花菜', '1.80', '74', '', '//fuss10.elemecdn.com/12e51eeec264ccb69ff4b2de7b0be42cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('865', '绿豆芽', '1.80', '208', '', '//fuss10.elemecdn.com/3359c8b54573720ecbb173dc0db39e9ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('866', '空心菜', '1.80', '509', '', '//fuss10.elemecdn.com/42fd759c72dd26ec3087fffce9a2d73ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('867', '娃娃菜', '1.80', '717', '', '//fuss10.elemecdn.com/5e976a023cd3e187a16bbe57854e1eb7jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('868', '生菜', '1.80', '385', '', '//fuss10.elemecdn.com/bbe2489467df0a1693586745c10c6ba8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('869', '豆皮', '1.03', '290', '', '//fuss10.elemecdn.com/a0fd27447c2d573aeb575f165e48d1cajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('870', '绿豆粉', '1.80', '76', '', '//fuss10.elemecdn.com/edebab610fb1f0bc4e2528123fada232jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('871', '宽粉', '1.80', '225', '', '//fuss10.elemecdn.com/2515a3eb45fb5a3a5a652931bfe15a4djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '85');
INSERT INTO `goods` VALUES ('872', '黑毛肚', '3.80', '83', '', '//fuss10.elemecdn.com/1ae0ade97bbfeaaa47d6cbb7550e0fcdjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('873', '熏鸭胸肉', '3.80', '69', '', '//fuss10.elemecdn.com/c04764e1b9efcda912aef560e31e79c0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('874', '牛肉卷', '3.80', '717', '', '//fuss10.elemecdn.com/2a04fc9ea2a2f7a4d9892ca9b38ee82djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('875', '牛百叶', '3.80', '245', '', '//fuss10.elemecdn.com/b08971aa65ace8bbd9db84fd9824c75djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('876', '鹌鹑蛋', '3.80', '237', '', '//fuss10.elemecdn.com/fec235ac012c0abcc6e8fc4cd9a18a3ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('877', '瘦肉片', '3.80', '237', '', '//fuss10.elemecdn.com/4a1db7e012713878c21aa6adef700232jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('878', '羊肉卷', '3.80', '214', '', '//fuss10.elemecdn.com/eaa47090cca1bbd7562ca64783e246cejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('879', '撒尿牛丸2个', '3.80', '200', '', '//fuss10.elemecdn.com/baba474662bfdb4045e9765b49e84b34jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('880', '油炸豆皮', '3.80', '172', '', '//fuss10.elemecdn.com/d2aacc78d3f276bd1f50805ead23a9ebjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('881', '芝士年糕', '3.80', '152', '', '//fuss10.elemecdn.com/70385866536556c688035a17dc94ae62jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('882', '鸡柳', '3.80', '155', '', '//fuss10.elemecdn.com/def0b5b6750e98bb0a1dfc5d980c0e4bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('883', '蛋饺', '2.17', '150', '', '//fuss10.elemecdn.com/342ea2273f7e0432f14cd5394f0fdf83jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('884', '开花肠4个', '3.80', '140', '', '//fuss10.elemecdn.com/0a3af5a014f68bbbc8d03898989c8cfbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('885', '龙利鱼', '3.80', '156', '', '//fuss10.elemecdn.com/d8cd55b7cb32c8f4c03cfab372c1edddjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('886', '培根', '3.80', '145', '', '//fuss10.elemecdn.com/2c34f8256f57c9969a93427ae75d3badjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('887', '千叶豆腐', '2.17', '105', '', '//fuss10.elemecdn.com/5d2fb0002b9ea1dbe9aa80f8d567fd8fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('888', '大火腿片2片', '3.80', '115', '', '//fuss10.elemecdn.com/862d24e2820994f4a686f31b5b17d303jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('889', '鱼豆腐4个', '3.80', '134', '', '//fuss10.elemecdn.com/87f471ea77fe78a7547630503af7b1c0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('890', '鸡胸肉', '3.80', '121', '', '//fuss10.elemecdn.com/decf058882a2a393258e7d09ad23a7bdjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('891', '蟹棒2根', '3.80', '126', '', '//fuss10.elemecdn.com/5519fbe69f63d5987be78c7e0481e4b7jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('892', '香菇肉丸2个', '3.80', '107', '', '//fuss10.elemecdn.com/3905ba58f5f1c978fb806d1dc5dd011fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('893', '鱼丸2个', '3.80', '109', '', '//fuss10.elemecdn.com/3943bc57c5cd468463ed6ba18726e037jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('894', '亲亲肠4个', '3.80', '95', '', '//fuss10.elemecdn.com/d4840729c863290d86ea6ad23502dda2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('895', '墨鱼丸2个', '3.80', '76', '', '//fuss10.elemecdn.com/ded5a85fb0b1a47408a644e6844ce1f1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('896', '鱼片', '3.80', '95', '', '//fuss10.elemecdn.com/8a99bab798b0a899a18a9727da4a4a12jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('897', '虾丸4个', '3.80', '98', '', '//fuss10.elemecdn.com/e21a82cf6cf788f78fd408b2e5384242jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('898', '火腿肠', '3.80', '71', '', '//fuss10.elemecdn.com/fe43fec5ce01da471a63d1748b3242c0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('899', '咸蛋黄年糕', '3.80', '69', '1份3个', '//fuss10.elemecdn.com/146a598448731b3e69854fbcc188e18ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('900', '鸭键', '3.80', '94', '', '//fuss10.elemecdn.com/0222a5cfd167e121c55c4408d2a43eb6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('901', '腊肠', '3.80', '70', '', '//fuss10.elemecdn.com/5c0acd1986acec528df278769e5cd1cbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('902', '鱼籽烧1根', '3.80', '81', '', '//fuss10.elemecdn.com/1551834df7c276fbdd2cac001169c76djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('903', '墨鱼腰花', '3.80', '63', '', '//fuss10.elemecdn.com/eb3646c6c1e3f6537bcaa5e9d269f335jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('904', '黄喉', '3.80', '19', '', '//fuss10.elemecdn.com/7ff5f76012bcc3bc69c1e59f7fff3204jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '86');
INSERT INTO `goods` VALUES ('905', '维他', '6.00', '6', '', '//fuss10.elemecdn.com/6e1ea737cd76a0a90c2bc1640767ce81jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '69');
INSERT INTO `goods` VALUES ('906', '加多宝（易拉罐）', '5.00', '31', '', '//fuss10.elemecdn.com/96dfc0feeb61b2de88ef4f01323c2a52jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '69');
INSERT INTO `goods` VALUES ('907', '椰汁汁（1升）', '18.00', '1', '', '//fuss10.elemecdn.com/431d92be549f3bba3ad8261f675f98f3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '69');
INSERT INTO `goods` VALUES ('908', '果粒橙', '10.00', '7', '', '//fuss10.elemecdn.com/f3d026af3c343a39ebc5b9f3efd251b1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '69');
INSERT INTO `goods` VALUES ('909', '雪碧', '5.00', '7', '', '//fuss10.elemecdn.com/af5d34d3a37e30bf967561ea2137f667jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '69');
INSERT INTO `goods` VALUES ('910', '可口可乐', '5.00', '13', '', '//fuss10.elemecdn.com/0e7da269a89cdd60d3881cbd5e26ecefjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '69');
INSERT INTO `goods` VALUES ('911', '大雪碧', '10.00', '4', '1.25', '//fuss10.elemecdn.com/12bdea04a48ccf1d5a24113e180e616cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '69');
INSERT INTO `goods` VALUES ('912', '大可乐', '10.00', '5', '1.25升', '//fuss10.elemecdn.com/1a411b0e1967a91a906a5acc1944da79jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '69');
INSERT INTO `goods` VALUES ('913', '奶茶烧仙草', '10.00', '397', '', '//fuss10.elemecdn.com/e7c1b409b11be617375050dae9dc11e4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('914', '波霸珍珠奶茶', '12.00', '395', '', '//fuss10.elemecdn.com/3608c3fd9d62a6c53bd956b8c7ef7bfejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('915', '黑糖波霸奶茶', '15.00', '279', '', '//fuss10.elemecdn.com/d3a8694f443b5009ec2838686ef3b822jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('916', '香港鸡蛋仔', '10.00', '176', '', '//fuss10.elemecdn.com/18c49bb738e5e9208616e6e0eecab2b4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('917', '蜂蜜烧仙草', '10.00', '165', '', '//fuss10.elemecdn.com/e70479cd19c7151a59542834267d9fd4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('918', '皇家金钻奶茶', '11.00', '120', '', '//fuss10.elemecdn.com/dc04e12356c4d687af82bb8cb44de2e9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('919', '盐酥鸡', '10.00', '113', '', '//fuss10.elemecdn.com/2c75055aadfe2553108c56db420f2b1cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('920', '一颗柠檬红茶', '13.00', '94', '\n主要原料: 柠檬, 红茶', '//fuss10.elemecdn.com/2a171892de0eb94b58ee2bac467fe1d2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('921', '一颗柠檬', '13.00', '86', '', '//fuss10.elemecdn.com/6dceebe1b47cbeae4e729fa00e54eaddjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('922', '热狗', '4.00', '82', '黑胡椒', '//fuss10.elemecdn.com/8ee76cc80459b39e656ff8f41192a9c1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('923', '高山茉绿', '6.90', '27', '', '//fuss10.elemecdn.com/50d3a2497a7365cbd764f561308d2459jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('924', '皇家金钻奶茶', '6.90', '120', '', '//fuss10.elemecdn.com/dc04e12356c4d687af82bb8cb44de2e9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('925', '相思红豆奶茶', '6.90', '74', '', '//fuss10.elemecdn.com/2ca9f26a309438a0d0f568daead87726jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('926', '骨肉相连2串', '3.90', '74', '', '//fuss10.elemecdn.com/fb162506e44fa225f21d32e8f65567cajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('927', '川香鸡柳2根', '3.90', '47', '', '//fuss10.elemecdn.com/8b261b6f582142fb745c4e2e19630807jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('928', '芝士大红袍', '9.90', '31', '', '//fuss10.elemecdn.com/bb76c3b9db120f90e91952dc9becdfeajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('929', '咖啡拿铁', '9.90', '8', '', '//fuss10.elemecdn.com/c5ee72489098f2ef026e0250343d69aajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('930', '宇治珍珠抹茶', '9.90', '17', '', '//fuss10.elemecdn.com/4dab7a5f919cd620ad4a85142127fed7jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('931', '芒果四季春', '9.90', '22', '', '//fuss10.elemecdn.com/e2ce9534b259035307158c6b1d60f487jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('932', '芒果绿妍', '9.90', '6', '', '//fuss10.elemecdn.com/4ba79bde19834498e32ea76bcf5d8c11jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('933', '橙柚青茶', '9.90', '14', '', '//fuss10.elemecdn.com/dc94c49689eea864c7483977c2b20773jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('934', '蜂蜜烧仙草', '6.90', '165', '', '//fuss10.elemecdn.com/e70479cd19c7151a59542834267d9fd4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('935', '奶茶烧仙草', '6.90', '397', '', '//fuss10.elemecdn.com/e7c1b409b11be617375050dae9dc11e4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('936', '岩韵大红袍', '0.00', '17', '', '//fuss10.elemecdn.com/575860a35ea1069b43758fb577016e54jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('937', '蜂蜜柚子茶', '0.00', '67', '', '//fuss10.elemecdn.com/cf7e05a71bdc5fd66f7d4a931684a3dejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('938', '一颗柠檬红茶', '0.00', '94', '\n主要原料: 柠檬, 红茶', '//fuss10.elemecdn.com/2a171892de0eb94b58ee2bac467fe1d2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('939', '连心脆（带骨鸡肉）', '6.00', '14', '\n主要原料: 鸡肉, 鸡脆骨', '//fuss10.elemecdn.com/1dd34ea3aae01eaf3d68a86a2ccdb4a6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('940', '黄金鱿鱼圈', '7.20', '11', '\n主要原料: 鱿鱼', '//fuss10.elemecdn.com/031e72f3382cb9c26045dee642611fc0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('941', '经典普洱茶', '15.00', '10', '', '//fuss10.elemecdn.com/b141e387b5b47ae6df62a957faad01efjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '90');
INSERT INTO `goods` VALUES ('942', '岩韵大红袍', '13.00', '17', '', '//fuss10.elemecdn.com/575860a35ea1069b43758fb577016e54jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '90');
INSERT INTO `goods` VALUES ('943', '正山小种', '14.00', '6', '', '//fuss10.elemecdn.com/34c00836522dd8b6358660b98786c907jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '90');
INSERT INTO `goods` VALUES ('944', '凤凰单枞', '14.00', '1', '', '//fuss10.elemecdn.com/836969805312449d003506daa6bf2f69jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '90');
INSERT INTO `goods` VALUES ('945', '玫瑰乌龙', '13.00', '5', '', '//fuss10.elemecdn.com/f3354b67ea16af96225145c6c4f987cdjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '90');
INSERT INTO `goods` VALUES ('946', '高山茉绿', '11.00', '27', '', '//fuss10.elemecdn.com/50d3a2497a7365cbd764f561308d2459jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '90');
INSERT INTO `goods` VALUES ('947', '四季春', '13.00', '23', '', '//fuss10.elemecdn.com/a6b855e18858409fb3c947f8aa03a557jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '90');
INSERT INTO `goods` VALUES ('948', '布丁巧克力', '16.00', '8', '', '//fuss10.elemecdn.com/8715be8e62dd6b0e68cf432e58e103d5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '91');
INSERT INTO `goods` VALUES ('949', '黑糖波霸奶茶', '15.00', '279', '', '//fuss10.elemecdn.com/d3a8694f443b5009ec2838686ef3b822jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '91');
INSERT INTO `goods` VALUES ('950', '奶茶三兄弟', '15.00', '57', '', '//fuss10.elemecdn.com/cf95bbdeb039ab641f08aa5a25ab241ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '91');
INSERT INTO `goods` VALUES ('951', '皇家金钻奶茶', '11.00', '120', '', '//fuss10.elemecdn.com/dc04e12356c4d687af82bb8cb44de2e9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '91');
INSERT INTO `goods` VALUES ('952', '相思红豆奶茶', '11.00', '74', '', '//fuss10.elemecdn.com/2ca9f26a309438a0d0f568daead87726jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '91');
INSERT INTO `goods` VALUES ('953', '法式布丁奶茶', '12.00', '41', '', '//fuss10.elemecdn.com/ea5c1abca4823730eee688231600303cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '91');
INSERT INTO `goods` VALUES ('954', '椰果粒奶茶', '12.00', '72', '', '//fuss10.elemecdn.com/c03cf8d2821220b9ea345c8bbdc762dejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '91');
INSERT INTO `goods` VALUES ('955', '波霸珍珠奶茶', '12.00', '395', '', '//fuss10.elemecdn.com/3608c3fd9d62a6c53bd956b8c7ef7bfejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '91');
INSERT INTO `goods` VALUES ('956', '草莓优果粒', '13.00', '18', '', '//fuss10.elemecdn.com/f87b90920fc731c468c0243e27afcd5bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '91');
INSERT INTO `goods` VALUES ('957', '芒果优果粒', '13.00', '30', '', '//fuss10.elemecdn.com/47fa0afd983b5fee2ef760bfdd0ed314jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '91');
INSERT INTO `goods` VALUES ('958', '茶巢多福奶茶', '15.00', '44', '', '//fuss10.elemecdn.com/dc4e1d833580815cfd0b4e85d74db7cejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '91');
INSERT INTO `goods` VALUES ('959', '霸气火龙果奶盖', '22.00', '7', '\n主要原料: 火龙果, 奶油', '//fuss10.elemecdn.com/27ac0f0a9deb3bfaa7beec05bd467091jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '92');
INSERT INTO `goods` VALUES ('960', '芝士芒果奶盖', '21.00', '49', '采取新鲜芒果鲜榨', '//fuss10.elemecdn.com/431ab7d4aca4af4dcd64f7b1ccef3421jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '92');
INSERT INTO `goods` VALUES ('961', '芝士西瓜奶盖', '19.00', '91', '', '//fuss10.elemecdn.com/c689a697599a7eb444c0b296cf3adfcfjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '92');
INSERT INTO `goods` VALUES ('962', '巧克力奶盖', '17.00', '6', '', '//fuss10.elemecdn.com/7e6819d9e5884664ce96ff042c19dbf3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '92');
INSERT INTO `goods` VALUES ('963', '波霸珍珠奶盖', '16.00', '50', '', '//fuss10.elemecdn.com/c5c39bb386ff5c5700d1f87bbdf7f571jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '92');
INSERT INTO `goods` VALUES ('964', '芝士普洱茶', '17.00', '25', '', '//fuss10.elemecdn.com/98cd55fb1f2b7b7e0af83d2d12bf3700jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '92');
INSERT INTO `goods` VALUES ('965', '芝士大红袍', '15.00', '31', '', '//fuss10.elemecdn.com/bb76c3b9db120f90e91952dc9becdfeajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '92');
INSERT INTO `goods` VALUES ('966', '芝士正山小种', '16.00', '3', '', '//fuss10.elemecdn.com/e009fd1dae77bcadbbae7f9d32af40d4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '92');
INSERT INTO `goods` VALUES ('967', '芝士凤凰单枞', '16.00', '5', '', '//fuss10.elemecdn.com/5100dea4b1e1b9f25471a969b7982c55jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '92');
INSERT INTO `goods` VALUES ('968', '芝士高山茉绿', '15.00', '17', '', '//fuss10.elemecdn.com/5209f399970d9399aa0abfe58447b81ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '92');
INSERT INTO `goods` VALUES ('969', '芝士玫瑰乌龙', '15.00', '16', '', '//fuss10.elemecdn.com/6d6ebe5226cbb80360b354d93b869be1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '92');
INSERT INTO `goods` VALUES ('970', '芝士四季春', '15.00', '10', '', '//fuss10.elemecdn.com/f855ceed80825e97eb0ef52983e780b1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '92');
INSERT INTO `goods` VALUES ('971', '抹茶烧仙草', '14.00', '25', '', '//fuss10.elemecdn.com/31de45d9838a4d02c57cd1d7ab1fd700jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '93');
INSERT INTO `goods` VALUES ('972', '牛奶烧仙草', '14.00', '46', '', '//fuss10.elemecdn.com/36435b694f177c3b32007078ae33d89ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '93');
INSERT INTO `goods` VALUES ('973', '蜂蜜烧仙草', '10.00', '165', '', '//fuss10.elemecdn.com/e70479cd19c7151a59542834267d9fd4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '93');
INSERT INTO `goods` VALUES ('974', '奶茶烧仙草', '10.00', '397', '', '//fuss10.elemecdn.com/e7c1b409b11be617375050dae9dc11e4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '93');
INSERT INTO `goods` VALUES ('975', '蜂蜜柚子茶', '12.00', '67', '', '//fuss10.elemecdn.com/cf7e05a71bdc5fd66f7d4a931684a3dejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '94');
INSERT INTO `goods` VALUES ('976', '鲜百香果汁', '14.00', '30', '', '//fuss10.elemecdn.com/5e38b8d70d088577431b029b2cf15210jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '94');
INSERT INTO `goods` VALUES ('977', '鲜金桔柠檬', '14.00', '40', '', '//fuss10.elemecdn.com/f64fcfaa41324f0e1495fee2893c02b0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '94');
INSERT INTO `goods` VALUES ('978', '百香+柠檬', '14.00', '34', '', '//fuss10.elemecdn.com/620e009d274f24233d71807cc8d225f2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '94');
INSERT INTO `goods` VALUES ('979', '柠檬爱玉', '14.00', '13', '', '//fuss10.elemecdn.com/b574f9e7c511b44624a46219c1f745e7jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '94');
INSERT INTO `goods` VALUES ('980', '一颗柠檬', '13.00', '86', '', '//fuss10.elemecdn.com/6dceebe1b47cbeae4e729fa00e54eaddjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '94');
INSERT INTO `goods` VALUES ('981', '一颗柠檬红茶', '13.00', '94', '\n主要原料: 柠檬, 红茶', '//fuss10.elemecdn.com/2a171892de0eb94b58ee2bac467fe1d2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '94');
INSERT INTO `goods` VALUES ('982', '咖啡拿铁', '15.00', '8', '', '//fuss10.elemecdn.com/c5ee72489098f2ef026e0250343d69aajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '95');
INSERT INTO `goods` VALUES ('983', '摩卡咖啡', '15.00', '3', '', '//fuss10.elemecdn.com/c3be54511d3423c832304bdaee03fe06jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '95');
INSERT INTO `goods` VALUES ('984', '经典醇香咖啡', '14.00', '3', '', '//fuss10.elemecdn.com/45079deeab74de4b938a229793ce8d05jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '95');
INSERT INTO `goods` VALUES ('985', '宇治抹茶奶盖', '17.00', '19', '', '//fuss10.elemecdn.com/0569ded705ea4bfc46e3624d377057fbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '96');
INSERT INTO `goods` VALUES ('986', '宇治珍珠抹茶', '15.00', '17', '', '//fuss10.elemecdn.com/4dab7a5f919cd620ad4a85142127fed7jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '96');
INSERT INTO `goods` VALUES ('987', '宇治红豆抹茶', '15.00', '8', '', '//fuss10.elemecdn.com/332286edac1b3f5f968236a21cc948cajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '96');
INSERT INTO `goods` VALUES ('988', '超级综合水果茶', '20.00', '54', '', '//fuss10.elemecdn.com/9cfe8a2300759ca96fb284d612c0d549jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '97');
INSERT INTO `goods` VALUES ('989', '芒果四季春', '15.00', '22', '', '//fuss10.elemecdn.com/e2ce9534b259035307158c6b1d60f487jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '97');
INSERT INTO `goods` VALUES ('990', '芒果绿妍', '15.00', '6', '', '//fuss10.elemecdn.com/4ba79bde19834498e32ea76bcf5d8c11jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '97');
INSERT INTO `goods` VALUES ('991', '橙柚青茶', '15.00', '14', '', '//fuss10.elemecdn.com/dc94c49689eea864c7483977c2b20773jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '97');
INSERT INTO `goods` VALUES ('992', '霸气橙子', '18.00', '12', '', '//fuss10.elemecdn.com/9364c952cac599c4ed88d6b8105aa355jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '97');
INSERT INTO `goods` VALUES ('993', '茉莉白桃绿', '18.00', '7', '', '//fuss10.elemecdn.com/372d92884e1c98299f5ab435ccdc230cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '97');
INSERT INTO `goods` VALUES ('994', '茉莉蜜桃水果茶', '18.00', '14', '', '//fuss10.elemecdn.com/fa5aeb7f23364ddce7c6a049dfbbc85ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '97');
INSERT INTO `goods` VALUES ('995', '鲜芒果冰沙', '17.00', '20', '采用新鲜进口芒果果肉粹成冰沙', '//fuss10.elemecdn.com/2670922768c2e3beb02ab1fa6f5e5197jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '98');
INSERT INTO `goods` VALUES ('996', '红豆牛奶冰沙', '17.00', '16', '严远优质红豆加入牛奶粹成冰沙\n主要原料: 红豆, 牛奶', '//fuss10.elemecdn.com/4d62da34957892b585018adca169fcccjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '98');
INSERT INTO `goods` VALUES ('997', '现榨橙汁', '16.00', '17', '新鲜橙子现榨果汁\n主要原料: 橙子', '//fuss10.elemecdn.com/d95d15a1b6fdd34d08e3512d4d275690jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '98');
INSERT INTO `goods` VALUES ('998', '现榨西瓜汁', '16.00', '38', '新鲜西瓜现榨果汁\n主要原料: 西瓜', '//fuss10.elemecdn.com/9ce80f1a95ebf2afc1b21c84412b42ecjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '98');
INSERT INTO `goods` VALUES ('999', '现榨芒果汁', '17.00', '34', '新鲜芒果现榨果汁', '//fuss10.elemecdn.com/84d54878f4354467b1fb02f088a0cb77jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '98');
INSERT INTO `goods` VALUES ('1000', '黄金鱿鱼圈', '7.20', '11', '\n主要原料: 鱿鱼', '//fuss10.elemecdn.com/031e72f3382cb9c26045dee642611fc0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '99');
INSERT INTO `goods` VALUES ('1001', '连心脆（带骨鸡肉）', '6.00', '14', '\n主要原料: 鸡肉, 鸡脆骨', '//fuss10.elemecdn.com/1dd34ea3aae01eaf3d68a86a2ccdb4a6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '99');
INSERT INTO `goods` VALUES ('1002', '黑椒鸡块', '10.00', '13', '', '//fuss10.elemecdn.com/eb34d1f2c2eda0f353b32b05bae58789jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '99');
INSERT INTO `goods` VALUES ('1003', '牙签肉', '10.00', '55', '', '//fuss10.elemecdn.com/cdcdf9d5ba311f5d9c3938b34930ce00jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '99');
INSERT INTO `goods` VALUES ('1004', '鲜虾堡', '12.00', '16', '', '//fuss10.elemecdn.com/2eae97b95a0bc37a0104bfcbb0f0157ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '99');
INSERT INTO `goods` VALUES ('1005', '爆浆鸡排', '14.00', '48', '', '//fuss10.elemecdn.com/3c3bbe2151f008fd2236cbe70286e032jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '99');
INSERT INTO `goods` VALUES ('1006', '骨肉相连2串', '3.90', '74', '', '//fuss10.elemecdn.com/fb162506e44fa225f21d32e8f65567cajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '99');
INSERT INTO `goods` VALUES ('1007', '香辣翅根2个', '8.00', '29', '', '//fuss10.elemecdn.com/0b45467b89a72a89742ae301355777a4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '99');
INSERT INTO `goods` VALUES ('1008', '香港鸡蛋仔', '10.00', '176', '', '//fuss10.elemecdn.com/18c49bb738e5e9208616e6e0eecab2b4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '99');
INSERT INTO `goods` VALUES ('1009', '西域鸡柳', '10.00', '53', '', '//fuss10.elemecdn.com/e88b72e6b98a2d9f2699d0c2f45118c9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '99');
INSERT INTO `goods` VALUES ('1010', '藤椒鸡排', '13.00', '42', '', '//fuss10.elemecdn.com/6a607780287ee18bf351cfa48f02b637jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '99');
INSERT INTO `goods` VALUES ('1011', '薯条', '6.00', '68', '', '//fuss10.elemecdn.com/833904c01aeeee950178525ee200545fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '99');
INSERT INTO `goods` VALUES ('1012', '盐酥鸡', '10.00', '113', '', '//fuss10.elemecdn.com/2c75055aadfe2553108c56db420f2b1cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '99');
INSERT INTO `goods` VALUES ('1013', '甘梅地瓜', '10.00', '39', '', '//fuss10.elemecdn.com/b2c512ae1dc4ebf088aee300a1585ee8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '99');
INSERT INTO `goods` VALUES ('1014', '抱抱糖爆米花', '12.00', '7', '', '//fuss10.elemecdn.com/59f93edd27c408abe98c6841eedf930djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '99');
INSERT INTO `goods` VALUES ('1015', '川香鸡柳2根', '3.90', '47', '', '//fuss10.elemecdn.com/8b261b6f582142fb745c4e2e19630807jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '99');
INSERT INTO `goods` VALUES ('1016', '奥尔良烤翅', '8.00', '36', '', '//fuss10.elemecdn.com/5f5e53cf4dd2a310c04fae84fbeccaaejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '99');
INSERT INTO `goods` VALUES ('1017', '热狗', '4.00', '82', '黑胡椒', '//fuss10.elemecdn.com/8ee76cc80459b39e656ff8f41192a9c1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '99');
INSERT INTO `goods` VALUES ('1018', '香酥大鸡排', '13.00', '56', '', '//fuss10.elemecdn.com/bafd0cf48b377835615022981e864119jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '99');
INSERT INTO `goods` VALUES ('1019', '芋圆（阿达子）', '5.00', '35', '请备注那杯加料', '//fuss10.elemecdn.com/0c76b0440445078912fb32617ad593b4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '100');
INSERT INTO `goods` VALUES ('1020', '红豆', '2.50', '25', '请备注那杯加料', '//fuss10.elemecdn.com/b821c72c393e627f621ed28bfb148750jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '100');
INSERT INTO `goods` VALUES ('1021', '爱玉冻', '2.50', '24', '请备注那杯加料', '//fuss10.elemecdn.com/96176dfd1ad615fe7b2a6654eeb6c0b9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '100');
INSERT INTO `goods` VALUES ('1022', '波霸珍珠', '2.50', '47', '请备注那杯加料', '//fuss10.elemecdn.com/39f6076fbf42d79daba1397826d924c9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '100');
INSERT INTO `goods` VALUES ('1023', '皇家金钻', '2.50', '16', '请备注那杯加料', '//fuss10.elemecdn.com/707d2c30fa495ba676208991a7c1ad85jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '100');
INSERT INTO `goods` VALUES ('1024', '芝士奶盖', '5.00', '9', '请备注那杯加料', '//fuss10.elemecdn.com/2206ae1d2430d77720b441210cc0b863jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '100');
INSERT INTO `goods` VALUES ('1025', '椰果粒', '2.50', '14', '请备注那杯加料', '//fuss10.elemecdn.com/de52a7c7c5d6c417c5480d4fca07ab26jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '100');
INSERT INTO `goods` VALUES ('1026', '奥尔良烤对翅', '7.00', '100', '一对，翅尖和翅根', '//fuss10.elemecdn.com/43383996233cb98edb62f6edbf0f8d3epng.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1027', '7寸奥尔良烤鸡披萨+奶茶1杯+小吃', '34.00', '77', '套餐包括7寸奥尔良烤鸡披萨一个，原味奶茶一杯，小吃包括蛋挞一只、玉米杯一杯、德式烤肠一根（小吃三选一）。奶茶加料品种和小吃请备注。', '//fuss10.elemecdn.com/2b284d5f97222f73f92d036f4a9abe4djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1028', '台式香嫩炸鸡排', '7.00', '58', '台式鸡排，外酥里嫩', '//fuss10.elemecdn.com/7344c349fc720aa0978cf4f20225477ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1029', '意式茄汁海鲜面', '16.00', '55', '美味营养的特调茄香酱遇上嫩滑的虾仁、新鲜的鱿鱼，入口鲜甜、口感饱满，加上卖相十足，海鲜面就是当如此。', '//fuss10.elemecdn.com/586d121afeeceac6547778f123729773jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1030', '奥尔良烤鸡披萨', '69.00', '51', '浓郁细嫩的奥尔良风味烤鸡，在进口芝士的作用下，呈现全新的口感与风味，搭配各种新鲜蔬菜，是口感更加丰富，层次感非常强烈，是进店必点的披萨之一哦。\n主要原料: 鸡肉, 奶酪, 青椒, 洋葱, 玉米', '//fuss10.elemecdn.com/cf46e14f1d606b7be51965b8d0f111cbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1031', '意式肉酱面', '14.00', '49', '酸甜适口，意式风味十足！', '//fuss10.elemecdn.com/2053c268d5b42275c28d622c7db6a7dajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1032', '招牌海陆双拼尊享披萨', '79.00', '19', '虾仁，鱿鱼，香肠，牛肉...... 还有满满的芝士，一个在手，海陆美味尽享！\n主要原料: 虾仁, 鱿鱼, 鸡肉, 牛肉', '//fuss10.elemecdn.com/03985be1a2374ee972e5e9343baf261fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1033', '苏丹王D24金榴莲披萨', '88.00', '47', '进口苏丹王D24金榴莲果肉，进口芝士，甜香扑鼻，即使您平时不喜欢榴莲，也可以试试这款，不会让您失望。', '//fuss10.elemecdn.com/7aee7ba873591ce781da76591e2e1920jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1034', '甜香黄桃菠萝水果披萨', '69.00', '27', '黄桃、菠萝果肉、进口芝士在精准的温度烘烤下，果香、奶香浑然一体，入口香滑，是喜欢水果的您的不二选择。\n主要原料: 菠萝, 桃子, 奶酪', '//fuss10.elemecdn.com/a8e25a49a943a22c96b434cf5bc0137ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1035', '日式照烧鸡肉饭+饮品套餐', '19.50', '27', '香嫩软滑的日式照烧鸡肉，再搭配玉米、鸡蛋、健康蔬菜。既健康美味，又让人赏心悦目，只为注重健康搭配的你。本套餐包含照烧鸡肉饭一份，饮品一杯。\n主要原料: 鸡肉, 鸡蛋, 玉米, 西红柿', '//fuss10.elemecdn.com/4f74549e404e744a93a5f433888aa928jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1036', '日式照烧鸡肉饭+饮品套餐', '19.50', '27', '香嫩软滑的日式照烧鸡肉，再搭配玉米、鸡蛋、健康蔬菜。既健康美味，又让人赏心悦目，只为注重健康搭配的你。本套餐包含照烧鸡肉饭一份，饮品一杯。\n主要原料: 鸡肉, 鸡蛋, 玉米, 西红柿', '//fuss10.elemecdn.com/4f74549e404e744a93a5f433888aa928jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1037', '西班牙海鲜焗饭', '28.00', '8', '美味新鲜虾仁、鱿鱼经精心腌制，再添加新鲜蔬菜炒制，然后加入进口芝士焗制，满满的西班牙风情。\n主要原料: 虾仁, 鱿鱼, 洋葱, 青椒', '//fuss10.elemecdn.com/ba3537b9a6516b1eb4647a2779d0a6e0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1038', '奥尔良烤鸡披萨', '69.00', '51', '浓郁细嫩的奥尔良风味烤鸡，在进口芝士的作用下，呈现全新的口感与风味，搭配各种新鲜蔬菜，是口感更加丰富，层次感非常强烈，是进店必点的披萨之一哦。\n主要原料: 鸡肉, 奶酪, 青椒, 洋葱, 玉米', '//fuss10.elemecdn.com/cf46e14f1d606b7be51965b8d0f111cbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '103');
INSERT INTO `goods` VALUES ('1039', '苏丹王D24金榴莲披萨', '88.00', '47', '进口苏丹王D24金榴莲果肉，进口芝士，甜香扑鼻，即使您平时不喜欢榴莲，也可以试试这款，不会让您失望。', '//fuss10.elemecdn.com/7aee7ba873591ce781da76591e2e1920jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '103');
INSERT INTO `goods` VALUES ('1040', '甜香黄桃菠萝水果披萨', '69.00', '27', '黄桃、菠萝果肉、进口芝士在精准的温度烘烤下，果香、奶香浑然一体，入口香滑，是喜欢水果的您的不二选择。\n主要原料: 菠萝, 桃子, 奶酪', '//fuss10.elemecdn.com/a8e25a49a943a22c96b434cf5bc0137ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '103');
INSERT INTO `goods` VALUES ('1041', '招牌浓香黑椒牛肉披萨', '79.00', '20', '片片经秘制酱料腌制24小时的牛肉、上等进口安佳马苏里拉、各种新鲜蔬菜，在纯手工现烤饼皮尽情绽放，给您带来美妙的舌尖享受。', '//fuss10.elemecdn.com/4b524878ff5b7f3e3a8fda0db159c070jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '103');
INSERT INTO `goods` VALUES ('1042', '味多秘制罗勒海鲜披萨', '79.00', '8', '选用新鲜虾仁、鱿鱼、罗勒、蔬菜，经味多特制酱料腌制，营养与口感的绝妙结合。', '//fuss10.elemecdn.com/27e2f3d5fc6ac443cf9e17e6517322a3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '103');
INSERT INTO `goods` VALUES ('1043', '经典美式培根披萨', '76.00', '10', '口感浓郁的进口美式培根，与上等芝士在200度的温度下完美结合，配合松软酥脆的现烤披萨饼皮，经典再次回归！\n主要原料: 培根, 奶酪, 火腿, 洋葱, 青豆', '//fuss10.elemecdn.com/39ddf8e22d4ee5086af801ab45db59a2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '103');
INSERT INTO `goods` VALUES ('1044', '超级肉香满溢尊享披萨', '79.00', '7', '牛肉、培根、火腿、烟熏鸡肉......,全是肉，食肉动物的最爱，满满的肉，满满的幸福。', '//fuss10.elemecdn.com/b2498eaeb160db75256bde66a62d3011jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '103');
INSERT INTO `goods` VALUES ('1045', '日式和风蒲烧鳗鱼披萨', '79.00', '4', '新鲜出口级鳗鱼，经味多专业厨师多达8道工序精心制作，鳗鱼香滑软嫩，蒲烧味十足，满满的日式风味。\n主要原料: 鳗鱼, 奶酪, 玉米, 洋葱', '//fuss10.elemecdn.com/f8767d1c6497dc3db9eb7d478826ba91jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '103');
INSERT INTO `goods` VALUES ('1046', '特色黄桃水果榴莲双拼披萨', '79.00', '4', '榴莲的香甜、黄桃菠萝的爽口、浓郁的芝士，给您更多的口感体验。\n主要原料: 榴莲, 菠萝, 桃子, 奶酪', '//fuss10.elemecdn.com/52bfef00c2a407b15a1e802f73a5c1f6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '103');
INSERT INTO `goods` VALUES ('1047', '夏威夷风情披萨', '69.00', '5', '精选上等进口火腿、酸甜适口菠萝肉，在醇厚芝士的包裹下，火腿香浓，偶尔还会有几颗菠萝丁的味道在舌尖爆开，口感独特，层次感非常丰富。', '//fuss10.elemecdn.com/2fc1fa19f19af290029dadc4d0c90e94jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '103');
INSERT INTO `goods` VALUES ('1048', '招牌海陆双拼尊享披萨', '79.00', '19', '虾仁，鱿鱼，香肠，牛肉...... 还有满满的芝士，一个在手，海陆美味尽享！\n主要原料: 虾仁, 鱿鱼, 鸡肉, 牛肉', '//fuss10.elemecdn.com/03985be1a2374ee972e5e9343baf261fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '103');
INSERT INTO `goods` VALUES ('1049', '金牌肥牛饭+饮品套餐', '39.00', '15', '采购澳洲精选谷饲肥牛，经健康日式调理。再搭配西兰花、玉米、西红柿等新鲜营养蔬菜，味美而营养。\n主要原料: 牛肉, 鸡蛋, 西兰花, 洋葱, 玉米', '//fuss10.elemecdn.com/207da5d944186c481a339cb27b93e7e0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '104');
INSERT INTO `goods` VALUES ('1050', '黑椒猪排饭+饮品套餐', '37.00', '17', '严选新鲜猪排，加入酱料精心腌制八小时以上煎制，再配以西兰花，鸡蛋等健康食材，让您吃好的同时更注重营养搭配。\n主要原料: 猪肉, 鸡蛋, 玉米, 西兰花', '//fuss10.elemecdn.com/4486b5c0f2d662d500e1fd9432457f39jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '104');
INSERT INTO `goods` VALUES ('1051', '日式照烧鸡肉饭+饮品套餐', '19.50', '27', '香嫩软滑的日式照烧鸡肉，再搭配玉米、鸡蛋、健康蔬菜。既健康美味，又让人赏心悦目，只为注重健康搭配的你。本套餐包含照烧鸡肉饭一份，饮品一杯。\n主要原料: 鸡肉, 鸡蛋, 玉米, 西红柿', '//fuss10.elemecdn.com/4f74549e404e744a93a5f433888aa928jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '104');
INSERT INTO `goods` VALUES ('1052', '7寸菠萝黄桃披萨+营养美味便当套餐', '48.00', '1', '套餐包含7寸黄桃菠萝水果披萨一个，便当一份，饮品两杯（原味奶茶+柠檬蜂蜜红茶），饮品请备注，若无备注，我们将随机发货。', '//fuss10.elemecdn.com/0e461bf2a00067238e425b4f9f45e509jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '105');
INSERT INTO `goods` VALUES ('1053', '7寸肉香满溢披萨+营养便当饮品套餐', '57.00', '1', '套餐包含7寸肉香满溢披萨一个，便当一份，饮品两杯（原味奶茶+柠檬蜂蜜红茶），饮品请备注，若无备注，我们将随机发货。', '//fuss10.elemecdn.com/35a266203494eb8063aee2e8ea90808cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '105');
INSERT INTO `goods` VALUES ('1054', '7寸榴莲披萨+美味营养便当饮品套餐', '62.00', '2', '套餐包含7寸榴莲披萨一个，便当一份，饮品两杯（原味奶茶+柠檬蜂蜜红茶），饮品请备注，若无备注，我们将随机发货。', '//fuss10.elemecdn.com/0e461bf2a00067238e425b4f9f45e509jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '105');
INSERT INTO `goods` VALUES ('1055', '7寸牛肉披萨+美味营养便当饮品套餐', '57.00', '5', '套餐包含7寸牛肉披萨一个，便当一份，饮品两杯（原味奶茶+柠檬蜂蜜红茶），饮品请备注，若无备注，我们将随机发货。', '//fuss10.elemecdn.com/d9d2c6af22506d869167e949440ab310jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '105');
INSERT INTO `goods` VALUES ('1056', '7寸奥尔良烤鸡披萨+奶茶1杯+小吃', '34.00', '77', '套餐包括7寸奥尔良烤鸡披萨一个，原味奶茶一杯，小吃包括蛋挞一只、玉米杯一杯、德式烤肠一根（小吃三选一）。奶茶加料品种和小吃请备注。', '//fuss10.elemecdn.com/2b284d5f97222f73f92d036f4a9abe4djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '106');
INSERT INTO `goods` VALUES ('1057', '7寸黄桃菠萝披萨+奶茶1杯+小吃', '34.00', '20', '套餐包括7寸黄桃菠萝披萨一个，原味奶茶一杯，小吃蛋挞一只、玉米杯一杯、德式烤肠一根（小吃3选1），奶茶加料和小吃品种请备注。', '//fuss10.elemecdn.com/ee4b883d302c698f1418047c2ceaa298jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '106');
INSERT INTO `goods` VALUES ('1058', '7寸经典培根披萨+奶茶1杯+小吃', '38.00', '4', '套餐包括7寸经典培根披萨一个、港式丝滑原味奶茶1杯、小吃包括葡式蛋挞1只、德式烤肠一根、玉米杯一杯（小吃3选1）.奶茶加料和小吃品种请备注。', '//fuss10.elemecdn.com/b21ca7a64e1352ad50e1d6c67516ef0ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '106');
INSERT INTO `goods` VALUES ('1059', '7寸招牌海陆双拼披萨+奶茶1杯+小吃', '38.00', '9', '套餐包括7寸招牌海陆双拼披萨一个，原味奶茶1杯，小吃包括葡式蛋挞1只、德式烤肠一根、香甜玉米杯1杯（小吃3选1）小吃和奶茶加料品种请备注。', '//fuss10.elemecdn.com/54104c451982780d7f34780dd8ad0d29jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '106');
INSERT INTO `goods` VALUES ('1060', '7寸夏威夷风情披萨+奶茶1杯+小吃', '34.00', '2', '套餐包括7寸夏威夷风情披萨一个，港式原味丝滑奶茶1杯，小吃包括葡式蛋挞一只、玉米杯1杯、德式烤肠一根（小吃3选1）.奶茶加料和小吃品种请备注', '//fuss10.elemecdn.com/a8347f819008a0bb8752d8135e14bb9cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '106');
INSERT INTO `goods` VALUES ('1061', '9寸经典培根披萨+奶茶2杯+小吃', '65.00', '2', '套餐包括9寸经典培根披萨1个，港式原味丝滑奶茶2杯，小吃包括奥尔良烤翅一对、葡式蛋挞2个、玉米杯一杯、香酥太少鸡排一块（小吃3选1）.奶茶加料和小吃品种请备注。', '//fuss10.elemecdn.com/2d9fb74f7ae76c2f1077d494f2c362f3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '107');
INSERT INTO `goods` VALUES ('1062', '9寸招牌海陆双拼披萨+奶茶2杯+小吃', '66.00', '9', '套餐包括9寸海陆双拼披萨一个，港式原味丝滑奶茶2杯，小吃包括葡式蛋挞2个、奥尔良烤鸡翅一对、香甜玉米杯一杯、台式香酥鸡排一块（小吃4选1）.奶茶加料和小吃品种请备注。', '//fuss10.elemecdn.com/9d8b5c7e2aee0ce646c1233908f5b620jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '107');
INSERT INTO `goods` VALUES ('1063', '9寸夏威夷风情披萨+奶茶2杯+小吃', '63.00', '2', '套餐包括9寸夏威夷风情披萨一个，港式丝滑原味奶茶2杯，小吃包括葡式蛋挞2个、奥尔良烤鸡翅一对、玉米杯一杯、台式香酥鸡排一块（小吃4选1）.奶茶加料和小吃品种请备注。', '//fuss10.elemecdn.com/a8347f819008a0bb8752d8135e14bb9cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '107');
INSERT INTO `goods` VALUES ('1064', '9寸黄桃菠萝水果披萨+奶茶2杯+小吃', '63.00', '3', '套餐包括9寸黄桃菠萝水果披萨一个，港式原味丝滑奶茶2杯，小吃包括葡式蛋挞2个、奥尔良烤鸡翅一对、香甜玉米杯一杯、台式香酥鸡排一块（小吃4选1）.奶茶加料和小吃品种请备注。', '//fuss10.elemecdn.com/c624569e2fbff79fbf56514e180f3560jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '107');
INSERT INTO `goods` VALUES ('1065', '9寸超级肉香满溢尊享披萨+奶茶2杯+小吃', '67.00', '2', '套餐包括9寸超级肉香满溢尊享披萨一个，港式原味丝滑奶茶2杯，小吃包括葡式蛋挞2个、奥尔良烤鸡翅一对、香甜玉米杯一杯、台式香酥鸡排一块（小吃4选1）.奶茶加料和小吃品种请备注。', '//fuss10.elemecdn.com/569a628af508d559e564922f7311ff8fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '107');
INSERT INTO `goods` VALUES ('1066', '奥尔良烤鸡披萨+意式炒饭+奶茶+小吃套餐', '61.00', '2', '套餐包括7寸奥尔良烤鸡披萨一个，意式培根米炒饭一份/意式红葱鸡肉饭一份/意式黑椒烤肠饭（饭三选一）。原味奶茶2杯。小吃包括香甜玉米杯一杯、奥尔良烤翅一对、蛋挞2只，鸡排一块（小吃4选1）。请备注炒饭和小吃品种，若无备注，随机发货。', '//fuss10.elemecdn.com/cedf06eed0a3d012dd18bbdb17424602jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '107');
INSERT INTO `goods` VALUES ('1067', '12寸浓香黑椒牛肉披萨+奶茶3杯+小吃', '105.00', '3', '奶茶为港式原味丝滑奶茶，小吃为奥尔良鸡对翅、蛋挞一对、玉米杯、德式烤肠两根（四选二），选奶茶加料品种请备注。', '//fuss10.elemecdn.com/a56e9feca014d42afa574d282a6c9d85jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '108');
INSERT INTO `goods` VALUES ('1068', '12寸经典培根披萨+奶茶3杯+小吃', '99.00', '2', '奶茶为港式丝滑原味奶茶，小吃包括奥尔良烤鸡翅一对、蛋挞两只、玉米杯一杯、香酥鸡排一块（四选二），奶茶加料和小吃请备注品种', '//fuss10.elemecdn.com/5864dbb1d0c4c9c692a4edb2259290cbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '108');
INSERT INTO `goods` VALUES ('1069', '12寸黄桃菠萝水果披萨+3杯奶茶+小吃', '95.00', '2', '奶茶为原味奶茶3杯，小吃为奥尔良烤鸡翅一对、蛋挞一对、台式香酥鸡排一块、玉米杯一杯（四选二）奶茶加料和小吃请备注品种。', '//fuss10.elemecdn.com/ee4b883d302c698f1418047c2ceaa298jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '108');
INSERT INTO `goods` VALUES ('1070', '12寸奥尔良烤鸡披萨+奶茶3杯+小吃', '95.00', '2', '套餐包括12寸奥尔良烤鸡披萨一个，港式原味丝滑奶茶三杯，小吃包括奥尔良烤鸡翅一对、玉米杯一杯、香酥鸡排一块、蛋挞一对（4选2）.奶茶加料和小吃品种请备注。', '//fuss10.elemecdn.com/2b284d5f97222f73f92d036f4a9abe4djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '108');
INSERT INTO `goods` VALUES ('1071', '意式黑椒牛肉饭', '18.00', '19', '秘制牛肉、秘制酱料、黑胡椒，再经味多厨师的精心炒制，成就了这款招牌炒饭，值得一试。', '//fuss10.elemecdn.com/ea28e234753de6f7cf34d53754bf1a28jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '109');
INSERT INTO `goods` VALUES ('1072', '意式培根玉米饭', '17.00', '5', '进口培根，配上香甜多汁的玉米、青椒、洋葱等新鲜蔬菜精心炒制，美味又营养。', '//fuss10.elemecdn.com/69c4803826661fe28863631c2655596bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '109');
INSERT INTO `goods` VALUES ('1073', '意式红葱鸡肉饭', '16.00', '5', '香浓的烟熏鸡肉，配上秘制红葱酱，炒饭粒粒饱满、颗颗入味，在配以新鲜蔬菜，好吃看得见。\n主要原料: 鸡肉, 大米, 青椒, 西兰花', '//fuss10.elemecdn.com/3f67d9dc58af00f89d8080ec135eae48jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '109');
INSERT INTO `goods` VALUES ('1074', '西班牙海鲜焗饭', '28.00', '8', '美味新鲜虾仁、鱿鱼经精心腌制，再添加新鲜蔬菜炒制，然后加入进口芝士焗制，满满的西班牙风情。\n主要原料: 虾仁, 鱿鱼, 洋葱, 青椒', '//fuss10.elemecdn.com/ba3537b9a6516b1eb4647a2779d0a6e0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '109');
INSERT INTO `goods` VALUES ('1075', '意式黑椒牛肉焗饭', '28.00', '4', '牛肉的美味，芝士的丝滑，在这份牛肉焗饭中体现得淋漓尽致，不得不尝。\n主要原料: 牛肉, 奶酪, 洋葱', '//fuss10.elemecdn.com/97b1de955629d62a87c69e0f9a2802dejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '109');
INSERT INTO `goods` VALUES ('1076', '黑椒烤肠饭', '16.00', '2', '德式烤肠与醇厚的黑椒酱的相遇，美味十足！', '//fuss10.elemecdn.com/7d34ae9e4acec9d499d295df340189ecjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '109');
INSERT INTO `goods` VALUES ('1077', '意式肉酱面', '14.00', '49', '酸甜适口，意式风味十足！', '//fuss10.elemecdn.com/2053c268d5b42275c28d622c7db6a7dajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '110');
INSERT INTO `goods` VALUES ('1078', '意式黑椒蘑菇面', '14.00', '6', '嫩滑的小蘑菇，配上黑胡椒、意面、特制酱料，美味和营养并存。', '//fuss10.elemecdn.com/b71cec9cdf96be6dcb6749f512e2419ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '110');
INSERT INTO `goods` VALUES ('1079', '意式黑椒牛肉面', '16.00', '13', '秘制牛肉、味多特制黑椒酱汁、纯正意大利面条、恰到好处的烹调，成就这本店的这款招牌意面——黑椒牛肉面。', '//fuss10.elemecdn.com/e2229c08592aef51a9e28645b36922e0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '110');
INSERT INTO `goods` VALUES ('1080', '意式茄汁海鲜面', '16.00', '55', '美味营养的特调茄香酱遇上嫩滑的虾仁、新鲜的鱿鱼，入口鲜甜、口感饱满，加上卖相十足，海鲜面就是当如此。', '//fuss10.elemecdn.com/586d121afeeceac6547778f123729773jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '110');
INSERT INTO `goods` VALUES ('1081', '意式黑椒烤肠面', '16.00', '1', '上等黑胡椒、纯肉德式烤肠、新鲜蔬菜和意面的搭配，想想都很美味。', '//fuss10.elemecdn.com/14c80bd42046f13b60dae4b5e7f23b02jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '110');
INSERT INTO `goods` VALUES ('1082', '意式茄汁培根面', '16.00', '4', '进口培根和茄香酱的经典搭配，加上新鲜蔬菜的点缀，让人胃口大开，欲罢不能。', '//fuss10.elemecdn.com/f86b337c465a99166e99d697ec20411ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '110');
INSERT INTO `goods` VALUES ('1083', '茄汁玉米面', '14.00', '2', '秘制茄香酱，嫩嫩的香甜玉米，美味营养，轻松保持好身材。', '//fuss10.elemecdn.com/102b38e7fe5a01fc0695b3e86dec3bafjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '110');
INSERT INTO `goods` VALUES ('1084', '港式原味丝滑奶茶', '9.00', '15', '采用原叶（非茶包）锡兰红茶调配而成，口感更丝滑，茶香味更浓，经典的港式奶茶风味。', '//fuss10.elemecdn.com/edd79a3052c63ddb27ed412ca481bad8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '111');
INSERT INTO `goods` VALUES ('1085', '芒果味爆爆蛋奶茶', '10.00', '13', '港式丝滑奶茶与芒果味爆爆蛋的组合，丝滑，香甜。', '//fuss10.elemecdn.com/de9d711e319ad86bd12ae7e0790fdfabjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '111');
INSERT INTO `goods` VALUES ('1086', '港式芋圆奶茶', '9.00', '10', 'Q弹芋圆、港式丝滑奶茶，下午茶的好选择。', '//fuss10.elemecdn.com/64ad1e1ad6e7af4f640982599ce504efjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '111');
INSERT INTO `goods` VALUES ('1087', '桂圆红枣茶', '7.00', '4', '红枣味十足，冬季女性的选择。', '//fuss10.elemecdn.com/0f9cd3d714ae8b403bf271e6cd107e64jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '111');
INSERT INTO `goods` VALUES ('1088', '热牛奶', '6.00', '3', '热热的牛奶，在这个冬天，给您温暖。', '//fuss10.elemecdn.com/a9deedba396d6ecacd6e3c0ef74b62bejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '111');
INSERT INTO `goods` VALUES ('1089', '韩式蜂蜜柚子茶', '9.00', '1', '', '//fuss10.elemecdn.com/7ead54eede46857f39e085d24a91de19jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '111');
INSERT INTO `goods` VALUES ('1090', '蜂蜜柠檬红茶', '8.00', '22', '新鲜柠檬用蜂蜜腌制冷藏，再加入红茶精心调制，冷热皆宜，夏日佳饮！\n主要原料: 柠檬, 蜂蜜, 红茶', '//fuss10.elemecdn.com/de308da7a975c5f662a87092e6d70a00jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '111');
INSERT INTO `goods` VALUES ('1091', '奥尔良对翅+港式丝滑奶茶', '13.00', '9', '', '//fuss10.elemecdn.com/7a0ba11c0703a56d9bbf5ffc2224a543jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '112');
INSERT INTO `goods` VALUES ('1092', '蛋挞+港式丝滑奶茶', '12.00', '11', '蛋挞两只+奶茶一杯', '//fuss10.elemecdn.com/257644f6862d471abf6ba3b6fca8eafbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '112');
INSERT INTO `goods` VALUES ('1093', '台式香酥鸡排+奶茶', '13.00', '9', '香酥鸡排一块+奶茶一杯', '//fuss10.elemecdn.com/6ce39d9dc7c12c35afc75040baadddc3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '112');
INSERT INTO `goods` VALUES ('1094', '韩式蜂蜜柚子茶+小吃', '11.00', '4', '柚子茶一杯，小吃一份', '//fuss10.elemecdn.com/7ead54eede46857f39e085d24a91de19jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '112');
INSERT INTO `goods` VALUES ('1095', '爆浆鸡排+奶茶套餐', '14.00', '7', '套餐包含爆浆鸡排一块，奶茶一杯。', '//fuss10.elemecdn.com/c93dcd747de30e82f6cd54cd6ee00eedjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '112');
INSERT INTO `goods` VALUES ('1096', '薯条+蜂蜜柠檬红茶套餐', '12.00', '4', '爽口的薯条，加上清爽的蜂蜜柠檬茶，给您带来一段美好的下午茶时光！', '//fuss10.elemecdn.com/239d9a1f134230eb51dd1c4ad6c87f86jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '112');
INSERT INTO `goods` VALUES ('1097', '芒果慕斯+蜂蜜柠檬红茶套餐', '12.00', '1', '香甜酥软、入口即化的慕斯条，搭配c冰爽的柠檬红茶，即刻开启美好的下午茶时间！', '//fuss10.elemecdn.com/b50db0cad2b709688d464cb7a9de006ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '112');
INSERT INTO `goods` VALUES ('1098', '葡式蛋挞', '3.50', '98', '1只－经典葡式蛋挞，美味软嫩。', '//fuss10.elemecdn.com/257644f6862d471abf6ba3b6fca8eafbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '113');
INSERT INTO `goods` VALUES ('1099', '奥尔良烤对翅', '7.00', '100', '一对，翅尖和翅根', '//fuss10.elemecdn.com/43383996233cb98edb62f6edbf0f8d3epng.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '113');
INSERT INTO `goods` VALUES ('1100', '台式香嫩炸鸡排', '7.00', '58', '台式鸡排，外酥里嫩', '//fuss10.elemecdn.com/7344c349fc720aa0978cf4f20225477ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '113');
INSERT INTO `goods` VALUES ('1101', '德式烤肠', '6.00', '55', '德式烤肠，肉特多面粉少，口感醇厚，回味无穷。', '//fuss10.elemecdn.com/28e25d29a8c914b0b4770fb6f8e4d5dejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '113');
INSERT INTO `goods` VALUES ('1102', '香甜玉米杯', '5.00', '15', '香甜、软嫩，美味又营养', '//fuss10.elemecdn.com/dc9fae6868c91e1f7afa9c0ad5c4bf0fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '113');
INSERT INTO `goods` VALUES ('1103', '藤椒鸡排', '7.00', '18', '香嫩的鸡排，藤椒的香味，再加一点点麻味，经典美味，恰到好处。\n主要原料: 鸡肉', '//fuss10.elemecdn.com/1c785e63855d2ee9c46a3d7d567e9991jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '113');
INSERT INTO `goods` VALUES ('1104', '爆浆鸡排', '7.00', '31', '软香香炸鸡排，里面是醇厚的芝士夹心，美味不可挡！', '//fuss10.elemecdn.com/2a5e3cdae553bc1e701f7d7cd8b9f8c1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '113');
INSERT INTO `goods` VALUES ('1105', '菠萝派', '6.00', '9', '香酥、酸甜，经典美味，下午茶绝配！', '//fuss10.elemecdn.com/82fbfe05225bedaa08eb652a7d292c06jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '113');
INSERT INTO `goods` VALUES ('1106', '红豆派', '6.00', '3', '经典小食，酥脆美味！', '//fuss10.elemecdn.com/0fd4f87c86d41cd6741d50266197c6ecjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '113');
INSERT INTO `goods` VALUES ('1107', '香芋派', '6.00', '1', '外酥里嫩，美味可口。下午茶必备！', '//fuss10.elemecdn.com/6d8ad766d371270f0df2ba362a29b62cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '113');
INSERT INTO `goods` VALUES ('1108', '雪花紫薯芝士球', '7.00', '5', '香脆的雪花，营养美味的紫薯。一口下去，里面还有芝士夹心，太美味了！一份三个紫薯球', '//fuss10.elemecdn.com/129cf754542ef0c85dd53205c7acc4efjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '113');
INSERT INTO `goods` VALUES ('1109', '雪花香炸鸡柳', '7.00', '15', '酥脆的雪花奥，香软的鸡柳，不要太好吃了！', '//fuss10.elemecdn.com/9b65290b88efd4acd595914b42455a6fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '113');
INSERT INTO `goods` VALUES ('1110', '芒果慕斯条', '6.00', '9', '香酥软嫩，入口即化，奶香味浓郁，下午茶好搭档。', '//fuss10.elemecdn.com/b28b18994a4146b47725d71edf3ea9fajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '113');
INSERT INTO `goods` VALUES ('1111', '美味炸薯条', '6.00', '23', '香酥可口，经典美味！', '//fuss10.elemecdn.com/17e9d326cd388126a0c92a547ab0d525jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '113');
INSERT INTO `goods` VALUES ('1112', '炒饭（必选主食）', '10.99', '481', '', '//fuss10.elemecdn.com/db858ea91c7daf63cadd13ee6f65629bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1113', '我要加鸡蛋', '2.38', '437', '加蛋直接炒在饭里喔～不是水煮蛋！不是水煮蛋！不是水煮蛋！', '//fuss10.elemecdn.com/5105b633a7734ea31ac12f9839a866d9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1114', '黑椒牛肉风味炒饭+ 果茶饮/手工豆浆', '16.99', '426', '配料：真牛肉、金牌培根、香菇贡丸或鳕鱼片、香肠、青菜、胡萝卜、玉米，套餐搭配鹭芳饮品或手工豆浆，豆浆每天现磨限量供应～', '//fuss10.elemecdn.com/e7bb1a4d41a1e6b9e650f4bbe2086a3ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1115', '南丫岛海鲜炒饭+ 果茶饮/手工豆浆', '16.99', '352', '配料：水晶虾仁、南极冰鱼片、南洋虾卷、夹心蟹排、青菜、胡萝卜、玉米，套餐搭配鹭芳饮品或手工豆浆，豆浆每天现磨限量供应～', '//fuss10.elemecdn.com/026f745ac33d6626ee4499ec03d933fcjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1116', '炒泡面（必选主食）', '10.99', '289', '', '//fuss10.elemecdn.com/b2e8ad8cebb68e13dd2546d5f151b69cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1117', '金牌培根蛋炒饭', '9.90', '259', '配料：培根、鸡蛋、青菜、胡萝卜、玉米、豌豆', '//fuss10.elemecdn.com/a06012135455038b4a2fef0e97a2e713jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1118', '大粒当归牛肉丸汤', '9.88', '240', '', '//fuss10.elemecdn.com/92d92504485066bbd9a248b55ce5dd09jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1119', '炒米粉（必选主食）', '10.99', '238', '', '//fuss10.elemecdn.com/8f661df92814268e7934d1aa5ba96c72jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1120', '香烤鸡丁炒饭+ 果茶饮/手工豆浆', '14.99', '238', '配料：鸡肉丁、碳烤鸡扒、香酥肉条、千页豆腐或油豆腐、青菜、胡萝卜、玉米，套餐搭配鹭芳饮品或手工豆浆，豆浆每天现磨限量供应～', '//fuss10.elemecdn.com/33e3b122f22599cdc0a55ae7fb3de359jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1121', '绿豆汤（清凉消暑）', '4.99', '237', '', '//fuss10.elemecdn.com/835c5557ac33e277e78774d07e74e346jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1122', '香芋猪柳炒饭', '10.98', '4', '配料：香芋丝、五香猪柳、香甜玉米粒、胡萝卜、包菜、少量的蛋。', '//fuss10.elemecdn.com/00fed3d7558b2aab5f56f26a20dcbb5ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1123', '金牌培根蛋炒饭', '9.90', '259', '配料：培根、鸡蛋、青菜、胡萝卜、玉米、豌豆', '//fuss10.elemecdn.com/a06012135455038b4a2fef0e97a2e713jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1124', '手工腊肠老干妈炒饭+ 果茶饮/手工豆浆', '14.99', '103', '配料：手工腊肠、奥尔良腿排、午餐肉、南洋虾卷、青菜、胡萝卜、玉米，套餐搭配鹭芳饮品或手工豆浆，豆浆每天现磨限量供应～', '//fuss10.elemecdn.com/15ad000105cfae7c92474b21acb90584jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1125', '香烤鸡丁炒饭+ 果茶饮/手工豆浆', '14.99', '238', '配料：鸡肉丁、碳烤鸡扒、香酥肉条、千页豆腐或油豆腐、青菜、胡萝卜、玉米，套餐搭配鹭芳饮品或手工豆浆，豆浆每天现磨限量供应～', '//fuss10.elemecdn.com/33e3b122f22599cdc0a55ae7fb3de359jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1126', '黑椒牛肉风味炒饭+ 果茶饮/手工豆浆', '16.99', '426', '配料：真牛肉、金牌培根、香菇贡丸或鳕鱼片、香肠、青菜、胡萝卜、玉米，套餐搭配鹭芳饮品或手工豆浆，豆浆每天现磨限量供应～', '//fuss10.elemecdn.com/e7bb1a4d41a1e6b9e650f4bbe2086a3ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1127', '南丫岛海鲜炒饭+ 果茶饮/手工豆浆', '16.99', '352', '配料：水晶虾仁、南极冰鱼片、南洋虾卷、夹心蟹排、青菜、胡萝卜、玉米，套餐搭配鹭芳饮品或手工豆浆，豆浆每天现磨限量供应～', '//fuss10.elemecdn.com/026f745ac33d6626ee4499ec03d933fcjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1128', '和风蒜香排骨炒饭+手工豆浆/果茶饮', '15.99', '151', '配料：蒜香排骨、烟熏鸭胸、香酥肉条、鳕鱼片、包菜、胡萝卜，套餐搭配鹭芳饮品或手工豆浆，豆浆每天现磨限量供应～\n', '//fuss10.elemecdn.com/6cd3e3d1144b36bdbabf2df4a8f4dc3cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1129', '黑椒猪柳炒泡面+ 果茶饮/手工豆浆', '15.99', '100', '配料：黑椒猪柳、金牌培根、香肠、墨鱼丸、香肠、包菜、胡萝卜、少量鸡蛋，套餐搭配鹭芳饮品或手工豆浆，豆浆每天现磨限量供应～\n', '//fuss10.elemecdn.com/7e1244f48393e944a94f02e24dbdc9f1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1130', '黄金咖喱鱿鱼炒饭+ 果茶饮/手工豆浆', '16.99', '118', '配料：香烤鱿鱼须、墨鱼丸、香酥肉条、夹心蟹排、青菜、胡萝卜、玉米，套餐搭配鹭芳饮品或手工豆浆，豆浆每天现磨限量供应～', '//fuss10.elemecdn.com/6b352a2f6b039f8d6c0edeeeb862e95ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1131', '炒饭（必选主食）', '10.99', '481', '', '//fuss10.elemecdn.com/db858ea91c7daf63cadd13ee6f65629bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1132', '炒米粉（必选主食）', '10.99', '238', '', '//fuss10.elemecdn.com/8f661df92814268e7934d1aa5ba96c72jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1133', '炒泡面（必选主食）', '10.99', '289', '', '//fuss10.elemecdn.com/b2e8ad8cebb68e13dd2546d5f151b69cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1134', '加辣', '0.00', '0', '', '//fuss10.elemecdn.com/78a1d4dbe51202ca3552607efb31ca6ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1135', '古早味（原味）', '0.00', '0', '', '//fuss10.elemecdn.com/79ad864afd8081e59da89ac636b44deajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1136', '黑胡椒风味', '0.00', '0', '', '//fuss10.elemecdn.com/c6b2b39cd9e8a04e0a122499d71db012jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1137', '老干妈风味', '0.00', '0', '', '//fuss10.elemecdn.com/e277730f0ad748f6ea7d45694bc8f99ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1138', '我要加鸡蛋', '2.38', '437', '加蛋直接炒在饭里喔～不是水煮蛋！不是水煮蛋！不是水煮蛋！', '//fuss10.elemecdn.com/5105b633a7734ea31ac12f9839a866d9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1139', '西兰花', '2.88', '46', '西蓝花中的营养成分，不仅含量高，而且十分全面，位居同类蔬菜之首，被誉为“蔬菜皇冠”，据说长期食用可以减少乳腺癌、直肠癌及胃癌等癌症的发病几率。', '//fuss10.elemecdn.com/ab52364373f37e4303d7fbb813424dfbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1140', '油豆腐', '2.88', '36', '油豆腐富含优质蛋白、多种氨基酸、不饱和脂肪酸及磷脂等，铁、钙的含量也很高。', '//fuss10.elemecdn.com/59ebf3996873eb596ee1aef0a74d537bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1141', '上海青', '1.88', '38', '上海青可以保持血管弹性，提供人体所需矿物质、维生素，其中的维生素B2尤为丰富，有抑制溃疡的作用，经常食用对皮肤和眼睛的保养有很好的效果。', '//fuss10.elemecdn.com/e6c54ba5032b0637a48603b38a99f718jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1142', '韭菜', '2.88', '26', '韭菜补肾温阳，益肝健胃，还含有丰富的纤维素，比大葱和芹菜都高，可以促进肠道蠕动、预防大肠癌的发生，同时又能减少对胆固醇的吸收，起到预防和治疗动脉硬化、冠心病等疾病的作用。', '//fuss10.elemecdn.com/5b7dc9ca2c02ba18ffa79b4510901d82jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1143', '生菜', '1.88', '56', '生菜中含有维生素E、胡萝卜素等，能保护眼睛，维持正常的视力，缓解眼睛干涩与疲劳。生菜中的膳食纤维等营养物质含量很高，常食有消除多余脂肪的作用，所以生菜又有减肥生菜的美誉。', '//fuss10.elemecdn.com/ac8c675f25a2aeb91c19578e5ffe85c3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1144', '青尖椒', '1.88', '13', '青辣椒不但能给人带来好口感，还含有丰富的维生素C、叶酸、镁及钾等营养成分。还有温中散寒、开胃消食的功效。', '//fuss10.elemecdn.com/3d2361b38cc5b809572078870343f6c7jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1145', '黄瓜', '1.88', '28', '现代医学研究表明，新鲜黄瓜中含有的黄瓜酶能有效促进机体的新陈代谢，扩张皮肤的毛细血管，促进血液循环，增强皮肤的氧化还原作用，因此黄瓜具有美容的效果。同时，黄瓜含有丰富的维生素，能够为皮肤提供充足的养分，有效对抗皮肤衰老。', '//fuss10.elemecdn.com/9b961a7359782aa0e2584af320ab41e8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1146', '金针菇', '2.88', '34', ' 金针菇能有效地增强机体的生物活性，促进体内新陈代谢，有\n利于食物中各种营养素的吸收和利用，对生长发育也大有益处，因而有“增智菇”、“一休菇”的美称', '//fuss10.elemecdn.com/9aa5646e83cf33ffddb7b0fc8a4457b0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1147', '酸豆角', '1.88', '46', '豆角含有丰富的优质蛋白质、碳水化合物及多种维生素、微量元素等，可补充机体的招牌营养素。其中所含B族维生素能维持正常的消化腺分泌和胃肠道蠕动的功能，抑制胆碱酶活性，可帮助消化，增进食欲。', '//fuss10.elemecdn.com/39d04cd0e8d19d2e87081b5b729b89a2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1148', '空心菜', '1.88', '49', '空心菜中的叶绿素有“绿色精灵”之称，可洁齿防龋除口臭，健美皮肤。空心菜的粗纤维素的含量较丰富，具有促进肠蠕动、通便解毒作用。', '//fuss10.elemecdn.com/c7e656beabb0d2ab19c907a497ec48bfjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1149', '香菇', '2.88', '35', '香菇素有山珍之王之称，是高蛋白、低脂肪的营养保健食品。香菇中的脂肪所含脂肪酸，对人体降低血脂有益。', '//fuss10.elemecdn.com/e705a185a17dc5662d844d3f519387eejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1150', '千叶豆腐', '1.88', '30', '千页豆腐是素食新产品。是一种富含蛋白质的新世纪美食，并保持了豆腐原本的细嫩，它具有超强的汤汁吸收能力，口感鲜美。', '//fuss10.elemecdn.com/7b724023152b5008cde25761f6875ab3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1151', '南洋虾卷', '3.88', '42', '', '//fuss10.elemecdn.com/45308b9edb20d7583bc3dfe17fe5648bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1152', '金牌培根', '3.88', '23', '', '//fuss10.elemecdn.com/37a715c036673640cb7f5e09e842ba59jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1153', '午餐肉', '3.88', '27', '', '//fuss10.elemecdn.com/3fc90e26501a5cadb0fd11b3be6a4d35jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1154', '香肠', '3.88', '40', '', '//fuss10.elemecdn.com/b09d3d7639ab5cecdfe232d8b047cc43jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1155', '香菇贡丸', '3.88', '10', '', '//fuss10.elemecdn.com/c03ba80e7389800758be7c845c5de59cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1156', '夹心蟹排', '3.88', '12', '', '//fuss10.elemecdn.com/4561130b94959291ba4efa04ab7494d7jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1157', '瘦肉丝', '3.88', '53', '', '//fuss10.elemecdn.com/83303d50add4c6e0fa2c7ceea6e01ed0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1158', '香烤鸡丁', '3.88', '34', '', '//fuss10.elemecdn.com/dfabef0eafb7ec900d096e862614d1edjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1159', '墨鱼丸', '3.88', '16', '', '//fuss10.elemecdn.com/066c04dfcb055df8fa142f0a093ab860jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1160', '鳕鱼片', '3.88', '6', '', '//fuss10.elemecdn.com/cf942fedd23b0f9d8b6d66ba5fbb6ce3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1161', '奥尔良鸡腿排', '3.88', '31', '', '//fuss10.elemecdn.com/6f435c5b9e1a6d56aa7f40004902b2fcjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1162', '冰鱼片', '4.88', '7', '', '//fuss10.elemecdn.com/9ad04215c37aff41ae75e18c80bd6a8ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1163', '手工腊肠', '4.88', '22', '农家手工制作腊肠，真材实料，味美鲜甜，可开胃助食，增进食欲。腊肠切小细丝炒饭味道更融入哟～', '//fuss10.elemecdn.com/026a7cfca7e8313c44ed2fa6d2daeaa6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1164', '黑椒猪柳', '4.88', '17', '', '//fuss10.elemecdn.com/23f81a8cc4c2682179b5abffdeb2502fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1165', '熏鸭胸肉', '4.88', '8', '', '//fuss10.elemecdn.com/279a167d934ec8de93bc65801335af1cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1166', '鱿鱼须', '4.88', '36', '', '//fuss10.elemecdn.com/55e3a7b6656bce9179f37a7a0c532ef4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1167', '水晶虾仁', '5.88', '34', '', '//fuss10.elemecdn.com/086a83158ee9023250272e6d445a1209jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1168', '牛肉', '5.88', '54', '牛肉含有丰富的蛋白质，氨基酸。其组成比猪肉更接近人体需要，能提高机体抗病能力；牛肉中脂肪含量很低，但其富含铁质，多食用牛肉有助于预防，缺铁性贫血。', '//fuss10.elemecdn.com/37113efd1ca6065c6674edfc0974bf45jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1169', '干煎猪五花', '3.88', '39', '', '//fuss10.elemecdn.com/d84b03cfc34b0adcf19a026ef0507ccajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1170', '香酥肉条', '3.88', '23', '', '//fuss10.elemecdn.com/19720fb9361703443efb5a954f45f345jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '116');
INSERT INTO `goods` VALUES ('1171', '凉拌黄瓜（清热养颜）', '4.39', '43', '', '//fuss10.elemecdn.com/08e52bacb14bc23c31633ac22d53dfecjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '117');
INSERT INTO `goods` VALUES ('1172', '凉拌海带丝（消肿降脂）', '4.39', '34', '', '//fuss10.elemecdn.com/e5cd168ec80b57339f4c1cef6a500e72jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '117');
INSERT INTO `goods` VALUES ('1173', '凉拌木耳（润肺补血）', '4.39', '53', '', '//fuss10.elemecdn.com/9c5c41da45bc90f66202314c7d493493jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '117');
INSERT INTO `goods` VALUES ('1174', '韩国泡菜（开胃健食）', '4.99', '35', '', '//fuss10.elemecdn.com/c97983cd9d73f19b9379fca463804c63jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '117');
INSERT INTO `goods` VALUES ('1175', '海带排骨汤（补钙降压）', '8.99', '140', '', '//fuss10.elemecdn.com/485c072cb533a12fba8c9dffe03be537jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '118');
INSERT INTO `goods` VALUES ('1176', '虫草花土鸡汤（补气养元）', '9.99', '86', '', '//fuss10.elemecdn.com/b222fb3965cc72e9bc4c00623c3d7a9fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '118');
INSERT INTO `goods` VALUES ('1177', '茶菇老鸭汤（滋补抗老）', '9.99', '46', '', '//fuss10.elemecdn.com/8d1c789827ce75693843b56dee0b6908jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '118');
INSERT INTO `goods` VALUES ('1178', '党参猪心汤（补心解郁）', '10.99', '62', '', '//fuss10.elemecdn.com/fd7dd1186470d79284c83b0eb51ab51fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '118');
INSERT INTO `goods` VALUES ('1179', '胡椒猪肚汤（养胃健脾）', '10.99', '47', '', '//fuss10.elemecdn.com/342d713025b93e2b40cbaac368c353edjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '118');
INSERT INTO `goods` VALUES ('1180', '胶原香浓黄豆猪手汤', '10.99', '12', '', '//fuss10.elemecdn.com/f5058047b059a54c2430de2ec001f236jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '118');
INSERT INTO `goods` VALUES ('1181', '手工豆浆(滋阴润燥)', '3.99', '37', '为了保证口感与营养，豆浆都是每天现蒸现磨，我们采用高速搅拌的方式打磨豆浆，味道更浓郁，喝前请摇匀即可。', '//fuss10.elemecdn.com/604dbac0bf803fd4b60527d36cd82917jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '119');
INSERT INTO `goods` VALUES ('1182', '绿豆汤（清凉消暑）', '4.99', '237', '', '//fuss10.elemecdn.com/835c5557ac33e277e78774d07e74e346jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '119');
INSERT INTO `goods` VALUES ('1183', '红豆汤（益气养颜）', '4.99', '52', '小红豆搭配农家糯香红芸豆，口感丰富，同时，红豆含高蛋白，热量低，富含维生素E等活性成分，能够有效消除水肿，养心补血，健脾益肾。', '//fuss10.elemecdn.com/e52b0997e3516c5361172f09b7ce2d42jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '119');
INSERT INTO `goods` VALUES ('1184', '红枣枸杞银耳汤（泽肤美发）', '6.99', '32', '银耳的营养成分相当丰富，既有补脾开胃的功效，又有益气清肠、滋阴润肺的作用，是平民界高级滋养补品。此外银耳富有天然特性胶质，加上它的滋阴作用，长期服用可以润肤，并有祛除脸部黄褐斑、雀斑的功效。', '//fuss10.elemecdn.com/b0ba3af171110689a329e95a0a598442jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '119');
INSERT INTO `goods` VALUES ('1185', '蜂蜜仙草', '4.99', '30', '', '//fuss10.elemecdn.com/69d1f4b5df7c2198f3443c51279528f6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '119');
INSERT INTO `goods` VALUES ('1186', '大粒当归牛肉丸汤', '9.88', '240', '', '//fuss10.elemecdn.com/92d92504485066bbd9a248b55ce5dd09jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '120');
INSERT INTO `goods` VALUES ('1187', '大粒包心丸汤', '8.88', '70', '', '//fuss10.elemecdn.com/5c24077530083f93d0f4375dfad8025fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '120');
INSERT INTO `goods` VALUES ('1188', '小粒肉丸汤', '7.88', '71', '', '//fuss10.elemecdn.com/ca551fb1c4904150ce916779c5e79531jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '120');
INSERT INTO `goods` VALUES ('1189', '香芋猪柳炒饭', '10.98', '4', '配料：香芋丝、五香猪柳、香甜玉米粒、胡萝卜、包菜、少量的蛋。', '//fuss10.elemecdn.com/00fed3d7558b2aab5f56f26a20dcbb5ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '121');
INSERT INTO `goods` VALUES ('1190', '金牌培根蛋炒饭', '9.90', '259', '配料：培根、鸡蛋、青菜、胡萝卜、玉米、豌豆', '//fuss10.elemecdn.com/a06012135455038b4a2fef0e97a2e713jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '121');
INSERT INTO `goods` VALUES ('1191', '香肠肉丝蛋炒饭', '22.00', '20', '配料：肉丝、香肠、鸡蛋、青菜、胡萝卜、玉米、豌豆', '//fuss10.elemecdn.com/b4f82af5e9344d87660b9033e8215f65jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '121');
INSERT INTO `goods` VALUES ('1192', '和风蒜香排骨炒饭+手工豆浆/果茶饮', '15.99', '151', '配料：蒜香排骨、烟熏鸭胸、香酥肉条、鳕鱼片、包菜、胡萝卜，套餐搭配鹭芳饮品或手工豆浆，豆浆每天现磨限量供应～\n', '//fuss10.elemecdn.com/6cd3e3d1144b36bdbabf2df4a8f4dc3cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '122');
INSERT INTO `goods` VALUES ('1193', '手工腊肠老干妈炒饭+ 果茶饮/手工豆浆', '14.99', '103', '配料：手工腊肠、奥尔良腿排、午餐肉、南洋虾卷、青菜、胡萝卜、玉米，套餐搭配鹭芳饮品或手工豆浆，豆浆每天现磨限量供应～', '//fuss10.elemecdn.com/15ad000105cfae7c92474b21acb90584jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '122');
INSERT INTO `goods` VALUES ('1194', '黑椒牛肉风味炒饭+ 果茶饮/手工豆浆', '16.99', '426', '配料：真牛肉、金牌培根、香菇贡丸或鳕鱼片、香肠、青菜、胡萝卜、玉米，套餐搭配鹭芳饮品或手工豆浆，豆浆每天现磨限量供应～', '//fuss10.elemecdn.com/e7bb1a4d41a1e6b9e650f4bbe2086a3ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '122');
INSERT INTO `goods` VALUES ('1195', '南丫岛海鲜炒饭+ 果茶饮/手工豆浆', '16.99', '352', '配料：水晶虾仁、南极冰鱼片、南洋虾卷、夹心蟹排、青菜、胡萝卜、玉米，套餐搭配鹭芳饮品或手工豆浆，豆浆每天现磨限量供应～', '//fuss10.elemecdn.com/026f745ac33d6626ee4499ec03d933fcjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '122');
INSERT INTO `goods` VALUES ('1196', '香烤鸡丁炒饭+ 果茶饮/手工豆浆', '14.99', '238', '配料：鸡肉丁、碳烤鸡扒、香酥肉条、千页豆腐或油豆腐、青菜、胡萝卜、玉米，套餐搭配鹭芳饮品或手工豆浆，豆浆每天现磨限量供应～', '//fuss10.elemecdn.com/33e3b122f22599cdc0a55ae7fb3de359jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '122');
INSERT INTO `goods` VALUES ('1197', '黄金咖喱鱿鱼炒饭+ 果茶饮/手工豆浆', '16.99', '118', '配料：香烤鱿鱼须、墨鱼丸、香酥肉条、夹心蟹排、青菜、胡萝卜、玉米，套餐搭配鹭芳饮品或手工豆浆，豆浆每天现磨限量供应～', '//fuss10.elemecdn.com/6b352a2f6b039f8d6c0edeeeb862e95ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '122');
INSERT INTO `goods` VALUES ('1198', '黑椒猪柳炒泡面+ 果茶饮/手工豆浆', '15.99', '100', '配料：黑椒猪柳、金牌培根、香肠、墨鱼丸、香肠、包菜、胡萝卜、少量鸡蛋，套餐搭配鹭芳饮品或手工豆浆，豆浆每天现磨限量供应～\n', '//fuss10.elemecdn.com/7e1244f48393e944a94f02e24dbdc9f1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '122');
INSERT INTO `goods` VALUES ('1199', '泡菜肥牛面', '32.80', '187', '泡白菜 酸中带点微辣 很多女士的选择', '//fuss10.elemecdn.com/48da042848f86e2ce6a2b04698a02634jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1200', '番茄牛肉面', '29.80', '77', '北京传统的汉族名菜 属于北京菜系 此菜汁浓味香 酸甜可口 既有蛋白质又有维生素', '//fuss10.elemecdn.com/30bd1107601b89a8e4e9b3025d617c20jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1201', '京城肉夹馍', '10.80', '72', '', '//fuss10.elemecdn.com/efb98a5a7f7f09061d2581510014a5b9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1202', '京城卤肉饭', '36.80', '68', '肥而不腻 甜咸适口 香浓四溢 带有厚重口感的卤肉 配上一碗蒸的不软不硬的白饭 每一粒米都吸透黑红的汤汁', '//fuss10.elemecdn.com/bb6418162ecb6478bfbdca808360018fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1203', '酸菜肉丝面', '31.80', '46', '酸菜肉丝面是一道传统的漢族面食 在陕西 河南 浙江 四川等地尤为流行 濃鬰的汤汁 酸爽的口感 诱人的香味 筋门的面身 富含维生素C 氨基酸 膳食纤维等营养物质 另外还有大量的乳酸菌 具有开胃 助消化的功效', '//fuss10.elemecdn.com/3bca63dcba16e2aa048a34d131fb10b8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1204', '御品溏心蛋', '3.80', '43', '', '//fuss10.elemecdn.com/edaa5217961f25102120b8e9afc32157jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1205', '至尊猪扒饭', '37.80', '38', '', '//fuss10.elemecdn.com/e36463bff49b6e2fb0b3532d4118a0c5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1206', '台式牛肉面', '32.80', '35', '牛肉含有丰富的蛋白质和氨基酸等营养成份 比猪肉更接近人体需要 能提高机体抗病能力 对生长发育及术后病后调养的人在补充失血和修复组织等方面特别适宜 寒冷的冬天食用牛肉 除了暖胃驱寒以外 还有补中益气 滋养脾胃 强健筋骨 化痰息风等功效作用 实为寒冬的补益佳品', '//fuss10.elemecdn.com/537441f5fb7cd14d98c3d209d11a6a43jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1207', '招牌炸酱面优惠套餐', '19.90', '109', '套餐内容：京城炸酱面+酸辣木耳+可乐', '//fuss10.elemecdn.com/fea944f775bd405ac0b44a9e0a8abdfajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1208', '京城烤鸭', '9.90', '18', '', '//fuss10.elemecdn.com/a9be5fe239fadd08fb876293d9fbe7f5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1209', '京城炸酱面', '19.84', '114', '清朝光绪年间 慈禧太后西逃至西安城内 饥肠辘辘 焦渴难抵 便在城内一家炸酱面馆用膳 不想粉面筋道爽滑 酱香绕梁不绝 堪比宫廷珍馐 大加赞赏 于是便命李莲英将做炸酱面的人带回京城做了御厨 从此炸酱面便落户北京 默认', '//fuss10.elemecdn.com/f8145e03b5115c0adfbfe0ec6fc0cb45jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1210', '京城烤鸭饭优惠套餐', '19.90', '14', '招牌烤鸭饭+拍黄瓜+核桃露', '//fuss10.elemecdn.com/49943670d21f9b63299eaf0e532db719jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1211', '香辣鸡排(不送饮料)', '10.80', '1546', '', '//fuss10.elemecdn.com/170bb9c4cbc9b90e02f68f6bc9c7b5ddjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1212', '烤肠', '5.00', '774', '一串两根，快点和朋友一起分享吧。', '//fuss10.elemecdn.com/082fda08edf28eaa61ec5dc22f0ec14djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1213', '鸡排+香酥鸡腿(送随机饮料)', '15.80', '655', '', '//fuss10.elemecdn.com/07c0c1817a7d8f2c98a1b2b003773ebfjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1214', '正新鸡排(香辣味)', '12.00', '639', '买每份鸡排送随机一杯饮料或奶茶\n主要原料: 鸡肉', '//fuss10.elemecdn.com/14b3817145bb911de2745d2acc63d0eejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1215', '奥尔良烤全腿', '8.00', '551', '\n主要原料: 鸡腿', '//fuss10.elemecdn.com/8a6b2603dffc007ae0891c670cac7daajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1216', '正新手抓饼', '5.00', '345', '原味手抓饼加鸡蛋', '//fuss10.elemecdn.com/a6c05049eaf952240c1dab91987a5023jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1217', '黄金单人餐(香辣鸡排+原味手抓饼)+饮料', '15.80', '330', '香辣鸡排+手抓饼+随机饮料', '//fuss10.elemecdn.com/d4d921fb271425713c96f21b415a5f99jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1218', '超大派鸡排+中可', '14.00', '307', '', '//fuss10.elemecdn.com/0d7ece8bb250f3af94d4b96a3f67c40ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1219', '经典单人餐(香辣鸡排+汉堡)+饮料', '17.60', '270', '香辣鸡排+汉堡+随机饮料', '//fuss10.elemecdn.com/c657549b5032a2c16d91c9b71b1cde53jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1220', '汉堡', '7.00', '203', '', '//fuss10.elemecdn.com/d11403052247b4b596a2fd794f34b45ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1221', '情侣套餐（鸡排两份+酸梅汤两杯)', '21.00', '82', '', '//fuss10.elemecdn.com/dabe7ed027f3fba5a3a4448e5cb5326djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1222', '情侣套餐', '21.00', '3', '鸡排两份+酸梅汤两杯', '//fuss10.elemecdn.com/5d9d14ddd12dae1eda69aacc12748423jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1223', '汉堡＋烤全腿＋中可', '16.90', '0', '', '//fuss10.elemecdn.com/ece38f4bad69d70ccf15b64fdc86492djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1224', '力推组合（香辣鸡排＋阿拉伯烤肉2串）＋饮', '19.90', '80', '', '//fuss10.elemecdn.com/a26285fe40227295ca1ae47661cd47f9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1225', '骨肉相连(4串)', '9.90', '76', '', '//fuss10.elemecdn.com/8ae23cfac05ebf4317ca0299ba31e7b9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1226', '下单必扫新用户领15元红包', '0.00', '0', '', '//fuss10.elemecdn.com/67ae632e162536a8c8d618d15be326e9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '125');
INSERT INTO `goods` VALUES ('1227', '扫一扫领红包', '0.00', '0', '', '//fuss10.elemecdn.com/266cfaf9c707b256891b532526d014cbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '125');
INSERT INTO `goods` VALUES ('1228', '单人简餐(烤肠+汉堡+中可)', '17.00', '56', '烤肠，汉堡，中可', '//fuss10.elemecdn.com/d435280841bbd9f231d54178faf2303cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '126');
INSERT INTO `goods` VALUES ('1229', '经典单人餐(香辣鸡排+汉堡)+饮料', '17.60', '270', '香辣鸡排+汉堡+随机饮料', '//fuss10.elemecdn.com/c657549b5032a2c16d91c9b71b1cde53jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '126');
INSERT INTO `goods` VALUES ('1230', '汉堡＋烤全腿＋中可', '16.90', '0', '', '//fuss10.elemecdn.com/ece38f4bad69d70ccf15b64fdc86492djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '126');
INSERT INTO `goods` VALUES ('1231', '黄金单人餐(香辣鸡排+原味手抓饼)+饮料', '15.80', '330', '香辣鸡排+手抓饼+随机饮料', '//fuss10.elemecdn.com/d4d921fb271425713c96f21b415a5f99jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '126');
INSERT INTO `goods` VALUES ('1232', '手扒鸡＋鸡排＋汉堡2个＋中可2杯', '46.00', '0', '', '//fuss10.elemecdn.com/a9f4e65b83e9fd746f50b23de610b346jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '126');
INSERT INTO `goods` VALUES ('1233', '香辣鸡腿堡+鸡肉卷+中可', '19.80', '107', '完美搭配，值得你拥有。', '//fuss10.elemecdn.com/b6a3a1197058b47cd324280ade2ab0afjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '126');
INSERT INTO `goods` VALUES ('1234', '爆浆芝士鸡排+烤肠+酸梅汁', '20.00', '32', '送随机饮料或奶茶', '//fuss10.elemecdn.com/b92a502bb496c340b6479880e18e2be9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '126');
INSERT INTO `goods` VALUES ('1235', '鸡排+香酥鸡腿(送随机饮料)', '15.80', '655', '', '//fuss10.elemecdn.com/07c0c1817a7d8f2c98a1b2b003773ebfjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '126');
INSERT INTO `goods` VALUES ('1236', '鸡排+烤肠(送随机饮料)', '15.80', '140', '', '//fuss10.elemecdn.com/d2f320b5dcbca9336306bff060bd1d56jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '126');
INSERT INTO `goods` VALUES ('1237', '超大派鸡排+中可', '14.00', '307', '', '//fuss10.elemecdn.com/0d7ece8bb250f3af94d4b96a3f67c40ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1238', '正新鸡排(香辣味)', '12.00', '639', '买每份鸡排送随机一杯饮料或奶茶\n主要原料: 鸡肉', '//fuss10.elemecdn.com/14b3817145bb911de2745d2acc63d0eejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1239', '情侣套餐（鸡排两份+酸梅汤两杯)', '42.00', '82', '', '//fuss10.elemecdn.com/dabe7ed027f3fba5a3a4448e5cb5326djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1240', '正新鸡排(孜然味)', '12.00', '54', '买鸡排送饮料随机饮料或奶茶', '//fuss10.elemecdn.com/43be99c3c0e328d1a7fb974354258674jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1241', '爆浆之士鸡排+中可', '16.00', '69', '', '//fuss10.elemecdn.com/bedce3d621d2c2b92012fe884215defejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1242', '力推组合（香辣鸡排＋阿拉伯烤肉2串）＋饮', '26.00', '80', '', '//fuss10.elemecdn.com/a26285fe40227295ca1ae47661cd47f9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1243', '爆浆芝士鸡排(送随机饮料）', '15.00', '84', '', '//fuss10.elemecdn.com/01650f25ba0f998f08b4cec6ae4a174fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1244', '香酥鸡腿', '6.00', '203', '\n主要原料: 鸡腿', '//fuss10.elemecdn.com/0407fa6db1403a92485d73486fb2d244jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1245', '奥尔良烤全腿', '8.00', '551', '\n主要原料: 鸡腿', '//fuss10.elemecdn.com/8a6b2603dffc007ae0891c670cac7daajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1246', '汉堡', '7.00', '203', '', '//fuss10.elemecdn.com/d11403052247b4b596a2fd794f34b45ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1247', '鸡米花', '5.00', '243', '', '//fuss10.elemecdn.com/ba244425f7d6de88bad9ac8d6408a607jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1248', '薯条(送番茄酱2包)', '6.00', '137', '', '//fuss10.elemecdn.com/613d05fd1c98656c18d701b4c729cf63jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1249', '番茄酱(1元2包)', '1.00', '41', '', '//fuss10.elemecdn.com/41d1af8728c0e3b20ad6e10da0deed5djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1250', '香辣鸡排(不送饮料)', '10.80', '1546', '', '//fuss10.elemecdn.com/170bb9c4cbc9b90e02f68f6bc9c7b5ddjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1251', '力推组合(鸡排+烤肠+阿拉伯烤)＋饮料', '20.00', '77', '送随机饮料或奶茶哦。', '//fuss10.elemecdn.com/0cd1ab68a28d6c3ced52c6d0a7e3287djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1252', '正新鸡肉卷', '8.50', '57', '优质的面饼包裹着外酥内嫩的鸡肉条。', '//fuss10.elemecdn.com/99e8e0a4c57ea0e3e5f68cd072d08031jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1253', '正新手抓饼', '5.00', '345', '原味手抓饼加鸡蛋', '//fuss10.elemecdn.com/a6c05049eaf952240c1dab91987a5023jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1254', '手抓饼+烤肠(1根)+随机饮料', '8.00', '84', '原味手抓饼里夹鸡蛋.烤肠1根，配上一杯果汁饮料吃出你想的感觉', '//fuss10.elemecdn.com/b896c8628d41e07f2a2b8ea9e946ced3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1255', '香辣孜然包(1元2包)', '1.00', '26', '', '//fuss10.elemecdn.com/5c02dc8ab419042a4001b692160a42d6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1256', '2个鸡肉卷(促销)', '15.00', '18', '', '//fuss10.elemecdn.com/d96bc9e064633c836a1c7461b7fcddafjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1257', '黑椒鸡块', '10.00', '98', '', '//fuss10.elemecdn.com/b5f547ecc4c163738dd464b26514ce41jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1258', '手扒鸡', '19.00', '34', '', '//fuss10.elemecdn.com/4347e524355fba37801b74ad82de61adjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1259', '手扒鸡+中可', '21.00', '26', '', '//fuss10.elemecdn.com/9a94eb0acf29e172a897c01c6223bc92jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1260', '香辣鸡排+奥尔良烤全腿+饮料', '18.90', '43', '', '//fuss10.elemecdn.com/fc3ca272892b45be42f21f2af079a758jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1261', '肉松手抓饼', '5.00', '54', '原昧手抓饼，肉松，生菜', '//fuss10.elemecdn.com/eb8e82c07f47734894a7b4bc7af3f87bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1262', '手撕大鸡排(送随机饮料)', '12.00', '32', '推荐这款手撕鸡排是不切的哟！享受大口吃的感觉', '//fuss10.elemecdn.com/752d947e76103776f4428b95808d1df1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1263', '藤椒半只鸡', '15.00', '28', '', '//fuss10.elemecdn.com/882c628c59a2565bc8fd8093e66bfc0ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1264', '藤椒半只鸡+鸡肉卷(送中可)', '25.00', '32', '', '//fuss10.elemecdn.com/2b46cb880d70eefaa6fa5d6df84c67d6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1265', '阿拉伯烤肉+烤肠+酸梅汤', '15.00', '13', '', '//fuss10.elemecdn.com/be965b460c407cf2865104ea9b70c6d8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1266', '情侣套餐', '21.00', '3', '鸡排两份+酸梅汤两杯', '//fuss10.elemecdn.com/5d9d14ddd12dae1eda69aacc12748423jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '127');
INSERT INTO `goods` VALUES ('1267', '鸡排＋3串手工面筋', '17.00', '23', '此套餐不送饮料哈', '//fuss10.elemecdn.com/162f71acf429cc4f68aa5c912a00e252jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '128');
INSERT INTO `goods` VALUES ('1268', '鸡排+鸡米花+随机饮料', '17.00', '34', '囗味备注', '//fuss10.elemecdn.com/dc8981d2c6feb68da77a6fdac136db8cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '128');
INSERT INTO `goods` VALUES ('1269', '鸡排＋6块黑椒鸡块', '17.00', '17', '此套餐不送饮料哈', '//fuss10.elemecdn.com/a26285fe40227295ca1ae47661cd47f9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '128');
INSERT INTO `goods` VALUES ('1270', '鸡排+薯条+随机饮料', '17.00', '37', '口味备注', '//fuss10.elemecdn.com/5579fc24f09b1fc7e3b3766dc1adba3ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '128');
INSERT INTO `goods` VALUES ('1271', '单人组合（鸡排+鸡肉卷+随机饮料）', '19.90', '21', '', '//fuss10.elemecdn.com/c6e55ee4aad94d18680115aaadd8e001jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '128');
INSERT INTO `goods` VALUES ('1272', '俄罗斯大肉串', '5.00', '54', '俄罗斯肉串升级版 5元一串', '//fuss10.elemecdn.com/dcfb126fc2a4b54288ecdf82c3a83a97jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '129');
INSERT INTO `goods` VALUES ('1273', '美味鸡胗', '5.00', '9', '', '//fuss10.elemecdn.com/92784f7562d30a85325c6883fc755909jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '129');
INSERT INTO `goods` VALUES ('1274', '手工面筋（2串）', '5.00', '116', '', '//fuss10.elemecdn.com/c5d2becc2aa21a375fe1d2a285324a22jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '129');
INSERT INTO `goods` VALUES ('1275', '小牛肉串', '10.00', '59', '一把约20串', '//fuss10.elemecdn.com/1952d389e2e2489484cf2f33f36cfce2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '129');
INSERT INTO `goods` VALUES ('1276', '烤翅', '10.00', '20', '', '//fuss10.elemecdn.com/1cab71f7ae9aa339fe30dc3515f76b24jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '129');
INSERT INTO `goods` VALUES ('1277', '鱿鱼', '12.00', '64', '(3串)－12元3串', '//fuss10.elemecdn.com/38304a913992366905cf4897f2eebfb0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '129');
INSERT INTO `goods` VALUES ('1278', '烤肠', '5.00', '774', '一串两根，快点和朋友一起分享吧。', '//fuss10.elemecdn.com/082fda08edf28eaa61ec5dc22f0ec14djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '129');
INSERT INTO `goods` VALUES ('1279', '阿拉伯烤肉', '5.00', '238', '1串', '//fuss10.elemecdn.com/abb7237656adea0337c5f1e5a38fd5bajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '129');
INSERT INTO `goods` VALUES ('1280', '俄罗斯大肉串(3串）', '10.00', '55', '(3串)', '//fuss10.elemecdn.com/dd6e9b872591427767320878c979a9b0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '129');
INSERT INTO `goods` VALUES ('1281', '正新肉串（3串)', '10.00', '26', '(3串)－猪肉串', '//fuss10.elemecdn.com/c8362428efbd5dd585b73b0ae741e36ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '129');
INSERT INTO `goods` VALUES ('1282', '孜然锁骨串(3串)', '10.00', '27', '', '//fuss10.elemecdn.com/b71ca257458711a1e6bcad79e0c3e966jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '129');
INSERT INTO `goods` VALUES ('1283', '单签烤翅', '6.00', '87', '', '//fuss10.elemecdn.com/cbbdf8d4356a2fc6a392ff8ab431f0e4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '129');
INSERT INTO `goods` VALUES ('1284', '南昌小肉串', '10.00', '61', '', '//fuss10.elemecdn.com/bbf6623c192e1d2d8c2911d7a9791b9bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '129');
INSERT INTO `goods` VALUES ('1285', '骨肉相连(4串)', '9.90', '76', '', '//fuss10.elemecdn.com/8ae23cfac05ebf4317ca0299ba31e7b9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '129');
INSERT INTO `goods` VALUES ('1286', '虾丸(5元2串)', '5.00', '17', '', '//fuss10.elemecdn.com/2b5895fecf858265e3247a6118a58a98jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '129');
INSERT INTO `goods` VALUES ('1287', '鸡肉丸(5元2串)', '5.00', '54', '', '//fuss10.elemecdn.com/ce86230bb0bb68197ce39f721e05ec46jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '129');
INSERT INTO `goods` VALUES ('1288', '鸡肉丸（小份）', '5.00', '121', '', '//fuss10.elemecdn.com/e9e83687cc37584d81d450c0322e3079jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '129');
INSERT INTO `goods` VALUES ('1289', '电梯', '3.00', '4', '', '//fuss10.elemecdn.com/f31259f595e0ae223da8ca5e4aaf66e3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '130');
INSERT INTO `goods` VALUES ('1290', '楼梯', '6.00', '1', '', '//fuss10.elemecdn.com/45ba14f5dbb3c951307fd00ff409b9e3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '130');
INSERT INTO `goods` VALUES ('1291', '麦香红豆奶茶', '5.00', '96', '', '//fuss10.elemecdn.com/c631d5b730e3641175998abb221b6c21jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '79');
INSERT INTO `goods` VALUES ('1292', '草莓奶茶', '5.00', '32', '', '//fuss10.elemecdn.com/3143090096b6225186dd4092ecc0fda5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '79');
INSERT INTO `goods` VALUES ('1293', '原味奶茶', '5.00', '1', '', '//fuss10.elemecdn.com/cf6095f87dd699a33df213489e30d59fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '79');
INSERT INTO `goods` VALUES ('1294', '果粒橙', '5.00', '6', '', '//fuss10.elemecdn.com/cefb34da8c5b7e94eefbfa624410981fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '79');
INSERT INTO `goods` VALUES ('1295', '酸梅汁', '5.00', '5', '', '//fuss10.elemecdn.com/076ce0786f81debc1b5b5875ff15942ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '79');
INSERT INTO `goods` VALUES ('1296', '雪碧', '3.00', '95', '', '//fuss10.elemecdn.com/58b5c7cee095eaa56b10f195738d7a08jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '79');
INSERT INTO `goods` VALUES ('1297', '百事可乐', '3.00', '108', '', '//fuss10.elemecdn.com/958b63adc3e1e0c42f229e920c8aa22cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '79');
INSERT INTO `goods` VALUES ('1298', '可口可乐', '3.00', '131', '', '//fuss10.elemecdn.com/778ff25c7491ceefdbf9e5dd915b71a8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '79');
INSERT INTO `goods` VALUES ('1299', '润田矿泉水', '1.50', '23', '', '//fuss10.elemecdn.com/c212c0ca3ed56524441fab4d95ce62f5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '79');
INSERT INTO `goods` VALUES ('1300', '金桔柠檬', '5.00', '5', '', '//fuss10.elemecdn.com/3dbbb883e52c6846d45e13cacf7cde6ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '79');
INSERT INTO `goods` VALUES ('1301', '王老吉', '4.00', '50', '', '//fuss10.elemecdn.com/5788d0da85b6109a752f57bf3cc0ce08jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '79');
INSERT INTO `goods` VALUES ('1302', '米饭两钵', '1.00', '2743', '一份两钵 适合大部分女生', '//fuss10.elemecdn.com/74749051fbb7483713a24c1b60d65cd6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1303', '烤鸭', '6.00', '758', '', '//fuss10.elemecdn.com/6af2b95f3230959e440a331549e3fbc1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1304', '红烧土豆', '3.00', '638', '', '//fuss10.elemecdn.com/d68b5798bfc83cd5f21e54c57e14bccajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1305', '腐竹炒肉', '4.00', '537', '', '//fuss10.elemecdn.com/d4a6091b9b4972ee61c8516f78ac9797jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1306', '杏鲍菇炒肉', '3.00', '346', '', '//fuss10.elemecdn.com/bfe787b70e365aa3ff86110fb0ab9e94jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1307', '腊香肠', '6.00', '260', '', '//fuss10.elemecdn.com/b9985f0d57ad2140e23c229493f1690bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1308', '香菇炒肉', '3.00', '245', '', '//fuss10.elemecdn.com/8ae34fb370e1ffc5eaf79694b0498c6ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1309', '米粉蒸肉', '6.00', '190', '', '//fuss10.elemecdn.com/dace717bc9b81976928ef18abda9d7ecjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1310', '米饭两钵', '1.00', '2743', '一份两钵 适合大部分女生', '//fuss10.elemecdn.com/74749051fbb7483713a24c1b60d65cd6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '133');
INSERT INTO `goods` VALUES ('1311', '米饭4钵', '2.00', '1282', '你好MAN~~', '//fuss10.elemecdn.com/dfacca8d6209b8bb3eef77608d4818b5jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '133');
INSERT INTO `goods` VALUES ('1312', '米饭三钵', '1.50', '2962', '适合大部分男生', '//fuss10.elemecdn.com/09f27663337dcdd1da71f48b6f25d3bbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '133');
INSERT INTO `goods` VALUES ('1313', '湘味腊鸭肉', '6.00', '575', '', '//fuss10.elemecdn.com/53f4acd8299fe79e2f8d50c97374d46djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '134');
INSERT INTO `goods` VALUES ('1314', '孜然牛肉', '6.00', '545', '', '//fuss10.elemecdn.com/93361eae9ed121705166a9b79cc484c1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '134');
INSERT INTO `goods` VALUES ('1315', '啤酒烧鸭', '6.00', '445', '', '//fuss10.elemecdn.com/058c97dc0d65e3e0126430967681b857jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '134');
INSERT INTO `goods` VALUES ('1316', '腊香肠', '6.00', '260', '', '//fuss10.elemecdn.com/b9985f0d57ad2140e23c229493f1690bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '134');
INSERT INTO `goods` VALUES ('1317', '烤鸭', '6.00', '758', '', '//fuss10.elemecdn.com/6af2b95f3230959e440a331549e3fbc1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '134');
INSERT INTO `goods` VALUES ('1318', '米粉蒸肉', '6.00', '190', '', '//fuss10.elemecdn.com/dace717bc9b81976928ef18abda9d7ecjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '134');
INSERT INTO `goods` VALUES ('1319', '清炒南瓜', '3.00', '54', '', '//fuss10.elemecdn.com/2ea7f56af6f6823163831dc2b2ab89dajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '135');
INSERT INTO `goods` VALUES ('1320', '篙笋炒肉', '3.00', '66', '', '//fuss10.elemecdn.com/1ced550502bb78df1f87aa47c463ac89jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '135');
INSERT INTO `goods` VALUES ('1321', '西湖烧肉', '3.00', '24', '', '//fuss10.elemecdn.com/2d7cd7487a62c1323659680c5f80a013jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '135');
INSERT INTO `goods` VALUES ('1322', '红烧土豆', '3.00', '638', '', '//fuss10.elemecdn.com/d68b5798bfc83cd5f21e54c57e14bccajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '135');
INSERT INTO `goods` VALUES ('1323', '杏鲍菇炒肉', '3.00', '346', '', '//fuss10.elemecdn.com/bfe787b70e365aa3ff86110fb0ab9e94jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '135');
INSERT INTO `goods` VALUES ('1324', '千页豆腐丝', '4.00', '270', '', '//fuss10.elemecdn.com/eb4ccd49f61a04718664e09474250c0bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '135');
INSERT INTO `goods` VALUES ('1325', '香菇炒肉', '3.00', '245', '', '//fuss10.elemecdn.com/8ae34fb370e1ffc5eaf79694b0498c6ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '135');
INSERT INTO `goods` VALUES ('1326', '辣椒炒蛋', '3.00', '482', '', '//fuss10.elemecdn.com/3a317e989a44c0b37c70db36507c27e9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '135');
INSERT INTO `goods` VALUES ('1327', '香脆藕片', '3.00', '338', '', '//fuss10.elemecdn.com/bbdcf06141be38eca9fc6987bc370c80jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '135');
INSERT INTO `goods` VALUES ('1328', '莴笋炒肉', '3.00', '295', '', '//fuss10.elemecdn.com/4d188a9c9e93f77ae00cc9de6eeb0aa4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '135');
INSERT INTO `goods` VALUES ('1329', '毛豆炒肉', '4.00', '455', '', '//fuss10.elemecdn.com/c3391b0ab2fe54b6fd372552a7d906fbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '135');
INSERT INTO `goods` VALUES ('1330', '腐竹炒肉', '4.00', '537', '', '//fuss10.elemecdn.com/d4a6091b9b4972ee61c8516f78ac9797jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '135');
INSERT INTO `goods` VALUES ('1331', '豆角炒肉', '3.00', '611', '', '//fuss10.elemecdn.com/bdf036c1e35e516c71f266e8d687e23fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '135');
INSERT INTO `goods` VALUES ('1332', '外婆菜', '3.00', '195', '', '//fuss10.elemecdn.com/280065310f3524f6f0c2caf809d8ebbfjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '135');
INSERT INTO `goods` VALUES ('1333', '二块香辣鸡翅(炸鸡)T', '11.00', '120', '香辣多汁，口感鲜美。主要原料:鸡翅，小麦粉', '//fuss10.elemecdn.com/addb15e88f3ab2cec9e518609655d50ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1334', '香辣鸡腿堡(汉堡)ST', '11.11', '98', '整块无骨鸡腿肉, 浓郁汉堡酱，香脆鲜辣多汁。,主要原料:鸡腿肉，面包，生菜', '//fuss10.elemecdn.com/75419438fbf8b03d21ebb8fa9e9a9fb6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1335', '黄金鸡块5块装T', '11.00', '98', '精选鸡肉烹炸，搭配调味酱，口感香鲜酥脆。,主要原料:黄金鸡块', '//fuss10.elemecdn.com/4ecfe5e0709aea8fa10c65488aa72d74jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1336', '二块新奥尔良烤翅T', '12.50', '93', '鲜嫩多汁，具烧烤香和甜辣味,主要原料:鸡翅\r\n', '//fuss10.elemecdn.com/ef6f0d22421cc2efea895da79d407a49jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1337', '劲爆鸡米花(大)T', '13.50', '67', '将鸡腿肉加工成小巧造型，用经典的香辣腌料，然后手工裹上优质面粉，烹炸至金黄喷香。酥脆，鲜嫩，香辣。,主要原料:鸡肉，小麦粉', '//fuss10.elemecdn.com/d39d1c9a63bb1979829494aee34ab84fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1338', '鸡肉卷九珍套餐T', '13.50', '46', '老北京鸡肉卷1个+九珍果汁1杯', '//fuss10.elemecdn.com/e4e47ac38a88daeb08cda42e4cfdd3bbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1339', '香辣鸡腿堡S豆泥餐T', '39.00', '40', '升级版香辣鸡腿堡1个+醇香土豆泥1份+黄金鸡块（5块）+九珍果汁饮料1杯', '//fuss10.elemecdn.com/478543d433c26556cdb10b0cb729d63ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1340', '超级外送全家桶ST', '124.00', '25', '升级版香辣鸡腿堡2个+升级版新奥尔良烤鸡腿堡1个+吮指原味鸡3块+香辣鸡翅2块+新奥尔良烤翅4块+醇香土豆泥2份+红豆派2个+1.25升百事可乐1瓶', '//fuss10.elemecdn.com/fcfe5b8bca32570704ca27c8f781b5ecjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1341', '鸡肉卷九珍套餐T', '13.50', '46', '老北京鸡肉卷1个+九珍果汁1杯', '//fuss10.elemecdn.com/e4e47ac38a88daeb08cda42e4cfdd3bbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1342', '拿铁双人套餐T', '17.90', '0', '拿铁(中)2杯', '//fuss10.elemecdn.com/6f59a4d1fba480d8d2eca5e2b55a9cf8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1343', '香辣鸡腿堡(汉堡)ST', '11.11', '98', '整块无骨鸡腿肉, 浓郁汉堡酱，香脆鲜辣多汁。,主要原料:鸡腿肉，面包，生菜', '//fuss10.elemecdn.com/75419438fbf8b03d21ebb8fa9e9a9fb6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1344', '卷堡双人餐ST', '70.50', '25', '升级版香辣鸡腿堡1个+老北京鸡肉卷1个+香辣鸡翅2块+新奥尔良烤翅2块+土豆泥1份+红豆派1块+九珍2杯\r\n', '//fuss10.elemecdn.com/a7a45ee4d8a97a3c3d3f16aef35a7e49jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1345', '美式单人套餐T', '23.90', '1', '美式(中)1杯+香辣鸡翅2块\r\n', '//fuss10.elemecdn.com/36c09d6e394a87a1e139fd12dc2579d3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1346', '饿了么超值套餐ST', '155.00', '0', '九珍果汁饮料3杯+吮指原味鸡1块+香辣鸡翅4块+新奥尔良烤翅2块+醇香土豆泥2份+劲爆鸡米花(小)1份+升级版香辣鸡腿堡1份+升级版新奥尔良烤鸡腿堡1份+老北京鸡肉卷1份\r\n', '//fuss10.elemecdn.com/87607cac8f31112247e2ac7078f2db3ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '139');
INSERT INTO `goods` VALUES ('1347', '超级外送全家桶ST', '124.00', '25', '升级版香辣鸡腿堡2个+升级版新奥尔良烤鸡腿堡1个+吮指原味鸡3块+香辣鸡翅2块+新奥尔良烤翅4块+醇香土豆泥2份+红豆派2个+1.25升百事可乐1瓶', '//fuss10.elemecdn.com/fcfe5b8bca32570704ca27c8f781b5ecjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '140');
INSERT INTO `goods` VALUES ('1348', '饿了么回味经典桶ST', '121.00', '1', '九珍果汁饮料2杯+吮指原味鸡2块+香辣鸡翅4块+醇香土豆泥1份+劲爆鸡米花(小)1份+升级版香辣鸡腿堡1个升级版新奥尔良烤鸡腿堡1个\r\n', '//fuss10.elemecdn.com/c6e0ac9128dd4ec16e15692f4d4ec844jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '140');
INSERT INTO `goods` VALUES ('1349', '卷堡双人餐ST', '70.50', '25', '升级版香辣鸡腿堡1个+老北京鸡肉卷1个+香辣鸡翅2块+新奥尔良烤翅2块+土豆泥1份+红豆派1块+九珍2杯\r\n', '//fuss10.elemecdn.com/a7a45ee4d8a97a3c3d3f16aef35a7e49jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '141');
INSERT INTO `goods` VALUES ('1350', '卷堡三人餐ST', '130.00', '1', '升级版香辣鸡腿堡1个+升级版新奥尔良烤鸡腿堡1个+老北京鸡肉卷1个+香辣鸡翅2块+新奥尔良烤翅2块+红豆派1块+葡式蛋挞2个+九珍3杯\r\n', '//fuss10.elemecdn.com/4040a0b1aaff78adc605098a3240b87ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '141');
INSERT INTO `goods` VALUES ('1351', '香辣鸡腿堡S豆泥餐T', '39.00', '40', '升级版香辣鸡腿堡1个+醇香土豆泥1份+黄金鸡块（5块）+九珍果汁饮料1杯', '//fuss10.elemecdn.com/478543d433c26556cdb10b0cb729d63ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '141');
INSERT INTO `goods` VALUES ('1352', '新奥良腿堡S豆泥餐T', '40.00', '10', '升级版新奥尔良烤鸡腿堡1个+醇香土豆泥1份+黄金鸡块（5块）+九珍果汁饮料1杯', '//fuss10.elemecdn.com/e90633b8b496574719569cceda8348cajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '141');
INSERT INTO `goods` VALUES ('1353', '老北京卷土豆泥餐T', '38.00', '7', '老北京鸡肉卷1个+醇香土豆泥1份+黄金鸡块（5块）+九珍果汁饮料1杯', '//fuss10.elemecdn.com/eb8e6d11c8267a737de86d0dc4a768a2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '141');
INSERT INTO `goods` VALUES ('1354', '辣堡九珍套餐ST', '29.00', '9', '升级版香辣鸡腿堡1个+九珍果汁1杯\r\n', '//fuss10.elemecdn.com/045d26320aa20a85130fec508b0b9521jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '141');
INSERT INTO `goods` VALUES ('1355', '鸡肉卷九珍套餐T', '13.50', '46', '老北京鸡肉卷1个+九珍果汁1杯', '//fuss10.elemecdn.com/e4e47ac38a88daeb08cda42e4cfdd3bbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '141');
INSERT INTO `goods` VALUES ('1356', '香辣鸡腿堡(汉堡)ST', '11.11', '98', '整块无骨鸡腿肉, 浓郁汉堡酱，香脆鲜辣多汁。,主要原料:鸡腿肉，面包，生菜', '//fuss10.elemecdn.com/75419438fbf8b03d21ebb8fa9e9a9fb6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '141');
INSERT INTO `goods` VALUES ('1357', '新奥尔良烤鸡腿堡ST', '18.50', '28', '选用超大无骨鸡腿肉烤制，鲜嫩多汁，甜中带辣。,主要原料:鸡腿肉，面包，蔬菜（生菜，青椒丝）', '//fuss10.elemecdn.com/e0c679e652b7c4846c0d3ad755459d64jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '141');
INSERT INTO `goods` VALUES ('1358', '老北京鸡肉卷T', '16.00', '44', '选用无骨鸡腿柳条、搭配传统甜面酱和新鲜爽脆黄瓜，酱香浓郁的老北京味。,主要原料:面饼，鸡腿肉条，黄瓜段，京葱丝\r\n', '//fuss10.elemecdn.com/a732f6934b725a9679e43637d2b1b307jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '141');
INSERT INTO `goods` VALUES ('1359', '20块香辣鸡翅T', '88.00', '3', '香辣鸡翅20块', '//fuss10.elemecdn.com/cb560e8ae54597ec7b9932221fe88ed0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '142');
INSERT INTO `goods` VALUES ('1360', '十块香辣鸡翅T', '46.00', '31', '香辣多汁，口感鲜美。十块香辣鸡翅', '//fuss10.elemecdn.com/39f9390b30effc3fbf91317185cbd422jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '142');
INSERT INTO `goods` VALUES ('1361', '十块新奥尔良烤翅T', '50.00', '18', '10块新奥尔良烤翅', '//fuss10.elemecdn.com/8beb2169797073bb6ee3452103bb4a55jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '142');
INSERT INTO `goods` VALUES ('1362', '二块香辣鸡翅(炸鸡)T', '11.00', '120', '香辣多汁，口感鲜美。主要原料:鸡翅，小麦粉', '//fuss10.elemecdn.com/addb15e88f3ab2cec9e518609655d50ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '142');
INSERT INTO `goods` VALUES ('1363', '二块新奥尔良烤翅T', '12.50', '93', '鲜嫩多汁，具烧烤香和甜辣味,主要原料:鸡翅\r\n', '//fuss10.elemecdn.com/ef6f0d22421cc2efea895da79d407a49jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '142');
INSERT INTO `goods` VALUES ('1364', '藤椒肯大大鸡排T', '12.00', '0', ',主要原料:鸡排，小麦粉\r\n', '//fuss10.elemecdn.com/23335cd2b3edbe31ad1a6ef2cad3c4d2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '142');
INSERT INTO `goods` VALUES ('1365', '吮指原味鸡套餐AST', '37.00', '13', '升级版香辣鸡腿堡1个 + 吮指原味鸡1块 + 九珍果汁饮料1杯', '//fuss10.elemecdn.com/4b24f122f168cf7ede112504cd1ba00ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '143');
INSERT INTO `goods` VALUES ('1366', '吮指原味鸡套餐BT', '44.00', '14', '吮指原味鸡2块+醇香土豆泥1份+黄金鸡块（5块）+九珍果汁饮料1杯', '//fuss10.elemecdn.com/940e96384d56fbf117fdb6bb4e1845f9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '143');
INSERT INTO `goods` VALUES ('1367', '原味鸡九珍套餐T', '23.00', '6', '吮指原味鸡1块+九珍果汁1杯', '//fuss10.elemecdn.com/a249246cc1a4b978e9d01856055f1643jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '143');
INSERT INTO `goods` VALUES ('1368', '(一块)吮指原味鸡T', '12.00', '56', '具有神秘配方浓郁的香料所散发的绝佳风味，鲜嫩多汁。,主要原料:鸡肉，小麦粉', '//fuss10.elemecdn.com/8d3d63bf7c1cd21c545bd34ab0fe3016jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '143');
INSERT INTO `goods` VALUES ('1369', '劲爆鸡米花(小)T', '11.00', '33', '将鸡腿肉加工成小巧造型，用经典的香辣腌料，然后手工裹上优质面粉，烹炸至金黄喷香。酥脆，鲜嫩，香辣。,主要原料:鸡肉，小麦粉', '//fuss10.elemecdn.com/176e22f1b0cec8b8dd734f1ef18a0c0cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '144');
INSERT INTO `goods` VALUES ('1370', '劲爆鸡米花(大)T', '13.50', '67', '将鸡腿肉加工成小巧造型，用经典的香辣腌料，然后手工裹上优质面粉，烹炸至金黄喷香。酥脆，鲜嫩，香辣。,主要原料:鸡肉，小麦粉', '//fuss10.elemecdn.com/d39d1c9a63bb1979829494aee34ab84fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '144');
INSERT INTO `goods` VALUES ('1371', '黄金鸡块5块装T', '11.00', '98', '精选鸡肉烹炸，搭配调味酱，口感香鲜酥脆。,主要原料:黄金鸡块', '//fuss10.elemecdn.com/4ecfe5e0709aea8fa10c65488aa72d74jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '144');
INSERT INTO `goods` VALUES ('1372', '芙蓉荟蔬汤T', '8.00', '23', '选用蔬菜配以蛋花精制而成,主要原料:鸡蛋、蔬菜（菠菜、裙带菜、胡萝卜、香菇）、水', '//fuss10.elemecdn.com/76c2c3a78afbdb4285fdf4bbdb76b18cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '144');
INSERT INTO `goods` VALUES ('1373', '香甜粟米棒T', '8.00', '46', '优质甜玉米，外表金黄诱人，口感香甜多汁。,主要原料:玉米', '//fuss10.elemecdn.com/e81588e2eb710dd74feacd81d24ad4e8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '144');
INSERT INTO `goods` VALUES ('1374', '醇香土豆泥T', '6.00', '42', '细腻香浓的土豆泥加上润滑可口的鸡汁,主要原料:土豆泥粉，鸡汁粉，淡奶油，黄油', '//fuss10.elemecdn.com/a6a2d3fe984b045788f99c975da1f4e7jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '144');
INSERT INTO `goods` VALUES ('1375', '鲜蔬沙拉T', '13.50', '8', '六种鲜脆蔬菜，搭配特制猕猴桃酱，酸甜爽口，健康之选！,主要原料:蔬菜(球生菜,紫甘蓝)，猕猴桃酱', '//fuss10.elemecdn.com/83e4b140504d7e88621b4e11eff743b2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '144');
INSERT INTO `goods` VALUES ('1376', '葡式蛋挞(经典)6只T', '37.00', '27', '葡式蛋挞（经典）6只,主要原料:挞皮，蛋液，淡奶油，牛奶', '//fuss10.elemecdn.com/3e7c01136b88c4735d0cf05bed25ae57jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '145');
INSERT INTO `goods` VALUES ('1377', '葡式蛋挞(经典)1只T', '7.50', '66', '口感嫩滑，浓郁香甜,主要原料:挞皮，蛋液，淡奶油，牛奶', '//fuss10.elemecdn.com/fbcdf3a30990f742903881a504712311jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '145');
INSERT INTO `goods` VALUES ('1378', '红豆派T', '6.50', '40', '肯德基精选富含高营养价值的红豆，精心熬煮制成浓稠绵蜜的红豆酱，再将其包裹于外表金黄的小酥皮中，特制成酥情蜜意红豆派。口感饱满且富有层次。,主要原料:红豆派', '//fuss10.elemecdn.com/8e084c4ef8a4e80ddad4ff7db6e59841jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '145');
INSERT INTO `goods` VALUES ('1379', '九珍果汁饮料T', '11.00', '25', '九种水果风味混合而成，酸甜可口,主要原料:果汁浓缩液、水', '//fuss10.elemecdn.com/b678fa9123c558c11935ebf8191720b0jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '146');
INSERT INTO `goods` VALUES ('1380', '1.25升装百事可乐T', '14.00', '6', '1瓶1.25L百事可乐', '//fuss10.elemecdn.com/307ab6a31e3744f3be99b398b5ac969cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '146');
INSERT INTO `goods` VALUES ('1381', '拿铁双人套餐T', '17.90', '0', '拿铁(中)2杯', '//fuss10.elemecdn.com/6f59a4d1fba480d8d2eca5e2b55a9cf8jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '147');
INSERT INTO `goods` VALUES ('1382', '美式单人套餐T', '23.90', '1', '美式(中)1杯+香辣鸡翅2块\r\n', '//fuss10.elemecdn.com/36c09d6e394a87a1e139fd12dc2579d3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '147');
INSERT INTO `goods` VALUES ('1383', '摩卡(中)T', '18.00', '0', '精选阿拉比卡咖啡豆，新鲜现磨；规格：同堂食中杯,主要原料:焙炒咖啡豆，牛奶，巧克力味可可固体饮料，水 \r\n', '//fuss10.elemecdn.com/8665c4a1b9ac1e43dd13ed0962bbba58jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '147');
INSERT INTO `goods` VALUES ('1384', '榛果风味拿铁(中)T', '17.00', '1', '榛果的坚果芬芳弥漫于拿铁的醇香，香甜可口。规格：同堂食中杯,主要原料:焙炒咖啡豆，牛奶，榛果风味糖浆，水 \r\n', '//fuss10.elemecdn.com/5bfce9965d52c0c9243b2ed5b85cd163jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '147');
INSERT INTO `goods` VALUES ('1385', '拿铁(中)T', '16.00', '1', '精选阿拉比卡咖啡豆，新鲜现磨；规格：同堂食中杯,主要原料:焙炒咖啡豆，牛奶，水 \r\n', '//fuss10.elemecdn.com/85911c61ecd4c12fda08be8fd4b3eebfjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '147');
INSERT INTO `goods` VALUES ('1386', '美式(中)T', '14.00', '4', ' 精选阿拉比卡咖啡豆，新鲜现磨；规格：同堂食中杯,主要原料:焙炒咖啡豆、水 \r\n', '//fuss10.elemecdn.com/cdc192f774de65be06b07a3324fb2396jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '147');
INSERT INTO `goods` VALUES ('1387', '冰拿铁(中)T', '16.00', '0', '精选阿拉比卡咖啡豆，新鲜现磨；规格：同堂食中杯,主要原料:焙炒咖啡豆，牛奶，水 \r\n', '//fuss10.elemecdn.com/e2bc91943b0f6c32c186e718eb791efajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '147');
INSERT INTO `goods` VALUES ('1388', '冰美式(中)T', '14.00', '3', ' 精选阿拉比卡咖啡豆，新鲜现磨；规格：同堂食中杯,主要原料:焙炒咖啡豆、水 \r\n', '//fuss10.elemecdn.com/4b87b382a7a128447eae37883f528812jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '147');
INSERT INTO `goods` VALUES ('1389', '冰美式多人餐T', '42.00', '1', '冰美式咖啡(大)1杯+拿铁(大)1杯+葡式蛋挞1只+香辣鸡翅2块', '//fuss10.elemecdn.com/3031287f0826d0ff33935d23b4c3d4f1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '147');
INSERT INTO `goods` VALUES ('1390', '大拿铁辣翅双人餐T', '48.00', '0', '拿铁(大)2杯+香辣鸡翅4块\r\n', '//fuss10.elemecdn.com/e36c262bcf2d13ebe9d230f1b1058c59jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '147');
INSERT INTO `goods` VALUES ('1391', '大拿铁单人餐T', '25.00', '3', '拿铁(大)1杯+香辣鸡翅2块\r\n', '//fuss10.elemecdn.com/66298ffcf40bb54180a2004856e723e6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '147');
INSERT INTO `goods` VALUES ('1392', '大美式单人餐T', '24.00', '0', '冰美式咖啡(大)1杯+新奥尔良烤翅2块\r\n', '//fuss10.elemecdn.com/928e33610b820d4963bb499c351204e4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '147');
INSERT INTO `goods` VALUES ('1393', '喵咪咖啡(美式冰大)T', '23.00', '0', '软萌喵咪棉花糖，遇到100%阿拉比卡现磨咖啡研磨的纯正拿铁，甜蜜与醇苦的融合,主要原料:焙炒咖啡豆，牛奶，水，棉花糖（高度充气胶质型糖果）\r\n\r\n', '//fuss10.elemecdn.com/6ad51cb80e696752f57e9885d5d92118jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '147');
INSERT INTO `goods` VALUES ('1394', '喵咪咖啡(拿铁热大)T', '25.00', '1', '软萌喵咪棉花糖，遇到100%阿拉比卡现磨咖啡研磨的纯正拿铁，甜蜜与醇苦的融合,主要原料:焙炒咖啡豆，牛奶，水，棉花糖（高度充气胶质型糖果）\r\n', '//fuss10.elemecdn.com/bbd01d18acbcc9fe74f83ba8a8023bb3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '147');
INSERT INTO `goods` VALUES ('1395', '冰美式(大)T', '17.00', '2', '精选阿拉比卡咖啡豆，新鲜现磨；规格：同堂食大杯,主要原料:焙炒咖啡豆、水', '//fuss10.elemecdn.com/55553f5865bd2c2b9dee10e2b4e82b3ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '147');
INSERT INTO `goods` VALUES ('1396', '榛果风味冰拿铁(大)T', '20.00', '1', '榛果的坚果芬芳弥漫于拿铁的醇香，香甜可口。规格：同堂食大杯,主要原料:焙炒咖啡豆，牛奶，榛果风味糖浆，水', '//fuss10.elemecdn.com/31afafa9d14996b40ba6bbe5b6acebd9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '147');
INSERT INTO `goods` VALUES ('1397', '美式(大)T', '17.00', '2', '精选阿拉比卡咖啡豆，新鲜现磨；规格：同堂食大杯,主要原料:焙炒咖啡豆、水', '//fuss10.elemecdn.com/ecfd95ed2f90aa6c0dcaa3bd89185a0bjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '147');
INSERT INTO `goods` VALUES ('1398', '榛果风味拿铁(大)T', '20.00', '1', '榛果的坚果芬芳弥漫于拿铁的醇香，香甜可口。规格：同堂食大杯,主要原料:焙炒咖啡豆，牛奶，榛果风味糖浆，水', '//fuss10.elemecdn.com/e859e0d4d4b4d662e61f71975f214b30jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '147');
INSERT INTO `goods` VALUES ('1399', '摩卡(大)T', '21.00', '1', '精选阿拉比卡咖啡豆，新鲜现磨；规格：同堂食大杯,主要原料:焙炒咖啡豆，牛奶，巧克力味可可固体饮料，水', '//fuss10.elemecdn.com/e9a65d99d0a43aed629fc86537f049e1jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '147');
INSERT INTO `goods` VALUES ('1400', '榛果风味冰拿铁(中)T', '17.00', '1', '榛果的坚果芬芳弥漫于拿铁的醇香，香甜可口。规格：同堂食中杯,主要原料:焙炒咖啡豆，牛奶，榛果风味糖浆，水', '//fuss10.elemecdn.com/0950ddfaeed5da5031c2b147afc44d8cjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '147');
INSERT INTO `goods` VALUES ('1401', '排骨面', '2.80', '2414', '', '//fuss10.elemecdn.com/57550b18dd2249bf310571fc32aa2bb6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1402', '豆泡', '0.60', '2388', '', '//fuss10.elemecdn.com/3b891062f0db9c955416ddeff13b95bbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1403', '娃娃菜', '1.60', '2194', '', '//fuss10.elemecdn.com/ab84014a43abd75b927297bc2c3c700ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1404', '金针菇', '1.60', '2133', '', '//fuss10.elemecdn.com/d21ff4efd1d5a58d560a2d67ab5f6455jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1405', '培根', '2.10', '1546', '', '//fuss10.elemecdn.com/22f7ef5ae949248dd1f9048b633e041ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1406', '撒尿牛丸', '2.50', '982', '', '//fuss10.elemecdn.com/9cadd62868a3421c595dc90a41a9cdecjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1407', '上海青', '1.20', '799', '', '//fuss10.elemecdn.com/bd85d80205097d9481ce827c8d355a74jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1408', '腐竹', '1.20', '665', '', '//fuss10.elemecdn.com/4f3609dc956565d50bfc44e7f568b75ejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1409', '火锅面', '2.80', '618', '', '//fuss10.elemecdn.com/ef55494bb7d99f8963afc95406ee7e5fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1410', '西兰花', '1.20', '584', '', '//fuss10.elemecdn.com/bdbe4314884d112b92b9166da78f5728jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');
INSERT INTO `goods` VALUES ('1411', '中美年达', '2.74', '24', '', '//fuss10.elemecdn.com/12edd3fff784a2739bb389d238e140b9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1412', '百事可乐', '3.46', '37', '', '//fuss10.elemecdn.com/07956e909185f0cd001fa2f44b897814jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1413', '茉莉花茶', '3.46', '12', '', '//fuss10.elemecdn.com/22ecbe5421b449b7a30d2cb2c207a32ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1414', '美年达', '3.46', '16', '', '//fuss10.elemecdn.com/cee49557b9004ffbe3ebad6d1b13a381jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1415', '雪碧', '3.46', '5', '', '//fuss10.elemecdn.com/71d38ccc5e7b62bef48ed989b7311087jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1416', '冰红茶', '3.46', '6', '', '//fuss10.elemecdn.com/a942e69ee1c47d5d4a22539ee448b2eejpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1417', '中雪碧', '2.77', '24', '', '//fuss10.elemecdn.com/1301cd268978a4aa720b7c78aba24edajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1418', '中百事可乐', '2.77', '42', '', '//fuss10.elemecdn.com/5c14a05c9c24030c9a4b29c77d881c88jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1419', '可口可乐', '2.77', '33', '', '//fuss10.elemecdn.com/7a55fee65ca1e2cc441663ce0c84fb6ajpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1420', 'rnvv营养快线', '4.95', '21', '', '//fuss10.elemecdn.com/b873ccacffbdb870ca069a0a120353b3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1421', '纯生啤酒', '4.75', '8', '', '//fuss10.elemecdn.com/c8c490b78822655529cbc864c0ae1154jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1422', '中纯生啤酒', '2.97', '7', '', '//fuss10.elemecdn.com/c11dda8001c436a98f1ab13e3643e8d3jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1423', '大冰红茶', '4.46', '16', '', '//fuss10.elemecdn.com/7de194ff0309dcc8c6cb77bc187aae1djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1424', '大茉莉花茶', '4.46', '21', '', '//fuss10.elemecdn.com/873076a01ce4a9419259eebf9770ef66jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '2');
INSERT INTO `goods` VALUES ('1425', '送上楼加6元', '6.00', '2', '', '//fuss10.elemecdn.com/5fa1f8b1e574bb698a6a9b5e89ad59dfjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '125');
INSERT INTO `goods` VALUES ('1426', '下单必扫，新用户领15元', '0.00', '0', '', '//fuss10.elemecdn.com/67ae632e162536a8c8d618d15be326e9jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '125');
INSERT INTO `goods` VALUES ('1427', '鱼丸', '1.50', '649', '', '//fuss10.elemecdn.com/7c136f04d513f8b389bb981270c30421jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '151');
INSERT INTO `goods` VALUES ('1428', '墨鱼肠', '1.50', '338', '', '//fuss10.elemecdn.com/f716e8bc67355db1018ff456699393f2jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '151');
INSERT INTO `goods` VALUES ('1429', '米饭两钵', '1.00', '2832', '一份两钵 适合大部分女生', '//fuss10.elemecdn.com/74749051fbb7483713a24c1b60d65cd6jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '1.0', '1');

-- ----------------------------
-- Table structure for goodstype
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype` (
  `gtid` int(10) NOT NULL AUTO_INCREMENT,
  `gtname` varchar(20) NOT NULL,
  `sid` int(10) DEFAULT NULL,
  PRIMARY KEY (`gtid`),
  KEY `fk_shop_sid` (`sid`),
  CONSTRAINT `fk_shop_sid` FOREIGN KEY (`sid`) REFERENCES `shop` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodstype
-- ----------------------------
INSERT INTO `goodstype` VALUES ('1', '热销', '1');
INSERT INTO `goodstype` VALUES ('2', '优惠', '1');
INSERT INTO `goodstype` VALUES ('3', '主食类', '1');
INSERT INTO `goodstype` VALUES ('4', '休闲小吃', '1');
INSERT INTO `goodstype` VALUES ('5', '炸、烤小吃类', '1');
INSERT INTO `goodstype` VALUES ('6', '单人优惠套餐', '1');
INSERT INTO `goodstype` VALUES ('7', '特惠双人套餐', '1');
INSERT INTO `goodstype` VALUES ('8', '全家福系列', '1');
INSERT INTO `goodstype` VALUES ('9', '意大利面 意式烩饭', '1');
INSERT INTO `goodstype` VALUES ('10', '意大利面 烩饭套餐', '1');
INSERT INTO `goodstype` VALUES ('11', '儿童套餐', '1');
INSERT INTO `goodstype` VALUES ('12', '果汁饮料', '1');
INSERT INTO `goodstype` VALUES ('13', '奶茶系列', '1');
INSERT INTO `goodstype` VALUES ('14', '热销', '2');
INSERT INTO `goodstype` VALUES ('15', '优惠', '2');
INSERT INTO `goodstype` VALUES ('16', '扫码送红包', '2');
INSERT INTO `goodstype` VALUES ('17', '口味选择', '2');
INSERT INTO `goodstype` VALUES ('18', '单料粥系列', '2');
INSERT INTO `goodstype` VALUES ('19', '招牌粥系列', '2');
INSERT INTO `goodstype` VALUES ('20', '莲子系列', '2');
INSERT INTO `goodstype` VALUES ('21', '特色小吃', '2');
INSERT INTO `goodstype` VALUES ('22', '加料系类', '2');
INSERT INTO `goodstype` VALUES ('23', '小菜类', '2');
INSERT INTO `goodstype` VALUES ('24', '虾仁系类', '2');
INSERT INTO `goodstype` VALUES ('25', '筒骨肉系列', '2');
INSERT INTO `goodstype` VALUES ('26', '干贝系列', '2');
INSERT INTO `goodstype` VALUES ('27', '螺肉系列', '2');
INSERT INTO `goodstype` VALUES ('28', '海参系列', '2');
INSERT INTO `goodstype` VALUES ('29', '花蛤系列', '2');
INSERT INTO `goodstype` VALUES ('30', '珍珠贝系列', '2');
INSERT INTO `goodstype` VALUES ('31', '生蠔系列', '2');
INSERT INTO `goodstype` VALUES ('32', '花蟹系类', '2');
INSERT INTO `goodstype` VALUES ('33', '虾菇系类', '2');
INSERT INTO `goodstype` VALUES ('34', '鱼翅系列', '2');
INSERT INTO `goodstype` VALUES ('35', '鲍鱼系列', '2');
INSERT INTO `goodstype` VALUES ('36', '鳕鱼系列', '2');
INSERT INTO `goodstype` VALUES ('37', '澳洲鲜贝系列', '2');
INSERT INTO `goodstype` VALUES ('38', '蠔干系类', '2');
INSERT INTO `goodstype` VALUES ('39', '玉米系列', '2');
INSERT INTO `goodstype` VALUES ('40', '苦瓜系列', '2');
INSERT INTO `goodstype` VALUES ('41', '热销', '3');
INSERT INTO `goodstype` VALUES ('42', '优惠', '3');
INSERT INTO `goodstype` VALUES ('43', '补差价', '3');
INSERT INTO `goodstype` VALUES ('44', '新品*套餐', '3');
INSERT INTO `goodstype` VALUES ('45', '金典折扣套餐', '3');
INSERT INTO `goodstype` VALUES ('46', '套餐类', '3');
INSERT INTO `goodstype` VALUES ('47', '欧式滋味套餐系列', '3');
INSERT INTO `goodstype` VALUES ('48', '特价类', '3');
INSERT INTO `goodstype` VALUES ('49', '自由搭配', '3');
INSERT INTO `goodstype` VALUES ('50', '汉堡类', '3');
INSERT INTO `goodstype` VALUES ('51', '鸡肉卷类', '3');
INSERT INTO `goodstype` VALUES ('52', '大鸡排系列', '3');
INSERT INTO `goodstype` VALUES ('53', '9寸超大美味披萨系列', '3');
INSERT INTO `goodstype` VALUES ('54', '饮料类', '3');
INSERT INTO `goodstype` VALUES ('55', '营养中餐', '3');
INSERT INTO `goodstype` VALUES ('56', '酒类', '3');
INSERT INTO `goodstype` VALUES ('57', '热销', '4');
INSERT INTO `goodstype` VALUES ('58', '啤酒小龙虾、天下是一家！', '4');
INSERT INTO `goodstype` VALUES ('59', '米饭◆米饭▏一定别忘记点，除非不想吃了！', '4');
INSERT INTO `goodstype` VALUES ('60', '▋要是不急▋到店逛逛呗！', '4');
INSERT INTO `goodstype` VALUES ('61', '经济危机菜▲省钱才是硬道理.', '4');
INSERT INTO `goodstype` VALUES ('62', '小东北人气菜★店里很多人点，不知是否喜欢', '4');
INSERT INTO `goodstype` VALUES ('63', '配酒硬菜▓既然喝酒了就来个硬菜吧', '4');
INSERT INTO `goodstype` VALUES ('64', '东北特色菜〓没有东北咸，但是适合咱们这边', '4');
INSERT INTO `goodstype` VALUES ('65', '家常小炒★很简单，但是我们认真对待每道菜', '4');
INSERT INTO `goodstype` VALUES ('66', '鲜活鱼类', '4');
INSERT INTO `goodstype` VALUES ('67', '干锅铁板', '4');
INSERT INTO `goodstype` VALUES ('68', '营养炖菜', '4');
INSERT INTO `goodstype` VALUES ('69', '酒水饮料', '4');
INSERT INTO `goodstype` VALUES ('70', '汤类', '4');
INSERT INTO `goodstype` VALUES ('71', '水饺、面食粗粮', '4');
INSERT INTO `goodstype` VALUES ('72', '热销', '5');
INSERT INTO `goodstype` VALUES ('73', '优惠', '5');
INSERT INTO `goodstype` VALUES ('74', '主食类', '5');
INSERT INTO `goodstype` VALUES ('75', '汤类', '5');
INSERT INTO `goodstype` VALUES ('76', '甜汤粥类', '5');
INSERT INTO `goodstype` VALUES ('77', '营养炖汤', '5');
INSERT INTO `goodstype` VALUES ('78', '小菜调料类', '5');
INSERT INTO `goodstype` VALUES ('79', '饮料', '5');
INSERT INTO `goodstype` VALUES ('80', '必选品\n(辣度（必点）否则无法出餐)', '6');
INSERT INTO `goodstype` VALUES ('81', '热销', '6');
INSERT INTO `goodstype` VALUES ('82', '优惠', '6');
INSERT INTO `goodstype` VALUES ('83', '米饭', '6');
INSERT INTO `goodstype` VALUES ('84', '冒菜套餐', '6');
INSERT INTO `goodstype` VALUES ('85', '素菜（一份为1两）', '6');
INSERT INTO `goodstype` VALUES ('86', '荤菜（一份为1两）', '6');
INSERT INTO `goodstype` VALUES ('87', '酒水饮料', '6');
INSERT INTO `goodstype` VALUES ('88', '热销', '7');
INSERT INTO `goodstype` VALUES ('89', '优惠', '7');
INSERT INTO `goodstype` VALUES ('90', '80秒现萃茗茶', '7');
INSERT INTO `goodstype` VALUES ('91', '台式醇香奶茶', '7');
INSERT INTO `goodstype` VALUES ('92', '茗茶/芝士奶盖', '7');
INSERT INTO `goodstype` VALUES ('93', '台湾烧仙草', '7');
INSERT INTO `goodstype` VALUES ('94', '柠檬/鲜果系列', '7');
INSERT INTO `goodstype` VALUES ('95', '醇香经典系列', '7');
INSERT INTO `goodstype` VALUES ('96', '宇治抹茶系列', '7');
INSERT INTO `goodstype` VALUES ('97', '水果茶', '7');
INSERT INTO `goodstype` VALUES ('98', '现榨果汁', '7');
INSERT INTO `goodstype` VALUES ('99', '美味小吃', '7');
INSERT INTO `goodstype` VALUES ('100', '加料区', '7');
INSERT INTO `goodstype` VALUES ('101', '热销', '8');
INSERT INTO `goodstype` VALUES ('102', '优惠', '8');
INSERT INTO `goodstype` VALUES ('103', '纯手工现烤美味披萨', '8');
INSERT INTO `goodstype` VALUES ('104', '便当来啦！！！', '8');
INSERT INTO `goodstype` VALUES ('105', '披萨+营养美味便当饮品套餐', '8');
INSERT INTO `goodstype` VALUES ('106', '经典单人套餐', '8');
INSERT INTO `goodstype` VALUES ('107', '乐享双人套餐', '8');
INSERT INTO `goodstype` VALUES ('108', '欢乐三人套餐', '8');
INSERT INTO `goodstype` VALUES ('109', '美味意饭', '8');
INSERT INTO `goodstype` VALUES ('110', '特色意面', '8');
INSERT INTO `goodstype` VALUES ('111', '夏日酷饮', '8');
INSERT INTO `goodstype` VALUES ('112', '下午茶时间', '8');
INSERT INTO `goodstype` VALUES ('113', '美味小食', '8');
INSERT INTO `goodstype` VALUES ('114', '热销', '9');
INSERT INTO `goodstype` VALUES ('115', '优惠', '9');
INSERT INTO `goodstype` VALUES ('116', '★我的餐我做主（自选）★', '9');
INSERT INTO `goodstype` VALUES ('117', '|爽口凉菜|', '9');
INSERT INTO `goodstype` VALUES ('118', '|元气炖罐|', '9');
INSERT INTO `goodstype` VALUES ('119', '|养颜甜汤|', '9');
INSERT INTO `goodstype` VALUES ('120', '|手工肉丸汤|', '9');
INSERT INTO `goodstype` VALUES ('121', '|老铁特惠蛋炒饭|', '9');
INSERT INTO `goodstype` VALUES ('122', '|老铁精选套餐|', '9');
INSERT INTO `goodstype` VALUES ('123', '热销', '10');
INSERT INTO `goodstype` VALUES ('124', '优惠', '10');
INSERT INTO `goodstype` VALUES ('125', '扫码领15元红包', '10');
INSERT INTO `goodstype` VALUES ('126', '美味鸡排套餐', '10');
INSERT INTO `goodstype` VALUES ('127', '正新鸡排', '10');
INSERT INTO `goodstype` VALUES ('128', '优惠套餐', '10');
INSERT INTO `goodstype` VALUES ('129', '烧烤', '10');
INSERT INTO `goodstype` VALUES ('130', '本店外卖不送上楼', '10');
INSERT INTO `goodstype` VALUES ('131', '饮料', '10');
INSERT INTO `goodstype` VALUES ('132', '热销', '11');
INSERT INTO `goodstype` VALUES ('133', '温馨提示，米饭加收1元两钵，1.5元三钵', '11');
INSERT INTO `goodstype` VALUES ('134', '荤菜类', '11');
INSERT INTO `goodstype` VALUES ('135', '花荤类', '11');
INSERT INTO `goodstype` VALUES ('136', '招聘学生兼职13177873179', '11');
INSERT INTO `goodstype` VALUES ('137', '热销', '12');
INSERT INTO `goodstype` VALUES ('138', '优惠', '12');
INSERT INTO `goodstype` VALUES ('139', '新品上市', '12');
INSERT INTO `goodstype` VALUES ('140', '桶', '12');
INSERT INTO `goodstype` VALUES ('141', '美味汉堡/卷', '12');
INSERT INTO `goodstype` VALUES ('142', '鸡翅/鸡排', '12');
INSERT INTO `goodstype` VALUES ('143', '原味鸡', '12');
INSERT INTO `goodstype` VALUES ('144', '小食/配餐', '12');
INSERT INTO `goodstype` VALUES ('145', '甜品/冰淇淋', '12');
INSERT INTO `goodstype` VALUES ('146', '缤纷饮料', '12');
INSERT INTO `goodstype` VALUES ('147', 'K 咖啡', '12');
INSERT INTO `goodstype` VALUES ('148', '热销', '13');
INSERT INTO `goodstype` VALUES ('149', '优惠', '13');
INSERT INTO `goodstype` VALUES ('150', '扫码领15元红包', '13');
INSERT INTO `goodstype` VALUES ('151', '张亮麻辣烫', '13');
INSERT INTO `goodstype` VALUES ('152', '热销', '11');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` int(10) NOT NULL AUTO_INCREMENT,
  `aid` int(10) NOT NULL,
  `sid` int(10) NOT NULL,
  `otime` datetime NOT NULL,
  `ostatus` varchar(20) NOT NULL,
  `ototal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_order_aid` (`aid`),
  KEY `fk_order_sid` (`sid`),
  CONSTRAINT `fk_order_aid` FOREIGN KEY (`aid`) REFERENCES `address` (`aid`),
  CONSTRAINT `fk_order_sid` FOREIGN KEY (`sid`) REFERENCES `shop` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '1', '1', '2018-07-04 14:47:34', '1', '1.00');

-- ----------------------------
-- Table structure for ordersdetail
-- ----------------------------
DROP TABLE IF EXISTS `ordersdetail`;
CREATE TABLE `ordersdetail` (
  `odid` int(10) NOT NULL AUTO_INCREMENT,
  `oid` int(10) NOT NULL,
  `gid` int(10) NOT NULL,
  `gcount` int(3) NOT NULL,
  PRIMARY KEY (`odid`),
  KEY `fk_od_oid` (`oid`),
  KEY `fk_od_gid` (`gid`),
  CONSTRAINT `fk_od_gid` FOREIGN KEY (`gid`) REFERENCES `goods` (`gid`),
  CONSTRAINT `fk_od_oid` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ordersdetail
-- ----------------------------
INSERT INTO `ordersdetail` VALUES ('1', '1', '1', '1');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `sid` int(10) NOT NULL AUTO_INCREMENT,
  `sname` varchar(100) NOT NULL,
  `sinfo` varchar(255) NOT NULL,
  `stype` int(10) NOT NULL,
  `saddress` varchar(255) NOT NULL,
  `stel` int(11) NOT NULL,
  `simage` varchar(255) DEFAULT NULL,
  `sstatus` varchar(20) NOT NULL,
  PRIMARY KEY (`sid`),
  KEY `fk_shop_stype` (`stype`),
  CONSTRAINT `fk_shop_stype` FOREIGN KEY (`stype`) REFERENCES `shoptype` (`stid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('1', '麦兹乐汉堡奶茶(橡树湾店)', '', '1', '厦门市集美区杏林街道杏北四里85号', '1', '//fuss10.elemecdn.com/b796ef13b9361e06203c3f96534a88a4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '营业中');
INSERT INTO `shop` VALUES ('2', '厦门沃头蠔干粥(中航城店)', '', '1', '厦门市集美区杏林街道九天湖二里30号', '1', '//fuss10.elemecdn.com/7b20be189f8f81abef6069ba6413ba60png.png?imageMogr2/thumbnail/100x100/format/webp/quality/85', '营业中');
INSERT INTO `shop` VALUES ('3', '嘉佳基 兴才学院店', '叫外卖，上饿了么。', '1', '厦门市集美区后溪镇溪西村山尾社882号之4', '1', '//fuss10.elemecdn.com/86bef55b7ccb3928e0e9dc4b474c449djpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '营业中');
INSERT INTO `shop` VALUES ('4', '陈家小东北', '', '1', '厦门市集美区后溪镇诚毅北大街6号107至109单元', '1', '//fuss10.elemecdn.com/1c463f50f0ba8f46a44c6c0542b0ae78png.png?imageMogr2/thumbnail/100x100/format/webp/quality/85', '营业中');
INSERT INTO `shop` VALUES ('5', '天天生煎(中航城店)', '', '1', '厦门市集美区杏林街道九天湖五里86号', '1', '//fuss10.elemecdn.com/d555bdb76424786908941ebe87005ebbjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '营业中');
INSERT INTO `shop` VALUES ('6', '成都冒菜(中航城店)', '', '1', '厦门市集美区杏林街道九天湖六里27号', '1', '//fuss10.elemecdn.com/88c5da92ab6b1f5cfdefea182832d951jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '营业中');
INSERT INTO `shop` VALUES ('7', '茶巢(中航城店)', '', '1', '厦门市集美区杏林街道九天湖六里30号第二间', '1', '//fuss10.elemecdn.com/d3ec11717dee1948756388139e711153png.png?imageMogr2/thumbnail/100x100/format/webp/quality/85', '营业中');
INSERT INTO `shop` VALUES ('8', '味多披萨（软件园三期店）', '【味多披萨】纯手工现烤披萨，主营意式手工现烤披萨、意面、意饭和各类小食、奶茶、饮品等', '1', '厦门市集美区杏林街道诚毅北路310号104单元', '1', '//fuss10.elemecdn.com/1e77d0f8bf167a178303131fa6c7623fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '营业中');
INSERT INTO `shop` VALUES ('9', '老铁铁板炒饭·元气炖罐', '', '1', '厦门市集美区杏林街道南山路127-4', '1', '//fuss10.elemecdn.com/8e8487f8d5972c1ba13b233d328b5c5fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '营业中');
INSERT INTO `shop` VALUES ('10', '正新鸡排(广兰店)', '外卖只送到楼下', '1', '南昌经济技术开发区广兰大道南天阳光26号楼店面105室', '1', '//fuss10.elemecdn.com/5decae62328c9f411b47210610003bc4jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '营业中');
INSERT INTO `shop` VALUES ('11', '湖南神仙钵饭', '本店优先配送饿了么网上订餐！', '1', '南昌市南昌经济技术开发区范家新村B区4栋1户', '1', '//fuss10.elemecdn.com/ab3501e74bf993267cc7a38e1ac03222jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '营业中');
INSERT INTO `shop` VALUES ('12', '肯德基宅急送（经开店）', '肯德基宅急送（经开店）', '1', '江西省南昌市经济开发区榴云路商业街与枫林大道转角的1-2层', '1', '//fuss10.elemecdn.com/3f38aa96b11789b45bf53d92e470acacjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '营业中');
INSERT INTO `shop` VALUES ('13', '张亮麻辣烫', '', '1', '南昌市经济技术开发区南天阳光26#楼店面', '1', '//fuss10.elemecdn.com/e8a163d679928efc9f5dec345250e65fjpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '营业中');
INSERT INTO `shop` VALUES ('14', '湖南神仙钵饭', '本店优先配送饿了么网上订餐！', '1', '南昌市南昌经济技术开发区范家新村B区4栋1户', '1', '//fuss10.elemecdn.com/ab3501e74bf993267cc7a38e1ac03222jpeg.jpeg?imageMogr2/thumbnail/100x100/format/webp/quality/85', '营业中');

-- ----------------------------
-- Table structure for shoptype
-- ----------------------------
DROP TABLE IF EXISTS `shoptype`;
CREATE TABLE `shoptype` (
  `stid` int(10) NOT NULL AUTO_INCREMENT,
  `stname` varchar(20) NOT NULL,
  PRIMARY KEY (`stid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoptype
-- ----------------------------
INSERT INTO `shoptype` VALUES ('1', '1');

-- ----------------------------
-- Table structure for shopuser
-- ----------------------------
DROP TABLE IF EXISTS `shopuser`;
CREATE TABLE `shopuser` (
  `suid` int(10) NOT NULL AUTO_INCREMENT,
  `sid` int(10) DEFAULT NULL,
  `suname` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`suid`),
  KEY `fk_shopuser_sid` (`sid`),
  CONSTRAINT `fk_shopuser_sid` FOREIGN KEY (`sid`) REFERENCES `shop` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopuser
-- ----------------------------
INSERT INTO `shopuser` VALUES ('1', '1', 'admin', '123456');
INSERT INTO `shopuser` VALUES ('2', '2', '8138', '77');
INSERT INTO `shopuser` VALUES ('3', '3', '4333', '8417');
INSERT INTO `shopuser` VALUES ('4', '4', '9086', '178');
INSERT INTO `shopuser` VALUES ('5', '5', '3632', '7623');
INSERT INTO `shopuser` VALUES ('6', '6', '7222', '3238');
INSERT INTO `shopuser` VALUES ('7', '7', '4523', '2902');
INSERT INTO `shopuser` VALUES ('8', '8', '941', '5999');
INSERT INTO `shopuser` VALUES ('9', '9', '7169', '7850');
INSERT INTO `shopuser` VALUES ('10', '10', '87', '388');
INSERT INTO `shopuser` VALUES ('11', '11', '679', '232');
INSERT INTO `shopuser` VALUES ('12', '12', '224', '363');
INSERT INTO `shopuser` VALUES ('13', '13', '144', '629');
INSERT INTO `shopuser` VALUES ('14', '14', '712', '675');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456');
