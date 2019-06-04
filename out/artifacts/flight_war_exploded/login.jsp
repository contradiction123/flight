<%--
  Created by IntelliJ IDEA.
  User: mars-sea
  Date: 2019-05-13
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="generator" content="Ygohel18">
    <link rel="shortcut icon" href="img/thumb.png" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Material Login Form #02">
    <title>Login</title>
    <!-- Main CSS -->
    <link href="css/grid.css" rel="stylesheet">
    <!-- 主题 CSS -->
    <link href="css/cl-blue.css" rel="stylesheet">
    <style>
        .J_codeimg {
            width: 85px;
            height: 36px;
            position: absolute;
            left: 70%;
            top:50%;
        }

    </style>

</head>
<body>
<div grid>
    <div card="back">
        <p class="headline">Welcome !</p>
        <p class="txt-body">Material Login Form</p>
        <p class="txt-body txt-b">Designed By @Mars_Sea</p>
    </div>
    <div card="front">
        <p class="title">登录</p>

        <form id="login" action="<c:url value="/login" />" method="post" class="grid xl-1">
            <input type="text" id="uid" name="user_email" placeholder="请输入邮箱地址"/>
            <input type="password" id="pass" name="password" placeholder="请输入密码"/>
            <div class="row">
            <input id="code" placeholder='验证码' maxlength="4" type='text' class="col-lg-5" >
            <canvas class="J_codeimg" id="myCanvas" onclick="Code();">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
            </div>
            <p style="color: red;position: absolute;font-size: 12px;right: 40%;"><c:if test="${error != ''}"><c:out value="${error}" /></c:if></p>
            <a onclick="login();" btn="primary">登陆</a>
            <a href="<c:url value="/register" />"><div btn="trans submit">没有账号？注册</div></a>
        </form>
        
    </div>
</div>
</body>
<script src='<c:url value="/js/login_Verification.js" />' type="text/javascript"></script>
<script language='javascript'>
    var form = document.getElementById("login")
    document.onkeydown=function(){
        if (event.keyCode == 13){
            login();
        }
    }
</script>


</html>