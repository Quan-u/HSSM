<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/user/common.css"
	rel="stylesheet" type="text/css" />
<!-- 登录的文本框 -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<title>登录页面</title>
<style type="text/css">
.loginImg {
	background-image: url(${pageContext.request.contextPath }/img/login.jpg);
	width: 940px;
	height: 560px;
}

.juzhong {
	display: flex;
	flex-direction: row;
}

.denglu {
	width: 60px;
	height: 30px;
	background-color: #0088CC;
	border-radius: 5px;
	margin-left: 90px;
	margin-top: 10px;
}

.bottom {
	width: 100%;
	height: 60px;
	background-color: gainsboro;
	margin-top: 57px;
}

.tishi {
	width: 100%;
	height: 20px;
	margin-left: 60px;
}
</style>
<script>
// 判断是登录账号和密码是否为空
function check(){
    var usercode = $("#username").val();
    var password = $("#password").val();
    if(usercode=="" || password==""){
    	$("#message").text("账号或密码不能为空！");
        return false;
    }  
    return true;
}
</script>
</head>
<body>
	<div class="juzhong">

		<div class="loginImg"></div>
		<div style="margin-left: 30px; margin-top: 100px;">
			<fieldset
				style="width: 250px; height: 300px; auto; margin: 0px auto; border: 5px solid #0088CC;">
				<legend>
					<font style="font-size: 20px; font-style: bold; color: #0088CC;"
						face="宋体"> 呵护您 我们加倍用心 </font>
				</legend>
				<div class="tishi">
					<font color="red"> <%-- 提示信息--%> <span id="message">${msg}</span>
					</font>
				</div>
				<div>
					<form action="${pageContext.request.contextPath}/login.action"
						onsubmit="return check()">
						<div
							style="margin-top: 14px; margin-left: 10px; font-size: 15px; font-weight: bolder;">
							<img alt="" style="width: 40px; height: 40px;"
								src="${pageContext.request.contextPath}/img/user.jpg" /><input
								type="text" id="username" name="username" class="text"></input><br />
						</div>

						<div
							style="margin-top: 10px; margin-left: 10px; font-size: 15px; font-weight: bolder;">
							<img alt="" style="width: 40px; height: 40px;"
								src="${pageContext.request.contextPath}/img/password.jpg" /><input
								type="text" id="password" name="password" class="text"></input>
						</div>
						<div>
							<button class="denglu" type="submit">登录</button>
							
						</div>
						<div class="bottom">
							<div
								style="color: red; font-size: 15px; margin-left: 55px; margin-top: 10px;">还没有注册账号？</div>
							<div
								style="margin-left: 40px; margin-top: 7px; font-weight: bolder;">
								立即注册享受在线购物！&nbsp;<a
									href="${pageContext.request.contextPath}/jsp/register.jsp">立即注册</a>		
							</div>
							<div
								style="margin-left: 40px; margin-top: 1px; font-weight: bolder;">
								后台管理请点击这&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
									href="${pageContext.request.contextPath}/jsp/adminLogin.jsp">管理员登录</a>		
							</div>
							
						</div>
					</form>
				</div>
			</fieldset>
				
		</div>
	</div>
</body>
</html>