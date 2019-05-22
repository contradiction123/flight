<%--
  Created by IntelliJ IDEA.
  User: fanxi
  Date: 2019/5/22
  Time: 15:21
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
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
    <!-- Page Specific CSS -->
    <link rel="stylesheet" href="<c:url value="/css/morris-0.4.3.min.css" />">
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
                <li class="active"><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="#"><i class="fa fa-bar-chart-o"></i> 用户信息</a></li>
                <li><a href="#"><i class="fa fa-table"></i> 机型售卖情况</a></li>
                <li><a href="#"><i class="fa fa-edit"></i> 用户满意度</a></li>
                <li><a href="#"><i class="fa fa-font"></i> 整机迁移</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-caret-square-o-down"></i> Dropdown <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Dropdown Item</a></li>
                        <li><a href="#">Another Item</a></li>
                        <li><a href="#">Third Item</a></li>
                        <li><a href="#">Last Item</a></li>
                    </ul>
                </li>
            </ul>

            <!--管理员选项-->
            <ul class="nav navbar-nav navbar-right navbar-user">
                <li class="dropdown user-dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <c:out value="${msg.user_name}" /> <b class="caret"></b></a>
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
                <h1>统计信息</h1>
            </div>
        </div><!-- /.row -->

        <div class="row">
            <div class="col-lg-3">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-6">
                                <i class="fa fa-comments fa-5x"></i>
                            </div>
                            <div class="col-xs-6 text-right">
                                <p class="announcement-heading">456</p>
                                <p class="announcement-text">用户数量</p>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer announcement-bottom">
                            <div class="row">
                                <div class="col-xs-6">
                                    用户管理
                                </div>
                                <div class="col-xs-6 text-right">
                                    <i class="fa fa-arrow-circle-right"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-6">
                                <i class="fa fa-check fa-5x"></i>
                            </div>
                            <div class="col-xs-6 text-right">
                                <p class="announcement-heading">12</p>
                                <p class="announcement-text">客机数量</p>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer announcement-bottom">
                            <div class="row">
                                <div class="col-xs-6">
                                    Complete Tasks
                                </div>
                                <div class="col-xs-6 text-right">
                                    <i class="fa fa-arrow-circle-right"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="panel panel-danger">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-6">
                                <i class="fa fa-tasks fa-5x"></i>
                            </div>
                            <div class="col-xs-6 text-right">
                                <p class="announcement-heading">18</p>
                                <p class="announcement-text">Crawl Errors</p>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer announcement-bottom">
                            <div class="row">
                                <div class="col-xs-6">
                                    Fix Issues
                                </div>
                                <div class="col-xs-6 text-right">
                                    <i class="fa fa-arrow-circle-right"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-6">
                                <i class="fa fa-comments fa-5x"></i>
                            </div>
                            <div class="col-xs-6 text-right">
                                <p class="announcement-heading">56</p>
                                <p class="announcement-text">New Orders!</p>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer announcement-bottom">
                            <div class="row">
                                <div class="col-xs-6">
                                    Complete Orders
                                </div>
                                <div class="col-xs-6 text-right">
                                    <i class="fa fa-arrow-circle-right"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div><!-- /.row -->
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

