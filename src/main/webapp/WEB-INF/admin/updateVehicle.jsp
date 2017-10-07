<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改车辆页面</title>
<link rel="stylesheet" href="${path}css/bootstrap.css">
<link rel="stylesheet" href="${path}css/recruit.css">
<script type="text/javascript" src="${path}js/jquery.min.js"></script>
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
.box{
	margin:0 auto;
	width:450px;
	height:600px;
}
.box-left span{
  width:140px;
}
 .butt{
 width:120px;
 height:35px;
 border-radius:15px;
 background:rgb(153,200,207);
 margin-left:30%;
 margin-top:20px;

 }
 .picture{
 position:absolute;
 top:60px;
 left:70%;
 }
</style>
</head>
<body>
<form action="${pageContext.request.contextPath}/admin/VehicleAction_updateVehicle?vehicleId=${vehicle1.vehicleId}" method="post">
<img src="${path }images/car.png" class="picture">
<div id="innerhead">
 <div class="row">
   <div class="col-lg-5 col-md-5 col-xs-6">
      <p>当前位置 >> 车辆管理 >> 修改车辆  </p>                                    
   </div>
  </div>
</div>
<div class="box">
   <div class="box-left">
   		<div class="col-lg-4 col-md-4  col-xs-4" >
   			<span>档案号:</span>
   		</div>
   		<div class="col-lg-8 col-md-8  col-xs-8" >
   			<input type="text" name="vehicle1.vehicleId" class="form-control" value="${vehicle1.vehicleId}"  readonly="readonly">
   		</div>
   		<div class="col-lg-4 col-md-4  col-xs-4" >
   			<span>车辆状态:</span>
   		</div>
   		<div class="col-lg-8 col-md-8  col-xs-8" >
   			<input type="text" name="vehicle1.operationStatus" class="form-control" value="${vehicle1.operationStatus}" readonly="readonly">
   		</div>
   		<div class="col-lg-4 col-md-4  col-xs-4" >
   			<span id="text">类型:</span>
   		</div>
   		<div class="col-lg-8 col-md-8  col-xs-8" >
			<select name="vehicle1.category" class="form-control" >
				<c:if test="${vehicle1.category=='货运'}">
					<option value="货运">货运</option>
					<option value="汽运">汽运</option>
				</c:if>
				<c:if test="${vehicle1.category=='汽运'}">
					<option value="汽运">汽运</option>	
					<option value="货运">货运</option>
				</c:if>
		    </select><br>
	   </div>
       <div class="col-lg-4 col-md-4  col-xs-4" >
            <span>发动机编号：</span>
        </div>
        <div class="col-lg-8 col-md-8  col-xs-8" style="float: right">
           <input type="text" name="vehicle1.engineId" class="form-control" value="${vehicle1.engineId}" required oninvalid="setCustomValidity('请输入发动机编号');" oninput="setCustomValidity('');"/>
         </div>
        <div class="col-lg-4 col-md-4  col-xs-4" style="margin-top: 33px;height:50px" >
            <span>车牌号:</span>
        </div>
        <div class="col-lg-8 col-md-8  col-xs-8" style="float: right">
           <input type="text" name="vehicle1.plateId" class="form-control" value="${vehicle1.plateId}"  pattern="^[\u4e00-\u9fa5]{1}[A-Z]{1}[A-Z_0-9]{5}$" required  oninvalid="setCustomValidity('请填写正确格式的车牌号,如豫G636UU);" oninput="setCustomValidity('');"/>
            
        </div>        
        <div class="col-lg-4 col-md-4  col-xs-4">
            <span>车辆重量：</span>
        </div>
        <div class="col-lg-8 col-md-8  col-xs-8">
           
           <input type="text" name="vehicle1.weight" class="form-control" value="${vehicle1.weight}" pattern="^[1-9]\d*\.\d*|0\.\d*[1-9]\d*$" required  oninvalid="setCustomValidity('请填写带小数点的正数,单位是吨');" oninput="setCustomValidity('');">
         </div>
         <div class="col-lg-4 col-md-4  col-xs-4">
            <span>备案日期：</span>
        </div>
        <div class="col-lg-8 col-md-8  col-xs-8">
           
           <input type="text" name="vehicle1.date" value="${vehicle1.date}" readonly="readonly" style="width:200px;height:35px;border-radius:5px;background:transparent">
         
         </div>
      <div class="col-lg-4 col-md-4  col-xs-4">
            <span >车底盘号衍射：</span>
        </div>
        <div class="col-lg-8 col-md-8  col-xs-8">
             <input type="text" name="vehicle1.carChassisId" class="form-control" value="${vehicle1.carChassisId}" required oninvalid="setCustomValidity('车底盘号衍射');" oninput="setCustomValidity('');"/>
         </div>
   			
         <div class="col-lg-4 col-md-4  col-xs-4">
            <span>出厂日期：</span>
        </div>
        <div class="col-lg-8 col-md-8  col-xs-8">
           
           <input type="text" name="vehicle1.manufactureDate" value="${vehicle1.manufactureDate}" class="sang_Calender" style="width:200px;height:35px;border-radius:5px"/>
         </div>
         <div class="col-lg-4 col-md-4  col-xs-4">
            <span>车辆型号：</span>
        </div>
        <div class="col-lg-8 col-md-8  col-xs-8">
           
           <input type="text" name="vehicle1.model" class="form-control" value="${vehicle1.model}" required oninvalid="setCustomValidity('请输入车辆类型');" oninput="setCustomValidity('');"/>
         </div>
         <div class="butn">
           <!--  <button class="butt" type="reset">重&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;置</button>  -->
            <button class="butt" type="submit" autofocus>修&nbsp;&nbsp;改</button> 
         </div>
   </div>
</div>
</form>
<script type="text/javascript" src="${path}js/datetime.js"></script>
</body>
</html>