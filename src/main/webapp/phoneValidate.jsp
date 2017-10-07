<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>手机号验证</title>
<link rel="stylesheet" href="${path}css/password-1.css">
  <style type="text/css">
    .container p{
      text-indent: 20px;
      color: #666;
      font-size: 16px;
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
         找回密码<div class="find-inner">${error}</div>
       </div>
       <p>您正在使用密码找回功能，请使用当前账号已验证尾号为${src}的手机号并找回密码</p>
<form action="${pageContext.request.contextPath}/admin/UserAction_phoneValidate" method="post">
       <div class="register">
          <div class="text">
            <span class="text-1">请输入手机号:</span>
            <input type="text" name="phone" class="text-2" placeholder="请输入手机号" pattern="^1[3-9]\d{9}$" required oninvalid="setCustomValidity('请输入11位手机号');" oninput="setCustomValidity('');">
          </div>
          <input type="submit" name="" value="下一步" class="next">
       </div>
</form>      
   </div>
 
</body>
</html>