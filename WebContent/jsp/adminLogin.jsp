<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/admin/adminLogin.css"
	rel="stylesheet" type="text/css" />
<!-- 样式 -->
<link href="${pageContext.request.contextPath}/css/user/common.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<title>管理员登录页面</title>
<script type="text/javascript">
function check(){
var ad_username=$("#ad_username").val();
var ad_password=$("#ad_password").val();
if(ad_username==''||ad_password==''){
$("#message").text("账号或密码不能为空！");
return false;
}
return true;
}
</script>
</head>
<body class="background">
	<div class="zhognjian">
		<div class="title">管理员登录</div>
		<div style="width: 100%; height: 20px; color: red;">
			<span id="message">${msg}</span>
		</div>
		<form action="${pageContext.request.contextPath}/AdminLogin"
			method="post" onsubmit="return check()">
			<div class="user">
				<div class="title-user" align="left">用户名</div>
				<div class="input">
					<input name="ad_username" id="ad_username" placeholder="用户名"
						type="text" class="text" style="width: 230px; height: 25px;"></input>
				</div>
			</div>
			<div class="user">
				<div class="title-user" align="left">密码</div>
				<div class="input">
					<input name="ad_password" id="ad_password" placeholder="密码"
						type="text" class="text" style="width: 230px; height: 25px;"></input>
				</div>
			</div>
			<button
				style="width: 60px; height: 30px; margin-top: 20px; black; font-size: 14px; background-color: white;"
				type="submit">
				<b>登录</b>
			</button>
		</form>
	</div>

</body>

</html>