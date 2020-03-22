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
<title>admin个人资料</title>
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
					<h4 class="modal-title" id="myModalLabel">修改管理员信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="T_project_form">
						<input type="hidden" id="edit_cust_id" name="cust_id" />


						<div class="form-group">
							<label for="projectName" class="col-sm-2 control-label">管理员ID</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="ad_id"
									readonly="readonly" placeholder="用户ID(不可以修改)" name="ad_id" />
							</div>
						</div>
						<div class="form-group">
							<label for="deputyName" class="col-sm-2 control-label">账号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="ad_username"
									placeholder="管理员账号" name="ad_username" />
							</div>
						</div>
						<div class="form-group">
							<label for="telephone" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="ad_password"
									placeholder="管理员密码" name="ad_password" />
							</div>
						</div>
						<div class="form-group">
							<label for="addr" class="col-sm-2 control-label">角色</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="ad_info"
									placeholder="角色" name="ad_info" />
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
	<form
		action="${pageContext.request.contextPath}/selectAdminList?ad_username=${Admin_session.ad_username}">

		<c:forEach items="${admin}" var="list">
			<table class="datalist" border="2px solid color: dodgerblue"
				width="27%"
				style="color: dodgerblue; float: center; margin-left: 35%; margin-right: 2.6%; height: 460px; margin-bottom: 40px;">

				<tr class="zheng" align="left">
					<td>管理员ID:${list.ad_id}</td>

				</tr>
				<tr class="zheng" align="left">
					<td>账号:${list.ad_username}</td>

				</tr>
				<tr class="zheng" align="left">
					<td>密码:${list.ad_password}</td>

				</tr>
				<tr class="zheng" align="left">
					<td>角色:${list.ad_info}</td>

				</tr>
				<td>
					<div style="margin-left: 3.2cm;">
						<a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
							data-target="#customerEditDialog"
							onclick="editT_project(${list.ad_id})">&nbsp;&nbsp;修改</a>
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
	        url:"<%=request.getContextPath()%>/ByAdminId",
	        data:{"ad_id":id},
	        success:function(data) {
	            $("#ad_id").val(data.ad_id);
	            $("#ad_username").val(data.ad_username);
	            $("#ad_password").val(data.ad_password);
	            $("#ad_info").val(data.ad_info)
	          
	            alert(data);
	        }
	    });
	}
	
	 // 执行修改admin操作
	function updateT_project() {
		$.post("<%=request.getContextPath()%>/updateAdmin",$("#T_project_form").serialize(),function(data){
			if(data =="OK"){
				alert("修改管理员信息成功！");
				window.location.reload();
			}else{
				alert("修改管理员信息失败！");
				window.location.reload();
			}
		});
	}
</script>
</body>
</html>