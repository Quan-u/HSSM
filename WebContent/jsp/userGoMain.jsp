<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引入EasyUI的样式文件-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/easyui.css"
	type="text/css" />
<!-- 引入EasyUI的图标样式文件-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/icon.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin/demo.css"
	type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/admin/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/admin/angular.min.js"></script>
<!-- 引入EasyUI -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/admin/jquery.easyui.min.js"></script>
<!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/admin/easyui-lang-zh_CN.js"></script>
<title>个人中心</title>
</head>
<body class="easyui-layout" ng-App="adminMainApp"
	ng-controller="adminMainCtrl">
	<div data-options="region:'north'"
		style="height: 100px; text-align: center; overflow-y: auto;">
		<span style="font-size: 50px;">个人中心</span>
		<div style="font-size: 15px; position: absolute; left: 0; bottom: 0;">
			<a href="${pageContext.request.contextPath }/jsp/homePage.jsp"> <img
				style="margin-left: 10px; margin-bottom: 10px;"
				src="${pageContext.request.contextPath }/img/timg.gif" border="0"
				width="150" height="50" /></a>

		</div>
		<div style="font-size: 15px; position: absolute; right: 0; bottom: 0;">
			<span>嗨！下午好~:${user.id}</span>

		</div>
	</div>
	<div data-options="region:'west',split:true,title:'菜单栏'"
		style="width: 150px; padding: 10px;">
		<div class="easyui-accordion" data-options="fit:true,border:false">
			<div title="个人资料" data-options="selected:true">
				<div style="margin: 5px">
					<ul class="tree easyui-tree" data-options="animate:true,lines:true">
						<li data-options="iconCls:'icon-group_add'"><a
							style="text-decoration: none;"
							href="${pageContext.request.contextPath}/ByUserids?id=${user.id}"
							target="center"><span>修改个人资料</span></a></li>
					</ul>
				</div>
			</div>
			<div title="订单管理" data-options="selected:true">
				<div style="margin: 5px">
					<ul class="tree easyui-tree" data-options="animate:true,lines:true">
						<li data-options="iconCls:'icon-group_add'"><a
							style="text-decoration: none;"
							href="${pageContext.request.contextPath}/selectOrdersList?user_id=${user.id}"
							target="center"><span>查看个人订单</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div data-options="region:'center',title:'内容'">
		<iframe frameborder="0" height="100%" width="100%" scrolling="yes"
			name="center"></iframe>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/admin/adminMain.js"></script>
</html>