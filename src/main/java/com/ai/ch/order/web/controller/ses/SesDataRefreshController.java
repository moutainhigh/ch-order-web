package com.ai.ch.order.web.controller.ses;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ai.opt.sdk.dubbo.util.DubboConsumerFactory;
import com.ai.slp.order.api.sesdata.interfaces.ISesDataRefreshSV;
import com.ai.slp.order.api.sesdata.param.SesDataByPageRequest;
import com.ai.slp.order.api.sesdata.param.SesDataResponse;
import com.alibaba.fastjson.JSON;


@Controller
@RequestMapping("/order")
public class SesDataRefreshController {
	
	private static Logger logger=LoggerFactory.getLogger(SesDataRefreshController.class);
	
	@RequestMapping(value="/refreshSesData",produces="text/html;charset=UTF-8")
	public ModelAndView refreshSesData(HttpServletRequest request,SesDataByPageRequest req){
		try {
			ISesDataRefreshSV sesDataRefreshSV = DubboConsumerFactory.getService(ISesDataRefreshSV.class);
			SesDataResponse response = sesDataRefreshSV.refreshSesData(req);
			if(response!=null && response.getResponseHeader().isSuccess()) {
				List<Long> failOrders = response.getFailOrders();
				request.setAttribute("failOrders", JSON.toJSONString(failOrders));
				request.setAttribute("resp", response);
			}else {
				request.setAttribute("error", response.getResponseHeader().getResultMessage());
				return new ModelAndView("jsp/ses/refreshFail"); 
			}
		} catch (Exception e) {
			logger.error("刷新数据错误>>>>>>>>>>>"+e.getStackTrace());
			request.setAttribute("error", e.getMessage());
			return new ModelAndView("jsp/ses/refreshFail"); 
		} 
		return new ModelAndView("jsp/ses/refreshSuccess") ;
	}
	
	@RequestMapping("/toRefreshPage")
	public ModelAndView toRefreshPage(){
		return new ModelAndView("jsp/ses/refreshSesData");
	}
}