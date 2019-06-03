<%--
  Created by IntelliJ IDEA.
  User: fanxi
  Date: 2019/6/3
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value="/bootstrap-3.3.7-dist/css/bootstrap.css" />"/>
    <script src="<c:url value="/jquery/jquery.min.js" />"></script>
    <script src="<c:url value="/bootstrap-3.3.7-dist/js/bootstrap.min.js" />"></script>
</head>
<body>
<div class="header_wrap">
    <div class="header">
        <div class="topMenu">
            <div style="float: left">
                <img style="width: 50px;" src="<c:url value="/img/logo.png"/> " />
                <h1 style="float: right; line-height: 10px; margin-left: 20px;">Eyat</h1>
            </div>
            <div style="margin-right: 10%">
                <ul class="nav navbar-right ">
                    <li>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><c:out value="${msg.user_name}" />  用户你好 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><i class="fa fa-gear"></i> 个人信息</a></li>
                            <li class="divider"></li>
                            <li><a href="<c:url value="/out"/> "><i class="fa fa-power-off"></i> 退出登录</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>

    </div>
</div>
</body>
</html>
