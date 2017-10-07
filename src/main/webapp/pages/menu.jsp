<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜单</title>
<style type="text/css">
    body{margin:0 auto;padding-left:1px;overflow-x:hidden;}
    html, body{height:100%; }
    img{border:none;}
    *{font-family:'微软雅黑';font-size:15px;color:#20634d;}
    dl,dt,dd{display:block;margin-left:-3%;margin:0 0 0 -3%;}
    a{text-decoration:none;}
    .container{width:100%;height:100%;margin:auto;}

    /*left*/
    .leftsidebar_box{
        width:230px;
        height:auto !important;
        overflow:visible !important;
        height:100% !important;
        /*background-color:#9bbbc5;*/
        background-image: url(../images/bg.png);
        padding-left:16px;
        }
    .line{
        height:24px;
        width:100%;
        background-image:url(../images/line_bg.png);
        background-repeat:repeat-x;
        }
    .leftsidebar_box dt{
        padding-left:20%;
        padding-right:10px;
        background-repeat:no-repeat;
        background-position:10px center;
        color:#000;
        font-weight: bold;
        font-size:18px;
        position:relative;
        line-height:55px;
        cursor:pointer;
        }
    .leftsidebar_box dd{
        font-size:13px;
        padding-left:19%;
        }
    .leftsidebar_box dd a{
        color:#f5f5f5;
        line-height:38px;
        }
    .leftsidebar_box dt img{
        position:absolute;
        right:34%;
        top:20px;
        }
    .system_log dt{
        background-image:url(../images/j1.png);
        }
    .a:hover{
        background-color: #8fa3a9;
        }
    .custom dt{
        background-image:url(../images/j2.png);
        }
    .channel dt{
        background-image:url(../images/j3.png);
        }
    .app dt{
        background-image:url(../images/j4.png);
        }
    .cloud dt{
        background-image:url(../images/j5.png);
        }
    .idea dt{
        background-image:url(../images/j6.png);
        }
    .leftsidebar_box dl dd:last-child{padding-bottom:10px;}
    .pic{margin-right: -30px;}
</style>
</head>
<body id="bg">
<div class="container">
    <div class="leftsidebar_box">
        <div class="line"></div> 
            <dl class="custom">
                <dt onClick="changeImage()" class="a">车辆管理<img class="pic" src="../images/select_xl01.png"></dt>
                <dd class="first_dd"><a href="${pageContext.request.contextPath}/admin/VehicleAction_addVehicle" target="main">新建车辆备案</a></dd>
                <dd><a href="${pageContext.request.contextPath}/admin/VehicleAction_maturityVehicleList" target="main">到期车辆查询</a></dd>
                <dd><a href="${pageContext.request.contextPath}/admin/VehicleAction_myVehicleList" target="main">查看车辆信息</a></dd> 
            </dl>
        
            <dl class="channel">
                <dt class="a">维护信息管理<img class="pic" src="../images/select_xl01.png"></dt>
                <dd class="first_dd"><a href="${pageContext.request.contextPath}/admin/MaintainAction_addMaintain" target="main">维护信息录入</a></dd>
                <dd><a href="${pageContext.request.contextPath}/admin/MaintainAction_maintainList" target="main">查询维护信息</a></dd>
            </dl>
        
            <dl class="app">
                <dt onClick="changeImage()" class="a">系统设置<img class="pic" src="../images/select_xl01.png"></dt>
                <dd><a href="${pageContext.request.contextPath}/admin/UserAction_modify?id=${User.userId}" target="main">修改密码</a></dd>
                <dd><a href="aboutSystem.jsp" target="main">关于系统</a></dd>
            </dl>
    </div>
</div>
<script type="text/javascript" src="../js/jquery.min.js"></script>

<script type="text/javascript">
$(".leftsidebar_box dt").css({"background-image":"../images/j1.png"});
$(".leftsidebar_box dt img").attr("src","${path}images/select_xl01.png");
$(function(){
    $(".leftsidebar_box dd").hide();
    $(".leftsidebar_box dt").click(function(){
        $(".leftsidebar_box dt").css({"background-image":"../images/j1.png"})
        $(this).css({"background-image": "../images/j1.png"});
        $(this).parent().find('dd').removeClass(("menu_chioce"),6000);
        $(".menu_chioce").slideUp();
        $(this).parent().find('dd').slideToggle();
    $(this).parent().find('dd').addClass("menu_chioce");
})
})
</script>
</body>
</html>