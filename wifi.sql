/*
Navicat MySQL Data Transfer

Source Server         : hq-mysql-1:22306
Source Server Version : 50623
Source Host           : 127.0.0.1:22306
Source Database       : wifi

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2015-07-24 15:23:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `s_menu`
-- ----------------------------
DROP TABLE IF EXISTS `s_menu`;
CREATE TABLE `s_menu` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `pid` varchar(32) DEFAULT NULL,
  `menu_name` varchar(32) DEFAULT NULL,
  `menu_url` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_menu
-- ----------------------------
INSERT INTO `s_menu` VALUES ('1', '0', '美食', null);
INSERT INTO `s_menu` VALUES ('2', '0', '娱乐', null);
INSERT INTO `s_menu` VALUES ('3', '0', '出行', null);
INSERT INTO `s_menu` VALUES ('4', '0', '管家', null);
INSERT INTO `s_menu` VALUES ('5', '0', '住房', null);
INSERT INTO `s_menu` VALUES ('6', '0', '美保', null);
INSERT INTO `s_menu` VALUES ('7', '0', '配送', null);
INSERT INTO `s_menu` VALUES ('8', '0', '其他', null);

-- ----------------------------
-- Table structure for `s_user`
-- ----------------------------
DROP TABLE IF EXISTS `s_user`;
CREATE TABLE `s_user` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `user_name` varchar(32) DEFAULT NULL,
  `user_pass` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_user
-- ----------------------------

-- ----------------------------
-- Table structure for `w_ad`
-- ----------------------------
DROP TABLE IF EXISTS `w_ad`;
CREATE TABLE `w_ad` (
  `id` varchar(32) NOT NULL,
  `AD_NAME` varchar(32) DEFAULT NULL COMMENT '广告名称',
  `ANY_ID` varchar(32) DEFAULT NULL COMMENT '店铺ID',
  `START_TIME` datetime DEFAULT NULL COMMENT '开始时间',
  `END_TIME` datetime DEFAULT NULL COMMENT '结束时间',
  `AD_SOURCE_ID` varchar(32) DEFAULT NULL COMMENT '投放区域',
  `SORT` int(11) DEFAULT NULL,
  `ZONE_ID` varchar(32) DEFAULT NULL,
  `AD_PIC` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告';

-- ----------------------------
-- Records of w_ad
-- ----------------------------
INSERT INTO `w_ad` VALUES ('1', null, '1', null, null, '4', '3', '4', null);
INSERT INTO `w_ad` VALUES ('10', null, '5', null, null, '5', '6', '4', null);
INSERT INTO `w_ad` VALUES ('11', null, '6', null, null, '5', '34', '4', null);
INSERT INTO `w_ad` VALUES ('2', '苹果大促销', '2', null, null, '2', '1', '4', '2015-07-21/58ee3d6d55fbb2fbcbddc508494a20a44623dc32.jpg');
INSERT INTO `w_ad` VALUES ('3', null, '3', null, null, '4', '2', '4', null);
INSERT INTO `w_ad` VALUES ('4', null, '4', null, null, '4', '5', '4', null);
INSERT INTO `w_ad` VALUES ('5', '芒果甩卖了', '5', null, null, '2', '7', '4', '2015-07-21/810a19d8bc3eb135a63a91aca01ea8d3fd1f4423.jpg');
INSERT INTO `w_ad` VALUES ('6', null, '1', null, null, '5', '56', '4', null);
INSERT INTO `w_ad` VALUES ('7', null, '2', null, null, '5', '89', '4', null);
INSERT INTO `w_ad` VALUES ('8', null, '3', null, null, '5', '34', '4', null);
INSERT INTO `w_ad` VALUES ('9', null, '4', null, null, '5', '23', '4', null);

-- ----------------------------
-- Table structure for `w_ad_domain`
-- ----------------------------
DROP TABLE IF EXISTS `w_ad_domain`;
CREATE TABLE `w_ad_domain` (
  `id` varchar(32) NOT NULL,
  `DOMAIN_NAME` varchar(32) DEFAULT NULL COMMENT '广告名称',
  `DOMAIN_URL` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告';

-- ----------------------------
-- Records of w_ad_domain
-- ----------------------------
INSERT INTO `w_ad_domain` VALUES ('1', '通过WIFI登陆入口', '/w/:wifi_mac/');

-- ----------------------------
-- Table structure for `w_ad_position`
-- ----------------------------
DROP TABLE IF EXISTS `w_ad_position`;
CREATE TABLE `w_ad_position` (
  `id` varchar(32) NOT NULL,
  `POSITION_NAME` varchar(32) DEFAULT NULL COMMENT '广告位名称',
  `PAGE_ID` varchar(32) DEFAULT NULL COMMENT '所属页面',
  `AD_SOURCE_ID` varchar(32) DEFAULT NULL COMMENT '数据源',
  `PREVIEW_PIC` varchar(64) DEFAULT NULL COMMENT '预览图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_ad_position
-- ----------------------------
INSERT INTO `w_ad_position` VALUES ('1', '页面上部活动广告', '1', '2', null);
INSERT INTO `w_ad_position` VALUES ('2', '页面中部商家大类排名', '1', '4', null);
INSERT INTO `w_ad_position` VALUES ('3', '页面下部商品大类排名', '1', '5', null);

-- ----------------------------
-- Table structure for `w_ad_source`
-- ----------------------------
DROP TABLE IF EXISTS `w_ad_source`;
CREATE TABLE `w_ad_source` (
  `id` varchar(32) NOT NULL,
  `SOURCE_NAME` varchar(32) DEFAULT NULL COMMENT '位置名称',
  `AD_TYPE_ID` varchar(32) DEFAULT NULL,
  `JS_METHOD_NAME` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告位';

-- ----------------------------
-- Records of w_ad_source
-- ----------------------------
INSERT INTO `w_ad_source` VALUES ('1', 'WIFI区域（如：中原区）商家分类排名1', '1', 'getShopCate_1');
INSERT INTO `w_ad_source` VALUES ('2', 'WIFI区域（如：中原区）活动排名1', '3', 'getTopOfPage_1');
INSERT INTO `w_ad_source` VALUES ('3', 'WIFI区域（如：中原区）商品排名2', '2', null);
INSERT INTO `w_ad_source` VALUES ('4', 'WIFI区域（如：中原区）商家大类排名2', '1', 'getShopCate_2');
INSERT INTO `w_ad_source` VALUES ('5', 'WIFI区域（如：中原区）商品大类排名1', '2', 'getGoodsCate_1');

-- ----------------------------
-- Table structure for `w_ad_type`
-- ----------------------------
DROP TABLE IF EXISTS `w_ad_type`;
CREATE TABLE `w_ad_type` (
  `id` varchar(32) NOT NULL,
  `TYPE_NAME` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告类型';

-- ----------------------------
-- Records of w_ad_type
-- ----------------------------
INSERT INTO `w_ad_type` VALUES ('1', '商家宣传');
INSERT INTO `w_ad_type` VALUES ('2', '商品宣传');
INSERT INTO `w_ad_type` VALUES ('3', '（优惠）活动');

-- ----------------------------
-- Table structure for `w_customer`
-- ----------------------------
DROP TABLE IF EXISTS `w_customer`;
CREATE TABLE `w_customer` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `user_name` varchar(32) DEFAULT NULL,
  `user_pass` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_customer
-- ----------------------------

-- ----------------------------
-- Table structure for `w_goods`
-- ----------------------------
DROP TABLE IF EXISTS `w_goods`;
CREATE TABLE `w_goods` (
  `id` varchar(32) NOT NULL,
  `SHOP_ID` varchar(32) DEFAULT NULL,
  `GOODS_TYPE_ID` varchar(32) DEFAULT NULL,
  `GOODS_NAME` varchar(32) DEFAULT NULL COMMENT '商品名称',
  `GOODS_PIC` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品';

-- ----------------------------
-- Records of w_goods
-- ----------------------------
INSERT INTO `w_goods` VALUES ('1', '1', '9', '香蕉', null);
INSERT INTO `w_goods` VALUES ('2', '1', '9', '苹果', null);
INSERT INTO `w_goods` VALUES ('3', '2', '10', '哈密瓜', null);
INSERT INTO `w_goods` VALUES ('4', '2', '10', '草莓', null);
INSERT INTO `w_goods` VALUES ('5', '2', '10', '芒果', null);
INSERT INTO `w_goods` VALUES ('6', '4', '10', '水蜜桃', null);

-- ----------------------------
-- Table structure for `w_goods_type`
-- ----------------------------
DROP TABLE IF EXISTS `w_goods_type`;
CREATE TABLE `w_goods_type` (
  `id` varchar(32) NOT NULL,
  `PID` varchar(32) DEFAULT NULL,
  `PATH` varchar(512) DEFAULT NULL,
  `TYPE_NAME` varchar(32) DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='美食';

-- ----------------------------
-- Records of w_goods_type
-- ----------------------------
INSERT INTO `w_goods_type` VALUES ('1', '0', '0', '美食', '1');
INSERT INTO `w_goods_type` VALUES ('10', '1', '0,1', '蔬菜', '2');
INSERT INTO `w_goods_type` VALUES ('2', '0', '0', '娱乐', '2');
INSERT INTO `w_goods_type` VALUES ('3', '0', '0', '出行', '3');
INSERT INTO `w_goods_type` VALUES ('4', '0', '0', '管家', '4');
INSERT INTO `w_goods_type` VALUES ('5', '0', '0', '住房', '5');
INSERT INTO `w_goods_type` VALUES ('6', '0', '0', '美保', '6');
INSERT INTO `w_goods_type` VALUES ('7', '0', '0', '配送', '7');
INSERT INTO `w_goods_type` VALUES ('8', '0', '0', '其他', '8');
INSERT INTO `w_goods_type` VALUES ('9', '2', '0,2', '水果', '1');

-- ----------------------------
-- Table structure for `w_page`
-- ----------------------------
DROP TABLE IF EXISTS `w_page`;
CREATE TABLE `w_page` (
  `id` varchar(32) NOT NULL,
  `PAGE_NAME` varchar(32) DEFAULT NULL,
  `PAGE_URL` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='html页面';

-- ----------------------------
-- Records of w_page
-- ----------------------------
INSERT INTO `w_page` VALUES ('1', 'WIFI区域（如：中原区）首页', '/w/:wifi_mac/');
INSERT INTO `w_page` VALUES ('2', 'WIFI区域（如：中原区）二级页', null);

-- ----------------------------
-- Table structure for `w_shop`
-- ----------------------------
DROP TABLE IF EXISTS `w_shop`;
CREATE TABLE `w_shop` (
  `id` varchar(32) NOT NULL,
  `SHOP_NAME` varchar(32) DEFAULT NULL,
  `SHOP_LOGO` varchar(256) DEFAULT NULL,
  `GOODS_TYPE_ID` varchar(32) DEFAULT NULL COMMENT '商品类型',
  `ZONE_ID` varchar(32) DEFAULT NULL COMMENT '区域',
  `ADDR` varchar(256) DEFAULT NULL COMMENT '具体地址',
  `LNG` varchar(32) DEFAULT NULL COMMENT '经度',
  `LAT` varchar(32) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺';

-- ----------------------------
-- Records of w_shop
-- ----------------------------
INSERT INTO `w_shop` VALUES ('1', '商铺1', null, '1', '4', null, null, null);
INSERT INTO `w_shop` VALUES ('2', '商铺2', null, '2', '5', null, null, null);
INSERT INTO `w_shop` VALUES ('3', '商铺3', null, '3', '7', null, null, null);
INSERT INTO `w_shop` VALUES ('4', '商铺4', null, '3', '8', null, null, null);
INSERT INTO `w_shop` VALUES ('5', '商铺5', null, '5', '9', null, null, null);

-- ----------------------------
-- Table structure for `w_shop_user`
-- ----------------------------
DROP TABLE IF EXISTS `w_shop_user`;
CREATE TABLE `w_shop_user` (
  `id` varchar(32) NOT NULL,
  `SHOP_ID` varchar(32) DEFAULT NULL,
  `USER_NAME` varchar(32) DEFAULT NULL,
  `USER_PASS` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商铺用户';

-- ----------------------------
-- Records of w_shop_user
-- ----------------------------

-- ----------------------------
-- Table structure for `w_templet`
-- ----------------------------
DROP TABLE IF EXISTS `w_templet`;
CREATE TABLE `w_templet` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `templet_name` varchar(32) DEFAULT NULL,
  `templet_desc` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_templet
-- ----------------------------

-- ----------------------------
-- Table structure for `w_wifi`
-- ----------------------------
DROP TABLE IF EXISTS `w_wifi`;
CREATE TABLE `w_wifi` (
  `id` varchar(32) NOT NULL,
  `WIFI_MAC` varchar(32) DEFAULT NULL,
  `WIFI_NAME` varchar(32) DEFAULT NULL,
  `ADDR` varchar(128) DEFAULT NULL COMMENT '具体地址',
  `ZONE_ID` varchar(32) DEFAULT NULL COMMENT '区域',
  `LNG` varchar(32) DEFAULT NULL COMMENT '经度',
  `LAT` varchar(32) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_wifi
-- ----------------------------
INSERT INTO `w_wifi` VALUES ('1', '00014280317A', '正森', null, '4', null, null);

-- ----------------------------
-- Table structure for `w_zone`
-- ----------------------------
DROP TABLE IF EXISTS `w_zone`;
CREATE TABLE `w_zone` (
  `id` varchar(32) NOT NULL,
  `PID` varchar(32) DEFAULT NULL,
  `PATH` varchar(256) DEFAULT NULL,
  `ZONE_NAME` varchar(32) DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_zone
-- ----------------------------
INSERT INTO `w_zone` VALUES ('1', '0', '0', '中国', '1');
INSERT INTO `w_zone` VALUES ('10', '2', '0,1,2,3', '二七区', '2');
INSERT INTO `w_zone` VALUES ('2', '1', '0,1', '河南', '1');
INSERT INTO `w_zone` VALUES ('3', '2', '0,1,2', '郑州', '1');
INSERT INTO `w_zone` VALUES ('4', '3', '0,1,2,3', '中原区', '1');
INSERT INTO `w_zone` VALUES ('5', '3', '0,1,2,3', '管城区', '3');
INSERT INTO `w_zone` VALUES ('6', '2', '0,1,2', '洛阳', '2');
INSERT INTO `w_zone` VALUES ('7', '6', '0,1,2,6', '涧西区', '1');
INSERT INTO `w_zone` VALUES ('8', '6', '0,1,2,6', '西工区', '2');
INSERT INTO `w_zone` VALUES ('9', '6', '0,1,2,6', '洛龙区', '3');
