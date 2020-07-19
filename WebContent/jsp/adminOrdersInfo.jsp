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
<title>admin页面用户管理</title>
</head>
<body>
	<pg:pager url="${pageContext.request.contextPath}/AdminOrdersList"
		index="center" maxPageItems="6" maxIndexPages="20"
		isOffset="<%=false%>" export="pageOffset,currentPageNumber=pageNumber"
		scope="request">
		<pg:param name="m" value="findSysparams" />
		<!-- <!--查看详情 -->
		<div class="modal fade" id="customerEditDialog" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel">
			<div
				style="background-color: white; width: 300px; height: 300px; margin-left: 45%; margin-top: 100px;">

			</div>
		</div> 
<!-- 修改个人信息框 -->
		<div class="modal fade" id="customerEditDialog1" tabindex="-1"
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
								<label for="projectName" class="col-sm-2 control-label">订单号</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="id"
										readonly="readonly" placeholder="订单号(不能修改)" name="id" />
								</div>
							</div>
							<div class="form-group">
								<label for="deputyName" class="col-sm-2 control-label">收货地址</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="receiverAddress"
										placeholder="收货地址" name="receiverAddress" />
								</div>
							</div>
							<div class="form-group">
								<label for="telephone" class="col-sm-2 control-label">收货人</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="receiverName"
										placeholder="收货人" name="receiverName" />
								</div>
							</div>
							<div class="form-group">
								<label for="telephone" class="col-sm-2 control-label">联系电话</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="receiverPhone"
										placeholder="联系电话" name="receiverPhone" />
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
					<h1 class="page-header">订单管理</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-inline" method="post"
						action="${pageContext.request.contextPath}/AdminOrderById">
						<div class="form-group">
							<label for="customerName">订单号</label> <input type="text"
								class="form-control" id="id" value="" name="id" />

						</div>
						<button type="submit" class="btn btn-primary">查询</button>
					</form>
				</div>
			</div>
			<div class="row" style="overflow-y: auto;">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">用户信息列表</div>
						<!-- /.panel-heading -->

						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>订单号</th>
									<th>支付金额</th>
									<th>收货地址</th>
									<th>收货人</th>
									<th>联系电话</th>
									<th>支付状态</th>
									<th>下单时间</th>
									<th>相关操作</th>
								</tr>
							</thead>
							<c:forEach items="${AdminOrdersList}" var="list"
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
										<td style="text-align: center;">${list.id}</td>
										<td style="text-align: center;">${list.money}元</td>
										<td style="text-align: center;">${list.receiverAddress}</td>
										<td style="text-align: center;">${list.receiverName}</td>
										<td style="text-align: center;">${list.receiverPhone}</td>
										<td style="text-align: center;">${list.paystate==0?"未支付":"已支付"}</td>
										<td style="text-align: center;">${list.ordertime}</td>
										<td style="text-align: center;"><a
											href="${pageContext.request.contextPath}/findOrderById?id=${list.id}"
											class="btn btn-primary btn-xs" data-toggle="modal">查看详情</a>
											<a href="#" class="btn btn-primary btn-xs"
											data-toggle="modal" data-target="#customerEditDialog1"
											onclick="editCustomer(${list.id})">修改</a> <a
											href="${pageContext.request.contextPath}/outExcelOrder?id=${list.id}"
											class="btn btn-primary btn-xs">报表</a> <a href="#"
											class="btn btn-danger btn-xs"
											onclick="deleteAdminOrder(${list.id})">删除</a></td>
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
  共${fn:length(AdminOrdersList) }个商品
    </pg:index>
		</div>
	</pg:pager>


	<script type="text/javascript">  
//通过id修改
function editCustomer(id) {
alert(id);
	    $.ajax({
	        type:"get",
	        url:"<%=request.getContextPath()%>/updateUserAdressById",
	        data:{"id":id},
	        success:function(data) {
	            $("#id").val(data.id);
	               $("#receiverAddress").val(data.receiverAddress);
	            $("#receiverName").val(data.receiverName);
	            $("#receiverPhone").val(data.receiverPhone)
	          
	            alert(data);
	        }
	    });
	}
		function updateT_project() {
		$.post("<%=request.getContextPath()%>/updateUserAdress",$("#T_project_form").serialize(),function(data){
			if(data =="OK"){
				alert("修改收货信息成功！");
				window.location.reload();
			}else{
				alert("修改收货信息失败！");
				window.location.reload();
			}
		});
	}
	
	//admin删除订单
	function deleteAdminOrder(id){
	alert(id);
	if(confirm('确定要删除此订单吗?')){
	$.post("<%=request.getContextPath()%>/deleteAdminOrder",{"id":id},function(data){
	if(data=="OK"){
	alert("该订单删除成功！");
	window.location.reload();
	}else{
	alert("该订单删除失败！");
	window.location.reload();
	}
	});
	}
	}
	</script>
</body>
</html>