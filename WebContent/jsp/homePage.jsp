<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--本周热买  -->
 <c:if test="${hotBuyThisWeek==null}">
<jsp:forward page="/HotBuyThisWeek"></jsp:forward>
</c:if>

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
<title>用户主页</title>
<script type="text/javascript">

</script>
<style type="text/css">
.top {
	background-color: gainsboro;
	width: 100% px;
	height: 60px;
	display: flex;
	flex-direction: row;
}

.weizi {
	margin-top: 20px;
	margin-left: 10px;
}

.shopType {
	display: flex;
	flex-direction: row;
	margin-top: 180px;
	margin-left: 200px;
}

.shopType-lineSpacing {
	margin-left: 20px;
}

b:hover {
	color: red;
}

.shopping-css {
	height: 100% px;
	width: 100% px;
	border: 1px solid white;
}

.shopping-css:hover {
	border-color: red;
}

p:hover {
	color: red;
}
</style>
</head>
<body>
	<div class="top">
		<div>
			<img alt="" style="width: 220px; height: 60px;"
				src="${pageContext.request.contextPath}/img/topImg.jpg" />
		</div>
		<div>
			<img alt="" style="width: 280px; height: 60px;"
				src="${pageContext.request.contextPath}/img/topImg1.jpg" />
		</div>
		<div class="weizi">
			<a href="${pageContext.request.contextPath}/salesDescend"
				style="text-decoration: none; color: white;"><b>畅销榜单</b></a>
		</div>
		<div style="margin-top: 20px; margin-left: 20px;" class="a">
			<a href="${pageContext.request.contextPath}/findAllshangping"
				style="text-decoration: none; color: white;"><b>药品商城</b></a>
		</div>
		<div style="margin-top: 20px; margin-left: 20px;">
			<a href="${pageContext.request.contextPath}/jsp/technicalServices.jsp"
				style="text-decoration: none; color: white;"><b>技术服务</b></a>
		</div>
		<div style="margin-top: 20px; margin-left: 20px;">
			<a href="${pageContext.request.contextPath}/jsp/userGoMain.jsp"
				style="text-decoration: none; color: white;"><b>个人中心</b></a>
		</div>
		<div style="margin-top: 20px; margin-left: 20px;">
			<a href="${pageContext.request.contextPath}/jsp/adminLogin.jsp"
				style="text-decoration: none; color: white;"><b>后台管理</b></a>
		</div>
		<div style="margin-top: 20px; margin-left: 20px;">
			<a href="${pageContext.request.contextPath}/jsp/login.jsp"
				style="text-decoration: none; color: white;"><b>用户登录</b></a>
		</div>

		<div>
			<img alt=""
				style="width: 30px; height: 30px; margin-top: 15px; margin-left: 40px;"
				src="${pageContext.request.contextPath}/img/pim.jpg" />
		</div>
		<div style="margin-top: 17px; margin-left: 10px;">
			<span>欢迎:${user.username}</span> <a
				href="${pageContext.request.contextPath}/logout.action"><span
				style="cursor: pointer">[退出]</span></a>
		</div>
	</div>
	<!--轮播图  -->
	<c:forEach items="${ adminImgList}" var="list">
	<div>
		<div class="container index">
			<div class="span24" style="height: 456px;">
				<%-- 			    	<img id="hei1"  src="${pageContext.request.contextPath}/img/hei.png" style="display: block;width:25px;position:absolute;top: 450px;left: 650px;"/>
			    	<img id="bai1"  src="${pageContext.request.contextPath}/img/bai.png" style="display: none;width:25px;position:absolute;top: 450px;left: 650px;"/>
			    	<img id="hei2"  src="${pageContext.request.contextPath}/img/hei.png" style="display: block;width:25px;position:absolute; top: 450px;left: 750px;"/>
			    	<img id="bai2"  src="${pageContext.request.contextPath}/img/bai.png" style="display: none;width:25px;position:absolute;top: 450px;left: 750px;"/>
			    	<img id="hei3"  src="${pageContext.request.contextPath}/img/hei.png" style="display: block;width:25px;position:absolute; top: 450px;left: 850px;"/>
			    	<img id="bai3"  src="${pageContext.request.contextPath}/img/bai.png"style="display: none;width:25px;position:absolute;top: 450px;left: 850px;"/> --%>
				<img id="lb1" src="${pageContext.request.contextPath}/${list.imgOne}"
					style="display: block; width: 1245px; height: 600px;" /> <img
					id="lb2" src="${pageContext.request.contextPath}/${list.imgTwo}"
					style="display: none; width: 1245px; height: 600px;" /> <img
					id="lb3" src="${pageContext.request.contextPath}/${list.imgThree}"
					style="display: none; width: 1245px; height: 600px;" />


			</div>
		</div>
	</div></c:forEach>
	<!--商品分类  -->
	<div class="shopType">
		<div>
			<img alt="" style="width: 80px; height: 80px;"
				src="${pageContext.request.contextPath}/img/208.jpg"><br /> <a
				style="margin-left: 15px; text-decoration: none; color: #8d898c;"
				href="${pageContext.request.contextPath}/findDrugType1"><span><b>感冒咳嗽</b></span></a>
		</div>
		<div class="shopType-lineSpacing">
			<img alt="" style="width: 80px; height: 80px;"
				src="${pageContext.request.contextPath}/img/209.jpg"><br /> <a
				style="margin-left: 15px; text-decoration: none; color: #8d898c;"
				href="${pageContext.request.contextPath}/findDrugType2"><span><b>皮肤用药</b></span></a>
		</div>
		<div class="shopType-lineSpacing">
			<img alt="" style="width: 80px; height: 80px;"
				src="${pageContext.request.contextPath}/img/210.jpg"><br /> <a
				style="margin-left: 15px; text-decoration: none; color: #8d898c;"
				href="${pageContext.request.contextPath}/findDrugType3"><span><b>补肾壮阳</b></span></a>
		</div>
		<div class="shopType-lineSpacing">
			<img alt="" style="width: 80px; height: 80px;"
				src="${pageContext.request.contextPath}/img/211.jpg"><br /> <a
				style="margin-left: 15px; text-decoration: none; color: #8d898c;"
				href="${pageContext.request.contextPath}/findDrugType4"><span><b>眼科用药</b></span></a>
		</div>
		<div class="shopType-lineSpacing">
			<img alt="" style="width: 80px; height: 80px;"
				src="${pageContext.request.contextPath}/img/212.jpg"><br /> <a
				style="margin-left: 15px; text-decoration: none; color: #8d898c;"
				href="${pageContext.request.contextPath}/findDrugType5"><span><b>肠胃消化</b></span></a>
		</div>
		<div class="shopType-lineSpacing">
			<img alt="" style="width: 80px; height: 80px;"
				src="${pageContext.request.contextPath}/img/213.jpg"><br /> <a
				style="margin-left: 15px; text-decoration: none; color: #8d898c;"
				href="${pageContext.request.contextPath}/findDrugType6"><span><b>耳鼻喉用药</b></span></a>
		</div>
		<div class="shopType-lineSpacing">
			<img alt="" style="width: 80px; height: 80px;"
				src="${pageContext.request.contextPath}/img/214.jpg"><br /> <a
				style="margin-left: 15px; text-decoration: none; color: #8d898c;"
				href="${pageContext.request.contextPath}/findDrugType7"><span><b>补气养血</b></span></a>
		</div>
		<div class="shopType-lineSpacing">
			<img alt="" style="width: 80px; height: 80px;"
				src="${pageContext.request.contextPath}/img/215.jpg"><br /> <a
				style="margin-left: 17px; text-decoration: none; color: #8d898c;"
				href="${pageContext.request.contextPath}/findDrugType8"><span><b>口腔用药</b></span></a>
		</div>
		<div class="shopType-lineSpacing">
			<img alt="" style="width: 80px; height: 80px;"
				src="${pageContext.request.contextPath}/img/216.jpg"><br /> <a
				style="margin-left: 15px; text-decoration: none; color: #8d898c;"
				href="${pageContext.request.contextPath}/findDrugType9"><span><b>止痛镇痛</b></span></a>
		</div>
	</div>
	<!-- 本周热买-->
	<div class="Hot-this-week-center">
		<div>
			<img style="width: 400px; height: 100px;" alt=""
				src="${pageContext.request.contextPath}/img/218.jpg" />
		</div>
		<div class="Hot-this-week-title">欢迎来到暮云药店在线购物网，不一样的感觉，不一样的你。</div>
	</div>
	<div class="Hot-this-week-shop">
		<div>
		<c:forEach items="${hotBuyThisWeek}" var="list">
		<table class="shopping-css" border="0" width="17%" style="float: left; margin-left: 60px; margin-right: 20px; height: 480px; margin-bottom: 40px;">
			
			<tr>
				<td><img src="${pageContext.request.contextPath}/${list.img}"
					width="220" height="200" /></td>
			</tr>
			<tr style="font-size: 15px;color: black;margin-left:10px;">
				<td>${list.name}</td>
			</tr>
			<tr style="font-size: 17px;color:red;">
				<td>￥${list.price}</td>
			</tr>
			<tr style="color:black; ">
				<td width="200" height="100"><p>&nbsp;&nbsp;&nbsp;&nbsp;${list.message}</p></td>
			</tr>
			<tr>
			<td><img alt="" style="width: 30px;" src="${pageContext.request.contextPath}/img/ziying.jpg"/></td>
			</tr>
			<tr style="color: black;">
				<td><p>月销：${list.num}</p></td>
			</tr>
			<tr  style="color: black;">
				<td><p>产地：${list.address}</p></td>
			</tr>
			<tr align="right">
				<td><a
					href="${pageContext.request.contextPath}/findById?id=${list.id}">
						<img src="${pageContext.request.contextPath }/img/shopping.jpg"
						border="0" width="100" height="25" />
				</a></td>
			</tr>
			<tr>
				<td></td>
			</tr>
		</table>
</c:forEach> 

		</div>



	</div>
	<!-- 本周热卖测试结束-->
	<!--标志图 -->
	<div>
		<img alt="" style="width: 100%;"
			src="${pageContext.request.contextPath}/img/222.jpg" />
	</div>
	<!-- 签收 -->
	<div class="shopping-process">
		<div class="shopping-process-css">
			<div>
				<a href="${pageContext.request.contextPath}/jsp/goShopFlow.jsp"><img
					alt="" src="${pageContext.request.contextPath}/img/221.jpg" /></a>
			</div>
			<div style="color: #8d898c;">购物流程</div>
		</div>
		<div class="shopping-process-css">
			<div>
				<a href="${pageContext.request.contextPath}/jsp/guifan.jsp"><img
					alt="" src="${pageContext.request.contextPath}/img/221.jpg" /></a>
			</div>
			<div style="color: #8d898c;">发货与签收规范</div>
		</div>
		<div class="shopping-process-css">
			<div>
				<a href="${pageContext.request.contextPath}/jsp/aboutUs.jsp"><img
					alt="" src="${pageContext.request.contextPath}/img/221.jpg" /></a>
			</div>
			<div style="color: #8d898c;">关于我们</div>
		</div>
	</div>
	<!-- title图片 -->
	<div>
		<img alt="" style="width: 100%; height: 85px; margin-top: 10px;"
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