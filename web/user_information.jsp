<%--
  Created by IntelliJ IDEA.
  User: s8534
  Date: 2019/6/8
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: s8534
  Date: 2019/6/8
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>购买机票</title>
    <link rel="stylesheet" href="<c:url value="/bootstrap-3.3.7-dist/css/bootstrap.min.css" />"/>
    <script src="<c:url value="/jquery/jquery.min.js" />"></script>
    <script src="<c:url value="/bootstrap-3.3.7-dist/js/bootstrap.min.js" />"></script>
    <link rel="stylesheet" href="<c:url value="/layui-v2.4.5/layui/css/layui.css" />"  media="all">
    <script src="<c:url value="/layui-v2.4.5/layui/layui.all.js" />" type="text/javascript"></script>
    <!-- Add custom CSS here -->
    <link href="<c:url value="css/admin.css" />" rel="stylesheet">
    <!-- Page Specific CSS -->
    <link rel="stylesheet" href="<c:url value="/css/morris-0.4.3.min.css" />">

    <style>

        .side-nav{
            top: 98px;
            position: fixed;
            z-index: -100;
        }
        #page-wrapper{
            margin-top: 100px;
        }
    </style>

</head>
<body>


<div id="wrapper">

    <!-- 侧边栏 -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="navbar-header">
            <img style="width: 88px;" src="<c:url value="/img/logo.png"/> " />
            <h1 style="    float: right;margin-left: 26px;line-height: 240%;color: #fff;">Eyat</h1>
        </div>

        <!-- 左侧栏列表-->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav side-nav">
                <li><a href="<c:url value="/buy"/> "><i class="fa fa-dashboard"></i>首页</a></li>
                <li><a href="#"><i class="fa fa-bar-chart-o"></i>个人信息</a></li>
                <li><a href="#"><i class="fa fa-table"></i></a></li>
                <li><a href="#"><i class="fa fa-edit"></i></a></li>
                <li><a href="#"><i class="fa fa-font"></i></a></li>
            </ul>

            <!--管理员选项-->
            <ul class="nav navbar-nav navbar-right navbar-user">
                <li class="dropdown user-dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #fff;font-size: 36px;line-height: 200%;"><i class="fa fa-user"></i><c:out value="${msg.user_name}" /> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><i class="fa fa-gear"></i> 设置</a></li>
                        <li class="divider"></li>
                        <li><a href="<c:url value="/out"/>"><i class="fa fa-power-off"></i> 退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-8" style="width: 100%;">
                <c:if test="${judge==0}">
                    <h1>没有这个用户</h1>
                </c:if>
                <c:if test="${judge==1}">
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
                                <td class="col-lg-1 user_id"><c:out value="${user.user_id}" /></td>
                                <td class="col-lg-1 user_name"><c:out value="${user.user_name}" /></td>
                                <td class="col-lg-1 user_email"><c:out value="${user.user_email}" /></td>
                                <td class="col-lg-1 user_sex"><c:out value="${user.user_sex}" /></td>
                                <td class="col-lg-1">
                                    <c:if test="${user.permission == 1}" ><span style="color: red">管理员</span></c:if>
                                    <c:if test="${user.permission != 1}" ><span style="color: green">普通用户</span></c:if>
                                </td>
                                <td class="col-lg-1">
                                    <a class=" glyphicon glyphicon-pencil btn btn-info edit_us" data-toggle="modal" data-target="#edit_user_modal" >修改</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>
            </div>
        </div>
    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->
<div class="modal fade" id="edit_user_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    修改用户信息
                </h4>
            </div>
            <div class="modal-body">
                <form id="edit_form" action="<c:url value="/userFormation" />" method="post" >
                    <div class="form-group">
                        <label>用户邮箱</label>
                        <input id="edit_user_email" class="form-control" type="text" name="user_email" />
                    </div>
                    <div class="form-group">
                        <label>用户姓名</label>
                        <input id="edit_user_name" class="form-control" type="text" name="user_name" />
                    </div>
                    <div class="form-group">
                        <label>用户性别</label>
                        <select name="user_sex" id="edit_user_sex" class="form-control">
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>用户ID</label>
                        <input id="edit_user_id" class="form-control" type="text" name="user_id" />
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button id="edit_user" type="button" class="btn btn-primary">
                    确定
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script type="text/javascript">
    var user_id = $(".user_id");
    var user_name = $(".user_name");
    var user_email = $(".user_email");
    var user_sex = $(".user_sex");

    $(".edit_us").click(function () {
        var a = $(".edit_us").index(this);
        $("#edit_user_id").val(user_id[a].innerHTML);
        $("#edit_user_name").val(user_name[a].innerHTML);
        $("#edit_user_email").val(user_email[a].innerHTML);
        $("#edit_user_sex").val(user_sex[a].innerHTML);
    });
    $("#edit_user").click(function () {
        $("#edit_form").submit();
    });
</script>
</body>

</html>


