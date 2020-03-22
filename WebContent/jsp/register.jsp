<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/user/common.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<title>用户注册界面</title>
<style type="text/css">
.juzhong {
	text-align: center;
}

.registerImg {
	background-image:
		url(${pageContext.request.contextPath }/img/register.jpg);
	width: 100% px;
	height: 480px;
}

.hanju {
	margin-top: 10px;
}
</style>

<script type="text/javascript">
/* function zheng(){
 
    var username=document.form.username.value;
    var password=document.form.password.value;
    var rePassword=document.form.rePassword.value;
    var email=document.form.email.value;
    var realname=document.form.realname.value;
    var sex=document.form.sex.value;
     var phone=document.form.phone.value;
      var address=document.form.address.value;

    if(username!=null){
	   document.form.submit();
	 

               
}else{
	  alert("有错误项！");
}
} */

   
  /*
			 * 1.确定事件：onfoucus  获得焦点
			 * 2.事件要驱动函数
			 * 3.函数要干一些事情 修改span的内容
			 */
			function showTips(spanID,msg){
				//获取操作元素span
				var span=document.getElementById(spanID)
				span.innerHTML=msg;
			}
			
			/*
			 * 1.确定事件：onblur 失去焦点
			 * 2.驱动函数
			 * 3.函数去校验结果
			 */
			
			function showTips(spanID,msg){
				//获取操作元素span
				var span=document.getElementById(spanID)
				span.innerHTML=msg;
			}
			
			/*
			 * 1.确定事件：onblur 失去焦点
			 * 2.驱动函数
			 * 3.函数去校验结果
			 */
			
			function checkUsername(){
				//获取用户输入的内容
			 	var uValue=document.getElementById("username").value;
			 	//对输入的内容进行校验
			 	//获得要显示结果的span
			 	var span=document.getElementById("span_username")
			 	if(uValue.length<3){
			 		span.innerHTML="<font color='red' size='2'>对不起！太短了（用户名必须大于2位）</font>"
			 		return false;
			 	}else{
			 	 	span.innerHTML="<font color='green' size='2'>用户名通过!</font>" 
			 		return true;
			 	}
			}
			
			function checkPassword(){
				var pValue=document.getElementById("password").value;
				
				var span=document.getElementById("span_password")
				if(pValue.length<6){
					span.innerHTML="<font color='red' size='2'>对不起 !太短了（密码必须大于5位）</font>"
					return false;
				}else{
					span.innerHTML="<font color='green' size='2'>恭喜你密码可用!</font>"
					return true;
				}
			}
			
			/*
			 * 确认密码
			 */
			function checkRepassword(){
				var pValue=document.getElementById("password").value;
				
				var repValue=document.getElementById("repassword").value;
				
				var span=document.getElementById("span_repassword")
				
				if(pValue !=repValue){
					span.innerHTML="<font color='red' size='2'>对不起，密码不一致!</font>"
					return false;
				}else{
					span.innerHTML="<font color='green' size='2'>密码一致!</font>"
					return true;
				}
			}
			
			/*
			 * 校验邮箱
			 */
			function checkmail(){
				var eValue=document.getElementById("email").value;
				var span=document.getElementById("span_email")
				var flag=checkEmail(eValue);
				if(flag){
					span.innerHTML="<font color='green' size='2'>邮箱格式正确!</font>"
					return true;
				}else{
					span.innerHTML="<font color='red' size='2'>邮箱格式错误!</font>"
					return false;
				}
			}
		function checkrealname(){
				var realname=document.getElementById("realname").value;
				var span=document.getElementById("span_realname")
				var flag=checkrealname(realname);
				if(flag){
					span.innerHTML="<font color='red' size='2'>不能为空!</font>"
				}else{
				span.innerHTML="<font color='green' size='2'>通过!</font>"
				}
			
			}
			/*
			 * 校验手机号码
			 */
			function checkphone(){
				var phone=document.getElementById("phone").value;
				var span=document.getElementById("span_phone")
				var flag=checkMobile(phone)
				if(flag){
					span.innerHTML="<font color='green' size='2'>手机号码正确!</font>"
					return true;
				}else{
					span.innerHTML="<font color='red' size='2'>手机号码输入有误!</font>"
					return false;
				}
			}
			function checkForm(){
				var flag=checkUsername()&&checkPassword()&&checkRepassword()&&checkmail()&&checkphone();
				if(flag){
					return true;
				}
				return false;
			}
</script>
</head>
<body>
	<div class="registerImg">
		<form action="${pageContext.request.contextPath}/insertUser"
			method="post" onsubmit="return checkForm()">
			<div class="juzhong"
				style="color: font-weight:bolder; color: black; margin-top: 100px;">
				<div>
					设置用户名：<input class="text" type="text" id="username" name="username"
						οnfοcus="showTips('span_username','用户名长度不能小于6位')"
						οnblur="checkUsername()" οnkeyup="checkUsername()" /><span
						id="span_username"></span>
				</div>
				<div class="hanju">
					&nbsp;&nbsp;&nbsp;设置密码：<input class="text" type="password"
						id="password" name="password"
						οnfοcus="showTips('span_password','用户名长度不能小于6位')"
						οnblur="checkPassword()" οnkeyup="checkPassword()" /><span
						id="span_password"></span>
				</div>
				<div class="hanju">
					&nbsp;&nbsp;&nbsp;确认密码：<input class="text" type="password"
						id="repassword" οnfοcus="showTips('span_repassword','两次密码必须一致')"
						οnblur="checkRepassword()" οnkeyup="checkRepassword()" /><span
						id="span_repassword"></span>
				</div>
				<div class="hanju">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮箱：<input
						class="text" type="email" id="email" name="email"
						οnfοcus="showTips('span_email','邮箱格式必须正确')" οnblur="checkemail()"
						οnkeyup="checkemail()" /><span id="span_email"></span>
				</div>
				<div class="hanju">
					&nbsp;&nbsp;&nbsp;真实姓名：<input class="text" type="text"
						id="realname" name="realname"
						οnfοcus="showTips('span_realname','不能为空')"
						οnblur="checkrealname()" οnkeyup="checkrealname()" /><span
						id="span_realname"></span>
				</div>
				<div class="hanju">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性别：<input
						type="radio" id="man" name="sex" value="男"><label
						for="man">男</label> <input type="radio" id="woman" name="sex"
						value="女"><label for="woman">女</label> <span
						style="color: red" id="sexmsg"></span>
				</div>
				<div class="hanju">
					&nbsp;&nbsp;&nbsp;联系方式：<input class="text" type="text" id="phone"
						name="phone" οnfοcus="showTips('span_phone','请输入正确手机号码')"
						οnblur="checkphone()" οnkeyup="checkphone()" /><br />
					<span id="span_phone"></span>
				</div>
				<div class="hanju">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地址：<input
						class="text" type="text" id="address" name="address"
						οnfοcus="showTips('span_address','请输入地址')" οnblur="checkaddress()"
						οnkeyup="checkaddress()" /><br />
					<span id="span_address"></span>
				</div>
				<div class="hanju">
					<button type="submit" class="zhuce"
						style="background-color: red; width: 60px; height: 30px;">注册</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>