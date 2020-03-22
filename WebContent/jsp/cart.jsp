<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/user/index.js"></script>
<!--轮播图-->
<link href="${pageContext.request.contextPath}/css/user/index.css"
	rel="stylesheet" type="text/css" />
<!--轮播图-->
<link href="${pageContext.request.contextPath}/css/user/index.min.css"
	rel="stylesheet" type="text/css" />
<!-- 主页药品分类 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%><!--el表达式格式取值  -->
<title>购物车</title>
<style type="text/css">
b:hover {
	color: red;
}

.border {
	height: 100% px;
	width: 100% px;
	border: 1px solid gainsboro;
}

.border:hover {
	border-color: red;
}
</style>
<script type="text/javascript">
//当商品数量发生变化时触发该方法
function changeProductNum(count, totalCount, id) {
	count = parseInt(count);
	totalCount = parseInt(totalCount);
	//如果数量为0，判断是否要删除商品
	if (count == 0) {
		var flag = window.confirm("确认删除商品吗?");

		if (!flag) {
			count = 1;
		}
	}
	if (count > totalCount) {
		alert("已达到商品最大购买量");
		count = totalCount;
	}
	location.href = "${pageContext.request.contextPath}/changeCart?id="
			+ id + "&count=" + count;
}
//删除购物车中的商品
function cart_del() {   
    var msg = "您确定要删除该商品吗？";   
    if (confirm(msg)==true){   
    return true;   
    }else{   
    return false;   
    }   
}   
</script>
</head>
<body>
	<div style="width: 80%; margin-left: 10%;">
		<!-- 控制主题 -->
		<!-- 轮播图 -->
		<div>
			<div class="container index">
				<div class="span24" style="width: 100%;">
					<%-- 			    	<img id="hei1"  src="${pageContext.request.contextPath}/img/hei.png" style="display: block;width:25px;position:absolute;top: 450px;left: 650px;"/>
			    	<img id="bai1"  src="${pageContext.request.contextPath}/img/bai.png" style="display: none;width:25px;position:absolute;top: 450px;left: 650px;"/>
			    	<img id="hei2"  src="${pageContext.request.contextPath}/img/hei.png" style="display: block;width:25px;position:absolute; top: 450px;left: 750px;"/>
			    	<img id="bai2"  src="${pageContext.request.contextPath}/img/bai.png" style="display: none;width:25px;position:absolute;top: 450px;left: 750px;"/>
			    	<img id="hei3"  src="${pageContext.request.contextPath}/img/hei.png" style="display: block;width:25px;position:absolute; top: 450px;left: 850px;"/>
			    	<img id="bai3"  src="${pageContext.request.contextPath}/img/bai.png"style="display: none;width:25px;position:absolute;top: 450px;left: 850px;"/> --%>
					<img id="lb1"
						src="${pageContext.request.contextPath}/img/title1.jpg"
						style="display: block; width: 100%; height: 150px;" /> <img
						id="lb2" src="${pageContext.request.contextPath}/img/title2.jpg"
						style="display: none; width: 100%; height: 150px;" /> <img
						id="lb3" src="${pageContext.request.contextPath}/img/title3.jpg"
						style="display: none; width: 100%; height: 150px;" />

				</div>
			</div>
		</div>
		<div>
			<table style="border-collapse: collapse; width: 100%;">
				<tr
					style="background-color: gainsboro; width: 100%; height: 40px; color: #666; font-size: 12px; text-align: center;">
					<td width="5%">序号</td>
					<td width="45%">商品</td>
					<td width="10%">单价</td>
					<td width="12%">数量</td>
					<td width="10%">库存</td>
					<td width="10%">小计</td>
					<td width="8%">操作</td>
				</tr>
				<c:forEach items="${cart}" var="list" varStatus="vs">
					<tr class="border">
						<td style="text-align: center; color: #666;">${vs.count}</td>
						<td
							style="display: flex; flex-direction: row; font-size: 12px; color: #666;">
							<div>
								<img
									style="width: 100px; height: 100px; border: 1px solid gainsboro;"
									src="${pageContext.request.contextPath}/${list.key.img}"></img>
							</div>
							<div style="margin-left: 10px;">${list.key.name}&nbsp;&nbsp;${list.key.message}</div>
						</td>
						<td style="text-align: center; color: #666; font-size: 12px;">￥${list.key.price}</td>
						<td style="text-align: center;">
							<!-- 减少商品数量 --> <input type="button" value='-'
							style="width: 20px"
							onclick="changeProductNum('${list.value-1}','${list.key.num}','${list.key.id}')">
							<!-- 商品数量显示 --> <input name="text" type="text"
							value="${list.value}" style="width: 40px; text-align: center" />
							<!-- 增加商品数量 --> <input type="button" value='+'
							style="width: 20px;"
							onclick="changeProductNum('${list.value+1}','${list.key.num}','${list.key.id}')">
						</td>
						<td style="text-align: center; color: #666; font-size: 12px;">${list.key.num}</td>
						<td style="text-align: center; font-size: 12px;">￥${list.key.price*list.value}</td>
						<td style="text-align: center;">
							<!-- 删除商品 --> <a
							href="${pageContext.request.contextPath}/changeCart?id=${list.key.id}&count=0"
							style="color: #666; font-weight: bold; text-decoration: none;"
							onclick="javascript:return cart_del()"><b
								style="font-size: 12px;">删除</b></a>
						</td>
					</tr>
					<c:set value="${total+list.key.price*list.value}" var="total" />
					<fmt:formatNumber value="${total}" var="totals"></fmt:formatNumber>
					<!-- 改变总价格式-->
				</c:forEach>
			</table>
		</div>


	</div>
	<!-- 结算 -->
	<div
		style="border: 1px solid #666; width: 80%; height: 50px; margin-left: 10%; display: flex; flex-direction: row;">
		<div>
			<%--  <c:set var="totalPrice" value="${totalPrice+list.key.price*list.value}"/> --%>
			<a href="${pageContext.request.contextPath}/findAllshangping"><img
				alt="" style="width: 80px; height: 50px;"
				src="${pageContext.request.contextPath}/img/returnShop.jpg" /></a>
		</div>
		<div
			style="font-size: 12px; color: #666; width: 60%; margin-top: 12px; margin-left: 710px;">
			总价:<b style="color: red; font-size: 16px;">&nbsp;￥${totals}</b>
		</div>

		<div style="margin-left: 20px;">
			<a href="${pageContext.request.contextPath}/jsp/order.jsp"><img
				alt="" style="width: 80px; height: 50px;"
				src="${pageContext.request.contextPath}/img/toShop.jpg" /></a>
		</div>
	</div>
	<div>
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
</body>
</html>