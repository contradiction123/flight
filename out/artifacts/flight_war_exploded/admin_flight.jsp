<%--
  Created by IntelliJ IDEA.
  User: fanxi
  Date: 2019/5/27
  Time: 14:03
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
</head>

<body>
<!--判断是不是非法进入-->
<c:if test="${msg.user_name == null}">
    <script>
        alert("非法访问");
        window.location.href="http://localhost:8080/flight/login";
    </script>
</c:if>
<div id="wrapper">

    <!-- 侧边栏 -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">航班分配系统后台管理</a>
        </div>

        <!-- 左侧栏列表-->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav side-nav">
                <li class="active"><a href="<c:url value="/admin" />"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="<c:url value="/admin_user" />"><i class="fa fa-bar-chart-o"></i> 用户管理</a></li>
                <li><a href="#"><i class="fa fa-table"></i> 机型管理</a></li>
                <li><a href="#"><i class="fa fa-edit"></i> 用户满意度</a></li>
                <li><a href="<c:url value="/admin_import" />"><i class="fa fa-font"></i> 一键导入乘客</a></li>
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
                <h1>机型信息</h1>
            </div>
        </div><!-- /.row -->

        <div class="row">
            <c:forEach items="${flight}" var="flight">
                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <img src="img/2.png"
                                 alt="飞机图">
                            <div class="caption">
                                <h3 class="clearfm"><c:out value="${flight.name}" /></h3>
                                <p>飞机座位一共有：<c:out value="${flight.z}"/>，以售卖:<c:out value="${flight.r}"/></p>
                                <p>
                                    <a href="<c:url value="/skip" ><c:param name="flight_number" value="${flight.name}" /> </c:url>" class="btn btn-primary" role="button">
                                        管理
                                    </a>
                                    <a href="#" class="btn btn-default clearuser" role="button">
                                        清空乘客
                                    </a>
                                </p>
                            </div>
                        </div>
                    </div>
            </c:forEach>
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

<script>
    var clearuser=$(".clearuser");
    var flightNumber=$(".clearfm");
    for(let i=0;i<clearuser.length;i++){
        clearuser[i].onclick=function () {
            // alert(flightNumber[i].innerHTML);
            $.ajax({
                type:"POST", //请求方式
                url:"./clearflightuser", //请求路径
                cache: false,
                data:{flight_number:flightNumber[i].innerHTML},
                dataType: 'text',   //设置返回值类型
                success:function(e){
                    alert(e);
                }
            });//ajax——的结束
        }
    }
</script>
</body>
</html>
