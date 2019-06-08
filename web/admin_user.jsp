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
                <li><a href="<c:url value="/admin_create_flight.jsp" />"><i class="fa fa-font"></i> 创建新飞机</a></li>
            </ul>
            <!--管理员选项-->
            <ul class="nav navbar-nav navbar-right navbar-user">
                <li class="dropdown user-dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><c:out value="${msg.user_name}" /> <b class="caret"></b></a>
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
            <div class="col-lg-12">
                <h1>用户信息</h1>
                <a href="#" class="glyphicon glyphicon-plus btn btn-info" data-toggle="modal" data-target="#add_user_modal">增加用户</a>
            </div>
        </div><!-- /.row -->
        <!--用户列表-->
        <div class="row">
            <div class="col-lg-8" style="width: 100%;">
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
                            <a class=" glyphicon glyphicon-pencil btn btn-info edit_a" data-toggle="modal" data-target="#edit_user_modal">修改</a>
                            <a class="glyphicon glyphicon-remove btn btn-danger delete_a" data-toggle="modal" data-target="#delete_user_modal">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            </div>
        </div>

    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<!-- 添加用户模态框（Modal） -->
<div class="modal fade" id="add_user_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    添加用户
                </h4>
            </div>
            <div class="modal-body">
                <form action="<c:url value="/register" />" method="post" id="add_user_from">
                    <div class="form-group">
                        <label>用户邮箱</label>
                        <input class="form-control" type="text" name="user_email" id="user_email" placeholder="用户邮箱"/>
                    </div>
                    <div class="form-group">
                        <label>用户密码</label>
                        <input class="form-control" type="password" name="password" id="user_passw" placeholder="用户密码"/>
                    </div>
                    <div class="form-group">
                        <label>用户姓名</label>
                        <input class="form-control" type="text" name="user_name" id="user_name" placeholder="用户姓名"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button id="add_user" type="button" class="btn btn-primary">
                    提交
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- 删除用户模态框（Modal） -->
<div class="modal fade" id="delete_user_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    确定删除用户吗？
                </h4>
            </div>
            <div class="modal-body">
                <form id="delete_form" action="<c:url value="/delete_user" />" method="post" >
                    <div class="form-group">
                        <label>用户邮箱</label>
                        <input id="delete_user_email" class="form-control" type="text" name="user_email" />
                    </div>
                    <div class="form-group">
                        <label>用户姓名</label>
                        <input id="delete_user_name" class="form-control" type="text" name="user_name" />
                    </div>
                    <div class="form-group">
                        <label>用户ID</label>
                        <input id="delete_user_id" class="form-control" type="text" name="user_id" />
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button id="delete_user" type="button" class="btn btn-primary">
                    确定
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- 修改用户模态框（Modal） -->
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
                <form id="edit_form" action="<c:url value="/edit_user" />" method="post" >
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
<!-- JavaScript -->
<script src="<c:url value="/jquery/jquery.min.js" />"></script>
<script src="<c:url value="/bootstrap-3.3.7-dist/js/bootstrap.min.js" />"></script>


<!-- Page Specific Plugins -->
<script src="<c:url value="js/raphael-min.js" />"></script>
<script src="<c:url value="js/morris-0.4.3.min.js" />"></script>
<script src="<c:url value="js/morris/chart-data-morris.js" />"></script>
<script src="<c:url value="js/tablesorter/jquery.tablesorter.js" />"></script>
<script src="<c:url value="js/tablesorter/tables.js" />"></script>

<script>
    var user_id = $(".user_id");
    var user_name = $(".user_name");
    var user_email = $(".user_email");
    var user_sex = $(".user_sex");

    var delete_btn = $(".delete_a").click(function () {
        var a = $(".delete_a").index(this);
        $("#delete_user_id").val(user_id[a].innerHTML);
        $("#delete_user_name").val(user_name[a].innerHTML);
        $("#delete_user_email").val(user_email[a].innerHTML);
    });

    $("#delete_user").click(function () {
        $("#delete_form").submit();
    });

    $(".edit_a").click(function () {
        var a = $(".edit_a").index(this);
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