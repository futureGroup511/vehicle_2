<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆维护管理系统-用户登录</title>
<link rel="stylesheet" href="${path}css/login.css">
<script type="text/javascript" src="${path}js/jquery.min.js"></script>
<script type="text/javascript" src="${path}js/jquery.md5.js" ></script>
<script>
   $(function(){
	    $("#begin").blur(function(){
	     var begin = $(this).val();
	     var beginval = $.md5(begin);
	     $("#end").val(beginval);
	    });
	    
	    $('form').submit(function(){
	    	$("#begin").blur();
	    });
	    
   });
   
<c:if test="${!empty login}">
	alert('${login}');
</c:if>

</script>
</head>  
<body>
    <div class="wall">
        <div class="box">
            <div class="box1 in"></div>
            <div class="box2 in">
                 <h1>辉县市车辆维护管理系统</h1>
            </div>
            <div class="box3">
                <div class="pic">
                    <img src="images/1.png" width="60px">
                    <span class="txt1">We &nbsp;&nbsp;are&nbsp;&nbsp; everywhere</span>
                </div>
               <div class="font">
                   <form action="${pageContext.request.contextPath}/BaseAction_login" method="post">
	                   <span class="txt2">账号:</span>
	                   <input type="text" class="txt" name="code" required oninvalid="setCustomValidity('请输入账号');" oninput="setCustomValidity('');" ><br>
	                   <span class="txt2">密码:</span>
	                   <input type="password" class="txt" id="begin" required oninvalid="setCustomValidity('请输入密码');" oninput="setCustomValidity('');">
	                   <!-- 加密转换 -->
	                   <input type="hidden"  name="password" id="end" ><br>
	                   <input type="submit" value="登&nbsp;&nbsp;录"><br>
	                   <a href="${pageContext.request.contextPath}/admin/UserAction_forgetPassword" target="top">找回密码</a>
                   </form>
               </div>
            </div>
        </div>
    </div>
</body>
</html>