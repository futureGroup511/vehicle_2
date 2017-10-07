<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>车辆维护系统-新建车辆备案</title>  
<link rel="stylesheet" href="${path}css\bootstrap.css">
<script type="text/javascript" src="${path}js/jquery.min.js"></script>
</head>
<script type="text/javascript">
	<c:if test="${!empty vehicleMessage}">
	  alert('${vehicleMessage}');
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
  margin-top: 20px;
  width:220px;
  height:34px;
 }
 #box button{
   float: right;
   margin-top: 20px;
   margin-right:55px;
   margin-left:10px;
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
 background:rgb(153,200,207);

 }
 
 .picture{
 position:absolute;
 top:60px;
 left:70%;
 }
 
</style>
<body>
<form action="${pageContext.request.contextPath}/admin/VehicleAction_saveVehicle" method="post" onsubmit="return show()">
<img src="${path }images/car.png" class="picture">
<div id="innerhead">
 <div class="row">
   <div class="col-lg-5 col-md-5 col-xs-6">
      <p>当前位置 >> 车辆管理 >> 新建车辆备案</p>
   </div>
  </div>
</div>
 <div id="box">
     <div class="box-innner">
        <div class="col-lg-5 col-md-6  col-xs-6">
            <span>车主账号：</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input type="text" name="user.code" id="code" class="form-control"  required  oninvalid="setCustomValidity('请输入车主账号');" oninput="setCustomValidity('');" />
        </div>
     </div>
 	 <div class="box-innner">
        <div class="col-lg-5 col-md-6  col-xs-6">
            <span>车主名：</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input type="text" name="user.name" id="name" class="form-control" required oninvalid="setCustomValidity('请输入用户名');" oninput="setCustomValidity('');"/>
        </div>
     </div>
     <div class="box-innner">
           <div class="col-lg-5 col-md-6  col-xs-6">
            <span>车牌号：</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6">
            <input type="text" name="plateId" class="form-control" id="plateId" pattern="^[\u4e00-\u9fa5]{1}[A-Z]{1}[A-Z_0-9]{5}$" required  oninvalid="setCustomValidity('请填写正确格式的车牌号,如豫G636UU);" oninput="setCustomValidity('');" />
         </div>
     </div>
     <div class="box-innner">
           <div class="col-lg-5 col-md-6  col-xs-6">
            <span>车辆类型：</span>
        </div>  
        <div class="col-lg-6 col-md-6  col-xs-6">        
           <select  id="category" name="category">
			 	<option selected="selected">请选择</option>
				<option value ="货运">货运</option>
		  		<option value ="客运">客运</option>
		   </select>
           
         </div> 
     </div> 
     <div class="box-innner">
        <div class="col-lg-5 col-md-6  col-xs-6">
            <span>车辆型号：</span>
        </div>  
        <div class="col-lg-6 col-md-6  col-xs-6">
            <input type="text" name="model" id="model" class="form-control"  required  oninvalid="setCustomValidity('请填写车辆型号');" oninput="setCustomValidity('');" />
         </div> 
     </div> 
     <div class="box-innner">
           <div class="col-lg-5 col-md-6  col-xs-6">
            <span>发动机型号：</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input type="text" name="engineId" id="engineId" class="form-control"  required  oninvalid="setCustomValidity('请填写发动机编号');" oninput="setCustomValidity('');" />
         </div>
     </div>
     <div class="box-innner">
           <div class="col-lg-5 col-md-6  col-xs-6">
            <span>车底盘号衍射：</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input type="text" name="carChassisId"  id="carChassisId" class="form-control"  required  oninvalid="setCustomValidity('请填写车底盘号衍射');" oninput="setCustomValidity('');" />
         </div>
     </div>
     <div class="box-innner">
           <div class="col-lg-5 col-md-6  col-xs-6">
            <span>车辆重量：</span>
        </div>
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input type="text" name="weight"  id="weight" class="form-control"  pattern="^[1-9]\d*\.\d*|0\.\d*[1-9]\d*$" required  oninvalid="setCustomValidity('请填写带小数点的正数,单位是吨');" oninput="setCustomValidity('');" />
         </div>
     </div>
      <div class="box-innner">
          <div class="col-lg-5 col-md-6  col-xs-6">
          <span>出厂日期：</span>
      </div>
        
        <div class="col-lg-6 col-md-6  col-xs-6">
           <input type="text" name="manufactureDate" id="manufactureDate" class="sang_Calender"  required  oninvalid="setCustomValidity('请选择出厂日期');" oninput="setCustomValidity('');" />  
        </div>
     </div>
       <button class="butt" type="reset">重&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;置</button> 
       <button class="butt" type="submit" autofocus="autofocus">进行备案</button>
  </div>
</form> 
<script type="text/javascript" src="${path}js/datetime.js"></script>
<script type="text/javascript">
 function show(){

	var code=document.getElementById("code").value;
	var name=document.getElementById("name").value;
    var plateId=document.getElementById("plateId").value;
    var category=document.getElementById("category").value;
    var model=document.getElementById("model").value;
    var engineId=document.getElementById("engineId").value;
    var carChassisId=document.getElementById("carChassisId").value;
    var weight=document.getElementById("weight").value;   
    var manufactureDate=document.getElementById("manufactureDate").value; 
    var message = window.confirm("确定提交您所填的这些信息   \n账户："+code +" \n用户名："+name+" \n车牌号："+plateId+
    		" \n车辆类型："+category+" \n车辆型号："+model+" \n发动机型号："+engineId+" \n车底盘号衍射："+carChassisId+" \n车辆重量："+weight+" \n出厂日期："+manufactureDate) 
		
    if (message) {
        return true;
    }else{
	    return false; 
    }
	 
}

</script>  
</body>
</html>