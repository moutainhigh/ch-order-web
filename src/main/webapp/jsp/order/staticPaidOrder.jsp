<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>已支付详情</title>
<%@include file="/inc/inc.jsp" %>
</head>
<body>
      	<div class="row"><!--外围框架-->
            <div class="col-lg-12"><!--删格化-->
                <div class="row"><!--内侧框架-->
                    <div class="col-lg-12"><!--删格化-->
                        <div class="main-box clearfix"><!--白色背景-->
                        	<div class="main-box-body clearfix">	<!--padding20-->
							<div class="form-label">
					           	<ul>
					                <li  class="col-md-6">
					                    <p class="word">订单来源：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.chlidname}</p>
					                </li>
					               	<li  class="col-md-6">
					                    <p class="word">订单类型：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.ordertypename}</p>
					                </li> 
					            </ul>  
					            <ul>
					                <li  class="col-md-6">
					                    <p class="word">仓库ID：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.routeid}</p>
					                </li>
					                <li  class="col-md-6">
					                    <p class="word">仓库信息：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.routename }</p>
					                </li>  
					            </ul>
					            <ul>
					                <li  class="col-md-6">
					                    <p class="word">父订单号：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.parentorderid}</p>
					                </li>
					                <li  class="col-md-6">
					                    <p class="word">子订单号：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.orderid }</p>
					                </li>  
					            </ul>
					            <ul>
					                <li  class="col-md-6">
					                    <p class="word">支付流水号：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.externalid}</p>
					                </li>
					                <li  class="col-md-6">
					                    <p class="word">支付方式：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.paystylename}</p>
					                </li>  
					            </ul>
					  	</div>
	                <!--步骤结束-->
					  	 	<!--table表格-->
                                <div class="table-responsive">
                                    <table class="table table-hover table-border table-bordered">
                                        <thead>
                                            <tr>
                                            	<th>商品</th>
                                                <th>单价/数量</th>
                                                <th>售后</th>
                                                <th>下单时间</th>
                                                <th>订单状态</th>
                                                <th>优惠券</th>
                                                <th>消费积分</th>
                                                <th>赠送积分</th>
                                            </tr>
                                        </thead>                                                                                                
                                    <tbody>
						             <c:forEach var="prod" items="${orderDetail.prodList}" varStatus="status">
							          <tr>
							                 <td class="sp"  width="45%">
							                      <table width="100%" border="0">
							                         <tr>
							                             <td><img src="${prod.imageUrl}"></td>
							                             <td class="word"><a href="#">${prod.prodName}</a></td>	
							                         </tr>
							                      </table>
							                 </td>
							                <td>${prod.prodSalePrice}元/${prod.buySum }件</td>
							                <td>${orderDetail.busicodename}</td>
							                <td><fmt:formatDate value="${orderDetail.ordertime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							                <td>${orderDetail.statename}</td>
							                <td>${prod.prodCouponFee }</td>
							                <td>${prod.jfFee }</td>
							                <td>${prod.giveJF}</td>
						              </tr> 		 
			 					</c:forEach>
                                    </tbody>
                                    </table>
                                </div>
                            <!--/table表格结束-->
                             <div class="text-r right">
                            	<ul class="mt-20">
                            		<li>
                            			 <p class="word">总优惠金额：<span class="red">${orderDetail.ordDiscountFee}</span></p>
                            		</li>
                            		<li>
                            			 <p class="word">运费：<span class="red">${orderDetail.ordFreight}</span></p>
                            		</li>
                            		<li>
                            			 <p class="word">订单应付金额：<span class="red">${orderDetail.ordAdjustFee}</span></p>
                            		</li>
                            	</ul>
                            </div>
                            <div class="nav-tplist-title bd-bottom pb-10  pt-15">
				                  <ul>
				                    <li>买家信息</li>
				                  </ul>
				       		</div>
                            <div class="form-label">
					           	<ul>
					                <li  class="col-md-6">
					                    <p class="word">买家账号：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.username}</p>
					                </li>
					                <li  class="col-md-6">
					                    <p class="word">收货人：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.contactname}</p>
					                </li>
					            </ul>
					            <ul>
					                <li  class="col-md-6">
					                    <p class="word">手机号：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.contacttel }</p>
					                </li>
					                <li  class="col-md-6">
					                    <p class="word">收货地址：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.provincecode}${orderDetail.citycode }${orderDetail.countycode}
					                    ${orderDetail.address }&nbsp;${orderDetail.contactname}&nbsp;${orderDetail.contacttel}</p>
					                </li>
					            </ul>
					            <ul>
					                <li  class="col-md-6">
					                    <p class="word">买家留言：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.remark }</p>
					                </li>
					            </ul>
					  	</div>
					  	<div class="nav-tplist-title bd-bottom pb-10  pt-15">
		                  <ul>
		                    <li>发票信息</li>
		                  </ul>
				       	</div>
					  	  <div class="form-label">
					  	  		<ul>
					                <li  class="col-md-6">
					                    <p class="word">发票类型：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.invoicetypename}</p>
					                </li>
					                <li  class="col-md-6">
					                    <p class="word">发票类目：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.invoicecontent }</p>
					                </li>
					            </ul>  
					            <ul>
					                <li  class="col-md-6">
					                    <p class="word">发票抬头：</p>
					                    <p class="wide-field" style="word-break:break-all;">${orderDetail.invoicetitle }</p>
					                </li>
					            </ul>
					  		</div>
					  		<div class="row">
								<p class="center mt-30">
									<input id="backPage" type="button" class="biu-btn  btn-primary btn-blue btn-small  ml-5 " value="返  回">
							   	</p>
							</div>
						</div>	
                       </div>	
                     </div>
                </div>
             </div> 
         </div>
    </div>
    <script type="text/javascript">
		var pager;
		(function () {
			seajs.use('app/jsp/order/staticPaidOrder', function (staticPaidPager) {
				pager = new staticPaidPager({element: document.body});
				pager.render();
			});
		})();
 </script> 
</body>
</html>