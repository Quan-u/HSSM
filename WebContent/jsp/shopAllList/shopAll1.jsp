<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%-- <%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>分页标签 --%>
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
<link href="${pageContext.request.contextPath}/css/user/common.css"
	rel="stylesheet" type="text/css" />
<title>分类商品列表</title>
<style type="text/css">
.shopping-css {
	height: 100% px;
	width: 100% px;
	border: 1px solid white;
}

.shopping-css:hover {
	border-color: red;
}

.shopping-choose {
	background-color: gainsboro;
	width: 100%;
	height: 45px;
	color: black;
	font-size: 13px;
}

.rows {
	display: flex;
	flex-direction: row;
	margin-left: 70px;
}

p:hover {
	color: red;
}
</style>
</head>
<body>
	<!--商品搜索  -->
	<form action="${pageContext.request.contextPath}/findShopByName"
		method="post">
		<div style="display: flex; flex-direction: row;">
			<div>
				<a href="${pageContext.request.contextPath}/jsp/homePage.jsp"><img
					alt=""
					style="width: 150px; height: 50px; margin-top: 15px; margin-left: 15px;"
					src="${pageContext.request.contextPath }/img/timg.gif" /></a>
			</div>
			<div style="width: 100%; height: 80px;">
				<input
					style="width: 15%; height: 45px; margin-left: 65%; margin-top: 20px;"
					name="name" type="text" class="text"></input> <input type="submit"
					value=""
					style="width:50px;height:50px;margin-top:25px;border:none;background:url(${pageContext.request.contextPath}/img/searchImg.jpg) left top no-repeat;" />
			</div>
		</div>
	</form>

	<!-- 用户选择 -->
	<div class="shopping-choose">
		<%-- <div class="rows">
<div>
<a href="${pageContext.request.contextPath}/salesDescend"><button>销量 ↑</button></a>
</div>
<div>
<a href="${pageContext.request.contextPath}/NewProductDescend"><button>新品  ↑</button></a>
</div>
<div>
<a href="${pageContext.request.contextPath}/priceDescend"><button>价格  ↑</button></a>
</div>
<div>
<a href="${pageContext.request.contextPath}/discountDescend"><button>折扣  ↑</button></a>
</div>
</div>
<div  class="rows">
<div>
<a href="${pageContext.request.contextPath}/salesAsc"><button>销量 ↓</button></a>
</div>
<div>
<a href="${pageContext.request.contextPath}/NewProductAsc"><button>新品  ↓</button></a>
</div>
<div>
<a href="${pageContext.request.contextPath}/priceAsc"><button>价格  ↓</button></a>
</div>
<div>
<a href="${pageContext.request.contextPath}/discountAsc"><button>折扣   ↓</button></a>
</div>
<div>
<a href="${pageContext.request.contextPath}/findAllshangping"><button>综合 ↑↓</button></a>
</div>
</div> --%>

	</div>
	<pg:pager url="${pageContext.request.contextPath}/findDrugType1"
		index="center" maxPageItems="8" maxIndexPages="20"
		isOffset="<%=false%>" export="pageOffset,currentPageNumber=pageNumber"
		scope="request">
		<pg:param name="m" value="findSysparams" />

		<c:forEach items="${shop }" var="list" varStatus="listStatus">
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

				<table class="shopping-css" border="1" width="17%"
					style="float: left; margin-left: 4.6%; margin-right: 2.6%; height: 480px; margin-bottom: 40px;">
					<tr>
					<tr>
						<td><img src="${pageContext.request.contextPath}/${list.img}"
							width="220" height="200" /></td>
					</tr>
					<tr style="font-size: 15px; color: black; margin-left: 10px;">
						<td>${list.name}</td>
					</tr>
					<tr style="font-size: 17px; color: red;">
						<td>￥${list.price}</td>
					</tr>
					<tr style="color: black;">
						<td width="200" height="100"><p>&nbsp;&nbsp;&nbsp;&nbsp;${list.message}</p></td>
					</tr>
					<tr>
						<td><img alt="" style="width: 30px;"
							src="${pageContext.request.contextPath}/img/ziying.jpg" /></td>
					</tr>
					<tr style="color: black;">
						<td><p>月销：${list.num}</p></td>
					</tr>
					<tr style="color: black;">
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
			</pg:item>
		</c:forEach>
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
  共${fn:length(shop) }个商品
    </pg:index>
		</div>
		<div
		style="background-color: gainsboro; width: 100%; height: 40px; margin-top: 10px; position: fixed; bottom: 0;">
		<div style="text-align: center; line-height: 40px; color: black;">【quanyou.zheng】暮云药店在线购物网
			版权所有</div>
	</div>
	</pg:pager>
</body>
</html>