<%--
  Created by IntelliJ IDEA.
  User: fanxi
  Date: 2019/5/31
  Time: 20:15
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
    <link rel="stylesheet" type="text/css" href="js/jquery.step.css" />
    <script src="js/jquery.step.min.js"></script>
    <link href="<c:url value="/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" />" rel="stylesheet" media="screen">
    <script type="text/javascript" src="<c:url value="/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js" />" charset="UTF-8"></script>
    <script type="text/javascript" src="<c:url value="/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js" />" charset="UTF-8"></script>

    <style>
        .header_wrap{
            border-bottom: 1px solid #e5e5e5;
            width: 100%;
        }
        .header{
            width: 100%;
            display: table;
            margin: 0 auto;
            background-color: black;
            margin-bottom: -10px;
        }
        .topMenu{
            padding: 20px 0;
            height: 80px;
            margin-left: 10%;
            color: #ffffff;
        }

        .fySearch{
            margin: 0 auto;
            width: 100%;
        }

        .stopImg{
            padding-top: 115px;
            color: #fff;
            font-size: 26px;
        }
        .mt{
            font-size: 54px;
            line-height: 60px;
            font-weight: 700;
        }
        .mc{
            font-size: 24px;
            margin-top: 20px;
        }
        .stopMain{
            margin-top: 5%;
            margin-left: 25%;
        }

        .f_content{
            width: 100%;
        }
        a {
            color: #ffffff;
        }
        a:hover {
            color: white;
            border-bottom: 1px solid red;
        }
        .tu{
            transform:scale(1.5) rotate(90deg);
        }

        div{
            display:block;
        }
        .headfly{
            width: 980px;
            position:relative;
            padding-left:50px;
        }
        .flylogo{
            width: 120px;
            float: left;
        }
        .headorder{
            width:800px;
            float:left;
            margin-left: 280px;
            color: #abb4c3;
            font-size: 14px;
        }
        .hstep{
            float: left;
            position: relative;
            width: 180px;
            margin-left:20px;
        }
        .hstepcols{
            color: #ff7d13;
        }
        .hlogin{
            position: absolute;
            padding-left: 50px;
            font-size: 14px;
            left:1300px;
            top:30px;
            color: black;
        }
        .fly-middle{
            width: 1280px;
            padding-left:0;
            position: relative;
            margin: 10px auto;
        }
        .main{
            position: relative;
            float: left;
            width: 90%;
            height: 900px;
            margin-left: -10px;
            padding-right: 0;
            padding-top: 10px;
            background: #eaf0f3;
        }
        .box-message{
            position: relative;
            margin:20px 0;
        }
        .box-tit{
            position: relative;
            color: #849bab;
            margin-left:10px;
            margin-bottom: 10px;
        }
        h2{
            font-size: 18px;
            margin-right: 10px;
            color: #234;
            display: inline-block;
        }
        .box-tips{
            display: inline-block;
            color: #849bab;
        }
        .p-message{
            position: relative;
            margin: 20px 10px;
        }
        .p-card{
            padding: 15px 15px 15px 20px;
            position: relative;
            margin-bottom: 10px;
            background: rgba(255, 255, 255, 0.527);
        }
        .p-card-set{
            padding:5px 0;
        }
        .p-card-s{
            display: table-cell;
        }
        .sidebar{
            width:340px;
            float:right;
            margin-right: 170px;
        }
        .sidebar-cont{
            width: 340px;
            border:solid #d6dde2;
            border-width: 0 1px;
            background: #f5f8f9;
        }
        .flight-info{
            position: relative;
            padding: 26px 0 3px;
            text-align: center;
        }
        .flight-city{
            font-size: 15px;
            padding-bottom: 8px;
            font-weight: 700;
        }

        .flt-date{
            padding-right: 14px;
            text-align: center;
        }
        .week{
            padding-left: 9px;
            text-align: center;
        }
        .flt-depart{
            text-align: left;
            display: inline-block;
            vertical-align: middle;
            margin-bottom:5px;
        }
        .flight-tit{
            padding-bottom: 10px;
            color: #849bab;
        }
        .plane-type{
            margin-right: 6px;
            display: inline-block;
            vertical-align: middle;
        }
        .flight-detail{
            padding-top:10px;
            text-align: center;
        }
        .flt-arrow{
            width: 320px;
        }
        .total-price{
            margin: 0 -20px;
            padding: 13px 30px 0;
            color: #ff7d13;
            font-size: 35px;
            font-weight: 700;
            border-top: 1px solid #e0e5e7;
            text-align: right;
        }
        .flight-cost{
            padding:20px 20px;
        }
        .total-price{
            border: none;
            padding: 12px 0;
        }
        .cost-row{
            position: relative;
            line-height: 27px;
            padding-right: 80px;
        }
        .cost-tit{
            line-height: 27px;
        }
        .abb{
            padding-bottom: 1px;
            color: #849bab;
            margin-left: 15px;
        }
        .corner{
            position: absolute;
            right: 0;
            top: 0;
            text-align: right;
        }
        .p-num{
            position: absolute;
            left:10px;
            top: 15px;
            width: 16px;
            height: 20px;
            color: #ccc;
            font-size: 20px;
            font-weight: 700;
        }
        .num-1{
            background-position: 0 -301px;
            width: 8px;
            height: 20px;
        }
        .b-go{
            width: 100%;
            height: 50px;
            line-height: 50px;
            padding: 0;
            margin-bottom: 10px;
            font-size: 18px;
            display: inline-block;
            color: #fff;
            background: #27e;
            border: 1px solid #27e;
            border-radius: 3px;
        }
    </style>
    <!-- Add custom CSS here -->
    <link href="<c:url value="css/admin.css" />" rel="stylesheet">
    <!-- Page Specific CSS -->
    <link rel="stylesheet" href="<c:url value="/css/morris-0.4.3.min.css" />">

    <style>
        .clear {
            clear: both
        }
        .RadioStyle input {
            display: none
        }
        .RadioStyle label {
            border: 1px solid #CCC;
            color: #666;
            padding: 2px 10px 2px 5px;
            line-height: 28px;
            min-width: 80px;
            text-align: center;
            float: left;
            margin: 2px;
            border-radius: 4px
        }
        .RadioStyle input:checked + label {
            background: url(<c:url value="/android_h5/images/ico_checkon.svg" />) no-repeat right bottom;
            border: 1px solid #00a4ff;
            background-size: 21px 21px;
            color: #00a4ff
        }
        .RadioStyle input:disabled + label {
            opacity: 0.7;
        }
        .child_vip{
            width: 48%;
        }
        .threechild_vip{
            width: 98%;
        }
        .one,.second{
            width: 23%;
        }
        .attribute{
            display: none;
        }

        .user_id_type{
            font-size: 18px;
        }
        .attribute_type{
            font-size: 8px;
            text-align: left;
        }


        .item span:nth-of-type(1){display:inline-block;font-size:14px;width:100%;line-height:24px;}
        .item span:nth-of-type(2){border-bottom:1px solid #eee;position:absolute;right:-60px;display:inline-block;font-size:14px;width:60px;background:#ddd;text-align: center;line-height:50px;}
        .item span:nth-of-type(3){border-bottom:1px solid #eee;position:absolute;right:-120px;display:inline-block;font-size:14px;width:60px;background:red;text-align: center;line-height:50px;}

        .user_id_type{
            display: flex;
        }
        .user_id_type>div{
            width: 50%;
            text-align: left;
        }
        .user_id_type>div:nth-child(2){
            position: relative;
        }
        .user_id_type>div:nth-child(2)>span{
            position: absolute;
            left: 0px;
            width: 27%;
            transform: scale(0.8);
            border: #5e5e5e 1px solid;
        }
        .user_id_type1{
            display: flex;
            margin-top: 10px;
        }
        .user_id_type1>div{
            width: 50%;
            text-align: left;
        }
        #a1{
            display: flex;
        }
        #a1>div{
            width: 50%;
        }
        .attribute{
            width: 100%;
        }
        .attribute>div{
            width: 70%;
        }

        #a2{
            display: flex;
        }
        #a2>div{
            width: 25%;
        }
        #a3{
            display: flex;
        }
        #a3>div{
            width: 25%;
        }
        label{
            transform: scale(0.9);
        }
        .child_vip{
            width: 100%;
            transform: scale(1);
        }
        .RadioStyle{
            width: 70%;
        }
        .one,.second{
            width: 100%;
        }
        body,
        html {
            height: 100%;
            width: 100%;
            margin: 0;
            padding: 0;
        }
        #mainSVG {
            width: 100%;
            height: 100%;
            /*display: none;*/
            z-index: 100;
            position: absolute;
            top: 0px;
            background: rgba(0,0,0,0.5);
            left:0px
        }
        .main{
            padding-top: 15px;
        }
        .side-nav{
            top: 98px;
            position: fixed;
            z-index: -100;
        }
        .sidebar{
            margin-top: 84px;
            position: fixed;
            right: 0px;
        }
        .topMenu{
            padding: 20px 0;
            height: 80px;
            margin-left: 10%;

        }
        .head_color{
            background-color: #304f89;

        }
        .head_bar{
            position: relative;
            margin-top: 90px;
            margin-right:90px;
        }
        #wrappera{
            padding-left: 125px;
        }
    </style>
    <style>
        #flight-information{
            width: 100%;
            height: 300px;
            margin-bottom: 10%;
        }
        .table-flight{
            transform-origin:0 0;
            font-size: 22px;
            transform: rotate(-90deg) translateX(-100%) translate(-50%,0%);
            text-align: center;
        }
        td{
            margin: 0px;
            height: 25px;
            width: 35px;
        }
        .seat-id:hover{
            background: rgba(255,0,0,0.5);
        }
        #flight-information{
            display: flex;
            width: 100%;
        }
        #flight-information>div{
            width: 20%;
            height: 100%;
        }
        #flight-information>div:nth-child(2){
            width: 20%;
            font-style: italic;
            font-family: -webkit-body;
            font-size: 17px;
        }
        #flight-information>div:nth-child(2)>div{
            margin-top: 10px;
        }
        #flight-information>div:nth-child(4){
            width: 50%;
        }
        .button{
            height: 66px;
            font-size: 20px;
            border-radius: 15px;
            font-family: cursive;
            margin-top: 10px;
        }
        .hoverBig:hover{
            transform: scale(1.2);
        }
    </style>
</head>
<body>


<div id="wrappera">

    <!-- 侧边栏 -->
    <nav class="navbar navbar-inverse navbar-fixed-top " role="navigation">
        <div class="navbar-header topMenu">
            <img style="width: 50px;" src="<c:url value="/img/logo.png"/> " />
            <h1 style=" float: right; line-height: 10px; margin-left: 20px;margin-top:20px;">Eyat</h1>
        </div>

        <!-- 左侧栏列表-->
        <div class="collapse navbar-collapse navbar-ex1-collapse head_color">
            <%--<ul class="nav navbar-nav side-nav">--%>
            <%--<li class="active"><a href="<c:url value="/buy"/> "><i class="fa fa-dashboard"></i>首页</a></li>--%>
            <%--<li><a href="<c:url value="/userFormation"/>?name=<c:out value="${msg.user_name}" />"><i class="fa fa-bar-chart-o"></i>个人信息</a></li>--%>
            <%--<li><a href="#"><i class="fa fa-table"></i></a></li>--%>
            <%--<li><a href="#"><i class="fa fa-edit"></i></a></li>--%>
            <%--<li><a href="#"><i class="fa fa-font"></i></a></li>--%>
            <%--</ul>--%>

            <%--添加一个用户图标到用户名旁边 还没弄好--%>
            <div style="float: right;">
                <svg class="icon" style="width: 1em; height: 1em;vertical-align: middle;fill: currentColor;overflow: hidden;fill-color:red; transform:scale(1.5);" viewBox="0 0 1024 1024" version="1.1"><path d="M511.997 597.333c125.778 0 241.87-109.881 254.883-270.586C780.487 158.596 668.816 0 511.997 0 355.184 0 243.506 158.596 257.124 326.747 270.131 487.452 386.225 597.333 511.997 597.333zM509.719 684.073C228.208 684.073 0 796.019 0 934.112c0 47.221 43.411 65.423 171.081 79.221C269.777 1024 387.61 1024 512 1024c127.414 0 253.777 0 342.675-10.667 125.756-15.09 169.325-32 169.325-79.221C1024 796.019 791.22 684.073 509.719 684.073z" p-id="1301"></path></svg>
            </div>
            <!--管理员选项-->
            <ul class="nav navbar-nav navbar-right navbar-user">

                <li class="dropdown user-dropdown" style="height: 80px;">

                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #fff;font-size: 36px;line-height: 200%;height: 80px;"><i class="fa fa-user"></i><c:out value="${msg.user_name}" /> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><i class="fa fa-gear"></i> 设置</a></li>
                        <li class="divider"></li>
                        <li><a href="<c:url value="/out"/>"><i class="fa fa-power-off"></i> 退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
    <div class="head_bar">
        <div id="step"></div>
    </div>
    <div id="page-wrapper">

        <div class="fly-middle">
            <div class="main">
                <div class="p-message" id="ss" style="width: 100%;height: 200px;display: flex;">
                    <div class="p-card" style="width: 50%;">
                        <label>当前航班</label>
                        <label style="float: right"><c:out value="${start_time}"/></label>
                        <HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#987cb9 SIZE=3>
                        <div style="text-align: center;">
                            <svg class="icon" style="width: 1em; height: 1em;vertical-align: middle;transform:scale(1.5);fill: red;overflow: hidden;" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1879"><path d="M714.94656 957.18912a20.21888 20.21888 0 0 1-19.33312-14.27968l-114.24256-371.76832-136.41216 115.58912 1.65376 201.04192a20.21888 20.21888 0 0 1-5.79584 14.336l-33.77152 34.37568a20.21376 20.21376 0 0 1-33.28-6.87616L300.672 740.6592l-196.17792-84.27008a20.22912 20.22912 0 0 1-6.5024-32.6912l33.6384-34.49344a20.25472 20.25472 0 0 1 15.46752-6.08256l205.76768 10.07616 115.89632-142.19264-374.35904-118.90176a20.21376 20.21376 0 0 1-8.33024-33.41824l64.26112-65.63328a20.2752 20.2752 0 0 1 16.47616-5.97504l461.64992 46.47936 130.82112-131.1232c52.10112-52.71552 102.05184-60.98944 127.18592-60.98944h0.36864c23.34208 0 43.96544 6.90176 55.23968 18.18112 27.22304 27.22304 25.87648 104.88832-47.46752 179.71712-0.05632 0.0512-0.10752 0.1536-0.1536 0.2048l-131.97312 131.75808 36.92544 458.3936a20.23936 20.23936 0 0 1-5.7088 15.78496l-64.3072 65.62816a20.22912 20.22912 0 0 1-14.44352 6.07744z m-123.24352-441.5232a20.21888 20.21888 0 0 1 19.31776 14.27968l113.25952 368.5888 34.06336-34.75968L721.408 405.248a20.20352 20.20352 0 0 1 5.86752-15.93344l138.52672-138.27072c33.99168-34.70336 45.952-65.15712 50.00704-84.59264 4.99712-23.9616-0.67584-36.28032-2.34496-38.05184-7.43936-7.33184-63.90784-19.62496-125.48096 42.71104a1.3568 1.3568 0 0 1-0.08704 0.08192l-137.61536 137.73824a20.21376 20.21376 0 0 1-16.32768 5.82656L172.43136 268.288l-34.47296 35.21024 371.38432 117.9392a20.21376 20.21376 0 0 1 9.55392 32.04608l-141.13792 173.16352c-4.06016 4.98688-10.24 7.72608-16.6656 7.424l-206.86848-10.12736-6.72256 6.89152 176.94208 76.0064a20.23936 20.23936 0 0 1 10.88 11.28448l64.84992 167.64928 5.93408-6.04672-1.65888-202.1376a20.18816 20.18816 0 0 1 7.14752-15.5904l167.03488-141.54752a20.23936 20.23936 0 0 1 13.07136-4.7872z" p-id="1880"></path></svg>
                            <label style="font-size: 15px;color: #9d9d9d;">中国航联</label>
                            <div>
                                <label style="font-size: 10px;color: #9d9d9d;"><c:out value="${flightmodel.name}"/></label>
                            </div>
                        </div>
                        <div>
                            <label style="font-size:20px; margin-left: 30%;"><c:out value="${start_site}"/></label>
                            <label style="font-size:20px; margin-left: 90px;"><c:out value="${end_site}"/></label>
                        </div>
                        <div>
                            <label style=" margin-left: 25%;"><svg class="icon" style="width: 1em; height: 1em;vertical-align: middle;fill: currentColor;overflow: hidden;" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1632"><path d="M363.52 330.24l-35.84-35.84-35.84 35.84 35.84 35.84 35.84-35.84z m135.68 504.32h51.2v-51.2h-51.2v51.2z m25.6-614.4c-15.36 0-25.6 10.24-25.6 25.6v256h-204.8c-15.36 0-25.6 10.24-25.6 25.6s10.24 25.6 25.6 25.6h230.4c15.36 0 25.6-10.24 25.6-25.6v-281.6c0-15.36-10.24-25.6-25.6-25.6z m-238.08 481.28l35.84 35.84 35.84-35.84-35.84-35.84-35.84 35.84z m494.08-199.68v51.2h51.2v-51.2h-51.2z m-107.52 197.12l35.84 35.84 35.84-35.84-35.84-35.84-35.84 35.84zM524.8 117.76c-225.28 0-409.6 184.32-409.6 409.6s184.32 409.6 409.6 409.6 409.6-184.32 409.6-409.6c0-227.84-184.32-409.6-409.6-409.6z m0 768c-197.12 0-358.4-161.28-358.4-358.4s161.28-358.4 358.4-358.4 358.4 161.28 358.4 358.4-161.28 358.4-358.4 358.4z m156.16-558.08l35.84 35.84 35.84-35.84-35.84-33.28-35.84 33.28z" p-id="1633"></path></svg>8:00</label>
                            &nbsp;
                            &nbsp;
                            ------------->
                            &nbsp;
                            &nbsp;
                            <label><svg class="icon" style="width: 1em; height: 1em;vertical-align: middle;fill: currentColor;overflow: hidden;" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1632"><path d="M363.52 330.24l-35.84-35.84-35.84 35.84 35.84 35.84 35.84-35.84z m135.68 504.32h51.2v-51.2h-51.2v51.2z m25.6-614.4c-15.36 0-25.6 10.24-25.6 25.6v256h-204.8c-15.36 0-25.6 10.24-25.6 25.6s10.24 25.6 25.6 25.6h230.4c15.36 0 25.6-10.24 25.6-25.6v-281.6c0-15.36-10.24-25.6-25.6-25.6z m-238.08 481.28l35.84 35.84 35.84-35.84-35.84-35.84-35.84 35.84z m494.08-199.68v51.2h51.2v-51.2h-51.2z m-107.52 197.12l35.84 35.84 35.84-35.84-35.84-35.84-35.84 35.84zM524.8 117.76c-225.28 0-409.6 184.32-409.6 409.6s184.32 409.6 409.6 409.6 409.6-184.32 409.6-409.6c0-227.84-184.32-409.6-409.6-409.6z m0 768c-197.12 0-358.4-161.28-358.4-358.4s161.28-358.4 358.4-358.4 358.4 161.28 358.4 358.4-161.28 358.4-358.4 358.4z m156.16-558.08l35.84 35.84 35.84-35.84-35.84-33.28-35.84 33.28z" p-id="1633"></path></svg>12:00</label>
                        </div>
                    </div>

                    <div class="p-card" style="width: 50%;margin-left: 10%;">
                        <label>乘客信息</label>
                        <label style="float: right">当前0位乘客</label>
                        <HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#987cb9 SIZE=3>
                        <div id="user-all" style="text-align: center;">
                        </div>
                    <div style="text-align: center"><a class=" glyphicon glyphicon-pencil btn btn-info edit_us" data-toggle="modal" data-target="#add_user" onclick="clearadduser()" >添加乘客</a></div>
                </div>

                </div>
                 <HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#987cb9 SIZE=3>
                <div style="width:auto;text-align: center;">
                    <a href="javascript:;" class="b-go" id="btn1">提交</a>
                </div>


                <div class="row col-lg-10" style="margin-left: 10%;">
                    <div id="flight-box">
                        <div id="flight-table">

                        </div>
                    </div>
                </div><!-- /.row -->
           </div>

       </div>
                </div>
            </div>

        </div>

    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<div class="modal fade" id="add_user" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    添加用户
                </h4>
            </div>
            <div class="modal-body">

                <div class="input-group" style="margin-left: 15px;">
                <span class="input-group-addon">姓名</span>
                <input type="text" id="user-name" class="form-control " value='<c:out value="${msg.user_name}" />'  aria-label="..." style="width:360px;">
                </div>
                <div>
                <div style="margin-top: 10px;">
                <div class="input-group" style="margin-left: 15px;">
                <span class="input-group-addon">账号</span>
                <input type="text" id="user-id" class="form-control  user-id" value=''  placeholder="账号" aria-label="..." style="width:360px;">
                </div>
                </div>
                </div>
                <div>
                <div style="margin-top: 10px;">
                <div class="col-lg-2" style="width:160px;">
                <select class="form-control" onchange="selectOnchang(this)">
                <option>身份证</option>
                <option>护照</option>
                <option>军人证</option>
                </select>
                </div>
                <input type="text" id="user-card" class="form-control" placeholder="证件号码" style="width:270px;">
                </div>
                </div>



                <div class="form-group modal-body-div child_vip_type">
                <div style="margin-top: 20px;">
                <label class="wenzi-5ex modal-body-label">类型（可不选）:</label>
                </div>
                <div class="RadioStyle">
                <div class="Block PaddingL">
                <div id="a1">
                <div>
                <input type="checkbox" id="love1" name="Storage" class="Storage"/>
                <label for="love1" class="child_vip">child</label>
                </div>
                <div>
                <input type="checkbox" id="love2" name="Storage" class="Storage" />
                <label for="love2" class="child_vip">vip</label>
                </div>
                </div>
                <div>
                <input type="checkbox" id="love3" name="Storage" class="Storage"/>
                <label for="love3" class="child_vip threechild_vip">不选</label>
                </div>
                </div>
                </div>
                </div>
                <div class="form-group modal-body-div attribute">
                <div>
                <label class="modal-body-label">第一属性：</label>
                </div>
                <div class="RadioStyle">
                <div class="Block PaddingL" id="a2">
                <div>
                <input type="radio" name="Storage1" id="model7" class="Storage1" />
                <label for="model7" class="one">windows</label>
                </div>
                <div>
                <input type="radio" name="Storage1" id="model4" class="Storage1" />
                <label for="model4" class="one">door</label>
                </div>
                <div>
                <input type="radio" name="Storage1" id="model5" class="Storage1"/>
                <label for="model5" class="one">middle</label>
                </div>
                <div>
                <input type="radio" name="Storage1" id="model6" class="Storage1"/>
                <label for="model6" class="one">aisle</label>
                </div>
                </div>
                </div>
                </div>

                <div class="form-group modal-body-div attribute">
                <div>
                <label class="wenzi-5ex modal-body-label">第二属性:</label>
                </div>
                <div class="RadioStyle">
                <div class="Block PaddingL" id="a3">
                <div>
                <input type="radio" name="Storage2" id="model11" class="Storage2"/>
                <label for="model11" class="second">windows</label>
                </div>
                <div>
                <input type="radio" name="Storage2" id="model8" class="Storage2"/>
                <label for="model8" class="second">door</label>
                </div>
                <div>
                <input type="radio" name="Storage2" id="model9" class="Storage2"/>
                <label for="model9" class="second">middle</label>
                </div>
                <div>
                <input type="radio" name="Storage2" id="model10" class="Storage2"/>
                <label for="model10" class="second">aisle</label>
                </div>
                </div>
                </div>
                </div>
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

<form id="formflight" method="get" action="./userdisplay">

    <input type="hidden" id="user-seat" name="seat"/>
    <input type="hidden" id="flight_number" name="flight" value="<c:out value="${flightmodel.name}"/>"/>

</form>
<i id="mysvg"></i>
</body>
<script src='<c:url value="/js/TweenMax.min.js"/>'></script>
<script src='<c:url value="/js/MorphSVGPlugin.min.js"/>'></script>

<script>
    var user_names=new Array();
    var user_ids=new Array();
    var user_cards=new Array();
    var user_attribute1=new Array();
    var user_attribute2=new Array();
</script>

<script>
    var child_vip=$(".child_vip");
    var storage=$(".Storage");
    var attribute=$(".attribute");
    var storage1=$(".Storage1");
    var storage2=$(".Storage2");
    var isselect=0;
    var one=$(".one");
    var second=$(".second");
    var onek=0;
    var secondk=0;

    var userconut=0;

    var user=$(".user");

    var list_item=$(".list-item");

    var user_name="";

    $(".add:eq(0)").click(function () {
        clearadduser();
    });

    function clearadduser() {
        $("#user-name").val("");
        $("#user-id").val("");
        $("#user-card").val("");

        $(".child_vip_type:eq(0)").css('display','inline');
        $(".child_vip:eq(2)").css('display','inline');

        $("#love1").attr("disabled",false);
        $("#love2").attr("disabled",false);
        $("#love3").attr("disabled",false);
        storage[0].checked=false;
        storage[1].checked=false;
        storage[2].checked=false;

        for(let i=0;i<storage1.length;i++){
            storage1[i].checked=false;
            storage2[i].checked=false;
        };

        attribute[0].style.display="none";
        attribute[1].style.display="none";

        document.getElementById("name").style.border="2px solid #ced4da";

        document.getElementById("name").value="";

        document.getElementsByClassName("modal-body")[0].style.border="0px solid red";

        isselect=0;
        onek=0;
        secondk=0;
    }

    child_vip[0].onclick=function () {
        if(!storage[0].checked||storage[1].checked){
            storage[0].style.border="1px solid #CCC";
            storage[1].style.border="1px solid #CCC";
            child_vip[2].innerHTML="确定";
            isselect++;
            document.getElementsByClassName("modal-body")[0].style.border="0px solid red";
        }else {
            child_vip[2].innerHTML="不选";
            isselect--;
        };
    };
    child_vip[1].onclick=function () {
        if(!storage[1].checked||storage[0].checked){
            isselect++;
            document.getElementsByClassName("modal-body")[0].style.border="0px solid red";
            storage[0].style.border="1px solid #CCC";
            storage[1].style.border="1px solid #CCC";
            child_vip[2].innerHTML="确定";
        }else {
            child_vip[2].innerHTML="不选";
            isselect--;
        }

    };
    child_vip[2].onclick=function () {
        if(storage[1].checked&&storage[0].checked){
            storage[0].style.border="1px solid #CCC";
            storage[1].style.border="1px solid #CCC";
            sureClick();
        }else {
            attribute[0].style.display="inline";
            if(!storage[1].checked&&!storage[0].checked){
                attribute[1].style.display="inline";
            };
            child_vip[2].style.display="none";

            $("#love1").attr("disabled",true);
            $("#love2").attr("disabled",true);
            $("#love3").attr("disabled",true);
        }
    };

    for(let i=0;i<storage1.length;i++){
        one[i].onclick=function () {
            onek++;
            if(!storage1[i].checked){
                if(onek==1){
                    isselect++;
                }
                document.getElementsByClassName("modal-body")[0].style.border="0px solid red";
            }
        }
        second[i].onclick=function () {
            secondk++
            if(!storage2[i].checked){
                if(secondk==1)isselect++;
                document.getElementsByClassName("modal-body")[0].style.border="0px solid red";
            }
        }
    }

    $("#edit_user").click(function () {
        var attribute=new Array(2);
        var arbk=0;
        if(storage[0].checked )attribute[arbk++]="vip";
        if(storage[1].checked )attribute[arbk++]="child";
        if(storage1[0].checked)attribute[arbk++]="windows";
        if(storage1[1].checked)attribute[arbk++]="door";
        if(storage1[2].checked)attribute[arbk++]="middle";
        if(storage1[3].checked)attribute[arbk++]="aisle";
        if(storage2[0].checked)attribute[arbk++]="windows";
        if(storage2[1].checked)attribute[arbk++]="door";
        if(storage2[2].checked)attribute[arbk++]="middle";
        if(storage2[3].checked)attribute[arbk++]="aisle";

        // alert($("#user-name").val()+","+$("#user-id").val()+","+$("#user-card").val()+","+attribute[0]+","+attribute[1]);

        $("#user-all").append(
            '<div class="user-num">'+
            '<div style="display:inline;">姓名:'+$("#user-name").val()+'</div>'+
            '<div style="display:inline;">账号:'+$("#user-id").val()+'</div>'+
            '<div style="display:inline;">证件:'+$("#user-card").val()+'</div>'+
            '<div style="display:inline;">属性:'+attribute[0]+","+attribute[1]+'</div>'+
            '<div style="display:inline;">'+
            '<button type="button" class="btn btn-secondary" btn="primary" onclick="login();" style="background-color:#4cd964;color: #fff9ec;" >X </button>'+
            '</div>'+
            '</div>'
        )

        user_names.push($("#user-name").val());
        user_ids.push($("#user-id").val());
        user_cards.push($("#user-id").val());
        user_attribute1.push(attribute[0]);
        user_attribute2.push(attribute[1]);

        $('#add_user').modal('hide');
    })
</script>

<script>
    $("#btn1").on("click", function() {
        var user_num=$(".user-num");
        if(user_num.length>0){
            addsvg();
            //首先定义passenger_info的数组拿来存放每一个人选择位置的信息
            var passenger_info = new Array();
            var user_name="";
            var json1=new Array();


            if($(".user-num").length==1){

                var jsonObj = {};
                jsonObj["Id"]=user_ids[0];
                jsonObj["type_one"]=user_attribute1[0];
                jsonObj["type_second"]=user_attribute2[0];

                passenger_info.push(jsonObj);

                //新建一个json数组并存进航班号和有多少个人和每一个人的选座信息
                //这里位置顺序不能弄乱因为在后台是按照顺序读取的

                var j={};
                j["passenger_flight_number"]="<c:out value="${flightmodel.name}"/>";//航班号
                j["passenger_num"]=$(".user-num").length;//人数
                j["passenger_info"]=passenger_info;//个人座位需求信息
                json1.push(j);

            }else {
                for(let i=0;i<$(".user-num").length;i++){
                    var jsonObj = {};
                    jsonObj["Id"]=user_ids[i];
                    jsonObj["type_one"]=user_attribute1[i];
                    jsonObj["type_second"]=user_attribute2[i];
                    passenger_info.push(jsonObj);
                }

                //新建一个json数组并存进航班号和有多少个人和每一个人的选座信息
                //这里位置顺序不能弄乱因为在后台是按照顺序读取的
                var json1=new Array();
                var j={};
                j["passenger_flight_number"]="<c:out value="${flightmodel.name}"/>";//航班号
                j["passenger_num"]=$(".user-num").length;//人数
                j["passenger_info"]=passenger_info;//个人座位需求信息
                json1.push(j);
            }

            //使用ajax用post的方式传到后台进行处理，为每一个人分配位置
            $.ajax({
                type:"POST", //请求方式
                url:"./buy_ticket_operation", //请求路径
                cache: false,
                data:{//传参_传递刚才创建的json1数组
                    "jsonArr":json1,
                },
                dataType: 'text',   //设置返回值类型
                success:function(e){

                    document.getElementById("user-seat").value=e;
                    <%--document.getElementById("formflight").action="user_info_<c:out value="${flight_number}" />.jsp";--%>
                    document.getElementById("formflight").submit();
                    // console.log(e);
                }
            });//ajax——的结束
        }
    });

</script>


<script>
    function  addsvg() {
        $("#mysvg").append(
            '<svg id="mainSVG" viewBox="0 0 800 600">'+
            '<defs>'+
            '<circle id="dot" cx="0" cy="0" r="5" fill="#fff" />'+
            '</defs>'+
            '<circle id="mainCircle" fill="none" stroke="none" stroke-width="2" stroke-miterlimit="10" cx="400" cy="300" r="70" />'+
            '<circle id="circlePath" fill="none" stroke="none" stroke-width="2" stroke-miterlimit="10" cx="400" cy="300" r="80" />'+
            '<g id="mainContainer">'+
            '<path id="plane" fill="#FFF" d="M38.1,19.6c0.2-0.2,0.3-0.5,0.3-0.7s-0.1-0.6-0.3-0.7c-1.2-1-2.8-1.6-4.4-1.6l-8.7,0L12.2,0L8.2,0l6.3,16.5	l-5.9,0c-0.5,0-1.1,0.1-1.6,0.4L3.1,11L0,11l3.1,7.9L0,26.7l3.1,0l3.9-5.9c0.5,0.3,1,0.4,1.6,0.4l5.9,0L8.2,37.7h3.9l13-16.5l8.7,0	C35.4,21.2,36.9,20.6,38.1,19.6"'+
            '/>'+
            '</g>'+
            '</svg>'
        )

        var script = document.createElement("script");
        script.id="mainsvgsrc1";
        script.src = "js/TweenMax.min.js";
        document.body.appendChild(script);
        var script = document.createElement("script");
        script.id="mainsvgsrc2";
        script.src = "js/MorphSVGPlugin.min.js";
        document.body.appendChild(script);
        var script = document.createElement("script");
        script.id="mainsvgsrc3";
        script.src = "jquery/jquery.min.js";
        document.body.appendChild(script);
        var script = document.createElement("script");
        script.id="mainsvgsrc4";
        script.src = "js/mysvg.js";
        document.body.appendChild(script);
    }
    function clearsvg() {

        var my=document.getElementById("mainsvgsrc1");
        my.parentNode.removeChild(my);
        var my=document.getElementById("mainsvgsrc2");
        my.parentNode.removeChild(my);
        var my=document.getElementById("mainsvgsrc3");
        my.parentNode.removeChild(my);
        var my=document.getElementById("mainsvgsrc4");
        my.parentNode.removeChild(my);
        var my=document.getElementById("mainSVG");
        my.parentNode.removeChild(my);
    }
</script>
<script type="text/javascript">
    window.onload=function () {
        var $step = $("#step");
        var $index = $("#index");

        $step.step({
            index: 1,
            time: 50,
            title: ["选择航班", "选择座位", "查看座位"]
        });

        $index.text($step.getIndex());


    }

</script>

<script type="text/javascript">
    //时间控件
    $(function () {
        $('.lot-time').datetimepicker({
            format: "yyyy-mm-dd",
            language:  'zh-CN',
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0,
            pickerPosition:'right'
        });
    })
</script>


<script>
    var flight_number="<c:out value="${flightmodel.getName()}"/>";
    var sellSeat=new Array();
    var sellk=0;
    <c:forEach items="${seatlist}" var="seat">
    sellSeat[sellk++]="${seat}";
    </c:forEach>




    var delete_seat="<c:out value="${flightmodel.getDelete_seat()}"/>";
    var dseat=delete_seat.split(",");
    var x=parseInt(<c:out value="${flightmodel.getRow()}"/>);
    var y=parseInt(<c:out value="${flightmodel.getCol()}"/>);
    var count=0;
    var str="";
    var sr="<c:out value="${flightmodel.getRow_aisle()}"/>";
    var start_aisle_row=sr.split(",");
    var strat_number=<c:out value="${flightmodel.getStart_number()}"/>
    var sc="<c:out value="${flightmodel.getSeat()}"/>";
    var start_aisle_col=sc.split(",");
    var col_aisle_count=0;
    var col_aisle_list=new Array();
    var jiange_list=new Array();
    var jgk=0;
    for(let i=0;i<start_aisle_col.length-1;i++){
        for(let j=0;j<start_aisle_col[i].length;j++){
            col_aisle_list[col_aisle_count++]=start_aisle_col[i].charAt(j)+"";
        }
        jiange_list[jgk++]=col_aisle_count-1;
    }

    for(let i=0;i<=x;i++){

        var judge_row=0;
        for(let z=0;z<start_aisle_row.length;z++){
            if(parseInt(start_aisle_row[z])==(parseInt(strat_number)+count))
            {
                judge_row=1;
                break;
            }
        }


        if(i==0){
            str+="<tr><td class=\"seat-col\"></td>";
            for(let j=0;j<y;j++){
                var judge_col=0;
                for(let z=0;z<jgk-1;z++){
                    if(parseInt(jiange_list[z])==j)
                    {
                        judge_col=1;
                        break;
                    }
                }

                str+="<td>"+col_aisle_list[j].toUpperCase()+"</td>";
                if(judge_col!=0){
                    str+="<td></td>"
                }
            }
            str+="<td class=\"seat-col\"></td></tr>";
        }else {
            str+="<tr><td class=\"seat-col\">"+(parseInt(strat_number)+count)+"</td>";
            for(let j=0;j<y;j++){
                var judge_col=0;
                for(let z=0;z<jgk-1;z++){
                    if(parseInt(jiange_list[z])==j)
                    {
                        judge_col=1;
                        break;
                    }
                }


                var dseatjudeg=0;
                for(let i=0;i<dseat.length-1;i++){
                    if((parseInt(strat_number)+count)+col_aisle_list[j].toUpperCase()==dseat[i]){
                        dseatjudeg=1;
                        break;
                    }
                }
                if(dseatjudeg==0){
                    str+="<td style='position: relative'><span class=\"tt \"><svg class=\"icon svg\" style=\"width: 1em; height: 1em;vertical-align: middle;fill: currentColor;overflow: hidden;\"                      viewBox=\"0 0 1024 1024\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" p-id=\"1056\">                     " +
                        "<path class='seatId "+((parseInt(strat_number)+count)+col_aisle_list[j].toUpperCase())+" colorss' d=\"M192 394.752V202.752c0-35.328 28.672-64 64-64h512c35.328 0 64 28.672 64 64                     v192h42.496c35.328 0 64 28.672 64 64v363.008c0 35.328-28.672 64-64 64H149.504c-35.328 0-64-28.672-64-64                     V458.752c0-35.328 28.672-64 63.488-64h43.008z\" fill=\"#fff\" p-id=\"1057\"></path>                     <path d=\"M192 394.752V202.752c0-35.328 28.672-64 64-64h512c35.328 0 64 28.672 64 64                     v192h42.496c35.328 0 64 28.672 64 64v363.008c0 35.328-28.672 64-64 64                     H149.504c-35.328 0-64-28.672-64-64V458.752c0-35.328 28.672-64 63.488-64                     h43.008z m597.504 0V202.752c0-11.776-9.216-21.504-20.992-21.504                     H256c-11.776 0-20.992 9.728-20.992 21.504v192c35.328 0 64 28.672 64 64v                     170.496c0 11.776 9.728 21.504 20.992 21.504h384.512c11.776 0 20.992-9.728 20.992-21.504                     V458.752c-0.512-35.328 28.16-64 64-64-0.512 0-0.512 0 0 0zM128 458.752v363.008c0 11.776 9.728 20.992 21.504                      20.992h724.992c11.776 0 21.504-9.728 21.504-20.992V458.752c0-11.776-9.728-20.992-21.504-20.992h-85.504                     c-11.776 0-21.504 9.728-21.504 21.504V629.76c0 35.328-28.672 64-64 64H320c-35.328 0-64-28.672-64-64V                     458.752c0-11.776-9.728-21.504-21.504-21.504H149.504c-11.776 0-21.504 9.216-21.504 21.504 0-0.512 0 0 0 0z\" p-id=\"1058\">                 </path></svg></span>\n";
                    str+="<div style='position: absolute;width: 100%;height: 100%;z-index: 10;transform: translateY(-100%);' " +
                        "class='seat-id' id='"+((parseInt(strat_number)+count)+col_aisle_list[j].toUpperCase())+"'></div></td>";

                }else {
                    str+="<td style='position: relative'></td>";
                }

                if(judge_col!=0){
                    str+="<td></td>"
                }
            }
            str+="<td class=\"seat-col\">"+((parseInt(strat_number)+count))+"</td></tr>";
            count++;
        }
        if(judge_row!=0){
            str+="<tr><td></td></tr>";
        }
    }

    $("#flight-table").append(
        //style="height:'+w+';width:'+h+';"
        '<table border="0px" class="table-flight" >'+str+
        '</table>'
    )

    for(var i=0;i<sellk;i++){
        document.getElementsByClassName(sellSeat[i])[0].style.fill="#56a1ff";
    }
</script>
</html>
