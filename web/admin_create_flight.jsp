<%--
  Created by IntelliJ IDEA.
  User: s8534
  Date: 2019/6/7
  Time: 7:58
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
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.14.2/dist/bootstrap-table.min.css">
    <script src="https://unpkg.com/bootstrap-table@1.14.2/dist/bootstrap-table.min.js"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
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
        .page{
            padding: 5px;
            width: 40px;
            height: 40px;
            line-height: 30px;
            text-align: center;
            border: #cccccc solid 1px;
        }
        .page:hover{
            background-color: #327AB7;
            color: #ffffff;
        }
        .select1 {
            float: left;
        }

        body,
        html {
            height: 100%;
            width: 100%;

        }
        #mainSVG {
            width: 100%;
            height: 100%;
            /*display: none;*/
            z-index: 100;
            position: absolute;
            top: 0px;
            background: rgba(0,0,0,0.5);
        }


        .top-information{

            height: 30%;
            width: 100%;
            display: flex;
            justify-content: space-around;
        }
        .top-information>div{
            width: 30%;
        }
        .bottom-table{
            width: 100%;
            height: 50%;
            border-top: 1px solid;
            padding: 0px;
        }
        #page-wrapper,#wrapper,.flight_information{
            height: 100%;
        }
        .col-id,.start-aisle-col,.start-aisle-row,.start-col,.start-row{
            display: inline;
            width: 48px;
            padding: 8px;
            text-align: center;
        }
        .table-flight{
            transform-origin:0 0;
            font-size: 22px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: rotate(-90deg) translateX(-100%) translate(50%,-50%);
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
                <li><a href="<c:url value="/admin_flight" /> "><i class="fa fa-table"></i> 机型管理</a></li>
                <li><a href="<c:url value="/admin_satisfaction" /> "><i class="fa fa-edit"></i> 用户满意度</a></li>
                <li class="active"><a href="<c:url value="/admin_import" />"><i class="fa fa-font"></i> 一键导入乘客</a></li>
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
            <div class="col-lg-12" style="margin-bottom: 20px;">
                <h1>创建新的飞机</h1>
            </div>
        </div><!-- /.row -->
        <!--用户列表-->
        <div class="row flight_information">
            <div class="col-lg-8 top-information">

                <div>
                    <div class="form-group">
                        <label>飞机行列</label>
                        <input type="number" class="form-control" id="row-table" placeholder="行">
                        <input type="number" class="form-control" id="col-table" placeholder="列">
                    </div>
                    <div class="form-group">
                        <label for="flight-number">飞机型号</label>
                        <input type="text" class="form-control" id="flight-number" placeholder="型号">
                    </div>
                    <div class="form-group">
                        <label for="strat-number">飞机座位开始号数</label>
                        <input type="text" class="form-control" id="strat-number" placeholder="座位开始号数">
                    </div>
                </div>
                <div>
                    <div class="form-group">
                        <label>飞机列表</label>
                        <div id="col-id">
                            <input type="text" class="form-control col-id" placeholder="列标" maxlength="1">
                            <input type="text" class="form-control col-id" placeholder="列标" maxlength="1">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>从多少列开始过道（可以填列数，可以填列标）：</label>
                        <div id="start-aisle-col">
                            <input type="button" id="add-aisle-col" value="增加"/>
                            <div class="start-aisle-col">
                                <input type="text" class="form-control start-col" placeholder="列过道" maxlength="2">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>多少行后面是过道（只能填行号）：</label>
                        <div id="start-aisle-row">
                            <input type="button" id="add-aisle-row" value="增加" />
                            <div class="start-aisle-row">
                                <input type="text" class="form-control start-row" placeholder="行过道" oninput="value=value.replace(/[^\d]/g,'')" maxlength="2"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <button class="button btn-danger">生成模型</button>
                        <button class="button btn-danger">重置</button>
                        <button class="button btn-danger">提交</button>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 bottom-table">
                <div id="bottom-table">

                </div>
            </div>
        </div>

    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->
<i id="mysvg"></i>
<a href="#" id="hrefflight"></a>
<script src='<c:url value="/js/TweenMax.min.js"/>'></script>
<script src='<c:url value="/js/MorphSVGPlugin.min.js"/>'></script>

<!-- JavaScript -->
<script src="<c:url value="/jquery/jquery.min.js" />"></script>
<script src="<c:url value="/bootstrap-3.3.7-dist/js/bootstrap.min.js" />"></script>


<!-- Page Specific Plugins -->
<script src="<c:url value="js/raphael-min.js" />"></script>
<script src="<c:url value="js/morris-0.4.3.min.js" />"></script>
<script src="<c:url value="js/morris/chart-data-morris.js" />"></script>
<script src="<c:url value="js/tablesorter/jquery.tablesorter.js" />"></script>
<script src="<c:url value="js/tablesorter/tables.js" />"></script>
<script type="text/javascript"  src="js/ga.js"></script>
<script type="text/javascript"  src="js/shim.js"></script>
<script type="text/javascript"  src="js/xlsx.full.min.js"></script>
<script type="text/javascript"  src="js/jquery.js"></script>

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


<script>
    var delete_seat="";//删除的座位；

    $("#add-aisle-col").click(function () {
        var my=document.getElementById("foucssrc1");
        my.parentNode.removeChild(my);

        $(".start-aisle-col:eq(0)").append(
            '<input type="text" class="form-control start-col" placeholder="列过道" maxlength="2">'
        )

        var script = document.createElement("script");
        script.id="foucssrc1";
        script.src = "js/create_flight_focus.js";
        document.body.appendChild(script);
    });
    $("#add-aisle-row").click(function () {
        var my=document.getElementById("foucssrc1");
        my.parentNode.removeChild(my);

        $(".start-aisle-row:eq(0)").append(
            '<input type="text" class="form-control start-row" placeholder="行过道" oninput="value=value.replace(/[^\\d]/g,\'\')" maxlength="2"/>'
        )

        var script = document.createElement("script");
        script.id="foucssrc1";
        script.src = "js/create_flight_focus.js";
        document.body.appendChild(script);
    });

    $("button:eq(0)").click(function () {
        createTable(parseInt($("#row-table").val()),parseInt($("#col-table").val()));
    });
    $("button:eq(1)").click(function () {
        var m=document.getElementsByClassName("table-flight")[0];
        m.parentNode.removeChild(m);
        $("#row-table").val("");
        $("#col-table").val("");
        var col_id=document.getElementsByClassName("col-id");
        if(col_id.length!=0){
            for(let i=col_id.length-1;i>=0;i--){
                col_id[i].value="";
            }
        }
        $("#strat-number").val("");
        $("#flight-number").val("");
    });

    $("#col-table").keyup(function(event){
        createcol(parseInt( $("#col-table").val()));
    });

    function createcol(n) {
        var col_id=document.getElementsByClassName("col-id");
        if(col_id.length!=0){
            for(let i=col_id.length-1;i>=0;i--){
                col_id[i].parentNode.removeChild(col_id[i]);
            }
            var my=document.getElementById("foucssrc1");
            my.parentNode.removeChild(my);
        }

        for(let i=0;i<n;i++){
            $("#col-id").append(
                '<input type="text" class="form-control col-id" placeholder="列标" maxlength="1">'
            )
        }
        var script = document.createElement("script");
        script.id="foucssrc1";
        script.src = "js/create_flight_focus.js";
        document.body.appendChild(script);

    }
    //创建模型
    function createTable(x,y) {
        var my=document.getElementById("foucssrc1");
        my.parentNode.removeChild(my);
        var start_aisle_col=$(".start-col");
        var start_aisle_row=$(".start-row");
        var col_id=document.getElementsByClassName("col-id");
        var count=0;
        var str="";
        for(let i=0;i<=x;i++){

            var judge_row=0;
            for(let z=0;z<start_aisle_row.length;z++){
                // console.log(start_aisle_row[z].value+","+(parseInt($("#strat-number").val())+count));
                if(parseInt(start_aisle_row[z].value)==(parseInt($("#strat-number").val())+count))
                {
                    judge_row=1;
                    break;
                }
            }


            if(i==0){
                str+="<tr><td class=\"seat-col\"></td>";
                for(let j=0;j<y;j++){
                    var judge_col=0;
                    for(let z=0;z<start_aisle_col.length;z++){
                        if(parseInt(start_aisle_col[z].value)==j||start_aisle_col[z].value==col_id[j].value.toUpperCase()||start_aisle_col[z].value==col_id[j].value.toLowerCase())
                        {
                            judge_col=1;
                            break;
                        }
                    }

                    str+="<td>"+col_id[j].value.toUpperCase()+"</td>";
                    if(judge_col!=0){
                        str+="<td></td>"
                    }
                }
                str+="<td class=\"seat-col\"></td></tr>";
            }else {
                str+="<tr><td class=\"seat-col\">"+(parseInt($("#strat-number").val())+count)+"</td>";
                for(let j=0;j<y;j++){
                    var judge_col=0;
                    for(let z=0;z<start_aisle_col.length;z++){
                        if(parseInt(start_aisle_col[z].value)==j||start_aisle_col[z].value==col_id[j].value.toUpperCase()||start_aisle_col[z].value==col_id[j].value.toLowerCase())
                        {
                            judge_col=1;
                            break;
                        }
                    }

                    str+="<td style='position: relative'><span class=\"tt \"><svg class=\"icon svg\" style=\"width: 1em; height: 1em;vertical-align: middle;fill: currentColor;overflow: hidden;\"                      viewBox=\"0 0 1024 1024\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" p-id=\"1056\">                     " +
                        "<path class='seatId "+((parseInt($("#strat-number").val())+count)+col_id[j].value.toUpperCase())+" colorss' d=\"M192 394.752V202.752c0-35.328 28.672-64 64-64h512c35.328 0 64 28.672 64 64                     v192h42.496c35.328 0 64 28.672 64 64v363.008c0 35.328-28.672 64-64 64H149.504c-35.328 0-64-28.672-64-64                     V458.752c0-35.328 28.672-64 63.488-64h43.008z\" fill=\"#fff\" p-id=\"1057\"></path>                     <path d=\"M192 394.752V202.752c0-35.328 28.672-64 64-64h512c35.328 0 64 28.672 64 64                     v192h42.496c35.328 0 64 28.672 64 64v363.008c0 35.328-28.672 64-64 64                     H149.504c-35.328 0-64-28.672-64-64V458.752c0-35.328 28.672-64 63.488-64                     h43.008z m597.504 0V202.752c0-11.776-9.216-21.504-20.992-21.504                     H256c-11.776 0-20.992 9.728-20.992 21.504v192c35.328 0 64 28.672 64 64v                     170.496c0 11.776 9.728 21.504 20.992 21.504h384.512c11.776 0 20.992-9.728 20.992-21.504                     V458.752c-0.512-35.328 28.16-64 64-64-0.512 0-0.512 0 0 0zM128 458.752v363.008c0 11.776 9.728 20.992 21.504                      20.992h724.992c11.776 0 21.504-9.728 21.504-20.992V458.752c0-11.776-9.728-20.992-21.504-20.992h-85.504                     c-11.776 0-21.504 9.728-21.504 21.504V629.76c0 35.328-28.672 64-64 64H320c-35.328 0-64-28.672-64-64V                     458.752c0-11.776-9.728-21.504-21.504-21.504H149.504c-11.776 0-21.504 9.216-21.504 21.504 0-0.512 0 0 0 0z\" p-id=\"1058\">                 </path></svg></span>\n";
                    str+="<div style='position: absolute;width: 100%;height: 100%;z-index: 10;transform: translateY(-100%);' " +
                        "class='seat-id' id='"+((parseInt($("#strat-number").val())+count)+col_id[j].value.toUpperCase())+"'></div></td>";
                    if(judge_col!=0){
                        str+="<td></td>"
                    }
                }
                str+="<td class=\"seat-col\">"+(parseInt($("#strat-number").val())+count)+"</td></tr>";
                count++;
            }
            if(judge_row!=0){
                str+="<tr><td></td></tr>";
            }
        }

        $("#bottom-table").append(
            //style="height:'+w+';width:'+h+';"
            '<table border="0px" class="table-flight" >'+str+
            '</table>'
        )

        var script = document.createElement("script");
        script.id="foucssrc1";
        script.src = "js/create_flight_focus.js";
        document.body.appendChild(script);
    }

    //点击提交按钮
    $("button:eq(2)").click(function () {
        addsvg();
        var flight_number=$("#flight-number").val();//飞机号
        var flight_row=$("#row-table").val();//飞机行数
        var flight_col=$("#col-table").val();//飞机列数
        var flight_start_number=$("#strat-number").val();//座位开始的标号
        var flight_seatlist="";//座位列标
        for(let i=0;i<$(".col-id").length;i++){
            flight_seatlist+=document.getElementsByClassName("col-id")[i].value.toString().toUpperCase();
            var listjudge=0;
            for(let j=0;j<$(".start-col").length;j++){
                if(document.getElementsByClassName("start-col")[j].value.toString().toUpperCase()==document.getElementsByClassName("col-id")[i].value.toString().toUpperCase()||
                    parseInt(document.getElementsByClassName("start-col")[j].value)==i){
                    flight_seatlist+=",";
                }
            }
        }
        flight_seatlist+=",";

        var flight_aisle_col="";//列 过道
        for(let i=0;i<$(".start-col").length;i++){
            flight_aisle_col+=document.getElementsByClassName("start-col")[i].value+",";
        }


        var flight_aisle_row=""//行 过道
        for(let i=0;i<$(".start-row").length;i++){
            flight_aisle_row+=document.getElementsByClassName("start-row")[i].value+",";
        }

        // delete_seat 被删除的座位

        //首先定义passenger_info的数组拿来存放每一个座位的信息
        var passenger_info = new Array();
        var count=0;
        var sumcunt=0;
        for(let i=0;i<parseInt(flight_row);i++){
            for(let j=0;j<parseInt(flight_col);j++){
                var jsonObj = {};
                if(document.getElementsByClassName("svg")[sumcunt].style.visibility!="hidden"){
                    jsonObj["Id"]=count+1;
                    jsonObj["seat_id"]=document.getElementsByClassName("seat-id")[sumcunt].id;
                    jsonObj["user_id"]=null;

                    jsonObj["child"]="0";
                    if(i==0||i==1){
                        jsonObj["vip"]="1";
                    }else {
                        var vipjudge=0;
                        for (let z=0;z<$(".start-aisle-row").length;z++){
                            if((i+parseInt(flight_start_number))==(parseInt(document.getElementsByClassName("start-row")[z])+1)||
                                (i+parseInt(flight_start_number))==(parseInt(document.getElementsByClassName("start-row")[z])+2)){
                                vipjudge=1;
                                break;
                            }
                        }
                        if(vipjudge==0){
                            jsonObj["vip"]="0";
                        }else {
                            jsonObj["vip"]="1";
                        }
                    }//vip

                    if(j==0||j==parseInt(flight_col)-1){
                        jsonObj["windows"]="1";
                    }else {
                        jsonObj["windows"]="0";
                    }//windows

                    if(i==0||i==parseInt(flight_row)-1){
                        jsonObj["door"]="1";
                    }else {
                        var doorjudge=0;
                        for(let z=0;z<$(".start-row").length;z++){
                            if((i+parseInt(flight_start_number))==parseInt(document.getElementsByClassName("start-row")[z].value)+1){
                                doorjudge=1;
                                break;
                            }
                        }
                        if(doorjudge==0){
                            jsonObj["door"]="0";
                        }else {
                            jsonObj["door"]="1";
                        }
                    }//door


                    if(j==0||j==parseInt(flight_col)-1){
                        jsonObj["middle"]="0";
                        jsonObj["aisle"]="0";
                    }else {
                        var middlejudge=0;
                        for(let z=0;z<$(".start-col").length;z++){
                            if(document.getElementsByClassName("col-id")[j].value.toString().toUpperCase()==document.getElementsByClassName("start-col")[z].value.toString().toUpperCase()
                                ||j+1==parseInt(document.getElementsByClassName("start-col")[z].value)
                                ||document.getElementsByClassName("col-id")[j-1].value.toString().toUpperCase()==document.getElementsByClassName("start-col")[z].value.toString().toUpperCase()
                                ||j==parseInt(document.getElementsByClassName("start-col")[z].value)){
                                middlejudge=1;
                                break;
                            }
                        }
                        if(middlejudge==1){
                            jsonObj["middle"]="0";
                            jsonObj["aisle"]="1";
                        }else {
                            jsonObj["middle"]="1";
                            jsonObj["aisle"]="0";
                        }
                    }//middle and aisle

                    jsonObj["flight_number"]=flight_number;

                    passenger_info.push(jsonObj);

                    count++;
                }else {
                    delete_seat+=document.getElementsByClassName("seat-id")[sumcunt].id+",";
                }
                sumcunt++;
            }
        }

        var json1=new Array();
        var j={};

        j["passenger_flight_number"]=flight_number//航班机型
        j["flight_row"]=flight_row;
        j["flight_col"]=flight_col;
        j["flight_start_number"]=flight_start_number;
        j["flight_seatlist"]=flight_seatlist;
        j["flight_aisle_row"]=flight_aisle_row;
        j["delete_seat"]=delete_seat;
        j["passenger_num"]=count;//座位数量
        j["passenger_info"]=passenger_info;//座位信息
        json1.push(j);

        $.ajax({
            type:"POST", //请求方式
            url:"./createFlight", //请求路径
            cache: true,
            data:{//传参_传递刚才创建的json1数组
                "jsonArr":json1,
            },
            dataType: 'text',   //设置返回值类型
            success:function(e){
                // document.getElementsByTagName("form")[0].submit();
                document.getElementById("hrefflight").href="./display?flight="+flight_number;
                document.getElementById("hrefflight").click();
            }
        });//ajax——的结束
    })
</script>
<script id="foucssrc1"></script>
</body>
</html>
