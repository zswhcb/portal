/*!
 * zswhcb-portal
 * Copyright(c) 2015 zswhcb-portal <3203317@qq.com>
 * MIT Licensed
 */
'use strict';

var EventProxy = require('eventproxy');

var util = require('speedt-utils'),
	mysql = util.mysql;

var GoodsType = require('../biz/GoodsType');

/**
 * （广告）获取推荐的商家分类前N条
 *
 * @param {String} zone_id 区域ID
 * @param {Integer} size 前N条
 * @return
 */
exports.getShopCate_2 = function(zone_id, size, cb){
	var ad_source_id = '4';

	var ep = EventProxy.create('shopAd', 'topGoodsType', function (shopAd, topGoodsType){
		/* 循环商品分类 */
		for(var i in topGoodsType){
			var row1 = topGoodsType[i];
			row1.children = [];

			/* 循环商家广告 */
			for(var j in shopAd){
				var row2 = shopAd[j];

				if(row1.id === row2.GOODS_TYPE_ID){
					row1.children.push(row2);
				}
			}
		}
		/* 以上部分待优化 */

		cb(null, topGoodsType);
	});

	ep.fail(function (err){
		cb(err);
	});

	/* 获取商品全部顶级分类 */
	GoodsType.getByPId('0', function (err, rows){
		if(err) return ep.emit('error', err);
		ep.emit('topGoodsType', rows);
	});

	this.getShopAdByZoneAndPosition(zone_id, ad_source_id, size, function (err, rows){
		if(err) return ep.emit('error', err);
		ep.emit('shopAd', rows);
	});
};

/**
 * （广告）获取商家广告前N条
 *
 * @param {String} zone_id 地区ID
 * @param {String} ad_source_id 广告区ID
 * @param {Integer} size 前N条
 * @return
 */
exports.getShopAdByZoneAndPosition = function(zone_id, ad_source_id, size, cb){
	size = size || 12;
	mysql.query('SELECT a.*, b.SHOP_NAME, b.SHOP_LOGO, b.GOODS_TYPE_ID FROM w_ad a, w_shop b WHERE a.ZONE_ID=? AND a.AD_SOURCE_ID=? AND a.ANY_ID=b.id ORDER BY a.SORT LIMIT 0, ?',
		[zone_id, ad_source_id, size],
		function (err, rows, fields){
		if(err) return cb(err);
		cb(null, rows);
	});
};

/**
 * （广告）获取页面顶部广告前N条
 *
 * @param {String} zone_id 地区ID
 * @param {Integer} size 前N条
 * @return
 */
exports.getTopOfPage_1 = function(zone_id, size, cb){
	var ad_source_id = '2';
	size = size || 5;
	mysql.query('SELECT a.*, b.SHOP_ID, b.GOODS_TYPE_ID, b.GOODS_NAME, b.GOODS_PIC FROM w_ad a, w_goods b WHERE a.ZONE_ID=? AND a.AD_SOURCE_ID=? AND a.ANY_ID=b.id ORDER BY a.SORT LIMIT 0, ?',
		[zone_id, ad_source_id, size],
		function (err, rows, fields){
		if(err) return cb(err);
		cb(null, rows);
	});
};

/**
 * （广告）获取商品大类分类推荐商品
 *
 * @param {String} zone_id 地区ID
 * @param {Integer} size 前N条
 * @return
 */
exports.getGoodsCate_1 = function(zone_id, size, cb){
	var ad_source_id = '5';

	var ep = EventProxy.create('goodsAd', 'topGoodsType', function (goodsAd, topGoodsType){
		/* 循环商品分类 */
		for(var i in topGoodsType){
			var row1 = topGoodsType[i];
			row1.children = [];

			/* 循环商品广告 */
			for(var j in goodsAd){
				var row2 = goodsAd[j];
				/* 获取商品顶级大类 */
				var topGoodsTypeId = row2.PATH.split(',')[1];

				if(row1.id === topGoodsTypeId){
					row1.children.push(row2);
				}
			}
		}
		/* 以上部分待优化 */

		cb(null, topGoodsType);
	});

	ep.fail(function (err){
		cb(err);
	});

	/* 获取商品全部顶级分类 */
	GoodsType.getByPId('0', function (err, rows){
		if(err) return ep.emit('error', err);
		ep.emit('topGoodsType', rows);
	});

	this.getGoodsAdByZoneAndPosition(zone_id, ad_source_id, size, function (err, rows){
		if(err) return ep.emit('error', err);
		ep.emit('goodsAd', rows);
	});
};


/**
 * （广告）获取推荐商品
 *
 * @param {String} zone_id 地区ID
 * @param {String} ad_source_id 广告区ID
 * @param {Integer} size 前N条
 * @return
 */
exports.getGoodsAdByZoneAndPosition = function(zone_id, ad_source_id, size, cb){
	size = size || 12;
	mysql.query('SELECT a.*, b.SHOP_ID, b.GOODS_TYPE_ID, b.GOODS_NAME, b.GOODS_PIC, b.GOODS_PRICE, c.PID, c.PATH, c.TYPE_NAME FROM w_ad a, w_goods b, w_goods_type c WHERE a.ZONE_ID=? AND a.AD_SOURCE_ID=? AND a.ANY_ID=b.id AND b.GOODS_TYPE_ID=c.id ORDER BY a.SORT LIMIT 0, ?',
		[zone_id, ad_source_id, size],
		function (err, rows, fields){
		if(err) return cb(err);
		cb(null, rows);
	});
};