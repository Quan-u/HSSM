<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/user/index.js"></script>
<!--轮播图-->
<link href="${pageContext.request.contextPath}/css/user/index.css"
	rel="stylesheet" type="text/css" />
<!--轮播图-->
<link href="${pageContext.request.contextPath}/css/user/product.min.css"
	rel="stylesheet" type="text/css" />
<!--本页面css -->
<title>商品详情页面</title>
</head>
<body>
	<c:forEach items="${list}" var="list">
		<div class="product-left">
			<div class="container index">
				<div class="span24">
					<%-- 			    <img id="hei1"  src="${pageContext.request.contextPath}/img/hei.png" style="display: block;width:25px;position:absolute;top: 450px;left: 650px;"/>
			    	<img id="bai1"  src="${pageContext.request.contextPath}/img/bai.png" style="display: none;width:25px;position:absolute;top: 450px;left: 650px;"/>
			    	<img id="hei2"  src="${pageContext.request.contextPath}/img/hei.png" style="display: block;width:25px;position:absolute; top: 450px;left: 750px;"/>
			    	<img id="bai2"  src="${pageContext.request.contextPath}/img/bai.png" style="display: none;width:25px;position:absolute;top: 450px;left: 750px;"/>
			    	<img id="hei3"  src="${pageContext.request.contextPath}/img/hei.png" style="display: block;width:25px;position:absolute; top: 450px;left: 850px;"/>
			    	<img id="bai3"  src="${pageContext.request.contextPath}/img/bai.png"style="display: none;width:25px;position:absolute;top: 450px;left: 850px;"/> --%>
					<img id="lb1"
						src="${pageContext.request.contextPath}/img/product1.jpg"
						style="display: block; width: 20%; height: 560px;" /> <img
						id="lb2" src="${pageContext.request.contextPath}/img/product2.jpg"
						style="display: none; width: 20%; height: 560px;" /> <img id="lb3"
						src="${pageContext.request.contextPath}/img/product3.jpg"
						style="display: none; width: 20%; height: 560px;" />
				</div>
			</div>
		</div>
		<!-- 图片 -->
		<div class="product-right">
			<div style="border: 1px solid gainsboro;">
				<img alt="" style="width: 300px; height: 300px;"
					src="${pageContext.request.contextPath}/${list.img}" />
			</div>
			<!--加入购物车  -->
			<div style="margin-left: 10px;">
				<div style="color: #414141; font-size: 14px; font-weight: bold;">名字${list.name}</div>
				<div class="shopping-font-size">编号:${list.id}</div>
				<div class="shopping-font-size">
					现价:<strong style="color: #ef0101; font-size: 16px;">￥:${list.price*list.discount/10}元/份</strong>&nbsp;&nbsp;&nbsp;&nbsp;原
					价:
					<del>￥${list.price}元/份</del>
				</div>
				<div class="shopping-font-size">品牌:${list.name}</div>
				<div class="shopping-font-size">产地:${list.address}</div>
				<div
					style="background-color: gainsboro; width: 410px; height: 60px; margin-top: 10px; border: 1px solid red;">
					<a href="${pageContext.request.contextPath}/AddCart?id=${list.id}"><img
						style="width: 90px; height: 40px; margin-left: 150px; margin-top: 10px;"
						alt="" src="${pageContext.request.contextPath}/img/addShop.jpg" /></a>
				</div>
			</div>
		</div>
		<!--商品详情  -->
		<div class="shop-info">
			<div class="shop-info-1">商品详情</div>
		</div>
		<div
			style="margin-left: 30%; width: 33%; color: #666666; margin-top: 20px;">规格参数:</div>
		<div style="display: flex; flex-direction: row;">
			<div
				style="margin-left: 30%; font-size: 12px; color: #666666; margin-top: 10px;">品牌:${list.name}</div>
			<div
				style="margin-left: 181px; font-size: 12px; color: #666666; margin-top: 10px;">产地:${list.address}</div>
			<div
				style="margin-left: 15%; font-size: 12px; color: #666666; margin-top: 10px;">名称:${list.name}</div>
		</div>
		<div style="display: flex; flex-direction: row;">
			<div
				style="margin-left: 30%; font-size: 12px; color: #666666; margin-top: 10px;">生产日期:${list.sDate}</div>
		</div>
		<div
			style="margin-left: 30%; font-size: 12px; color: #666666; margin-top: 10px;">保质期:${list.bDate}个月</div>
		<div
			style="margin-left: 30%; font-size: 12px; color: #666666; margin-top: 10px;">详情:${list.message}</div>
		<%-- <div class="shop-info-4" style="font-size: 12px;color: #666666;">规格参数:</div>
<div class="shop-info-2">
<div class="shop-info-4">
<div class="shop-info-3">品牌:${list.name}</div>
<div class="shop-info-3">生产日期:${list.sDate}</div>
<div class="shop-info-3">详情:${list.message}</div>
</div>
<div class="shop-info-5">
<div class="shop-info-3">产地:${list.address}</div>
<div class="shop-info-3">保质期:${list.address}</div>
</div>
<div class="shop-info-6">
<div class="shop-info-3">名称:${list.name}</div>
</div>

</div> --%>
	</c:forEach>

</body>
</html>