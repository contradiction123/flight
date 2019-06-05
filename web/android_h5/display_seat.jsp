<%--
  Created by IntelliJ IDEA.
  User: s8534
  Date: 2019/6/2
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>显示座位</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="../bootstrap-3.3.7-dist/css/bootstrap.min.css" />" rel="stylesheet">

    <style>
        span {
            text-align: center;
            width: 50px;
            font-size: 24px;
        }
        #page-wrapper {
            width: 100%;
            padding: 5px 15px;
        }
        #wrapper {
            padding-left: 0;
        }
        body,html{
            height: 100%;
            margin:0px;
            background: -webkit-linear-gradient(#2aabd2, #fcf8e3); /* Safari 5.1 - 6.0 */

            background: -o-linear-gradient(#2aabd2, #fcf8e3); /* Opera 11.1 - 12.0 */

            background: -moz-linear-gradient(#2aabd2, #fcf8e3); /* Firefox 3.6 - 15 */

            background: linear-gradient(#2aabd2, #fcf8e3); /* 标准的语法 */
        }
        .header{
            display: flex;
            padding-bottom: 20px;
        }
        .header>div:nth-child(1){
            width: 80%;
        }
        .header>div:nth-child(1)>span{
            margin-left: 0px;
        }
        .day,.site,.timer,.user,.id_number{
            display: flex;
        }
        .day>div,.site>div,.timer>div{
            width: 33%;
            margin-top: 5px;
        }
        .day>div:nth-child(1),.site>div:nth-child(1),.timer>div:nth-child(1){
             text-align: left;
         }
        .day>div:nth-child(2),.site>div:nth-child(2),.timer>div:nth-child(2){
             text-align: center;
         }
        .day>div:nth-child(3),.site>div:nth-child(3),.timer>div:nth-child(3){
             text-align: right;
         }
        .flight{
            border-radius: 15px;
            background: #FAFAFA;
        }
        .box{
            padding: 6px;
            position: relative;
        }
        .box>div{
            margin-top: 5px;
        }

        .order-number{
            font-size: large;
        }
        .time_site{
            background: #F3F3F3;
            border-radius: 9px;
            padding: 12px;
        }
        .strat_timer,.end_timer{
            font-size: xx-large;
        }
        .flight_number{
            line-height: 320%;
        }
        .man{
            margin-left: 20px;
            font-size: 10px;
            line-height: 200%;
        }
        .name{
            font-size: 18px;
            margin-left: 12px;
        }

        .user_seat{
            font-size: 26px;
            position: absolute;
            right: 23px;
            margin-top: -37px;
        }
        .user{
            margin-top: 21px;
            margin-bottom: 4px;
        }
        .card_header{
            display: flex;
        }
        .tu{
            transform: rotate(-90deg);
            width: 1em;
            height: 1em;
            vertical-align: middle;
            fill: currentColor;
            overflow: hidden;
            position: absolute;
            right: 15px;
            top: 7px;
        }
        .tt{
            transform: scale(0.1);
        }
        .seat_row{
            display: flex;
            justify-content: center;
        }

        .allseat{
            display: flex;
            justify-content: center;
        }
        ._row{
            font-size: 18px;
            margin-left: 8px;
        }
        .seat_number{
            font-size: 12px;
        }
        #seat_img{
            padding: 10px;
        }
        .seat_svg{
            margin-left: 8px;
        }





        #clos{
            transform: scale(2) rotate(45deg);
        }


        .search-wrapper {
            position: absolute;
            right: 4px;
            transform: scale(0.4);
            z-index: 10;
            margin-top: -17px;
        }
        .search-wrapper.active {}

        .search-wrapper .input-holder {
            overflow: hidden;
            height: 70px;
            background: rgba(255,255,255,0);
            border-radius:6px;
            position: relative;
            width:70px;
            -webkit-transition: all 0.3s ease-in-out;
            -moz-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out;
        }
        .search-wrapper.active .input-holder {
            border-radius: 50px;
            width:450px;
            background: rgba(0,0,0,0.5);
            -webkit-transition: all .5s cubic-bezier(0.000, 0.105, 0.035, 1.570);
            -moz-transition: all .5s cubic-bezier(0.000, 0.105, 0.035, 1.570);
            transition: all .5s cubic-bezier(0.000, 0.105, 0.035, 1.570);
        }

        .search-wrapper .input-holder .search-input {
            width:100%;
            height: 50px;
            padding:0px 70px 0 20px;
            opacity: 0;
            position: absolute;
            top:0px;
            left:0px;
            background: transparent;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            border:none;
            outline:none;
            font-family:"Open Sans", Arial, Verdana;
            font-size: 16px;
            font-weight: 400;
            line-height: 20px;
            color:#FFF;
            -webkit-transform: translate(0, 60px);
            -moz-transform: translate(0, 60px);
            transform: translate(0, 60px);
            -webkit-transition: all .3s cubic-bezier(0.000, 0.105, 0.035, 1.570);
            -moz-transition: all .3s cubic-bezier(0.000, 0.105, 0.035, 1.570);
            transition: all .3s cubic-bezier(0.000, 0.105, 0.035, 1.570);

            -webkit-transition-delay: 0.3s;
            -moz-transition-delay: 0.3s;
            transition-delay: 0.3s;
        }
        .search-wrapper.active .input-holder .search-input {
            opacity: 1;
            -webkit-transform: translate(0, 10px);
            -moz-transform: translate(0, 10px);
            transform: translate(0, 10px);
        }

        .search-wrapper .input-holder .search-icon {
            width:70px;
            height:70px;
            border:none;
            border-radius:6px;
            background: #37B0D3;
            padding:0px;
            outline:none;
            position: relative;
            z-index: 2;
            float:right;
            cursor: pointer;
            -webkit-transition: all 0.3s ease-in-out;
            -moz-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out;
        }
        .search-wrapper.active .input-holder .search-icon {
            width: 50px;
            height:50px;
            margin: 10px;
            border-radius: 30px;
        }
        .search-wrapper .input-holder .search-icon span {
            width:22px;
            height:22px;
            display: inline-block;
            vertical-align: middle;
            position:relative;
            -webkit-transform: rotate(45deg);
            -moz-transform: rotate(45deg);
            transform: rotate(45deg);
            -webkit-transition: all .4s cubic-bezier(0.650, -0.600, 0.240, 1.650);
            -moz-transition: all .4s cubic-bezier(0.650, -0.600, 0.240, 1.650);
            transition: all .4s cubic-bezier(0.650, -0.600, 0.240, 1.650);

        }
        .search-wrapper.active .input-holder .search-icon span {
            -webkit-transform: rotate(-45deg);
            -moz-transform: rotate(-45deg);
            transform: rotate(-45deg);
        }
        .search-wrapper .input-holder .search-icon span::before, .search-wrapper .input-holder .search-icon span::after {
            position: absolute;
            content:'';
        }
        .search-wrapper .input-holder .search-icon span::before {
            width: 4px;
            height: 27px;
            left: 11px;
            top: 9px;
            border-radius: 2px;
            background: #974BE0;
        }
        .search-wrapper .input-holder .search-icon span::after {
            width: 27px;
            height: 27px;
            left: -1px;
            top: -12px;
            border-radius: 16px;
            border: 4px solid #974BE0;

        }

        .search-wrapper .close {
            position: absolute;
            z-index: 1;
            top:24px;
            right:20px;
            width:25px;
            height:25px;
            cursor: pointer;
            -webkit-transform: rotate(-180deg);
            -moz-transform: rotate(-180deg);
            transform: rotate(-180deg);
            -webkit-transition: all .3s cubic-bezier(0.285, -0.450, 0.935, 0.110);
            -moz-transition: all .3s cubic-bezier(0.285, -0.450, 0.935, 0.110);
            transition: all .3s cubic-bezier(0.285, -0.450, 0.935, 0.110);
            -webkit-transition-delay: 0.2s;
            -moz-transition-delay: 0.2s;
            transition-delay: 0.2s;
        }
        .search-wrapper.active .close {
            right:-50px;
            -webkit-transform: rotate(45deg);
            -moz-transform: rotate(45deg);
            transform: rotate(45deg);
            -webkit-transition: all .6s cubic-bezier(0.000, 0.105, 0.035, 1.570);
            -moz-transition: all .6s cubic-bezier(0.000, 0.105, 0.035, 1.570);
            transition: all .6s cubic-bezier(0.000, 0.105, 0.035, 1.570);
            -webkit-transition-delay: 0.5s;
            -moz-transition-delay: 0.5s;
            transition-delay: 0.5s;
        }
        .search-wrapper .close::before, .search-wrapper .close::after {
            position:absolute;
            content:'';
            background: #FFF;
            border-radius: 2px;
        }
        .search-wrapper .close::before {
            width: 5px;
            height: 25px;
            left: 10px;
            top: 0px;
        }
        .search-wrapper .close::after {
            width: 25px;
            height: 5px;
            left: 0px;
            top: 10px;
        }
        .search-wrapper .result-container {
            width: 100%;
            position: absolute;
            top:80px;
            left:0px;
            text-align: center;
            font-family: "Open Sans", Arial, Verdana;
            font-size: 14px;
            display:none;
            color:#B7B7B7;
        }


        @media screen and (max-width: 560px) {
            .search-wrapper.active .input-holder {width:400px;}
        }
        #text{
            font-size: 28px;
            color: #fff;
        }
        .search-wrapper.active{
            right:-84px;
        }
    </style>
</head>

<body>

<section class="container">
    <form onsubmit="submitFn(this, event);" method="post" action="../android/display_seat" id="search-form">
        <div class="search-wrapper">
            <div class="input-holder">
                <input type="text" id="text" class="search-input" placeholder="Type to search"  name="name"/>
                <button class="search-icon" onclick="searchToggle(this, event);"><span class="glyphicon glyphicon-search"></span></button>
            </div>
            <span  id="clos" class="close" onclick="searchToggle(this, event);"></span>
            <div class="result-container" style="display: none"></div>
        </div>
    </form>
</section>

<input type="hidden" id="flight_get" value="
<c:if test="${list==null}">
    <%= request.getParameter("flight_number")%>
</c:if>
<c:if test="${!(list==null)}">
    <c:out value="${list.get(4)}"/>
</c:if>"/>

<input type="hidden" id="name_get" value="
<c:if test="${list==null}">
   <%= request.getParameter("name")%>
</c:if>
<c:if test="${!(list==null)}">
    <c:out value="${list.get(1)}"/>
</c:if>"/>


<input type="hidden" id="seat_get" value="
<c:if test="${list==null}">
   <%= request.getParameter("seat")%>
</c:if>
<c:if test="${!(list==null)}">
    <c:out value="${list.get(2)}"/>
</c:if>"/>

<input type="hidden" id="seat_list" value="
<c:if test="${list==null}">
   <%= request.getParameter("seatlist")%>
</c:if>
<c:if test="${!(list==null)}">
    <c:out value="${list.get(3)}"/>
</c:if>"/>


<div id="wrapper">

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12 header">
                <div><a href="javascript:history.go(-1)"><span class="glyphicon glyphicon-menu-left" style="font-size: 18px;"></span></a></div>
                <div></div>
            </div>

            <div class="col-sm-6 col-md-4 alluser">
                <div class="thumbnail flight">

                    <div class="functionuser col-sm-3">
                        <div class="button add">订单</div>
                    </div>

                </div>
            </div>

            <div id="user_box">

            </div>


            <div class="col-sm-6 col-md-4 alluser">
                <div class="thumbnail flight">
                    <div class="functionuser col-sm-3">
                        <div class="button add">座位</div>
                    </div>
                    <div id="seat_img">

                    </div>

                </div>
            </div>


        </div><!-- /.row -->

    </div><!-- /#page-wrapper -->
</div><!-- /#wrapper -->

<!-- JavaScript -->
<script src="<c:url value="../jquery/jquery.min.js" />"></script>
<script src="<c:url value="../bootstrap-3.3.7-dist/js/bootstrap.min.js" />"></script>
</body>

    <script>
        function bodyhe() {
            var ar=$(".alluser");

            var h=ar[ar.length-1].offsetHeight+ar[ar.length-1].offsetTop;

            var bodyh=$("body").height();

            if(h>bodyh)$("body").height(h+30);
        }
        var name=document.getElementById("name_get").value.toString().trim();
        var seat=document.getElementById("seat_get").value.toString().trim();
        var flight=document.getElementById("flight_get").value.toString().trim();
        var seat_list=document.getElementById("seat_list").value.toString().trim();

        var jiange=new Array(5);
        var jgk=0;

        // console.log(name);

        var namelist=name.split(",");
        var seatlist=seat.split(",");
        var seatrow=new Array(seatlist.length);
        var seatcol=new Array(seatlist.length);

        for(let i=0;i<namelist.length-1;i++){
            adduserorder(i);
            seatrow[i]=seatlist[i].substring(0,2);
            seatcol[i]=seatlist[i].substring(2,3);

        }

        var nolikecount=0;
        var nolikelist=new Array(namelist.length);

        var templist=seatrow;
        seatrow=seatrow.sort();
        for(let i=0;i<seatlist.length-1;i++){
            var judge=0;
            for(let j=i+1;j<seatlist.length-1;j++){
                if(seatrow[i]==seatrow[j]){
                    judge=1;
                    break;
                }
            }
            if(judge==0){
                nolikelist[nolikecount++]=seatrow[i];
            }
        }

        seat_list=seat_list.toString().trim();
        var seatenglish=seat_list.split(",");
        var selist=seatenglish.length-1;

        var stcount=0;
        for(let i=0;i<selist;i++){
            for(let j=0;j<seatenglish[i].length;j++){
                stcount++;
            }
        }

        var slist=new Array(stcount);
        var slistk=0;

        for(let i=0;i<selist;i++){
            for(let j=0;j<seatenglish[i].length;j++){
                slist[slistk++]=seatenglish[i].charAt(j)+"";
            }
            if(jgk==0){
                jiange[jgk++]=seatenglish[i].length;
            }else {
                jiange[jgk]=seatenglish[i].length+jiange[jgk-1];
                jgk++;
            }
        }



        for(let i=0;i<nolikecount;i++){
            if(i==0)adduserrow();
            adduserseatsvg(nolikelist[i]);
        }

        for(let i=0;i<seatlist.length-1;i++){
            document.getElementsByClassName(seatlist[i])[0].style.fill="#6DC4D8";

        }
        bodyhe();
        function adduserseatsvg(flight_num) {

            var str="";
            for(let i=0;i<stcount;i++){
                var jiangejudeg=0;
                for(var j=0;j<jgk;j++){
                    if(i==jiange[j]){
                        jiangejudeg=1;
                        break;
                    }
                }
                var spans="";
                if(stcount>6){spans="style=\"font-size:15px\""};
                if(jiangejudeg==1){
                    str+='<div class="seat_svg" style="margin-left: 30px">'+
                        '<span class="tt" '+spans+'>'+
                        '<svg class="icon svg" style="width: 1em; height: 1em;vertical-align: middle;fill: currentColor;overflow: hidden;" viewBox="0 0 1024 1024" version="1.1"  p-id="1056">'+
                        '<path class="seatId '+flight_num+(slist[i].toUpperCase())+' colorss" d="M192 394.752V202.752c0-35.328 28.672-64 64-64h512c35.328 0 64 28.672 64 64'+
                        'v192h42.496c35.328 0 64 28.672 64 64v363.008c0 35.328-28.672 64-64 64H149.504c-35.328 0-64-28.672-64-64'+
                        'V458.752c0-35.328 28.672-64 63.488-64h43.008z" fill="#fff" p-id="1057">'+
                        '</path>'+
                        '<path d="M192 394.752V202.752c0-35.328 28.672-64 64-64h512c35.328 0 64 28.672 64 64'+
                        'v192h42.496c35.328 0 64 28.672 64 64v363.008c0 35.328-28.672 64-64 64'+
                        'H149.504c-35.328 0-64-28.672-64-64V458.752c0-35.328 28.672-64 63.488-64'+
                        'h43.008z m597.504 0V202.752c0-11.776-9.216-21.504-20.992-21.504'+
                        'H256c-11.776 0-20.992 9.728-20.992 21.504v192c35.328 0 64 28.672 64 64v'+
                        '170.496c0 11.776 9.728 21.504 20.992 21.504h384.512c11.776 0 20.992-9.728 20.992-21.504'+
                        'V458.752c-0.512-35.328 28.16-64 64-64-0.512 0-0.512 0 0 0zM128 458.752v363.008c0 11.776 9.728 20.992 21.504'+
                        '20.992h724.992c11.776 0 21.504-9.728 21.504-20.992V458.752c0-11.776-9.728-20.992-21.504-20.992h-85.504'+
                        'c-11.776 0-21.504 9.728-21.504 21.504V629.76c0 35.328-28.672 64-64 64H320c-35.328 0-64-28.672-64-64V'+
                        '458.752c0-11.776-9.728-21.504-21.504-21.504H149.504c-11.776 0-21.504 9.216-21.504 21.504 0-0.512 0 0 0 0z" p-id="1058">'+
                        '</path>'+
                        '</svg>'+
                        '</span>'+
                        '</div>'
                }else {
                    str+='<div class="seat_svg">'+
                        '<span class="tt " '+spans+'>'+
                        '<svg class="icon svg" style="width: 1em; height: 1em;vertical-align: middle;fill: currentColor;overflow: hidden;" viewBox="0 0 1024 1024" version="1.1"  p-id="1056">'+
                        '<path class="seatId '+flight_num+(slist[i].toUpperCase())+' colorss" d="M192 394.752V202.752c0-35.328 28.672-64 64-64h512c35.328 0 64 28.672 64 64'+
                        'v192h42.496c35.328 0 64 28.672 64 64v363.008c0 35.328-28.672 64-64 64H149.504c-35.328 0-64-28.672-64-64'+
                        'V458.752c0-35.328 28.672-64 63.488-64h43.008z" fill="#fff" p-id="1057">'+
                        '</path>'+
                        '<path d="M192 394.752V202.752c0-35.328 28.672-64 64-64h512c35.328 0 64 28.672 64 64'+
                        'v192h42.496c35.328 0 64 28.672 64 64v363.008c0 35.328-28.672 64-64 64'+
                        'H149.504c-35.328 0-64-28.672-64-64V458.752c0-35.328 28.672-64 63.488-64'+
                        'h43.008z m597.504 0V202.752c0-11.776-9.216-21.504-20.992-21.504'+
                        'H256c-11.776 0-20.992 9.728-20.992 21.504v192c35.328 0 64 28.672 64 64v'+
                        '170.496c0 11.776 9.728 21.504 20.992 21.504h384.512c11.776 0 20.992-9.728 20.992-21.504'+
                        'V458.752c-0.512-35.328 28.16-64 64-64-0.512 0-0.512 0 0 0zM128 458.752v363.008c0 11.776 9.728 20.992 21.504'+
                        '20.992h724.992c11.776 0 21.504-9.728 21.504-20.992V458.752c0-11.776-9.728-20.992-21.504-20.992h-85.504'+
                        'c-11.776 0-21.504 9.728-21.504 21.504V629.76c0 35.328-28.672 64-64 64H320c-35.328 0-64-28.672-64-64V'+
                        '458.752c0-11.776-9.728-21.504-21.504-21.504H149.504c-11.776 0-21.504 9.216-21.504 21.504 0-0.512 0 0 0 0z" p-id="1058">'+
                        '</path>'+
                        '</svg>'+
                        '</span>'+
                        '</div>'
                }
            }
            spans="style=\"font-size:18px\"";
            $("#seat_img").append(
                '<div class="allseat">'+
                '<div class="seat_number"'+spans+'>'+flight_num+'</div>'+str+
                '</div>'
            );
        }

        function adduserrow() {

            var str="";
            for(let i=0;i<slist.length;i++){
                var jiangejudeg=0;
                for(var j=0;j<jgk;j++){
                    if(i==jiange[j]){
                       jiangejudeg=1;
                       break;
                    }
                }
                if(jiangejudeg==1){
                    str+='<div class="_row" style="margin-left: 40px">'+slist[i]+'</div>'
                }else {
                    str+='<div class="_row">'+slist[i]+'</div>'
                }
            }

            $("#seat_img").append(
                '<div class="seat_row">'+
                '<div class="seat_number">&nbsp;</div>'+str+
                '</div>'
            );
        }

        function adduserorder(i) {
            $("#user_box").append(
                '<div class="col-sm-6 col-md-4 alluser">'+
                '<div class="thumbnail flight">'+
                '<div class="box">'+
                '<div class="card_header">'+
                '<div class="order-number">订单号:132465879</div>'+
                '<div class="flight_svg">'+
                '<span><svg class="icon tu"  viewBox="0 0 1024 1024" version="1.1" p-id="2738"><path d="M326.637 955.266c0-2.658-2.896-3.678-6.446-2.258-5.19 2.074-6.392-1.566-6.173-18.609l0.273-21.197 64.224-57.977 64.205-57.979v-95.779c0-61.619-1.548-95.78-4.334-95.78-2.403 0-72.709 23.235-156.234 51.642-83.543 28.37-154.14 51.604-156.89 51.604-3.387 0-4.989-11.981-4.989-37.473v-37.475l161.223-131.27L442.72 371.427V245.966c0-140.428 1.056-146.71 28.151-168.288 13.475-10.744 20.267-12.874 41.079-12.874 27.933 0 42.173 8.122 58.707 33.487 9.468 14.531 9.65 17.462 9.65 143.706v128.884l161.224 131.415 161.26 131.434v37.583c0 24.984-1.676 37.619-4.88 37.619-2.66 0-74.221-23.597-159.003-52.477-84.781-28.844-154.996-51.569-156.016-50.477s-0.801 45.596 0.547 98.949l2.439 96.981 61.547 55.647 61.584 55.645 0.146 21.197c0.109 17.043-1.13 20.684-6.302 18.609-3.567-1.42-6.481-0.547-6.481 1.894 0 2.476-39.077-7.393-86.857-21.961-47.78-14.566-92.01-26.439-98.293-26.439-8.686 0-146.546 39.695-179.213 51.641-2.95 1.057-5.372-0.217-5.372-2.875z" fill="#006FC2" p-id="2739"></path></svg></span>'+
                '</div>'+
                '</div>'+
                '<div class="time_site">'+
                '<div class="day">'+
                '<div class="srtat_day">6月3日&nbsp;明天</div>'+
                '<div></div>'+
                '<div class="end_day">6月3日&nbsp;明天</div>'+
                '</div>'+
                '<div class="timer">'+
                '<div class="strat_timer">12:50</div>'+
                '<div class="flight_number">'+flight+'</div>'+
                '<div class="end_timer">18.00</div>'+
                '</div>'+
                '<div class="site">'+
                '<div class="strat_site">广元站</div>'+
                '<div class="duration">5时10分</div>'+
                '<div class="end_site">南京站</div>'+
                '</div>'+
                '</div>'+
                '<div class="user_inforrmation">'+
                '<div class="user">'+
                '<div class="name">'+namelist[i]+'</div>'+
                '<div class="man">成人票</div>'+
                '</div>'+
                '<div class="id_number">'+
                '<div class="user_seat">经济舱<i class="seat">'+seatlist[i]+'</i></div>'+
                '</div>'+
                '</div>'+
                '</div>'+
                '</div>'+
                '</div>'
            );

        }


    </script>
<script type="text/javascript">
    function searchToggle(obj, evt){
        var container = $(obj).closest('.search-wrapper');

        if(!container.hasClass('active')){
            container.addClass('active');
            evt.preventDefault();
        }
        else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
            container.removeClass('active');
            // clear input
            container.find('.search-input').val('');
            // clear and hide result container when we press close\
            container.find('.result-container').fadeOut(100, function(){$(this).empty();});
        }
    }

    function submitFn(obj, evt){
        value = $(obj).find('.search-input').val().trim();

        _html = "";
        if(!value.length){
            _html = "";
        }
        else{
            _html += "<b>" + value + "</b>";
            $("#search-form").submit();
        }

        $(obj).find('.result-container').html('<span>' + _html + '</span>');
        $(obj).find('.result-container').fadeIn(100);

        evt.preventDefault();
    }
</script>


</html>
