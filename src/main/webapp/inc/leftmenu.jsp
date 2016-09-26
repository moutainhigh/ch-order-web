<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!--左侧菜单-->
    <div id="nav-col">
    <section id="col-left" class="col-left-nano">
        <div id="col-left-inner" class="col-left-nano-content">
            <div class="collapse navbar-collapse navbar-ex1-collapse" id="sidebar-nav">
                <ul class="nav nav-pills nav-stacked">
         <%--        	<li class="active"><a href="#"><i class="fa fa-home"></i><span>系统控制台</span><!--<span class="label label-info label-circle pull-right">28</span>--></a></li>
                    <li>
                        <a href="#" class="dropdown-toggle">
                        <i class="fa fa-sitemap"></i><span>服务器对接管理</span>
                        <i class="fa fa-chevron-circle-right drop-icon"></i>
                        </a>
                       <!--二级菜单-->
                        <ul class="submenu">
                            <li><a href="${_base}/demo/demopage" target="mainFrame">@@服务器对接管理@@</a>
                           
                            </li>
                            <li><a href="#">服务器对接管理</a></li>
                            <li><a href="#">服务器对接管理</a></li>
                        </ul>
                        <!--二级菜单结束-->
                    </li>
                <li>
                    <a href="#" class="dropdown-toggle">
                    <i class="fa fa-inbox"></i>
                    <span>智能路由</span>
                    <i class="fa fa-chevron-circle-right drop-icon"></i>
                    </a>
                    <!--二级菜单-->
                    <ul class="submenu">
                        <li><a href="#">新建路由</a></li>
                        <li><a href="#">添加路由规则</a></li>
                        <li><a href="#">新增预警接收人</a></li>
                    </ul>
                    <!--二级菜单结束-->
                </li>
                <li>
                    <a href="#" class="dropdown-toggle">
                    <i class="fa fa-paste"></i>
                    <span>合同中心</span>
                    <i class="fa fa-chevron-circle-right drop-icon"></i>
                    </a>
                <!--二级菜单-->    
                    <ul class="submenu">
                        <li><a href="#">合同分析统计</a></li>
                        <li><a href="#">客户信息管理</a></li>
                        <li><a href="#">合同信息管理</a></li>
                        <li><a href="#">网络协议签订列表</a></li>
                    </ul>
                <!--二级菜单结束-->
                </li>
                <li>
                <a href="#">
                <i class="fa fa-shopping-cart"></i>
                <span>商品类目管理</span>
                </a>
                </li>
                <li>
                    <a href="#" class="dropdown-toggle">
                    <i class="fa fa-tasks"></i>
                    <span>属性及属性值管理</span>
                    <i class="fa fa-chevron-circle-right drop-icon"></i>
                    </a>
                <!--二级菜单-->
                    <ul class="submenu">
                        <li><a href="#">查看类目属性</a></li>
                        <li><a href="#">关联类目属性</a></li>
                        <li><a href="#">选择类目属性</a></li>
                    </ul>
                <!--二级菜单结束-->
                </li>
                <li>
                    <a href="#" class="dropdown-toggle">
                    <i class="fa fa-usd"></i>
                    <span>结算管理</span><i class="fa fa-chevron-circle-right drop-icon"></i>
                    </a>
                <!--二级菜单-->    
                    <ul class="submenu">
                        <li><a href="#">路由添加成本价-编辑价格</a></li>
                        <li><a href="#">路由添加成本价</a></li>
                    </ul>
                <!--二级菜单结束-->
                </li> --%>
                <!-- 订单测试 start -->
                
       <%--            <li>
                    <a href="#" class="dropdown-toggle">
                    <i class="fa fa-usd"></i>
                    <span>订单管理</span><i class="fa fa-chevron-circle-right drop-icon"></i>
                    </a>
                <!--二级菜单-->    
                    <ul class="submenu">
                        <li><a href="${_base}/toAlertOrder" target="mainFrame">订单处理</a></li>
                    </ul>
                <!--二级菜单结束-->
                </li> --%>
                 <li>
                    <a href="${_base}/order/toOrderList " target="mainFrame" class="dropdown-toggle">
                    <i class="fa fa-usd"></i>
                    <span>订单处理</span><i class="fa fa-chevron-circle-right drop-icon"></i>
                    </a>
                </li>
                
                <li>
                    <a href="${_base}/toPaidOrder" target="mainFrame" class="dropdown-toggle">
                    <i class="fa fa-usd"></i>
                    <span>售后列表</span><i class="fa fa-chevron-circle-right drop-icon"></i>
                    </a>
                </li>
                <li>
                    <a href="${_base}/toAlertOrder" target="mainFrame" class="dropdown-toggle">
                    <i class="fa fa-usd"></i>
                    <span>预警订单</span><i class="fa fa-chevron-circle-right drop-icon"></i>
                    </a>
                </li>
                <li>
                    <a href="${_base}/toStasticOrder" target="mainFrame" class="dropdown-toggle">
                    <i class="fa fa-usd"></i>
                    <span>订单查询</span><i class="fa fa-chevron-circle-right drop-icon"></i>
                    </a>
                </li>
                <li>
                    <a href="${_base}/jsp/order/invoice.jsp" target="mainFrame" class="dropdown-toggle">
                    <i class="fa fa-usd"></i>
                    <span>发票打印</span><i class="fa fa-chevron-circle-right drop-icon"></i>
                    </a>
                </li>
                <li>
                    <a href="${_base}/jsp/order_rule/panel_orderRuleSetting.jsp" target="mainFrame" class="dropdown-toggle">
                    <i class="fa fa-usd"></i>
                    <span>订单监控规则设置</span><i class="fa fa-chevron-circle-right drop-icon"></i>
                    </a>
                </li>
                <li>
                    <a href="${_base}/jsp/order_rule/findOrderRuleDetail.jsp" target="mainFrame" class="dropdown-toggle">
                    <i class="fa fa-usd"></i>
                    <span>订单监控规则详情</span><i class="fa fa-chevron-circle-right drop-icon"></i>
                    </a>
                </li>
                <!-- 订单测试 end -->
                </ul>
            </div>
        </div>
    </section>
    </div>
    <!--/左侧菜单结束-->