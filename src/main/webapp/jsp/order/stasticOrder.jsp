<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>查询订单统计列表</title>
<%@include file="/inc/inc.jsp" %>
</head>
<body>
   <div class="content-wrapper-iframe" ><!--右侧灰色背景-->
   	 <!--框架标签结束-->
      <div class="row"><!--外围框架-->
     	<div class="col-lg-12"><!--删格化-->
             <div class="row"><!--内侧框架-->
	                 <div class="col-lg-12"><!--删格化-->
	                    <div class="main-box clearfix"><!--白色背景-->
	                    	<!--查询条件-->
	                    	<form id="dataForm" method="post" >
		                    	<div class="form-label">
						            <ul>
										<li class="col-md-6" id="dateDiv1">
											<p class="word">开始时间</p>
											<p>
												<input class="int-text int-medium " readonly
													onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true,maxDate:'#F{$dp.$D(\'orderTimeEnd\')}'})"
													id="orderTimeBegin" name="control_date" /> <span class="time">
													<i class="fa  fa-calendar"></i>
												</span>
											</p>
										</li>
										<li class="col-md-6" id="dateDiv2">
											<p class="word">结束时间</p>
											<p>
												<input class="int-text int-medium " readonly
													onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true,minDate:'#F{$dp.$D(\'orderTimeBegin\')}'})"
													id="orderTimeEnd" name="control_date" /> <span class="time"><i class="fa  fa-calendar"></i></span>
											</p>
										</li>
									</ul>
									<ul>
									 	<li class="col-md-6">
						                   	<p class="word" >按商品查询</p>
						                    <p><input  class="int-text int-medium" id="productName" name="productName" placeholder="请输入商品名查询" type="text"/>
						                    </p>
						                </li>
						            </ul>
							            <ul>
								            <li class="col-md-6">
									            <p class="word">按商家查询</p>
									            <p><input class="int-text int-medium" id="supplierName" type="text" placeholder="请输入商家名" ></p>
								            </li>
							            	<li class="col-md-6">
								            	<p class="word">按订单查询</p>
							            		<p>
							            		<input class="int-text int-medium" id="parentOrderId" type="text" placeholder="请输入父订单号" ></p>
							            	</li>
							            </ul>
							             <ul>
							            	<li class="col-md-6">
								            	<p class="word">按用户查询</p>
							            		<p><input class="int-text int-medium" id="userName" type="text" placeholder="请输入用户名"></p>
							            	</li>
							            	<li class="col-md-6">
								            	<p class="word">按父订单状态</p>
							            		<p>
								            		<select class="select select-small" id="state">
								            			<option value="">请选择</option>
								            			<option value="11">待付款</option>
								            			<option value="111">已付款</option>
								            			<option value="90">已完成</option>
								            			<option value="91">已关闭</option>
								            		</select>
							            		</p>
							            	</li>
							            </ul>
						            <ul>
										<li class="width-xlag">
											<p class="word">&nbsp;</p>
											<p><input type="button" class="biu-btn  btn-primary btn-blue btn-medium ml-10"
													  id="search" value="查  询"></p>
										</li>
									</ul>
						         </div>
					         </form>
					   	<!--查询结束-->      
	         			</div>
	                </div>
              </div>
         </div>
     </div>	
     <!--框架标签结束-->
   	  	<div class="row"><!--外围框架-->
            <div class="col-lg-12"><!--删格化-->
                <div class="row"><!--内侧框架-->
                    <div class="col-lg-12"><!--删格化-->
                        <div class="main-box clearfix"><!--白色背景-->
                        <!--标题-->
                            <header class="main-box-header clearfix">
                            <h5 class="pull-left">订单统计列表</h5>
                            </header>
                        <!--标题结束-->   
                            <div class="main-box-body clearfix">
                            	<!--table表格-->
                                <div class="table-responsive clearfix">
                                   	<!--table表格-->
                          		<div class="table-responsive clearfix mt-10">
                                    <table class="table table-hover table-border table-bordered ">
                                        <thead>
                                            <tr>
                                            	<th>商户ID</th>
                                            	<th>商户名称</th>
                                            	<th>订单来源</th>
                                                <th>父订单号</th>
                                                <th>用户名</th>
                                                <th>绑定手机号</th>
                                                <th>收货人手机号</th>
                                                <th>是否需要物流</th>
                                       			<th>子订单号</th>
                                       			<th>商品信息</th>
                                       			<th>数量</th>
                                          		<th>订单状态</th>
                                         		<th>详情</th>
                                            </tr>
                                        </thead>
	                                     <tbody id="stasticData"></tbody>
                                    </table>
                                    <div id="showMessageDiv"></div>
                                </div>
                           <!--/table表格结束-->
                                </div>
                                <!--分页-->
								 <div>
					 				 <nav style="text-align: center">
										<ul id="pagination">
										</ul>
									</nav>
								  </div>
								<!--分页结束-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    	</div>
   </div>
   	<script id="stasticTemple" type="text/template">
				{{if ordextendes!=null}}
						{{for ordextendes ~orderData = #data}}  
							<!-- 子订单 -->
								{{for prodinfos ~parentProdSize=prodsize ~cOrderId=orderid ~parentOrderId=parentorderid 
									~busiCode=busicode ~state=state ~stateName=statename
									~parentInd = #index ~parentOrder =~orderData }}	
								<!-- 商品 {{:~parentInd}}-->        						
								<tr>
								{{if ~parentInd == 0  && #index ==0}}
									<td rowspan="{{:~parentOrder.totalprodsize}}">{{:~parentOrder.supplierid}}</td>
									<td rowspan="{{:~parentOrder.totalprodsize}}">{{:~parentOrder.suppliername}}</td>
									<td rowspan="{{:~parentOrder.totalprodsize}}">{{:~parentOrder.chlidname}}</td>
		   							<td rowspan="{{:~parentOrder.totalprodsize}}">{{:~parentOrder.porderid}}</td>
									<td rowspan="{{:~parentOrder.totalprodsize}}">{{:~parentOrder.username}}</td>
									<td rowspan="{{:~parentOrder.totalprodsize}}">{{:~parentOrder.usertel}}</td>
		   							<td rowspan="{{:~parentOrder.totalprodsize}}">{{:~parentOrder.contacttel}}</td>
									<td rowspan="{{:~parentOrder.totalprodsize}}">{{:~parentOrder.deliveryflagname}}</td>
								{{/if}}
								<!-- 子订单不存在的情况-->
								{{if #index ==0 && ~parentOrderId==0}}
									<td rowspan="{{:~parentProdSize}}"></td>
								{{/if}}
								{{if #index ==0 && ~parentOrderId!=0}}
									<td rowspan="{{:~parentProdSize}}">{{:~subStr(2,~cOrderId)}}</td>
								{{/if}}

									<td title="{{:prodname}}">{{:~subStr(10,prodname)}}</td>	
									<td >{{:buysum}}</td>
								{{if #index ==0 }}
									<td  rowspan="{{:~parentProdSize}}">{{:~stateName}}</td>
									<td  rowspan="{{:~parentProdSize}}"><a  href="javascript:void(0);" onclick="pager._detail('{{:~cOrderId}}','{{:~state}}','{{:~parentOrder.porderid}}','{{:~busiCode}}')">查看详情</a></td>
								{{/if}}
        					</tr>
        			{{/for}}
				{{/for}}
			{{/if}}				
  </script> 
   <script type="text/javascript">
		<%-- 展示日历 --%>
		$('#dateDiv1').delegate('.fa-calendar', 'click', function() {
			var calInput = $(this).parent().prev();
			var timeId = calInput.attr('id');
			WdatePicker({
				el : timeId,
				readOnly : true,
				dateFmt : 'yyyy-MM-dd',
				isShowClear : true,
				maxDate : '#F{$dp.$D(\'orderTimeEnd\')}'
			});
		});
		$('#dateDiv2').delegate('.fa-calendar', 'click', function() {
			var calInput = $(this).parent().prev();
			var timeId = calInput.attr('id');
			WdatePicker({
				el : timeId,
				readOnly : true,
				dateFmt : 'yyyy-MM-dd',
				isShowClear : true,
				minDate : '#F{$dp.$D(\'orderTimeBegin\')}'
			});
		});
		
		var pager;
		(function () {
			seajs.use('app/jsp/order/stasticOrder', function (stasticOrderPager) {
				pager = new stasticOrderPager({element: document.body});
				pager.render();
			});
		})();
 </script>       
</body>
</html>