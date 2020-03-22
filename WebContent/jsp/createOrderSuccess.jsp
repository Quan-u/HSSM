<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	src="${pageContext.request.contextPath}/js/user/my.js"></script>
<!-- 跳转 -->
<title>支付成功页面</title>
</head>
<body>
	<c:forEach items="${cart}" var="list">
	</c:forEach>
	<!-- 收银台顶部 -->
	<div class="order-top">
		<div>
			<img alt="" style="width: 220px; height: 60px;"
				src="${pageContext.request.contextPath}/img/topImg.jpg" />
		</div>
		<div class="order-top-1">收银台</div>
	</div>
	<div>
		<img alt="" style="width: 100%; height: 30px;"
			src="${pageContext.request.contextPath}/img/orderTop.jpg" />
	</div>
	<!-- 收银台中间 信息部分-->
	<div style="display: flex; flex-direction: row;">
		<div>
			<img alt=""
				style="width: 60px; height: 60px; margin-left: 230px; margin-top: 20px;"
				src="${pageContext.request.contextPath}/img/succeed.jpg" />
		</div>
		<div style="margin-top: 50px; font-size: 14px;">
			订单提交成功!可以进入我的订单查看相关详情 <font style="font-weight: bold; color: #FF0000">正在为您跳转到首页...请稍等！</font><br />
			<br /> <a
				href="${pageContext.request.contextPath }/jsp/homePage.jsp"> <span
				id="second">5</span>点击直接进入首页！
			</a>
		</div>

	</div>
	<!-- 底部图片 -->
	<div style="margin-top: 50px;">
		<img alt="" style="width: 100%; height: 85px;"
			src="${pageContext.request.contextPath}/img/title.jpg" />
	</div>
	<!--底部  -->
	<div>
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