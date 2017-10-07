<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆维护管理系统-维护信息录入</title>
<link rel="stylesheet" href="${path}css/bootstrap.css">
</head>
<script type="text/javascript">
	<c:if test="${!empty maintainMessage}">
	  alert('${maintainMessage}');
	</c:if>
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

 #box{
  width: 500px;
  height: auto;
  margin: 50px auto
 }
 #box span{
 float: right;
 margin-top: 20px;
 font-size: 20px
 }
 #box input{
  margin-top: 20px
 }
 #box button{
   float: right;
   margin-top: 20px;
  /*width: 300px*/
   margin-right:55px;
   margin-left:10px;
 }
 #side_here{
	height: 44px;
	background:#fff url('../images/here.gif') 0px 0px repeat-x;
}
#side_here_l{
	width: 206px;
	height: 44px;
	background: url('../images/side_top.gif') 0px 0px no-repeat;
}
#here_area{
	height: 44px;
	line-height: 44px;
	padding-left: 20px;
}
.butt{
 width:80px;
 height:30px;
 border-radius:15px;
 background:rgb(153,200,207)
 }

.picture{
 position:absolute;
 top:60px;
 left:70%;
 } 
</style>
<body>
 <form  action="${pageContext.request.contextPath}/admin/MaintainAction_saveMaintain" method="post" >
 <img src="${path}images/car.png" class="picture">
 <div id="innerhead">
 <div class="row">
   <div class="col-lg-5 col-md-5 col-xs-6">
      <p>当前位置 >> 维护信息管理 >> 维护信息录入</p>
   </div>
  </div>
</div>
  
   <div id="box">
       <div class="col-lg-5 col-md-6  col-xs-6" >
            <span>车主姓名：</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input type="text" class="form-control" name="userName" required oninvalid="setCustomValidity('请填写车主姓名');" oninput="setCustomValidity('');"/>
         </div> 
      <div class="col-lg-5 col-md-6  col-xs-6">
            <span>车辆档案号：</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input type="text" class="form-control" name="vehicleId" required oninvalid="setCustomValidity('请输入车辆档案号');" oninput="setCustomValidity('');"/>
         </div>
      <div class="col-lg-5 col-md-6  col-xs-6">
            <span>车牌号：</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input type="text" class="form-control" name="plateId" pattern="^[\u4e00-\u9fa5]{1}[A-Z]{1}[A-Z_0-9]{5}$" required  oninvalid="setCustomValidity('请填写正确格式的车牌号,如豫G636UU');" oninput="setCustomValidity('');"/>
         </div>
         <button class="but butt" type="reset">重&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;置</button> 
         <button class="butt" type="submit" style="width:110px" autofocus="autofocus" >维护信息录入</button>
      </div>
   </form>
</body>
</html>