<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆维护管理系统-管理员界面</title>
<frameset rows="15%,*,5%" frameborder="0" scrolling="No" noresize="noresize" >
        <frame src="${path}pages/head.jsp" scrolling="No" noresize="noresize" ></frame>
        <frameset cols="234,*" scrolling="No" noresize="noresize" >
            <frame src="${path}pages/menuByAdmin.jsp" scrolling="Yes" noresize="noresize"></frame>
            <frameset rows="100%,*" class="ifa">  <!--右边的上部分-->
                <frame src="${path}welcome.jsp"  name="main" class="ifa"></frame>
            </frameset>
        </frameset>
        <frame src="${path}pages/foot.jsp" scrolling="No" noresize="noresize" ></frame>
    </frameset>
</head>
<body>
</body>
</html>