<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆维护管理系统-使用说明</title>
<link rel="stylesheet" type="text/css" href="../css/demo.css">
<style type="text/css">
*{margin:0;padding:0;}
#innerhead{
height:60px;
background-color:white;
}
#innerhead p{
font-size:20px;
padding:13px 30px;
}
 .picture{
 position:absolute;
 top:60px;
 left:70%;
 }

</style>
</head>
<body>
<div class="user_callback">  
<img src="${path }images/car.png" class="picture">
<div id="innerhead">
 <div class="row">
   <div class="col-lg-5 col-md-5 col-xs-6">
      <p>当前位置 >> 使用说明 </p>                                    
   </div>
  </div>
</div>

    <div class="user_pic" id="user_pic">   
        <span class="prev"></span>   
        <span class="next"></span>   
        <ul id="user_call">    
            <li class="user_pic1">
                <a href="#"> <img src="../images/introduce/p1.png" alt="1"/></a>
            </li>    
            <li class="user_pic2"> 
                <a href="#"> <img src="../images/introduce/p2.png" alt="2"/></a>
            </li>    
            <li class="user_pic3">
                <a href="#"> <img src="../images/introduce/p3.png" alt="3"/></a>
            </li>    
            <li class="user_pic4">
                <a href="#"> <img src="../images/introduce/p4.png" alt="4"/></a>
            </li>    
            <li class="user_pic5"> 
                <a href="#"> <img src="../images/introduce/p5.png" alt="5"/></a>
            </li>    
        </ul>  
    </div>
</div>
</body>
<script type="text/javascript" src="../js/demo.js"></script>
</html>