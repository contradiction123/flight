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
            width: 980px;
            padding-left:0;
            position: relative;
            margin: 10px auto;
        }
        .main{
            position: relative;
            float: left;
            width: 700px;
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
            padding-top: 88px;
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
        .button{
            height: 66px;
            font-size: 35px;
            border-radius: 15px;
            font-family: cursive;
            margin-top: 10px;
        }
        .hoverBig:hover{
            transform: scale(1.2);
        }
        .table-flight{
            transform-origin:0 0;
            font-size: 22px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: rotate(-90deg) translateX(-100%) translate(-50%,-50%);
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
                <li><a href="<c:url value="/userFormation"/>?name=<c:out value="${msg.user_name}" />"><i class="fa fa-bar-chart-o"></i>个人信息</a></li>
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
            <div class="col-lg-10">
                <div class="sidebar">
                    <div class="sidebar-cont">
                        <div>
                            <div class="flight-info" style="border-bottom: none;padding-bottom: 0">
                                <div class="flight-city">
                                    <div class="flt-date">
                                        05-27
                                        <span class="week">周二</span>
                                        <div class="flt-depart">上海</div>
                                        <div class="flt-depart">--&gt;</div>
                                        <div class="flt-depart">上海</div>
                                    </div>
                                </div>
                                <div class="flight-tit">
                                    <div class="plane-type">
                                        <%= request.getParameter("flight")%>
                                    </div>
                                    <input type="hidden" id="seatlist" value="<%= request.getParameter("seat")%>">
                                    <div class="plane-type">
                                        经济舱
                                    </div>
                                </div>
                                <div class="flight-detail">
                                    <div class="flt-arrow" id="u-s-n">
                                        您的座位:
                                    </div>
                                </div>
                                <div class="">
                                    <span style="position:absolute;left:300px;top:10px;"><svg class="icon tu" style="width: 1em; height: 1em;vertical-align: middle;fill: currentColor;overflow: hidden;" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2738"><path d="M326.637 955.266c0-2.658-2.896-3.678-6.446-2.258-5.19 2.074-6.392-1.566-6.173-18.609l0.273-21.197 64.224-57.977 64.205-57.979v-95.779c0-61.619-1.548-95.78-4.334-95.78-2.403 0-72.709 23.235-156.234 51.642-83.543 28.37-154.14 51.604-156.89 51.604-3.387 0-4.989-11.981-4.989-37.473v-37.475l161.223-131.27L442.72 371.427V245.966c0-140.428 1.056-146.71 28.151-168.288 13.475-10.744 20.267-12.874 41.079-12.874 27.933 0 42.173 8.122 58.707 33.487 9.468 14.531 9.65 17.462 9.65 143.706v128.884l161.224 131.415 161.26 131.434v37.583c0 24.984-1.676 37.619-4.88 37.619-2.66 0-74.221-23.597-159.003-52.477-84.781-28.844-154.996-51.569-156.016-50.477s-0.801 45.596 0.547 98.949l2.439 96.981 61.547 55.647 61.584 55.645 0.146 21.197c0.109 17.043-1.13 20.684-6.302 18.609-3.567-1.42-6.481-0.547-6.481 1.894 0 2.476-39.077-7.393-86.857-21.961-47.78-14.566-92.01-26.439-98.293-26.439-8.686 0-146.546 39.695-179.213 51.641-2.95 1.057-5.372-0.217-5.372-2.875z" fill="#006FC2" p-id="2739"></path></svg></span>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>

        <div class="row col-lg-10" style="padding-left: 20%;">
            <div id="flight-table"></div>
        </div><!-- /.row -->


    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<i id="mysvg"></i>


</body>
<script>
    var u_seat=document.getElementById("seatlist").value.split("TtT");
    // console.log(u_seat[0]);
    // console.log(u_seat[1]);
    var u_seat1=u_seat[0].split("zZz");
    var u_seat2=u_seat[1].split("zZz");
    // console.log(u_seat1);
    // console.log(u_seat2);

    for(let i=1;i<u_seat1.length-1;i++){
        $("#u-s-n").append(
            '<span class="user-seat" style="margin-left:6px">'+u_seat1[i]+'</span>'
        );
        // document.getElementsByClassName(u_seat[i])[0].style.fill="blue";
    }

    // function back() {
    //     window.history.back(-1);
    // }

</script>

<script>
    var flight_number=u_seat2[0];

    var delete_seat=u_seat2[6];
    var dseat=delete_seat.split(",");

    var x=parseInt(u_seat2[2]);
    var y=parseInt(u_seat2[3]);
    var count=0;
    var str="";
    var sr=u_seat2[5];
    var start_aisle_row=sr.split(",");
    var strat_number=parseInt(u_seat2[4]);
    var sc=u_seat2[1];
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

    for(var i=1;i<u_seat1.length-1;i++){
        document.getElementsByClassName(u_seat1[i])[0].style.fill="#56a1ff";
    }
</script>


<script>
    window.onload=function () {
        $.ajax({
            type:"GET", //请求方式
            url:"./buy_ticket_operation", //请求路径
            cache: false,
            data:{f:"<%= request.getParameter("flight")%>"},
            dataType: 'text',   //设置返回值类型
            success:function(e){
                if(e.length>3){
                    //返回的是一个字符串——31K zZz 32A zZz
                    //ZzZ是座位之间的间隔
                    // alert(e);    //弹出返回过来的座位号我的写法是以zZz分割
                    //这样进行切割得到的是 31A zZz T
                    var seat_satisfaction_list=e.split("zZz");
                    for(let i=0;i<seat_satisfaction_list.length;i++){
                        //得到每一个子 字符串，座位号
                        //有人就是灰色
                        // console.log(seat_satisfaction_list[i]);
                        var judge=0;
                        for(var j=1;j<u_seat1.length-1;j++){
                            if(seat_satisfaction_list[i]==u_seat1[j]){
                                judge=1;
                                break;
                            }
                        }
                        if(judge==0){
                            document.getElementsByClassName(seat_satisfaction_list[i])[0].style.fill="#cccccc";
                        }
                    }
                }

            }
        });//ajax——的结束
    }

</script>

</html>

