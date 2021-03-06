/*!
 * hnzswh-dolalive
 * Copyright(c) 2015 hnzswh-dolalive <3203317@qq.com>
 * MIT Licensed
 */
'use strict';

var util = require('speedt-utils');

var conf = require('../../settings');

var biz = {
	role: require('../../../biz/manage/role')
};

/**
 *
 * @params
 * @return
 */
exports.indexUI = function(req, res, next){
	biz.role.findAll(null, function (err, docs){
		// TODO
		res.render('manage/role/Index', {
			conf: conf,
			title: req.query.name +' | '+ conf.corp.name,
			description: '',
			keywords: ',dolalive,html5',
			data: {
				title: req.query.name,
				roles: docs
			}
		});
	});
};