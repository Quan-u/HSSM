<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 取list长度 -->
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
<title>用户管理页面</title>
</head>
<body>
	<pg:pager url="${pageContext.request.contextPath}/selectUserInfoList"
		index="center" maxPageItems="6" maxIndexPages="20"
		isOffset="<%=false%>" export="pageOffset,currentPageNumber=pageNumber"
		scope="request">
		<pg:param name="m" value="findSysparams" />
		<!-- 创建用户模态框 -->
		<div class="modal fade" id="newCustomerDialog" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">新建用户信息</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="new_customer_form">
							<div class="form-group">
								<label for="new_customerName" class="col-sm-2 control-label">
									真实姓名 </label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="realname1"
										placeholder="真实姓名" name="realname" />
								</div>
							</div>
							<div class="form-group">
								<label for="new_customerName" class="col-sm-2 control-label">
									用户名 </label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="username1"
										placeholder="用户名" name="username" />
								</div>
							</div>
							<div class="form-group">
								<label for="new_customerName" class="col-sm-2 control-label">
									用户密码 </label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="password1"
										placeholder="用户密码" name="password" />
								</div>
							</div>
							<div class="form-group">
								<label for="new_customerName" class="col-sm-2 control-label">
									用户电话 </label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="phone1"
										placeholder="用户电话" name="phone" />
								</div>
							</div>
							<div class="form-group">
								<label for="new_customerName" class="col-sm-2 control-label">
									用户邮箱 </label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="email1"
										placeholder="用户邮箱" name="email" />
								</div>
							</div>
							<div class="form-group">
								<label for="new_customerName" class="col-sm-2 control-label">
									用户性别 </label>
								<div class="col-sm-10">

									<input type="radio" id="man" name="sex" value="男"><label
										for="man">男</label> <input type="radio" id="woman" name="sex"
										value="女"><label for="woman">女</label>

								</div>
							</div>
							<div class="form-group">
								<label for="new_customerName" class="col-sm-2 control-label">
									用户地址 </label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="address1"
										placeholder="用户地址" name="address" />
								</div>
							</div>


						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary"
							onclick="createUser()">创建用户</button>
					</div>
				</div>
			</div>
		</div>
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

		<div id="page-wrapper" style="margin-left: 0%; overflow-y: auto;">
			<!--左边边距  -->
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">用户管理</h1>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-inline" method="post"
						action="${pageContext.request.contextPath }/mohuchaxun">
						<div class="form-group">
							<label for="customerName">用户名称</label> <input type="text"
								class="form-control" id="username" value="" name="username" />
						</div>
						<div class="form-group">
							<label for="customerName">用户电话</label> <input type="text"
								class="form-control" id="phone" value="" name="phone" />
						</div>

						<button type="submit" class="btn btn-primary">查询</button>
					</form>
				</div>
			</div>
			<a href="#" class="btn btn-primary" data-toggle="modal"
				data-target="#newCustomerDialog" onclick="clearUser()">新建</a>
			<div class="row" style="overflow-y: auto;">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">用户信息列表</div>
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>编号</th>
									<th>真实姓名</th>
									<th>用户名</th>
									<th>用户电话</th>
									<th>用户邮箱</th>
									<th>用户性别</th>
									<th>用户地址</th>
									<th>注册时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<c:forEach items="${selectUserInfoList }" var="list"
								varStatus="listStatus">
								<pg:item>
									<c:if test="${1 == listStatus.count % 2 }">
										<tr class="tab_list_tr2" onmouseover=this.className
											= 'tab_list_tr_hover';;
                        onmouseOut=this.className= 'tab_list_tr2';;>
                </c:if>
									<c:if test="${0 == listStatus.count % 2 }">
										<tr class="tab_list_tr" onmouseover=this.className
											= 'tab_list_tr_hover';;
                        onmouseOut=this.className= 'tab_list_tr';;>
                </c:if>
									<tr>
										<td align="center">${list.id}</td>
										<td align="center">${list.realname}</td>
										<td align="center">${list.username}</td>
										<td align="center">${list.phone}</td>
										<td align="center">${list.email}</td>
										<td align="center">${list.sex}</td>
										<td align="center">${list.address}</td>
										<td align="center">${list.registerTime}</td>
										<td align="center"><a href="#"
											class="btn btn-primary btn-xs" data-toggle="modal"
											data-target="#customerEditDialog"
											onclick="editT_project(${list.id})">修改</a> <a href="#"
											class="btn btn-danger btn-xs"
											onclick="deleteUser(${list.id})">删除</a></td>
									</tr>
								</pg:item>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div style="text-align: center;">
			<pg:index>
				<pg:first>
					<a href="<%=pageUrl%>"><button>首页</button></a>
				</pg:first>
				<pg:prev>
					<a href="<%=pageUrl%>"><button>上一页</button></a>
				</pg:prev>
				<pg:pages>
					<c:choose>
						<c:when test="${pageNumber eq currentPageNumber}">
							<font color="red">[<%=pageNumber%>]
							</font>
						</c:when>
						<c:otherwise>
							<a href="<%=pageUrl%>"><%=pageNumber%></a>
						</c:otherwise>
					</c:choose>
				</pg:pages>
				<pg:next>
					<a href="<%=pageUrl%>"><button>下一页</button></a>
				</pg:next>
				<pg:last>
					<a href="<%=pageUrl%>"><button>尾页</button></a>
				</pg:last>
  共${fn:length(selectUserInfoList) }个商品
    </pg:index>
		</div>
	</pg:pager>


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
     // 执行修改用户操作
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
    	//删除用户
    	function deleteUser(id){
    	alert(id);
    	if(confirm('确定要删除改用户吗?')){
    	$.post("<%=request.getContextPath()%>/deleteUser",{"id":id},function(data){
    	if(data=="OK"){
    	alert("用户删除成功！");
    	window.location.reload();
    	}else{
    	alert("删除用户失败！");
    	window.location.reload();
    	}
    	});
    	}
    	}
    	//清空新建用户窗口中的数据
    	function clearUser() {
    	alert("正在清理中...");
    		    $("#id1").val("");
    		    $("#realname1").val("")
    		    $("#username1").val("")
    		    $("#password1").val("")
    		    $("#phone1").val("");
    		    $("#email1").val("");
    		    $("#sex").val("");
    		    $("#address1").val("");
    		    
    		}
    	// 创建用户
    	function createUser(){
    	alert("创建用户");
    	$.post("<%=request.getContextPath()%>/createUser",
    	$("#new_customer_form").serialize(),function(data){
    alert("创建成功");
    	        if(data =="OK"){
    	            alert("用户创建成功！");
    	            window.location.reload();
    	        }else{
    	            alert("用户创建失败！");
    	            window.location.reload();
    	        }
    	    });
    	}
        </script>
</body>
</html>