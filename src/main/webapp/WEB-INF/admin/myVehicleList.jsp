<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib  prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆维护管理系统-车辆列表</title>
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
 
 .butt{
 width:80px;
 height:30px;
 border-radius:15px;
 background:rgb(153,200,207);

 }
 
 .picture{
 position:absolute;
 top:60px;
 left:70%;
 }

</style>
</head>
<body>
<form id="pageForm" name="ordinaryForm" action="${pageContext.request.contextPath}/admin/VehicleAction_vehicleList" method="post">
<img src="${path}images/car.png" class="picture">
<div id="innerhead">
 <div class="row">
   <div class="col-lg-5 col-md-5 col-xs-6">
      <p>当前位置 >> 车辆管理 >> 管理车辆  </p>
   </div>
  </div>
</div>

<div class="pas">
    <span>车牌号：</span>
    <div class="col-lg-6 col-md-6  col-xs-6">
       <input type="text" name="plateId" class="form-control" id="plateId" value="${plateId}"/>
    </div>
    <button class="butt" type="submit" name="button" class="button">筛&nbsp;&nbsp;选</button>
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
          <td>档案号</td>
          <td>车牌号</td>
          <td>车的类别</td>
          <td>车辆型号</td>
          <td>发动机编号</td>
          <td>车底盘号衍射</td>
          <td>重量</td>
          <td>车辆状态</td>
          <th>出厂日期</th>
	      <th>车主 </th>
	      <th>维护信息的数量</th>
       </tr>
      </thead>
      <tbody>
        <c:forEach items="${pageBean.list}" var="list" >
	          <tr>
	            <td>${list.vehicleId}</td>
	            <td>${list.plateId}</td>
	            <td>${list.category}</td>
	            <td>${list.model}</td>
	            <td>${list.engineId}</td>
	            <td>${list.carChassisId}</td>
	            <td>${list.weight}</td>
	            <td>${list.operationStatus}</td>
	            <td>${list.manufactureDate}</td>
	            <td>${list.userName}</td>
	            <td>${list.maintainNumber}</td>
	            <td>  
	            </td>
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
            <li>到 <input type="text" id="page" name="page" value="${pageBean.currentPage}" style="width: 60px">页</li>
            <li><button class="butt" type="button" onclick="changePage($('#page').val())">GO</button></li>
          </ul>
        </nav>
        </div>
  </div>
</body>
</html>