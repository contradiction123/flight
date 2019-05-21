<%--
  Created by IntelliJ IDEA.
  User: mars-sea
  Date: 2019-05-16
  Time: 13:25
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
    <title>用户注册</title>
    <!-- Main CSS -->
    <link href="css/grid.css" rel="stylesheet">
    <!-- Theme CSS -->
    <link href="css/cl-blue.css" rel="stylesheet">
</head>
<body>
<div grid>
    <div card="back">
        <p class="headline">Welcome !</p>
        <p class="txt-body">Material Register Form</p>
        <p class="txt-body txt-b">Designed By @Mars_Sea</p>
    </div>
    <div card="front">
        <p class="title">注册</p>

        <form id="register" action="<c:url value="/register" />" method="post" class="grid xl-1">
            <input type="text" name="user_email" placeholder="用户邮箱"/>
            <input type="password" name="password" placeholder="用户密码"/>
            <input type="text" name="user_name" placeholder="用户姓名"/>
            <a onclick="document:register.submit();" btn="primary">注册</a>
            <a href="<c:url value="/login" />"><div btn="trans submit">已注册？登陆</div></a>
        </form>
    </div>
</div>
</body>
</html>
