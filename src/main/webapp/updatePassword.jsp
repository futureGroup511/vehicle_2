<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${path}js/jquery.min.js"></script>
<script type="text/javascript" src="${path}js/jquery.md5.js"></script>
<script>
 $(function(){
  $("#before").blur(function(){
   var before = $(this).val();
   var beforeVal = $.md5(before);
   $("#after").val(beforeVal);
  });
 });
</script>
<title>修改密码</title>
<link rel="stylesheet" href="${path}css/bootstrap.css">
<link rel="stylesheet" href="${path}css/password-1.css">
</head>
<style type="text/css">
 #next1{
 width: 178px;
 	 
 	margin-left:373px;
 	background: #dc3c00;
 	display: inline-block;
 	height: 35px;
 	color: #fff;
 	line-height: 35px;
 	text-align: center;
 	border:0;
 	outline: none;
 	margin-top: 40px;
 	font-size:18px;
 }
</style>
<body>
   <div class="container">
       <div class="usercenter">
         <span class="clock"><i><img src="${path}images/clock.png" width="23"></i></span>
         <span class="tit">账号安全中心</span> 
       </div>
       <div class="find">
         设置新密码
       </div>
<form action="${pageContext.request.contextPath}/admin/UserAction_updatePassword?id=${user.userId}" method="post">       
       <div class="register">
          <div class="text">
            <span class="text-1">设置新密码</span>
            <input type="password" id="before" class="text-2" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}$" required oninvalid="setCustomValidity('包含大小写字母和数字的组合，不能使用特殊字符，长度在8-10之间');" oninput="setCustomValidity('');"/>
           <input type="hidden" name="password" id="after"/>
          </div>
          <input type="submit" name="" value="提&nbsp;&nbsp;交" class="submit_button" id="next1">
        </div>
</form>        
   </div>
</body>
</html>