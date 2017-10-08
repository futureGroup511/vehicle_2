<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib  prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆维护管理系统-维护信息列表</title>
<link rel="stylesheet" href="${path}css/bootstrap.css"> 
<link rel="stylesheet" href="${path}css/basic.css">
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
    .input{
    width:100%;
      height: 30px;
    }
    .box{
    width:90%;
    height:50px;
    }
   
   .box span{
    font-size: 20px;
    float: left;
  }
    .left{
    width:60%;
    float:left;
    }
    .right{
    float:left;
    width:40%;
 
  
    }
    dody{
    z-index:-1}
    .tab{
    height:10px;
}
    .ji{
    width: 70%;
    font-size: 20px;
    font-weight: bold;
    margin-top: 100px;
    
   }
      #pge{
    float: right;
    width:400px;
    heigth:50px;
    margin-top:-50px;
    margin-right: 100px
   }
    
    #pge nav{
      float: right;
    }
    
 .butt{
  width:80px;
  height:30px;
  border-radius:15px;
  background:rgb(153,200,207);

 }
 .btn1{
  float:right;
  margin-right:100px;
  margin-top:-25px;
 } 
  .picture{
 position:absolute;
 top:60px;
 left:70%;
 }
 .pic{
 position:absolute;
 right:15%;
 
 }
</style>
</head>
<body>
<form id="pageForm" action="${pageContext.request.contextPath}/admin/MaintainAction_maintainList" method="post">

 <div id="innerhead">
 <div class="row">
   <div class="col-lg-5 col-md-5 col-xs-6">
      <p>当前位置 >> 维护信息管理 >> 管理维护信息</p>
   </div>
  </div>
</div>
 
 <div class="box">
 	 <div class="left">
 	 	<div class="input">
        <span>车牌号：</span>
        <div class="col-lg-6 col-md-6  col-xs-6">
        <input type="text" class="form-control" name="plateId" id="plateId" placeholder="请输入车牌号" value="${plateId}">
        </div> 
    </div><br>
    <div class="input" >
        <span>时间查询:</span>
        <div class="col-lg-6 col-md-6  col-xs-6" style="display: inline-block;width: 450px">
         <center>
           <input type="text" name="beginDateString" class="sang_Calender"placeholder="请输入起始日期" style="width: 200px;float: left;border-radius:5px"  value="${beginDateString}">
           <input type="text" name="endDateString" class="sang_Calender" placeholder="请输入截止日期" style="width: 200px;float: left;margin-left: 20px;border-radius:5px" value="${endDateString}" >  
        </center>
        </div>
    </div><br>
 	 </div>
     <div class="right">
     <img class="pic" src="${path }images/car.png" class="picture">
     	 <div class="input">
        <span>车辆档案号：</span>
        <div class="col-lg-6 col-md-6  col-xs-6">
        <input type="text" class="form-control" name="vehicleId" id="vehicleId" placeholder="请输入车辆档案号" value="${vehicleId}">
        </div>
    </div><br>
    <div class="input">
        <span>车主查询：</span>
        <div class="col-lg-6 col-md-6  col-xs-6">
          <input type="text" name="userName" id="userName" class="form-control" placeholder="请输入车主名字" value="${userName}">
        </div> 
         
       
       
     </div>
      
 </div>   
    	<!-- 隐藏域.当前页码 -->
		<input type="hidden" name="currentPage" id="currentPageInput" value="${pageBean.currentPage}" />
		<!-- 隐藏域.每页显示条数 -->
        <input type="hidden" name="pageSize" id="pageSizeInput"   value="${pageBean.pageSize}" />    
  
    </div>    
     <input class="btn1 butt" type="submit" value="筛选">
     
 
</form>
  <div class="tab" style="z-index:-1"><!-- 表格开始 -->
    <table border="1" cellspacing＝"1">
      <thead>
        <tr>
          <td>维护信息编号</td>
          <td>车主名</td>
          <td>车辆档案号</td>
          <td>车牌号</td>
          <td>车辆类型</td>
          <td>手机号</td>
          <td>维护信息的录入日期</td>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${pageBean.list}" var="list">
	          <tr>
	            <td>${list.maintainId}</td>
	            <td>${list.userName}</td>
	            <td>${list.vehicleId}</td>
	            <td>${list.plateId}</td>
	            <td>${list.category}</td>	 
	            <td>${list.userPhone}</td>	            
	            <td>${list.date}</td>
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
            </li>
            <li><a href="javaScript:void(0)" onclick="changePage(${pageBean.currentPage-1})" >前一页</a></li>
            <li><a href="">${pageBean.currentPage}</a></li>
            <li><a href="javaScript:void(0)" onclick="changePage(${pageBean.currentPage+1})" >后一页</a></li>
            <li>到 <input type="text" id="page" name="page" value="${pageBean.currentPage}" style="width: 60px">页</li>
            <li><button class="butt" type="button" onclick="changePage($('#page').val())">GO</button></li>
            </li>
          </ul>
        </nav>
        </div>
  </div>
<script type="text/javascript" src="${path}js/datetime.js"></script>
</body>
</html>