<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- jQuery -->

	<script src="../vue.min.js"></script>

<script src="${pageContext.request.contextPath}/bootstrap-how2j/js/jquery/2.0.0/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/bootstrap-how2j/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/bootstrap-how2j/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<title>管理员管理主页图片</title>
</head>
<body>
  <c:forEach items="${adminImgList}" var="list">
<!-- 修改静态框 -->   
 <!-- 数据提交 ，修改第一张图片-->
<form action="${pageContext.request.contextPath}/updateAdminImg1" method="post" enctype="multipart/form-data">
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
<div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title">修改主页图片1</h4>
                     <input name="id1" type="hidden" value="${list.id}"/>
                     <input  name="two1" type="hidden" value="${list.imgTwo}"/>
                     <input  name="three1" type="hidden" value="${list.imgThree}"/>
          <div class="modal-body">
            <p>修改窗口</p>      
            <div style="width: 50%;margin-left:30%;">
             <div>请选择图片:<input name="img" type="file" class="form-control" accept="image/*"></div>          
          </div>
          <div class="modal-footer">
            <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
            <button  class="btn btn-primary" type="submit">确定修改</button>
          </div>   
        </div><!-- /.modal-content --> 
      </div><!-- /.modal-dialog --> 
</div>
</div>
</div>
 </form>


<!-- 数据提交 ，修改第二张图片-->
<form action="${pageContext.request.contextPath}/updateAdminImg2" method="post" enctype="multipart/form-data">
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
<div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title">修改主页图片2</h4>
                     <input name="id2" type="hidden" value="${list.id}"/>
                     <input  name="one2" type="hidden" value="${list.imgOne}"/>
                     <input  name="three2" type="hidden" value="${list.imgThree}"/>
          <div class="modal-body">
            <p>修改窗口</p>      
            <div style="width: 50%;margin-left:30%;">
             <div>请选择图片:<input name="img" type="file" class="form-control" accept="image/*"></div>          
          </div>
          <div class="modal-footer">
            <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
            <button  class="btn btn-primary" type="submit">确定修改</button>
          </div>   
        </div><!-- /.modal-content --> 
      </div><!-- /.modal-dialog --> 
</div>
</div>
</div>
 </form>

<!-- 数据提交 ，修改第三张图片-->
<form action="${pageContext.request.contextPath}/updateAdminImg3" method="post" enctype="multipart/form-data">
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
<div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title">修改主页图片3</h4>
                     <input name="id3" type="hidden" value="${list.id}"/>
                     <input  name="one3" type="hidden" value="${list.imgOne}"/>
                     <input  name="two3" type="hidden" value="${list.imgTwo}"/>
          <div class="modal-body">
            <p>修改窗口</p>      
            <div style="width: 50%;margin-left:30%;">
             <div>请选择图片:<input name="img" type="file" class="form-control" accept="image/*"></div>          
          </div>
          <div class="modal-footer">
            <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
            <button  class="btn btn-primary" type="submit">确定修改</button>
          </div>   
        </div><!-- /.modal-content --> 
      </div><!-- /.modal-dialog --> 
</div>
</div>
</div>
 </form>
 
<table class="table" style="margin-left: 60px;">
  <thead>
     <th>图片</th>
     <th>操作</th>
     
  </thead>
  <tbody>

    
     <tr>
        <td><img width="250px" height="120px" src="${pageContext.request.contextPath}/${list.imgOne}"/></td> 
        <td><button type="button" class="btn btn-success" onclick="updateImg1()">修改</button></td> 
        <!-- 使用input存放EL值 -->
<%--         <input type="text" value="${list.id},${list.imgOne},${list.imgOne},${list.imgTwo},${list.imgThree}"/> --%>
                  
        <td>第一张</td>  
     </tr>
 <tr>
        <td><img width="250px" height="120px" src="${pageContext.request.contextPath}/${list.imgTwo}"/></td> 
        <td><button type="button" class="btn btn-success" onclick="updateImg2()">修改</button></td> 
        <td>第二张</td> 
     </tr>
 <tr>
        <td><img width="250px" height="120px" src="${pageContext.request.contextPath}/${list.imgThree}"/></td> 
        <td><button type="button" class="btn btn-success" onclick="updateImg3()">修改</button></td> 
        <td>第三张</td> 
     </tr> 

  </tbody>
</table>
   </c:forEach>
</body>
<script type="text/javascript">

		function updateImg1(){
			 $("#myModal1").modal("show");
			}
				
				function updateImg2(){
					 $("#myModal2").modal("show");
					}
				
				function updateImg3(){
					 $("#myModal3").modal("show");
					}
	
</script>
</html>