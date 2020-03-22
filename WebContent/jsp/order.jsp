<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 取list长度 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%><!--el表达式格式取值  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/user/order.min.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/user/index.min.css"
	rel="stylesheet" type="text/css" />
<!-- 主页底部样式 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/user/order.js"></script>
<title>订单支付页面</title>
<style type="text/css">
b:hover {
	color: red;
}
</style>
</head>
<body>
	<div style="width: 80%; margin-left: 10%;">
		<!-- 控制主题 -->
		<div class="order-top">
			<div>
				<img alt="" style="width: 220px; height: 60px;"
					src="${pageContext.request.contextPath}/img/topImg.jpg" />
			</div>
			<div class="order-top-1">结算页</div>
		</div>
		<div>
			<img alt="" style="width: 100%; height: 30px;"
				src="${pageContext.request.contextPath}/img/orderTop.jpg" />
		</div>
		<form id="orderForm"
			action="${pageContext.request.contextPath}/createOrder" method="post">
			<div style="margin-top: 10px; color: #666;">填写并核对订单信息</div>
			<div style="border: 1px solid #333;">
				<div style="margin-left: 20px; font-weight: bolder;">收货人信息</div>
				<div style="margin-left: 40px; margin-top: 20px;">
					收货地址:<input type="text" class="text" placeholder="请输入收货地址"
						id="receiverAddress" name="receiverAddress"
						style="width: 200px; height: 25px;"
						onkeyup="checkReceiverAddress();"></input>
					&nbsp;&nbsp;&nbsp;&nbsp;收货人:<input type="text" class="text"
						placeholder="请收货人姓名" id="receiverName" name="receiverName"
						style="width: 200px; height: 25px;" onkeyup="checkReceiverName();"></input>
					&nbsp;&nbsp;&nbsp;&nbsp;联系电话:<input type="text" class="text"
						placeholder="请输入联系方式" id="receiverPhone" name="receiverPhone"
						style="width: 200px; height: 25px;"
						onkeyup="checkReceiverPhone();"></input>
					<!--验证信息  -->
					<div
						style="display: flex; flex-direction: row; width: 100%; font-size: 12px;">
						<div style="width: 33%; margin-left: 90px;">
							<span id="receiverAddressMsg"></span>
						</div>
						<div style="width: 33%;">
							<span id="receiverNameMsg"></span>
						</div>
						<div style="width: 33%;">
							<span id="receiverPhoneMsg"></span>
						</div>
					</div>
					<div style="margin-top: 20px;"></div>
				</div>
			</div>
			<!-- 支付方式  -->
			<div style="border: 1px solid #666; margin-top: 10px;">
				<div style="margin-left: 20px; font-weight: bolder;">支付方式</div>
				<div style="display: flex; flex-direction: row; margin-top: 8px;">
					<div style="margin-left: 40px;">
						<img alt="" style="width: 50px; height: 50px;"
							src="${pageContext.request.contextPath}/img/weixin.jpg" />
					</div>
					<div style="margin-top: 17px;">
						<input name="pay" type="radio" style="line-height: 20px;"></input>
					</div>

					<div style="margin-left: 40px;">
						<img alt="" style="width: 50px; height: 50px;"
							src="${pageContext.request.contextPath}/img/zhifubao.jpg" />
					</div>
					<div style="margin-top: 17px;">
						<input name="pay" type="radio" style="line-height: 20px;"></input>
					</div>

					<div style="margin-left: 40px;">
						<img alt="" style="width: 50px; height: 50px;"
							src="${pageContext.request.contextPath}/img/unionPay.jpg" />
					</div>
					<div style="margin-top: 17px;">
						<input name="pay" type="radio" style="line-height: 20px;"></input>
					</div>
				</div>
				<div style="margin-top: 20px;"></div>

			</div>
			<!--送货清单  -->
			<div style="border: 1px solid #666; margin-top: 10px;">
				<div style="margin-left: 20px; font-weight: bolder;">送货清单</div>
				<div
					style="background-color: gainsboro; display: flex; flex-direction: row; width: 100%; height: 40px;">
					<div style="line-height: 40px; color: #666; margin-left: 10px;">商家:暮云药店自营</div>
					<div style="line-height: 40px; margin-left: 700px;">
						<a style="text-decoration: none; font-size: 12px; color: #666;"
							href="${pageContext.request.contextPath}/jsp/cart.jsp"><b>返回修改购物车</b></a>
					</div>
				</div>
			</div>
			<div style="border: 1px solid #666;"></div>
			<c:forEach items="${cart}" var="list">
				<table style="border: 1px solid #666; width: 100%;">
					<tr>
						<td style="width: 10%;"><img alt=""
							style="width: 80px; height: 80px;"
							src="${pageContext.request.contextPath}/${list.key.img}" /></td>
						<td style="color: #666; font-size: 12px; width: 65%;">${list.key.name}<br />${list.key.message}</td>
						<td
							style="color: red; font-size: 12px; font-weight: bolder; width: 5%;">￥${list.key.price}</td>
						<td style="color: #666; font-size: 12px; width: 5%;">x${list.value}</td>
						<td style="color: #666; font-size: 12px; width: 5%;">有货</td>
					</tr>
				</table>
				<c:set value="${total+list.key.price*list.value}" var="total" />
			</c:forEach>
			<table>
				<td><fmt:formatNumber value="${total}" var="totals"></fmt:formatNumber>
					<!-- 改变总价格式--> <input type="hidden" name="money" value="${totals}"></input>
				<!--hidden用于隐藏值提交到from表单，不展现到页面--></td>
			</table>
			<!--运费  -->
			<div
				style="font-size: 12px; color: #666; margin-top: 10px; display: flex; flex-direction: row; margin-left: 75%;">
				<div>
					<div style="margin-top: 10px;">
						<b style="color: red;">${fn:length(cart)}</b>&nbsp;件商品，总商品金额:
					</div>
					<div style="margin-top: 10px;">调货服务费:</div>
					<div style="margin-top: 10px;">运费:</div>
					<div style="margin-top: 10px;">返现:</div>
				</div>
				<div style="margin-left: 80px;">
					<div style="margin-top: 10px;">￥${totals}</div>
					<div style="margin-top: 10px;">￥0.00</div>
					<div style="margin-top: 10px;">￥0.00</div>
					<div style="margin-top: 10px;">￥0.00</div>
				</div>
			</div>
			<!-- 应付总额  -->
			<div
				style="background-color: gainsboro; width: 100%; height: 80px; margin-top: 10px;">
				<div style="display: flex; flex-direction: row;">
					<div
						style="font-size: 12px; color: #666; margin-top: 5px; margin-left: 85%;">应付总额:</div>
					<div
						style="font-size: 18px; color: red; font-weight: bolder; margin-left: 10px;">￥${totals}</div>
				</div>
				<div class="pay">
					<img alt="" style="width: 130px; height: 35px;"
						src="${pageContext.request.contextPath}/img/tijiao.jpg"
						onclick="checkOnSubmit()" ;/>
				</div>
			</div>
		</form>
		<!-- 底部图片 -->
		<div style="margin-top: 50px;">
			<img alt="" style="width: 100%; height: 85px;"
				src="${pageContext.request.contextPath}/img/title.jpg" />
		</div>
		<!--底部  -->
		<div class="bottom-css" style="margin-top: -10px;">
			<div class="bottom-orientation">
				<div>购物指南</div>
				<div class="bottom-css-1">会员介绍</div>
				<div class="bottom-css-1">生活旅行/团购</div>
				<div class="bottom-css-1">常见问题</div>
				<div class="bottom-css-1">网点查询</div>
			</div>
			<div class="bottom-orientation-1">
				<div>配送方式</div>
				<div class="bottom-css-1">上门自取</div>
				<div class="bottom-css-1">配送服务查询</div>
				<div class="bottom-css-1">配送费收取标准</div>
				<div class="bottom-css-1">海外配送</div>
			</div>
			<div class="bottom-orientation-2">
				<div>支付方式</div>
				<div class="bottom-css-1">货到付款</div>
				<div class="bottom-css-1">在线支付</div>
				<div class="bottom-css-1">分期付款</div>
				<div class="bottom-css-1">邮局汇款</div>
				<div class="bottom-css-1">公司转账</div>
			</div>
			<div class="bottom-orientation-3">
				<div>全国服务热线</div>
				<div class="bottom-css-2">402-8223-88888</div>
				<div class="bottom-css-3">关注我们</div>
				<div class="bottom-css-3">服务时间： 8:30-20:30</div>
			</div>

		</div>
		<!--版权所有  -->
		<div class="bottom-css-4">【quanyou.zheng】暮云药店在线购物网 版权所有</div>
	</div>
</body>
</html>