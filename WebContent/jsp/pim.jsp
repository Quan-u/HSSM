<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引入js文件 -->
<!-- jQuery -->
<script
	src="${pageContext.request.contextPath}/js/bootstrap/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script
	src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script
	src="${pageContext.request.contextPath}/js/bootstrap/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script
	src="${pageContext.request.contextPath}/js/bootstrap/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script
	src="${pageContext.request.contextPath}/js/bootstrap/sb-admin-2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引入css样式文件 -->
<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css"
	rel="stylesheet" />
<!-- MetisMenu CSS -->
<link
	href="${pageContext.request.contextPath}/css/bootstrap/metisMenu.min.css"
	rel="stylesheet" />
<!-- DataTables CSS -->
<link
	href="${pageContext.request.contextPath}/css/bootstrap/dataTables.bootstrap.css"
	rel="stylesheet" />
<!-- Custom CSS -->
<link
	href="${pageContext.request.contextPath}/css/bootstrap/sb-admin-2.css"
	rel="stylesheet" />
<!-- Custom Fonts -->
<link
	href="${pageContext.request.contextPath}/css/bootstrap/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/bootstrap/boot-crm.css"
	rel="stylesheet" type="text/css" />
<title>个人中心-我的资料</title>
<style type="text/css">
border
:
 
1
px
 
solid
 
#429fff
; /* 单元格边框 */

  
text-align
:
 
right
;

  
padding
:
 
4
px
;


}
.zheng {
	color: black;
}
</style>
</head>
<body>
	<!-- 修改个人信息框 -->
	<div class="modal fade" id="customerEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改个人信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="T_project_form">
						<input type="hidden" id="edit_cust_id" name="cust_id" />


						<div class="form-group">
							<label for="projectName" class="col-sm-2 control-label">用户ID</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="id"
									readonly="readonly" placeholder="用户ID(不可以修改)" name="id" />
							</div>
						</div>
						<div class="form-group">
							<label for="deputyName" class="col-sm-2 control-label">真实姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="realname"
									placeholder="真实姓名" name="realname" />
							</div>
						</div>
						<div class="form-group">
							<label for="telephone" class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="username"
									placeholder="用户名称" name="username" />
							</div>
						</div>
						<div class="form-group">
							<label for="addr" class="col-sm-2 control-label">用户密码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="password"
									placeholder="用户密码" name="password" />
							</div>
						</div>
						<div class="form-group">
							<label for="addr" class="col-sm-2 control-label">用户电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="phone"
									placeholder="用户电话" name="phone" />
							</div>
						</div>
						<div class="form-group">
							<label for="addr" class="col-sm-2 control-label">用户邮箱</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="email"
									placeholder="用户邮箱" name="email" />
							</div>
						</div>
						<div class="form-group">
							<label for="addr" class="col-sm-2 control-label">用户性别</label>
							<div class="col-sm-10">
								<td><input type="radio" id="man" name="sex" value="男"><label
									for="man">男</label> <input type="radio" id="woman" name="sex"
									value="女"><label for="woman">女</label></td>

							</div>
						</div>

						<div class="form-group">
							<label for="addr" class="col-sm-2 control-label">用户地址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="address"
									placeholder="用户地址" name="address" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateT_project()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<form action="${pageContext.request.contextPath}/ByUserids">



		<c:forEach items="${PIM}" var="list">
			<table class="datalist" border="2px solid color: dodgerblue"
				width="27%"
				style="color: dodgerblue; float: center; margin-left: 35%; margin-right: 2.6%; height: 460px; margin-bottom: 40px;">

				<tr class="zheng" align="left">
					<td>用户ID:${list.id}</td>

				</tr>
				<tr class="zheng" align="left">
					<td>真实姓名:${list.realname}</td>

				</tr>
				<tr class="zheng" align="left">
					<td>用户名:${list.username}</td>

				</tr>
				<tr class="zheng" align="left">
					<td>用户密码:${list.password}</td>

				</tr>
				<tr class="zheng" align="left">
					<td>用户电话:${list.phone}</td>

				</tr>
				<tr class="zheng" align="left">
					<td>用户邮箱:${list.email}</td>

				</tr>
				<tr class="zheng" align="left">
					<td>用户性别:${list.sex}</td>

				</tr>
				<tr class="zheng" align="left">
					<td>用户地址:${list.address}</td>

				</tr>
				<td>
					<div style="margin-left: 3.2cm;">
						<a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
							data-target="#customerEditDialog"
							onclick="editT_project(${list.id})">&nbsp;&nbsp;修改</a>
					</div>

				</td>

			</table>
		</c:forEach>



	</form>
	<script type="text/javascript">  
//通过id修改
function editT_project(id) {
alert(id);
	    $.ajax({
	        type:"get",
	        url:"<%=request.getContextPath()%>/ByUserid",
	        data:{"id":id},
	        success:function(data) {
	            $("#id").val(data.id);
	               $("#realname").val(data.realname);
	            $("#username").val(data.username);
	            $("#password").val(data.password)
	            $("#phone").val(data.phone)
	             $("#email").val(data.email)
	              $("#sex").val(data.sex)
	            $("#address").val(data.address)
	        
	            alert(data);
	        }
	    });
	}
	
	 // 执行修改客户操作
	function updateT_project() {
		$.post("<%=request.getContextPath()%>/updateUser",$("#T_project_form").serialize(),function(data){
			if(data =="OK"){
				alert("该用户信息更新成功！");
				window.location.reload();
			}else{
				alert("修改个人信息失败！");
				window.location.reload();
			}
		});
	}
</script>
</body>
</html>