<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${path}css/bootstrap.css">
<script type="text/javascript" src="${path}js/jquery.min.js"></script>
<script type="text/javascript" src="${path}js/jquery.md5.js"></script>   
<script language="javascript">
  
  function modifyPassword(){
	  
	  var newPsw=$.md5($("#old_password").val()); 
      var newPsw1 =$("#password1").val();
      var newPsw2 = $("#password2").val();
     
      if(newPsw!= '${user.password}'){
     	  alert("旧密码输入错误!");
     	 return false;
      } 
      
      if(newPsw1!= newPsw2){
          alert("两次密码输入不一致!");            
          return false; 
      }else{
        var new_password = $.md5(newPsw2);      
        $("#password").val(new_password);
     } 
      	
      return  true; 
      
   }
        
<c:if test="${!empty  message}">
     alert("${message}");
     top.location.href ="${pageContext.request.contextPath}/BaseAction_loginJump";
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
 #box .but{
  margin-left:220px;
  margin-right:65px;
 }
  #box button{
   margin-top:20px;
 }
 .form-group{
 	width:500px;
 	height:50px;
 	/*background:red;  */
 }
 
 .butt{
	width:80px;
	height:30px;
	border-radius:15px;
	background:rgb(153,200,207);

 }
 .butt2{
 margin-left:47px;
 }
 .butt1{
 margin-left:-40px;
 }
 
.picture{
 position:absolute;
 top:60px;
 left:70%;
 }
 
</style>
<title>车辆维护管理系统--修改密码</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/admin/UserAction_modifyPassword?id=${User.userId}" method="post" onsubmit="return modifyPassword()">
 <img src="${path}images/car.png" class="picture"> 
 <div id="innerhead">
 <div class="row">
   <div class="col-lg-5 col-md-5 col-xs-6">
      <p>当前位置 >> 系统设置 >> 修改密码</p>
   </div>
  </div>
 </div> 
  <div id="box"> 
      <div class="form-group">
      	<div class="col-lg-5 col-md-6  col-xs-6" >
            <span>输入旧密码：</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input  type="password"  id="old_password" placeholder="请输入旧密码"  required oninvalid="setCustomValidity('请输入旧密码);" oninput="setCustomValidity('');" class="form-control"/>
        </div> 
      </div>
      <div  class="form-group">
        	<div class="col-lg-5 col-md-6  col-xs-6" id="passSpan">
           	 <span>输入新密码：</span>
            </div>
        	<div class="col-lg-6 col-md-6  col-xs-6" id="passDiv">
          		<input  type="password"  id="password1"  placeholder="请输入新密码" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}$" required oninvalid="setCustomValidity('包含大小写字母和数字的组合，不能使用特殊字符，长度在8-10之间');" oninput="setCustomValidity('');" class="form-control"/>
        	</div>
      </div>
      <div	class="form-group">
        <div class="col-lg-5 col-md-6  col-xs-6">
            <span>新密码确认：</span>
        </div>
   
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input  type="password"  id="password2" class="form-control" placeholder="请在输入一次新密码" required oninvalid="setCustomValidity('再输入一次新密码');" oninput="setCustomValidity('');"/>
           <input  type="hidden" id="password" name="password" class="form-control"/>
        </div>
     </div>
     <div class="form-group">
       <div class="col-lg-5 col-lg-offset-4 col-md-6 col-md-offset-4 col-xs-6 col-xs-offset-4">
         <button class="butt butt2" type="reset">重&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;置</button>
        </div>
        <div class="col-lg-2 col-md-2 col-xs-2">
           <button class="butt butt1" type="submit">确认修改</button>
         </div>
      </div>
  </div>
        
</form>
</body>
</html>