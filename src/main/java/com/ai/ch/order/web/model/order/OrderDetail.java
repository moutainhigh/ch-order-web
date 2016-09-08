package com.ai.ch.order.web.model.order;

import java.util.List;

import com.ai.slp.order.api.orderlist.param.OrdOrderVo;

public class OrderDetail extends OrdOrderVo {
	private static final long serialVersionUID = 1L;

	private List<OrdProdVo> prodList;
	/**
	 * 应收费用
	 */
	private String ordAdjustFee;
	/**
	 * 总优惠费用
	 */

	private String ordDiscountFee;
	/**
	 * 运费
	 */
	private String ordFreight;

	public String getOrdDiscountFee() {
		return ordDiscountFee;
	}

	public void setOrdDiscountFee(String ordDiscountFee) {
		this.ordDiscountFee = ordDiscountFee;
	}

	public List<OrdProdVo> getProdList() {
		return prodList;
	}

	public void setProdList(List<OrdProdVo> prodList) {
		this.prodList = prodList;
	}

	public String getOrdAdjustFee() {
		return ordAdjustFee;
	}

	public void setOrdAdjustFee(String ordAdjustFee) {
		this.ordAdjustFee = ordAdjustFee;
	}

	public String getOrdFreight() {
		return ordFreight;
	}

	public void setOrdFreight(String ordFreight) {
		this.ordFreight = ordFreight;
	}

}