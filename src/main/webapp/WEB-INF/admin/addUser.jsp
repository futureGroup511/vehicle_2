<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${path}css/bootstrap.css">
<script type="text/javascript" src="${path}js/jquery.min.js"></script>
<script type="text/javascript" src="${path}js/jquery.md5.js" ></script>
<title>辉县市车辆维护管理系统——增加用户</title>
</head>
<script type="text/javascript">
  var tip = "${userMessage}";
  if (tip !== null && tip !== undefined && tip !== '') { 
	  	alert(tip);
  } 
  
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
  margin-top: 20px;
  width:220px;
  height:34px;
 }
 #box button{
   float: right;
   margin-top: 20px;
   margin-right:50px;
 }
 #box div{
  position: relative;
 }
 .choose{
  position: relative;
  width: 100%;
  height: 50px;
 }
 #box .box-innner{
  width: 100%;
  height: 40px;
  margin-top: 10px
 }
 #box .sel{
  width: 100px;
  height: 30px;
  margin-top:20px;
  text-align: center;
  
 }
 #category{
 	width:220px;
 	height:34px;
 	margin-top:20px;
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
<form  action="${pageContext.request.contextPath}/admin/UserAction_saveUser" method="post" onsubmit="return show()" >
<img src="${path }images/car.png" class="picture">
<div id="innerhead">
 <div class="row">
   <div class="col-lg-5 col-md-5 col-xs-6">
      <p>当前位置 >> 用户管理 >> 增加用户  </p>                                    
   </div>
  </div>
</div>
<div id="box">
       <div class="col-lg-5 col-md-6  col-xs-6" >
            <span>账户：</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input type="text" name="code" id="code" class="form-control" required  oninvalid="setCustomValidity('请输入账号');" oninput="setCustomValidity('');"/>
         </div> 
      <div class="col-lg-5 col-md-6  col-xs-6" id="passSpan">
            <span>密码：</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6" id="passDiv">
           <input type="password" id="before" class="form-control" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}$" required oninvalid="setCustomValidity('包含大小写字母和数字的组合，不能使用特殊字符，长度在8-10之间');" oninput="setCustomValidity('');" />
           <input type="hidden" name="password" id="after" value=""/>
         </div>
      <div class="col-lg-5 col-md-6  col-xs-6">
            <span>用户名：</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input type="text" name="name" id="name" class="form-control" required oninvalid="setCustomValidity('请输入用户名');" oninput="setCustomValidity('');"/>
         </div>
      <div class="col-lg-5 col-md-6  col-xs-6">
            <span>手机号：</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input type="tel" name="phone" id="phone" class="form-control" pattern="^1[3-9]\d{9}$" required oninvalid="setCustomValidity('请输入11位手机号');" oninput="setCustomValidity('');"/>
         </div>
      <div class="col-lg-5 col-md-6  col-xs-6">
            <span>地址：</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input type="text" name="address" id="address"  class="form-control" required oninvalid="setCustomValidity('请输入地址');" oninput="setCustomValidity('');"/>
         </div>
         <button class="but butt" type="reset">重&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;置</button> 
         <button class="butt" type="submit" autofocus>添加用户</button>
      </div>
     
</form>
</body>
<script type="text/javascript">
	$(function(){
		  $("#before").blur(function(){
		   var before = $(this).val();
		   var beforeVal = $.md5(before);
		   $("#after").val(beforeVal);
		  }); 
    });
	
function show(){
	var code=document.getElementById("code").value;
    var before_password=document.getElementById("before").value;
    var name=document.getElementById("name").value;
    var phone=document.getElementById("phone").value;
    var address=document.getElementById("address").value;    
    if(confirm("确定提交您所填的这些信息   \n账户："+code +" \n密码："+before_password+" \n用户名："+name+" \n手机："+phone+" \n地址："+address)){
    	return true;
    }else{
       return false; 
    }      
}
</script>
</html>