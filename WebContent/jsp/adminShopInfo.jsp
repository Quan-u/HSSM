<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 取list长度 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="multipart/form-data; charset=UTF-8"> -->
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
<title>admin页面遍历商品</title>
</head>
<body>
	<pg:pager url="${pageContext.request.contextPath}/AdminShopList"
		index="center" maxPageItems="6" maxIndexPages="20"
		isOffset="<%=false%>" export="pageOffset,currentPageNumber=pageNumber"
		scope="request">
		<pg:param name="m" value="findSysparams" />

		<!-- 修改商品信息框 -->
		<form action="${pageContext.request.contextPath}/updateShop" 
			  method="post" enctype="multipart/form-data">
		<div class="modal fade" id="customerEditDialog1" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">修改商品信息</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="T_project_form">
							<div class="form-group">
								<label for="id" class="col-sm-2 control-label">商品ID</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="id"
										readonly="readonly" placeholder="商品ID(不能修改)" name="id" />
								</div>
							</div>
							<div class="form-group">
								<label for="id" class="col-sm-2 control-label">商品名称</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="name"
										placeholder="商品名称" name="name" />
								</div>
							</div>
							<div class="form-group">
								<label for="img" class="col-sm-2 control-label"> 商品图片 </label>
								<div class="col-sm-10">
									<!-- <img height='60' width='60' /><br>
									<input class="form-control" type="file" name="img"> <input
										type="text" class="form-control" id="img"
										placeholder="	    商品图片" name="img" value="yaoping/" /> -->
										<input type="file" class="form-control" id="img"
											 name="img" accept="image/*" />
								</div>
							</div>
							<div class="form-group">
								<label for="price" class="col-sm-2 control-label">商品价格</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="price"
										placeholder="商品价格" name="price" />
								</div>
							</div>
							<div class="form-group">
								<label for="message" class="col-sm-2 control-label">商品信息</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="message"
										placeholder="商品信息" name="message" />
								</div>
							</div>
							<div class="form-group">
								<label for="address" class="col-sm-2 control-label">生产地</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="address"
										placeholder="生产地" name="address" />
								</div>
							</div>


							<div class="form-group">
								<label for="num" class="col-sm-2 control-label">商品库存</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="num"
										placeholder="商品库存" name="num" />
								</div>
							</div>
							<div class="form-group">
								<label for="customerEditDialog1" class="col-sm-2 control-label">
									商品折扣 </label>
								<div class="col-sm-10">
									<select id="discount" class="form-control" name="discount">
										<option value="1">1折</option>
										<option value="2">2折</option>
										<option value="3">3折</option>
										<option value="4">4折</option>
										<option value="5">5折</option>
										<option value="6">6折</option>
										<option value="7">7折</option>
										<option value="8">8折</option>
										<option value="9">9折</option>
										<option value="10">10折</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="addr" class="col-sm-2 control-label">生产日期</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="sDate"
										placeholder="生产日期" name="sDate" />
								</div>
							</div>
							<div class="form-group">
								<label for="bDate" class="col-sm-2 control-label">保质期</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="bDate"
										placeholder="保质期 " name="bDate" />
								</div>
							</div>
							<div class="form-group">
								<label for="customerEditDialog1" class="col-sm-2 control-label">
									商品类型 </label>
								<div class="col-sm-10">
									<select id="drugType" class="form-control" name="drugType">
										<option value="1">感冒咳嗽</option>
										<option value="2">皮肤用药</option>
										<option value="3">补肾壮阳</option>
										<option value="4">眼科用药</option>
										<option value="5">肠胃消化</option>
										<option value="6">耳鼻喉用药</option>
										<option value="7">补气养血</option>
										<option value="8">口腔用药</option>
										<option value="9">止痛镇痛</option>
									</select>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary"
							>保存修改</button>
					</div>
				</div>
			</div>
		</div>
		</form>
		<!-- 创建商品模态框 -->
		<form id="formcreateShop" action="${pageContext.request.contextPath}/createShop" 
		 method="post" enctype="multipart/form-data">
			<div class="modal fade" id="newCustomerDialog" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel">
				<div class="clearfix" style="margin: 0px 15px 0px">
					<!-- 日期 -->
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">新建商品信息</h4>
							</div>
							<div class="modal-body">

								<div class="form-group">
									<label for="new_customerName" class="col-sm-2 control-label">
										商品名称 </label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="name"
											placeholder="商品名称" name="name" />
									</div>
								</div>
								<div class="form-group">
									<label for="new_customerName" class="col-sm-2 control-label">
										商品图片 </label>
									<div class="col-sm-10">

										<input type="file" class="form-control" id="img"
											 name="img" accept="image/*" />
                                <!--  <input type="file" name="image" accept="image/*/> -->
									</div>
								</div>
								<div class="form-group">
									<label for="new_customerName" class="col-sm-2 control-label">
										商品价格 </label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="price"
											placeholder="商品价格" name="price" />
									</div>
								</div>
								<div class="form-group">
									<label for="new_customerName" class="col-sm-2 control-label">
										商品信息 </label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="message"
											placeholder="商品信息" name="message" />
									</div>
								</div>
								<div class="form-group">
									<label for="new_customerName" class="col-sm-2 control-label">
										生产地 </label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="address"
											placeholder="生产地" name="address" />
									</div>
								</div>


								<div class="form-group">
									<label for="new_customerName" class="col-sm-2 control-label">
										商品库存 </label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="num"
											placeholder="商品库存" name="num" />
									</div>
								</div>

								<div class="form-group">
									<label for="new_customerName" class="col-sm-2 control-label">
										商品折扣 </label>
									<div class="col-sm-10">
										<select id="discount" class="form-control" name="discount">
											<option value="1">1折</option>
											<option value="2">2折</option>
											<option value="3">3折</option>
											<option value="4">4折</option>
											<option value="5">5折</option>
											<option value="6">6折</option>
											<option value="7">7折</option>
											<option value="8">8折</option>
											<option value="9">9折</option>
											<option value="10">10折</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="new_customerName" class="col-sm-2 control-label">
										生产日期 </label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="sDate"
											placeholder="生产日期" name="sDate" />
									</div>
								</div>
								<div class="form-group">
									<label for="new_customerName" class="col-sm-2 control-label">
										保质期 </label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="bDate"
											placeholder="保质期" name="bDate" />
									</div>
								</div>
								<div class="form-group">
									<label for="new_customerName" class="col-sm-2 control-label">
										商品类型 </label>
									<div class="col-sm-10">
										<select id="drugType" class="form-control" name="drugType">
											<option value="1">感冒咳嗽</option>
											<option value="2">皮肤用药</option>
											<option value="3">补肾壮阳</option>
											<option value="4">眼科用药</option>
											<option value="5">肠胃消化</option>
											<option value="6">耳鼻喉用药</option>
											<option value="7">补气养血</option>
											<option value="8">口腔用药</option>
											<option value="9">止痛镇痛</option>
										</select>
									</div>
								</div>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button  class="btn btn-primary" onclick="haha()">创建商品</button>

							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!--头部  -->
		<div id="page-wrapper" style="margin-left: 0%; overflow-y: auto;">
			<!--左边边距  -->
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">商品管理</h1>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-inline" method="post"
						action="${pageContext.request.contextPath }/mohuchaxunShop">
						<div class="form-group">
							<label for="customerName">商品ID</label> <input type="text"
								class="form-control" id="id" value="" name="id" />
						</div>
						<div class="form-group">
							<label for="customerName">商品名称</label> <input type="text"
								class="form-control" id="name" value="" name="name" />
						</div>
						<div class="form-group">
							<label for="customerName">商品类型</label> <select name="drugType"
								style="width: 150px; padding: 6px 12px; background-color: #fff; border: 1px solid #c2cad8; border-radius: 4px;">
								<option value="">全部</option>
								<option value="1">感冒咳嗽</option>
								<option value="2">皮肤用药</option>
								<option value="3">补肾壮阳</option>
								<option value="4">眼科用药</option>
								<option value="5">肠胃消化</option>
								<option value="6">耳鼻喉用药</option>
								<option value="7">补气养血</option>
								<option value="8">口腔用药</option>
								<option value="9">止痛镇痛</option>
							</select>
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
						<div class="panel-heading">商品信息列表</div>
						<table class="table table-bordered table-striped">
							<thead>
								<tr style="width: 100%;">
									<th width="5%">商品ID</th>
									<th width="8%">商品名称</th>
									<th width="5%">商品图片</th>
									<th width="5%">商品价格</th>
									<th width="35%">商品信息</th>
									<th width="5%">生产地</th>
									<th width="5%">商品库存</th>
									<th width="5%">商品折扣</th>
									<th width="5%">生产日期</th>
									<th width="5%">保质期</th>
									<th width="5%">相关操作</th>
								</tr>
							</thead>
							<c:forEach items="${AdminShopList}" var="list"
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
										<td style="text-align: center;">${list.name}</td>
										<td style="text-align: center;"><img
											src="${pageContext.request.contextPath}/${list.img}"
											width="50" height="50" /></td>
										<td style="text-align: center;">${list.price}</td>
										<td style="text-align: center;">${list.message}</td>
										<td style="text-align: center;">${list.address}</td>
										<td style="text-align: center;">${list.num}</td>
										<td style="text-align: center;">${list.discount}/折</td>
										<td style="text-align: center;">${list.sDate}</td>
										<td style="text-align: center;">${list.bDate}</td>

										<td style="text-align: center;"><a href="#"
											class="btn btn-primary btn-xs" data-toggle="modal"
											data-target="#customerEditDialog1"
											onclick="editShop(${list.id})">修改</a> <a href="#"
											class="btn btn-danger btn-xs"
											onclick="deleteShop(${list.id})">删除</a></td>
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
  共${fn:length(AdminShopList) }个商品
    </pg:index>
		</div>
	</pg:pager>


	<script type="text/javascript">
//清空新建客户窗口中的数据
function clearUser() {
alert("正在清理中...");
	    $("#id").val("");
	    $("#name").val("");
	    $("#img").val("")
	    $("#price").val("")
	    $("#message").val("")
	    $("#address").val("");
	    $("#num").val("");
	    $("#discount").val("");
	    $("#sDate").val("");
	    $("#bDate").val("");
	    $("#drugType").val("");
	}
//删除商品信息
function deleteShop(id) {
	if (confirm('确定要删除该商品信息吗？')) {
$.post("<%=request.getContextPath()%>/deleteShop",{"id":id},function(data){
if(data=="OK"){
alert("信息刪除成功！");
window.location.reload();
}else{
alert("删除信息失败！");
window.location.reload();
}
});
}
}
// 创建商品信息
function createShop(){
alert("创建商品");
$.post("<%=request.getContextPath()%>/createShop",
function(){
alert("创建成功");
    if(data =="OK"){
        alert("商品创建成功！");
        window.location.reload();
    }else{
        alert("商品创建失败！");
        window.location.reload();
    }
});
}
	
	//通过id修改
function editShop(id) {
alert(id);
	    $.ajax({
	        type:"get",
	        url:"<%=request.getContextPath()%>/getShopById",
	        data:{"id":id},
	        success:function(data) {
		            $("#id").val(data.id);
					$("#name").val(data.name);
					$("#price").val(data.price);
					$("#message").val(data.message);
					$("#address").val(data.address);
					$("#num").val(data.num);
					$("#discount").val(data.discount);
					$("#sDate").val(data.sDate);
					$("#bDate").val(data.bDate);

				}
			});
		}
	// 执行修改商品操作
	<%-- function updateT_project() {
		$.post("<%=request.getContextPath()%>/updateShop",$("#T_project_form").serialize(),function(data){
			if(data =="OK"){
				window.location.reload();
			}else{
				alert("修改商品信息失败！");
				window.location.reload();
			}
		});
	} --%>

  
		</script>
		
		<script type="text/javascript">
		  function createShop1() {
			  alert("f");
				window.location.reload();
		        return true;
		    	/*   window.location.go(-2); */
		    
		    	
			}
		</script>
		<script type="text/javascript">
		function haha(){
			document.getElementById("formcreateShop").submit();
			 
				window.location.reload();

			
		}
		</script>
</body>
</html>