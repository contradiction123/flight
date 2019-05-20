<%--
  Created by IntelliJ IDEA.
  User: s8534
  Date: 2019/5/13
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <!-- Theme CSS -->
    <link href="css/cl-red.css" rel="stylesheet">
</head>
<body>
<div grid>
    <div card="back">
        <p class="headline">Welcome !</p>
        <p class="txt-body">Material Login Form</p>
        <p class="txt-body txt-b">Designed By @Mars_Sea</p>
    </div>
    <div card="front">
        <p class="title">Log In</p>
        <form action="/flight/b7377select" method="post" class="grid xl-1">
            <input type="text" name="username" placeholder="请输入邮箱地址"/>
            <input type="password" name="password" placeholder="请输入密码"/>
            <button type="submit" btn="primary">登陆</button>
            <a href="#"><div btn="trans submit">没有账号？注册</div></a>
        </form>
        <a href="#" class="subtitle">忘记密码?</a>
    </div>
</div>
</body>
</html>

