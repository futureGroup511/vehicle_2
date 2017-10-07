<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆维护系统-用户列表</title>
<link rel="stylesheet" href="${path}css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${path}css/basic.css">
<script type="text/javascript" src="${path}js/jquery.min.js"></script>

<script type="text/javascript">
  function changePage(pageNum){
	  //1.将页码的值放入对应的表单隐藏域中
	  $("#currentPageInput").val(pageNum);  
	  //2.提交表单
	  $("#pageForm").submit();
	  
  };
  
  
  var tip = "${Message}";
  if (tip !== null && tip !== undefined && tip !== '') { 
	  	alert(tip);
  } 
  

  function changePageSize(pageSize){
	   //1 将页码的值放入对应表单隐藏域中
	   $("#pageSizeInput").val(pageSize);
	   //2 提交表单
	   $("#pageForm").submit();
	}; 
</script>

<style type="text/css">
body{
   background:#efefef;
 }
html{
   background:#efefef;
}
#innerhead{
  height:60px;
  background-color:white;
}
#innerhead p{
  font-size:20px;
  padding:13px 30px;
}
.ji {
     width: 70%;
     font-size: 20px;
     font-weight: bold;
     margin-top: 100px;
    }
 #pge{
    margin-top:-50px;
  }
 .picture{
  position:absolute;
  top:60px;
  left:70%;
 }
 .butt{
 width:80px;
 height:30px;
 border-radius:15px;
 background:rgb(153,200,207)
 }
</style>
</head>
<body>  
<form id="pageForm" name="ordinaryForm" action="${pageContext.request.contextPath}/admin/UserAction_userList" method="post">
<img src="${path }images/car.png" class="picture">
 <div id="innerhead">
 <div class="row">
   <div class="col-lg-5 col-md-5 col-xs-6">
      <p>当前位置 >> 用户管理 >>管理用户   </p>
   </div>
  </div>
</div>
 
 <div class="pas">
    <span>用户名称：</span>
    <div class="col-lg-6 col-md-6  col-xs-6">
        <input type="text" class="form-control" name="name" id="name" placeholder="请输入用户名称" value="${name}">
    </div>
    <button class="butt" type="submit" name="button">筛&nbsp;&nbsp;选</button>
  		<!-- 隐藏域.当前页码 -->
		<input type="hidden" name="currentPage" id="currentPageInput" value="${pageBean.currentPage}" />
		<!-- 隐藏域.每页显示条数 -->
        <input type="hidden" name="pageSize" id="pageSizeInput"   value="${pageBean.pageSize}" />
  </div><!-- 输入框 -->
</form>
  <div class="tab"><!-- 表格开始 -->
    <table border="1">
      <thead>
        <tr>
          <td>账号</td>
          <td>用户名</td>
          <td>地址</td>
          <td>联系方式</td>
          <td>车辆数目</td>
          <td>信息数目</td>
          <td>操作</td>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${pageBean.list}" var="list" >
	          <tr>
	            <td>${list.code}</td>
	            <td>${list.name}</td>
	            <td>${list.address}</td>
	            <td>${list.phone}</td>
	            <td>${list.vehicleNumber}</td>
	            <td>${list.maintainNumber}</td>
	            <td class="edit"><img src="${path}images/bian.png"><a href="${pageContext.request.contextPath}/admin/UserAction_selectUser?id=${list.userId}">修改</a>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;<img src="${path}images/lajitong.png"><a href="${pageContext.request.contextPath}/admin/UserAction_deleteUser?id=${list.userId}"onclick="return confirm('确定要删除吗?')" style="color:#E11E05;">删除</a></td>
	          </tr>
              </c:forEach>     
      </tbody>
    </table>
     <div class="ji">
        共[<b>${pageBean.totalCount}</b>]条记录,[<b>${pageBean.totalPage}</b>]页
			 ,每页显示 
			 <select name="pageSize" onchange="changePageSize(this.options[this.options.selectedIndex].value)"  id="pageSizeSelect" >
				<option  value="3"  ${pageBean.pageSize==3?'selected':''}>3</option>
				<option  value="5" ${pageBean.pageSize==5?'selected':''}>5</option>
			 </select>
			 条
     </div>
     <div class="col-lg-5 col-lg-offset-5 col-md-6 col-md-offset-4 col-xs-6 col-xs-offset-4" id="pge">
           <nav>
          <ul class="pagination">
             
            <li><a href="javaScript:void(0)" onclick="changePage(${pageBean.currentPage-1})" >前一页</a></li>
            <li><a href="">${pageBean.currentPage}</a></li>
            <li><a href="javaScript:void(0)" onclick="changePage(${pageBean.currentPage+1})" >后一页</a></li>
            <li>到</li>
            <li><input type="text" id="page" name="page" value="${pageBean.currentPage}" style="width: 30px"/></li>
            <li><button class="butt"  style="width:45px" type="button" onclick="changePage($('#page').val())">GO</button></li>
             
          </ul>
          </nav>
        </div>
  </div>
</body>
</html>