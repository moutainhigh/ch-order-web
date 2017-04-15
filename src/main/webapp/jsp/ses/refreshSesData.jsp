<%@page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>刷新订单数据</title>
<%@include file="/inc/inc.jsp"%>

<script type="text/javascript">
	function refreshOrder() {
		var no = $("#orderNo").val();
		var size = $("#orderSize").val();
		if (no == "" || no == null) {
			no = 1;
		}
		if (size == "" || size == null) {
			size = 100;
		}
		window.location.href = _base
				+ "/order/refreshSesData?pageNo=" + no
				+ "&pageSize=" + size+"&tenantId=changhong";
	}

</script>
</head>
<body>
	<div class="flushdata" style="margin: 10px 20px 30px 40px">
		<div>
			<ul style="margin: 10px 20px 30px 40px">
				<li style="margin: 10px 20px 30px 40px"><input id="orderNo" style="border: 1px solid #CCCCCC;"
					name="orderNo" type="text">--<input id="orderSize"
					style="border: 1px solid #CCCCCC;" name="orderSize" type="text">
				</li>
				<li style="margin: 10px 20px 30px 40px"><a href="#"><input type="button"
						class="biu-btn  btn-primary  btn-medium ml-10 " value="刷新订单数据"
						onclick="refreshOrder()"></a></li>
			</ul>
		</div>
	</div>
</body>
</html>
