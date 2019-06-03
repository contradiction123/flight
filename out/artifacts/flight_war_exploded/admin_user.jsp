<%--
  Created by IntelliJ IDEA.
  User: fanxi
  Date: 2019/5/23
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>航班分配系统后台管理</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/bootstrap-3.3.7-dist/css/bootstrap.min.css" />" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="<c:url value="css/admin.css" />" rel="stylesheet">
    <!-- Page Specific CSS -->
    <link rel="stylesheet" href="<c:url value="/css/morris-0.4.3.min.css" />">
    <style>
        th {
            text-align: center;
        }
        td {
            text-align: center;
            height: 50px;
        }
        .table tbody tr td{
            vertical-align: middle;
        }
    </style>
</head>

<body>

<div id="wrapper">

    <!-- 侧边栏 -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">航班分配系统后台管理</a>
        </div>

        <!-- 左侧栏列表-->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav side-nav">
                <li><a href="<c:url value="/admin" />"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active"><a href="<c:url value="/admin_user" />"><i class="fa fa-bar-chart-o"></i> 用户管理</a></li>
                <li><a href="<c:url value="/admin_flight" /> "><i class="fa fa-table"></i> 机型管理</a></li>
                <li><a href="<c:url value="/admin_satisfaction" /> "><i class="fa fa-edit"></i> 用户满意度</a></li>
                <li><a href="<c:url value="/admin_import" />"><i class="fa fa-font"></i> 一键导入乘客</a></li>
            </ul>
            <!--管理员选项-->
            <ul class="nav navbar-nav navbar-right navbar-user">
                <li class="dropdown user-dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><c:out value="${msg.user_name}" /> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><i class="fa fa-gear"></i> 设置</a></li>
                        <li class="divider"></li>
                        <li><a href="#"><i class="fa fa-power-off"></i> 退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <h1>用户信息</h1>
            </div>
        </div><!-- /.row -->
        <!--用户列表-->
        <div class="row">
            <div class="col-lg-8">
            <table class="table table-striped table-hover table-bordered ">
                <tr>
                    <th class="col-lg-1">用户ID</th>
                    <th class="col-lg-1">用户名</th>
                    <th class="col-lg-1">用户邮箱</th>
                    <th class="col-lg-1">用户性别</th>
                    <th class="col-lg-1">用户权限</th>
                    <th class="col-lg-1">操作</th>
                </tr>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td class="col-lg-1"><c:out value="${user.user_id}" /></td>
                        <td class="col-lg-1"><c:out value="${user.user_name}" /></td>
                        <td class="col-lg-1"><c:out value="${user.user_email}" /></td>
                        <td class="col-lg-1"><c:out value="${user.user_sex}" /></td>
                        <td class="col-lg-1">
                            <c:if test="${user.permission == 1}" ><span style="color: red">管理员</span></c:if>
                            <c:if test="${user.permission != 1}" ><span style="color: green">普通用户</span></c:if>
                        </td>
                        <td class="col-lg-1">
                            <a href="#" class=" glyphicon glyphicon-pencil btn btn-info" >修改</a>
                            <a href="#" class=" glyphicon glyphicon-remove btn btn-danger" >删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            </div>
        </div>

    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<!-- JavaScript -->
<script src="<c:url value="/jquery/jquery.min.js" />"></script>
<script src="<c:url value="/bootstrap-3.3.7-dist/js/bootstrap.min.js" />"></script>


<!-- Page Specific Plugins -->
<script src="<c:url value="js/raphael-min.js" />"></script>
<script src="<c:url value="js/morris-0.4.3.min.js" />"></script>
<script src="<c:url value="js/morris/chart-data-morris.js" />"></script>
<script src="<c:url value="js/tablesorter/jquery.tablesorter.js" />"></script>
<script src="<c:url value="js/tablesorter/tables.js" />"></script>

</body>
</html>