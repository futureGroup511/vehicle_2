<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>头部</title>
<style type="text/css">
    *{margin:0;padding: 0}
    .contain{
        width: 100%;
        height: 195px;
        min-width: 1050px;
        background:url(../images/top1.png);
    }
    .font{
        color: #fff;
        display: inline-block;
        position: absolute;
        top: 30px;
        left: 12%;
        font-family: "华文行楷";
        font-size: 40px;
        text-shadow:1px 1px rgba(0, 0, 0,0.8),
                    2px 2px rgba(0, 0, 0,0.8),
    }
    .r-box{
        width: 8%;
        height:100%;
        float:left;
        margin-left: 2%;
    }
    .right-box{
        width: 14%;
        height: 100%;
        float: right;
        margin-top: 15px;
    }
    @media  only screen and (max-width: 800px){
        .font{
            left: 17%;
            font-size: 34px;
        }
    }
    
    .test{
				
	}
	.title{
		font-size:10px;
		position: absolute;
		display: none;
		z-index:999;
		background-color: #E3E3E3;
		padding: 5px;
		right:30px;
		top:10px;
	}
    </style>
</head>
<body>
    <div class="contain">
    <div class="r-box">
        <img src="../images/1.png" width="90%">
    </div>
        <p class="font">辉县市机动车维修站车辆维护管理系统</p>
        <div class="right-box">
            <div style="float:left;width:40%;" class="test">
               <img src="${path}images/point1.png" width="80%">
               <div class="title">
				 <p>账号：${User.code}</p>
				 <p>用户名：${User.name}</p>
				 <p>地址：${User.address}</p>
				 <p>手机号：${User.phone}</p>
			   </div>
            </div>
            <div style="float:right; width:55%;">
                <span><img src="../images/tan.png" width="25" ></span>
                <span><img src="../images/line.png" width="10"></span>
                <span><a href="#"><img src="../images/set.png" width="25"></a></span><br>
                <span><a href="#"><img id="img1" src="../images/ling1.png" width="23"></a></span>
                <span style="display:inline-block;padding-left:18px;"><a  title="注销"  onclick="window.top.location.href='BaseAction_logOff?identity=${User.role}'"  href="#"><img id="img2" src="../images/pow1.png"></a></span>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
     img1.onmouseover=function(){
        this.src="../images/ling2.png";
    }
     img1.onmouseout=function(){
        this.src="../images/ling1.png";
    }
     img2.onmouseover=function(){
        this.src="../images/pow2.png";
    }
     img2.onmouseout=function(){
        this.src="../images/pow1.png";
    }
     
    var oDiv = document.getElementsByClassName('test')[0];
 	var oTitle = document.getElementsByClassName('title')[0];
 	oDiv.onmousemove = function(){
 		oTitle.style.display = 'block';
 	}
 	oDiv.onmouseout = function(){
 		oTitle.style.display = 'none';
 	}
  
</script>
</html>