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
    <style>
        .select1 {
            float: left;
        }

        span{
            text-align: center;
            width: 50px;
            font-size:24px;
        }
    </style>
</head>

<body>
<!--判断是不是非法进入-->
<c:if test="${msg.user_name == null}">
    <script>
        alert("非法访问");
        window.location.href='<c:url value="/login" />';
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
                <li><a href="<c:url value="/admin" />"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="<c:url value="/admin_user" />"><i class="fa fa-bar-chart-o"></i> 用户管理</a></li>
                <li class="active"><a href="<c:url value="/admin_flight" /> "><i class="fa fa-table"></i> 机型管理</a></li>
                <li><a href="<c:url value="/admin_satisfaction" /> "><i class="fa fa-edit"></i> 用户满意度</a></li>
                <li><a href="<c:url value="/admin_import" />"><i class="fa fa-font"></i> 一键导入乘客</a></li>
            </ul>
            <!--管理员选项-->
            <ul class="nav navbar-nav navbar-right navbar-user">
                <li class="dropdown user-dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <c:out value="${msg.user_name}" /> <b class="caret"></b></a>
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
            <div class="col-lg-20">
                <h1 style="float: left">机型信息</h1>
                <div class="col-lg-8" style="margin-top: 20px;">
                        <div class="caption">
                            <form id="form" action="<c:url value="/admin_flight" />" method="post">
                                <div class="select1 col-lg-4">
                                    <select name="flight1" class="form-control" id="flight1" onchange="gradeChange()">
                                        <c:forEach items="${flight}" var="flight">
                                            <c:if test="${flight.r != 0}"><option value="<c:out value="${flight.name}" />"><c:out value="${flight.name}" /></option></c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                                <span class="glyphicon glyphicon-random select1"></span>
                                <div class="col-lg-4">
                                    <select name="flight2" class="form-control" id="flight2">
                                        <option>请选择</option>
                                    </select>
                                </div>
                                <div class="text-left" >
                                    <button id="btn" type="button" class="btn btn-primary text-center">换机</button>
                                </div>
                            </form>
                        </div>
                </div>
            </div>
        </div><!-- /.row -->

        <div class="row">
            <c:forEach items="${flight}" var="flight">
                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <img src="img/2.png"
                                 alt="飞机图">
                            <div class="caption">
                                <h3>客机型号：<span class="clearfm"><c:out value="${flight.name}" /></span></h3>
                                <p>飞机座位一共有：<span class="allseat" id="<c:out value="${flight.name}"/>_z"><c:out value="${flight.z}"/></span>，以售卖：<span class="sellseat" id="<c:out value="${flight.name}"/>_r"><c:out value="${flight.r}"/></span></p>
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
                    if(e=="true"){
                        location.reload();
                    }else {
                        alert("换机失败");
                    }
                }
            });//ajax——的结束
        }
    }

    var form = document.getElementById("form");
    var btn = document.getElementById("btn");

    var flight_model_2 = $("#flight2");
    var allseat=$(".allseat");
    var sellseat = $(".sellseat");
    var clearfm = $(".clearfm");
    gradeChange();
    btn.onclick = function () {
        var flight1=$("#flight1 option:selected");  //获取选中的项
        var flight1_value = flight1.val();   //拿到选中项的值
        var flight2=$("#flight2 option:selected");  //获取选中的项
        var flight2_value = flight2.val();   //拿到选中项的值

       if (flight1_value == flight2_value){
           alert("不能选择同一架飞机！")
       }else {
           form.submit();
       }

    }
    function gradeChange(){
        var a = 0;
        var flight1=$("#flight1 option:selected");  //获取选中的项
        var flight1_value = flight1.val();   //拿到选中项的值
        for (var i = 0;i<clearfm.length;i++){
            if(flight1_value == clearfm[i].innerHTML){
                a = i;
            }
        }
        var z = allseat[a].innerHTML;
        var r = sellseat[a].innerHTML;
        $("#flight2 option").remove();  //删除Select中索引值最大Option(最后一个
        for (var i = 0; i<sellseat.length;i++){
            if (r <= allseat[i].innerHTML - sellseat[i].innerHTML){
                //alert(clearfm[i].innerHTML);

                $("#flight2").append("<option value='"+clearfm[i].innerHTML+"'>"+clearfm[i].innerHTML+"</option>");
            }
        }

    }



</script>
</body>
</html>
