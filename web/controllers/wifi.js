/*!
 * zswhcb-portal
 * Copyright(c) 2015 zswhcb-portal <3203317@qq.com>
 * MIT Licensed
 */
'use strict';

var conf = require('../settings'),
	mysqlUtil = require("../lib/mysqlUtil");

var virtualPath = '/';

exports.indexUI = function(req, res, next){
	var id = req.params.id;

	mysqlUtil.query('SELECT * FROM w_wifi WHERE ID=?', ['010'], function (err, rows, fields){
		if(err) return next(err);

		for(var i in rows){
			console.log(rows[i]);
		}

		res.render('wifi/Index', {
			title: conf.corp.name,
			description: '',
			keywords: ',Bootstrap,nodejs,express,javascript,java,html5',
			virtualPath: virtualPath,
			cdn: conf.cdn,
			data: {
				id: id
			}
		});
	});
};