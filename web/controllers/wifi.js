/*!
 * zswhcb-portal
 * Copyright(c) 2015 zswhcb-portal <3203317@qq.com>
 * MIT Licensed
 */
'use strict';

var EventProxy = require('eventproxy');

var conf = require('../settings');

var GoodsType = require('../biz/GoodsType'),
	Wifi = require('../biz/Wifi');

var virtualPath = '/';

exports.indexUI = function(req, res, next){
	var wifi_mac = req.params.wifi_mac;

	/* 获取wifi设备信息 */
	Wifi.getByMac(wifi_mac, function (err, row){
		if(err) return next(err);
		if(null === row) return res.redirect('/');
		var wifi = row;

		var ep = EventProxy.create('topAllGoodsType', function (topAllGoodsType){

			res.render('wifi/Index', {
				title: conf.corp.name,
				description: '',
				keywords: ',Bootstrap,nodejs,express,javascript,java,html5',
				virtualPath: virtualPath,
				cdn: conf.cdn,
				data: {
					id: wifi_mac,
					topAllGoodsType: topAllGoodsType
				}
			});
		});

		ep.fail(function (err){
			next(err);
		});

		/* 获取商品全部顶级分类 */
		GoodsType.getTopAll(function (err, rows){
			if(err) return ep.emit('error', err);
			ep.emit('topAllGoodsType', rows);
		});
	});
};
