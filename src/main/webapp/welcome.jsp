<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆维护管理系统-欢迎界面</title>
 <style type="text/css">
       *{margin:0;padding: 0;box-sizing:border-box;}
       .wall{
        width: 100%;
        height: 100%;
       }
       .top{
        width: 80%;
        height: 100px;
        margin:0 auto;
       }
       .box{
        width: 50%;
        background-color: #eee;
        margin:0 auto;
        padding-bottom: 40px;
       }
       .font{
        font-size: 8em;
        font-family: "方正舒体";
        display: block;
        margin:0 0 0 17%;
        padding-top: 5%;
       }
       .in-box{
        width: 70%;
        height:200px;
        margin:0 auto;
        margin-top: 15%;
        position: relative;
       }
       .pic{
        position: absolute;
        top: -35%;
        left: 20%;
        width: 58%;
       }
       .font2{
        font-size: 3em;
        font-family: "华文隶书";

       }
       .txt-box{
        margin:0 auto;
        padding-left: 25%;
        margin-top:8%;
       }
       @media only screen and (min-width: 1250px){
        .font{
            font-size: 8em;
        }
       }
        @media only screen and (max-width: 1250px) and (min-width: 1000px){
        .font{
            font-size: 6em;
        }
        .pic{
            top: -20%;
        }
       }
        @media only screen and (max-width: 995px){
        .font{
            font-size: 4.5em;
        }
         .pic{
            top: -10%;
        }
       }
    </style>
</head>
<body>
   <div class="wall">
       <div class="top">
           <img src="images/welcome/top1.png" width="100%" height="100%">
       </div>
       <div class="box">
           <p class="font">Welcome</p>
           <div class="in-box">
               <img src="images/welcome/cai1.png" width="100%">
               <div class="pic">
                   <img src="images/welcome/logo.png" width="100%" height="100%">
               </div>
           </div>
           <div class="txt-box">
               <p class="font2">欢迎用户<span>${User.name}</span>登录</p>
           </div>
       </div>
   </div> 
</body>
</html>