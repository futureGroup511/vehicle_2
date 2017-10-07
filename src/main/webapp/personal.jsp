<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${path}css/bootstrap.css">
<title>修改个人资料</title>
</head>
<style type="text/css">
body{
  background: url(${path}images/dotted.png);
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
   margin-right:50px;
 }
 .butn{
   width: 400px;
   float: right;
 }
  .butn input{
    float: right;
    width: 90px;
    margin-right: 50px
  }
</style>
<body>
<form action="${pageContext.request.contextPath}/admin/UserAction_updateUser?id=${user1.userId}" method="post">
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
           <input type="text" class="form-control" name="user1.phone" value="${user1.phone}"  pattern="^1[3-9]\d{9}$" required oninvalid="setCustomValidity('请输入11位手机号');" oninput="setCustomValidity('');"/>
         </div>
         <div class="butn">
           <input class="btn btn-primary" type="submit" value="修&nbsp;&nbsp;改" ></input>
      </div>
      </div>
</form>
</body>
</html>