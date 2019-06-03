<%--
  Created by IntelliJ IDEA.
  User: s8534
  Date: 2019/5/31
  Time: 19:00
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

    <title>选飞机界面</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="./bootstrap-3.3.7-dist/css/bootstrap.min.css" />" rel="stylesheet">
    <!-- Add custom CSS here -->
    <link href="<c:url value="./css/admin.css" />" rel="stylesheet">
    <!-- Page Specific CSS -->
    <link rel="stylesheet" href="<c:url value="./css/morris-0.4.3.min.css" />">
    <style>
        body,html{
            height: 100%;
            background: -webkit-linear-gradient(#2aabd2, #fcf8e3); /* Safari 5.1 - 6.0 */

            background: -o-linear-gradient(#2aabd2, #fcf8e3); /* Opera 11.1 - 12.0 */

            background: -moz-linear-gradient(#2aabd2, #fcf8e3); /* Firefox 3.6 - 15 */

            background: linear-gradient(#2aabd2, #fcf8e3); /* 标准的语法 */
        }
        span{
            text-align: center;
            width: 50px;
        }
        .flight{
            position: relative;
            padding: 0;
            border-radius: 30px;
        }
        .caption{
            border-top: 2px #5e5e5e dashed;
        }
        h3{
            margin-top: 0px;
            margin-bottom: 0px;
        }
        .flight_img{
            position: absolute;
        }
        .path_money{
            width: 90%;
            margin-left: -20px;
        }
        .path_money>div{
            text-align: center;
            margin-top: 2%;
            font-size: 2ex;
        }
        .zhezhao{
            position: absolute;
            width: 100%;
            height: 100%;
            border-radius: 30px;
            background: RGBA(0,0,0,0);
         }
        .zhezhao:hover{
            background:RGBA(0,0,0,0.1);
        }
        .select{
            margin-left: 80%;
            margin-top: 50%;
            z-index: 10;
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
        .timer{
            display: flex;
            margin-top: 10px;
            margin-left: -4px;
            text-align: center;
        }
        .timer>div{
            width: 33%;
        }
        .srart-time{
            font-size: 25px;
        }
        .long-time{
            font-size: 10px;
            line-height: 300%;
        }
        .end-time{
            font-size: 25px;
            text-align: right;
            padding-right: 18px;
        }
        .path-flight{
            display: flex;
            margin-top: 10px;
            margin-left: 0px;
            text-align: center;
        }
        .path-flight>div{
            width: 33%;
        }
        .start-site{
            font-size: 15px;
        }
        .flight{
            font-size: 15px;
        }
        .end-site{
            font-size: 15px;
        }
        .number-name{
            font-size: 10px;
        }
        .number{
            margin-top: 10px;
            background: #ccc;
            padding-left: 29px;
            border-bottom-left-radius: 30px;
            border-bottom-right-radius: 30px;
            border: 2px #ccc solid;
            line-height: 200%;
        }
        .ur{
            font-size: 26px;
            margin-top: -8px;
            text-align: right;
        }





        #clos{
            transform: scale(2) rotate(45deg);
        }


        .search-wrapper {
            position: absolute;
            right: 4px;
            transform: scale(0.4);
            z-index: 10;
            margin-top: -60px;
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
            height: 11px;
            left: 9px;
            top: 18px;
            border-radius: 2px;
            background: #974BE0;
        }
        .search-wrapper .input-holder .search-icon span::after {
            width: 14px;
            height: 14px;
            left: 0px;
            top: 0px;
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
<div id="wrapper" style="margin-top: -35px;">

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12 header">
                <div><a href="javascript:history.go(-1)"><span class="glyphicon glyphicon-menu-left" style="font-size: 10px;"></span></a></div>
                <div></div>
            </div>

            <c:forEach items="${flight}" var="flight">
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail flight">
                        <c:if test="${flight.z!=flight.r}">
                            <a href="./android_h5/buy.jsp?flight_number=<c:out value="${flight.name}" />&all_seat=<c:out value="${flight.z}"/>&sell_seat=<c:out value="${flight.r}"/>" class="button">
                            <div class="zhezhao">&nbsp</div>
                            </a>
                        </c:if>
                        <c:if test="${flight.z==flight.r}">
                            <div class="zhezhao"></div>
                        </c:if>

                        <div class="timer">
                            <div class="srart-time">12:50</div>
                            <div class="long-time">5时10分</div>
                            <div class="end-time">18:00</div>
                        </div>

                        <div class="path-flight">
                            <div class="start-site">广元</div>
                            <div class="flight"><span class="clearfm"><c:out value="${flight.name}" /></span></div>
                            <div class="end-site">南京</div>
                        </div>

                        <div class="number">
                            <div class="number-name">经济舱
                                <span class="sellseat" id="<c:out value="${flight.name}"/>_z"><c:out value="${flight.z-flight.r}"/></span>
                            </div>
                        </div>

                    </div>
                </div>
            </c:forEach>
        </div><!-- /.row -->
    </div><!-- /#page-wrapper -->
</div><!-- /#wrapper -->

<!-- JavaScript -->
<script src="<c:url value="./jquery/jquery.min.js" />"></script>
<script src="<c:url value="./bootstrap-3.3.7-dist/js/bootstrap.min.js" />"></script>


<!-- Page Specific Plugins -->
<script src="<c:url value="./js/raphael-min.js" />"></script>
<script src="<c:url value="./js/morris-0.4.3.min.js" />"></script>
<script src="<c:url value="./js/morris/chart-data-morris.js" />"></script>
<script src="<c:url value="./js/tablesorter/jquery.tablesorter.js" />"></script>
<script src="<c:url value="./js/tablesorter/tables.js" />"></script>
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
</body>
</html>
