<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改用户页面</title>
<link rel="stylesheet" href="${path}css/bootstrap.css">
<script type="text/javascript">
<c:if test="${!empty userMessage}">
	alert('${userMessage}');
</c:if>
</script>
</head>
<style type="text/css">
body{
   background:#efefef;
 }
html{
   background:#efefef;
} 
 #box{
  width: 500px;
  height: auto;
  margin: 70px auto
 }
 #box span{
 float: right;
 margin-top: 35px;
 font-size: 20px;
 vertical-align:middle;
 }
 #box input{
  margin-top:35px;
  vertical-align:middle;
 }
 #box button{
   float: right;
   margin-top: 40px;
   margin-right:160px;
 }
 .butt{
 width:120px;
 height:35px;
 border-radius:15px;
 background:rgb(153,200,207);

 }
 
 .picture{
 position:absolute;
 top:0;
 left:70%;
 }
 
</style>
<body>
<form action="${pageContext.request.contextPath}/admin/UserAction_updateUser?id=${user1.userId}" method="post">
 <img src="${path }images/car.png" class="picture">
 <div id="box">
       <div class="col-lg-5 col-md-6  col-xs-6" >
            <span>账号：</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input type="text" class="form-control" name="user1.code" value="${user1.code}"  required  oninvalid="setCustomValidity('请输入账号');" oninput="setCustomValidity('');" readonly="readonly"/>
         </div> 
      <div class="col-lg-5 col-md-6  col-xs-6">
            <span>用户名：</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input type="text" class="form-control" name="user1.name" value="${user1.name}"  required oninvalid="setCustomValidity('请输入用户名');" oninput="setCustomValidity('');"/>
         </div>
      <div class="col-lg-5 col-md-6  col-xs-6">
            <span>地址：</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input type="text" class="form-control" name="user1.address" value="${user1.address}" required oninvalid="setCustomValidity('请输入地址');" oninput="setCustomValidity('');"/>
         </div>
      <div class="col-lg-5 col-md-6  col-xs-6">
            <span>手机号：</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input type="text" class="form-control" name="user1.phone" value="${user1.phone}" pattern="^1[3-9]\d{9}$" required oninvalid="setCustomValidity('请输入11位手机号');" oninput="setCustomValidity('');"/>
         </div>
         <button class="butt" type="submit" >修&nbsp;&nbsp;改</button>
</div>
</form>
</body>
</html>