<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码成功页面</title>
  <link rel="stylesheet" href="${path}css/password-1.css">
  <style type="text/css">
  .register{
    text-align: center
  }
    .register p{
      text-align: center;
      color: #666;
      font-size: 18px;
    }
    .register a{
      font-size: 16px
    }
  </style>
</head>
<body>
   <div class="container">
       <div class="usercenter">
         <span class="clock"><i><img src="${path}images/clock.png" width="23"></i></span>
         <span class="tit">账号安全中心</span> 
       </div>
       <div class="find">
         找回密码
       </div>
       <div class="register">
          <p>修改密码成功</p> 
          <a href="${pageContext.request.contextPath}/BaseAction_loginJump" id="out">转到登录</a>
       </div>
   </div>
 
</body>
</html>