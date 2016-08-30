define('app/jsp/order/changeGoodsFirst', function (require, exports, module) {
    'use strict';
    var $=require('jquery'),
    Widget = require('arale-widget/1.2.0/widget'),
    Dialog = require("artDialog/src/dialog"),
    Paging = require('paging/0.0.1/paging-debug'),
    AjaxController = require('opt-ajax/1.0.0/index');
    require("jsviews/jsrender.min");
    require("jsviews/jsviews.min");
    require("bootstrap-paginator/bootstrap-paginator.min");
    require("app/util/jsviews-ext");
    
    require("opt-paging/aiopt.pagination");
    require("twbs-pagination/jquery.twbsPagination.min");
    require('bootstrap/js/modal');
    var SendMessageUtil = require("app/util/sendMessage");
    //实例化AJAX控制处理对象
    var ajaxController = new AjaxController();
    //定义页面组件类
    var changePager = Widget.extend({
    	
    	Implements:SendMessageUtil,
    	//属性，使用时由类的构造函数传入
    	attrs: {
    	},
    	Statics: {
    	},
    	//事件代理
    	events: {
    		//查询
            "click #agrren":"_agrrenChangeGoods",
            "click #refuse":"_refuseChangeGoods"
        },
    	//重写父类
    	setup: function () {
    		changePager.superclass.setup.call(this);
    	},
    	_refuseChangeGoods:function(){
    	    var url=_base+"/firstChange";
    	    var isRefuse = true;
    	    var refuseInfo = $("#refuseInfo").val();
    	    if(refuseInfo=="" || refuseInfo==null){
    	    	var d = Dialog({
					title: '提示',
					content:"拒绝理由不能为空",
					icon:'prompt',
					okValue: '确 定',
					ok:function(){
						this.close();
					}
				});
				d.show();
				return false;
    	    }
    	    ajaxController.ajax({
    	    	type: "post",
				dataType: "json",
				processing: false,
				message: "查询中，请等待...",
				url: url,
				data:{"orderId":31323,"refuseInfo":refuseInfo,"isRefuse":isRefuse},
    	        success: function (data) {
    	        	if(data.statusCode == "1"){
    	        		window.location.href=_base+"/toPaidOrder";
    	        	}else{
    	        		var d = Dialog({
							title: '消息',
							content:"换货审核失败:"+data.statusInfo,
							icon:'prompt',
							okValue: '确 定',
							ok:function(){
								this.close();
							}
						});
						d.show();
    	        	}
    	        },
                
    	    }); 
    	},
    	_agrrenChangeGoods:function(){
    	    var url=_base+"/firstChange";
    	    var isRefuse = false;
    	    ajaxController.ajax({
    	    	type: "post",
				dataType: "json",
				processing: false,
				message: "查询中，请等待...",
				url: url,
				data:{"orderId":31323},
    	        success: function (data) {
    	        	if(data.statusCode == "1"){
    	        		window.location.href=_base+"/toChangeOrderSecond";
    	        	}else{
    	        		var d = Dialog({
							title: '消息',
							content:"换货审核失败:"+data.statusInfo,
							icon:'prompt',
							okValue: '确 定',
							ok:function(){
								this.close();
							}
						});
						d.show();
    	        	}
    	        },
                
    	    }); 
    	}
		
    });
    
    module.exports = changePager
});
