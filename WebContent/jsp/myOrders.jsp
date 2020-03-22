<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/user/myOrders.css"
	rel="stylesheet" type="text/css" />
<!-- 样式 -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<title>用户个人中心-我的订单</title>
<style type="text/css">
b:hover {
	color: red;
}
</style>
</head>
<body>
	<table border="1" bordercolor="gray" rules="all">
		<tr class="top">
			<td align="center" width="15%">订单号</td>
			<td align="center" width="8%">实付金额</td>
			<td align="center" width="16%">用户地址</td>
			<td align="center" width="12%">用户名</td>
			<td width="11%" align="center">用户电话</td>
			<td width="5%" align="center">支付状态</td>
			<td width="25%" align="center">下单时间</td>
			<td width="20%" align="center">相关操作</td>
		</tr>
		<c:forEach items="${myOrders}" var="list">
			<tr class="border">
				<td align="center">&nbsp;&nbsp;&nbsp;${list.id}</td>
				<td align="center">&nbsp;&nbsp;&nbsp;${list.money}元</td>
				<td align="center">${list.receiverAddress}</td>
				<td align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					${list.receiverName}</td>
				<td align="center">${list.receiverPhone}</td>
				<td align="center">${list.paystate==0?"未支付":"已支付"}</td>
				<td align="center">${list.ordertime}</td>
				<td align="center">
					<div class="controller">
						<a
							href="${pageContext.request.contextPath}/findOrderById?id=${list.id}"
							style="text-decoration: none; color: #666;"><b>商品详情</b></a>
					</div>
					<div class="controller">
						<a href="#" style="text-decoration: none; color: #666;"
							onclick="deleteAdminOrder(${list.id})"><b>删除</b></a>
					</div>
				</td>
			</tr>
		</c:forEach>
	</table>
	<script type="text/javascript">  
	//删除商品信息
		function deleteAdminOrder(id) {
			if (confirm('确定要删除改订单吗？')) {
			
		$.post("<%=request.getContextPath()%>/deleteAdminOrder",{"id":id},function(data){
	if(data=="OK"){
	alert("该订单刪除成功！");
	window.location.reload();
	}else{
	alert("该订单删除失败！");
	window.location.reload();
	}
	});
	}
	}
	</script>
</body>
</html>