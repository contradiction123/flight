<%--
  Created by IntelliJ IDEA.
  User: fanxi
  Date: 2019/6/3
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/bootstrap-3.3.7-dist/css/bootstrap.css" />"/>
    <script src="<c:url value="/jquery/jquery.min.js" />"></script>
    <script src="<c:url value="/bootstrap-3.3.7-dist/js/bootstrap.min.js" />"></script>
    <style>
        .ff{
            position: relative;
            padding-top: 0px;
        }
        .ss{
            border: 1px solid red;
        }
    </style>
</head>
<body>
<div class="ss">
    <div class="container-fluid ff">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">
                <ul class="nav nav-sidebar">
                    <li class="active"><a href="./PersonEditBefore.html" target="l">个人信息 <span class="sr-only">(current)</span></a></li>
                    <li><a href="./PersonEditpd.html" target="l">密码修改</a></li>
                    <li><a href="./PersonOrder.html" target="l">订单查询</a></li>
                    <li><a href="./PersonSelectInfor.html" target="l">常用旅客信息</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>
