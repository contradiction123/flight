

<%--
  Created by IntelliJ IDEA.
  User: s8534
  Date: 2019/4/18
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%--这个是显示b737-700航班表格的--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>学生表</title>

    <link rel="stylesheet" href="./bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <style>
        body {
            min-height: 2000px;
            padding-top: 70px;
        }
        .studentIdtext1{
            visibility: hidden;
            margin-top: -1000px;
        }
    </style>
    <script src="./jquery/jquery.min.js"></script>
    <script src="./bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>


<body>
<!-- Fixed navbar -->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li class="dropdown-header">Nav header</li>
                        <li><a href="#">Separated link</a></li>
                        <li><a href="#">One more separated link</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="../navbar/">Default</a></li>
                <li><a href="../navbar-static-top/">Static top</a></li>
                <li class="active"><a href="./">Fixed top <span class="sr-only">(current)</span></a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>


<div class="container">

    <!-- Main component for a primary marketing message or call to action -->
    <div class="jumbotron">
        <h1>表</h1>
        <table class="table table-bordered table-hover">
            <tr>
                <td>序号</td>
                <td>座位号</td>
                <td>用户账户</td>
                <td>儿童挂点</td>
                <td>vip</td>
                <td>靠窗</td>
                <td>靠门</td>
                <td>中间</td>
                <td>靠过道</td>
            </tr>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.seat_id}</td>
                    <td>${user.user_id}</td>
                    <td>${user.child}</td>
                    <td>${user.vip}</td>
                    <td>${user.windows}</td>
                    <td>${user.door}</td>
                    <td>${user.middle}</td>
                    <td>${user.aisle}</td>
                </tr>
            </c:forEach>
        </table>
    </div>

</div> <!-- /container -->


</body>
</html>
