<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="${pageContext.request.contextPath}/css/user/myOrdersInfo.css"
	rel="stylesheet" type="text/css" />
<!--页面样式-->
<title>user页面订单详情</title>
</head>
<body>
	<div class="border1">
		<div class="title">订单编号:${order.id}</div>
		<div class="background">
			<table style="width: 100%;">
				<tr class="background">
					<td width="10%">序号</td>
					<td width="10%">商品图片</td>
					<td width="40%">商品名称</td>
					<td width="10%">价格</td>
					<td width="10%">数量</td>
					<td width="10%">小计</td>
				</tr>
				<c:forEach items="${order.orderItems}" var="item" varStatus="vs">
					<tr style="font-size: 12px; color: #666;">
						<td width="10%">${vs.count }</td>
						<td width="10%"><img alt=""
							src="${pageContext.request.contextPath}/${item.p.img}"
							style="width: 60px; height: 60px;" /></td>
						<td width="40%">${item.p.name}&nbsp;${item.p.message}</td>
						<td width="10%">${item.p.price }元</td>
						<td width="10%">${item.buynum }</td>
						<td width="10%">${item.buynum*item.p.price }元</td>
					</tr>
				</c:forEach>
			</table>
			<div class="background">
				<div class="total">
					<b style="color: red; line-height: 30px; margin-left: 82%;">合计:&nbsp;&nbsp;${order.money}&nbsp;元</b>
				</div>
			</div>
			<div style="margin-top: 10px;">收货地址:&nbsp;${order.receiverAddress }</div>
			<div style="margin-top: 10px;">收货人:&nbsp;${order.receiverName}</div>
			<div style="margin-top: 10px;">联系方式:&nbsp;${order.receiverPhone }</div>
		</div>
		<div></div>
	</div>

</body>
</html>