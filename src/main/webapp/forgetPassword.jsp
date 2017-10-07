<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>账号安全中心</title>
<link rel="stylesheet" href="${path}css/password-1.css">
</head>
<body>

<div class="container">
       <div class="usercenter">
         <span class="clock"><i><img src="${path}images/clock.png" width="23"></i></span>
         <span class="tit">账号安全中心</span>
       </div>
       <div class="find">
         找回密码
         <div class="find-inner">${errorMeg}</div>
       </div>
<form action="${pageContext.request.contextPath}/admin/UserAction_codeValidate" method="post">
       <div class="register">
          <div class="text">
            <span class="text-1">登录账号</span>
            <input type="text" name="code" class="text-2">
          </div>
          <input type="submit" value="下一步" class="next">
       </div>
</form>
</div>
 
</body>
</html>