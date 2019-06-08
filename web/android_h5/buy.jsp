<%--
  Created by IntelliJ IDEA.
  User: s8534
  Date: 2019/5/31
  Time: 19:54
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

    <title>买票界面</title>

    <link rel="stylesheet" href="css/framework7.ios.min.css">
    <link rel="stylesheet" href="css/framework7.ios.colors.min.css">
    <link rel="stylesheet" href="css/framework7.material.min.css">
    <link rel="stylesheet" href="css/framework7.material.colors.min.css">
    <link rel="stylesheet" href="css/upscroller.css">
    <link rel="stylesheet" href="css/my-app.css">

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="../bootstrap-3.3.7-dist/css/bootstrap.min.css" />" rel="stylesheet">
    <!-- Add custom CSS here -->
    <link href="<c:url value="../css/admin.css" />" rel="stylesheet">
    <!-- Page Specific CSS -->
    <link rel="stylesheet" href="<c:url value="../css/morris-0.4.3.min.css" />">

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>

    <link href="css/buy.css" rel="stylesheet">
    <style>

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
        .flight_information,.flight_information>div:nth-child(2)>div:nth-child(3){
            display: flex;
        }
        .header>div:nth-child(2),.flight_information>div,.flight_information>div:nth-child(2)>div:nth-child(3)>div{
            width: 20%;
        }
        .flight_information>div:nth-child(2),.flight_information>div:nth-child(2)>div:nth-child(3)>div:nth-child(2){
            width: 58%;
        }
        .flight_information>div:nth-child(2)>div,.flight_information>div:nth-child(2)>div:nth-child(3)>div:nth-child(2)>div{
            width: 100%;
            height: auto;
        }
        .site>span{
            font-size: 33px;
            line-height: 200%;
        }
        .flight_number>span{
            font-size: 20px;
            margin-left: 28%;
        }
        .long_time>span{
            font-size: 14px;
            margin-left: 18%;
        }
        .flight_time>span{
            font-size: 20px;
            line-height: 300%;
        }
        .con{
            -webkit-transform: scale(2.5,0.8);
            width: 100%;
            height: 1em;
            vertical-align: middle;
            fill: currentColor;
            overflow: hidden;
        }
        .con2{
            -webkit-transform: scale(1.5,0.8);
        }
        .sell_seat>span{
            font-size: 13px;
            margin-left: 14%;
        }
        body{
            overflow: scroll;
            overflow-x:hidden;
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
            width: 100%;
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



        #clos{
            transform: scale(2) rotate(45deg);
        }


        .search-wrapper {
            position: absolute;
            right: 4px;
            transform: scale(0.4);
            z-index: 10;
            margin-top: -16px;
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
<a href="javascript:" class="floating-button addbtn color-pink"><i class="glyphicon glyphicon-ok"></i></a>

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

<div id="wrapper">

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12 header">
                <div><a href="javascript:history.go(-1)"><span class="glyphicon glyphicon-menu-left" style="font-size: 18px;"></span></a></div>
                <div></div>
            </div>

            <div class="col-lg-12 flight_information">
                <div class="site"><span>广元</span></div>

                <div>
                    <div class="flight_number"><span><%= request.getParameter("flight_number")%></span></div>
                    <div>
                        <svg class="con"  viewBox="0 0 6144 1024" version="1.1" p-id="3267"><path d="M4787.2 947.2l1177.5744-435.2H5964.8h-0.0256L4787.2 76.8v358.4H179.2v153.6h4608z" p-id="3268"></path></svg>
                    </div>
                    <div>
                        <div class="flight_time"><span>12:50</span></div>
                        <div>
                            <div class="long_time"><span>5小时10分钟</span></div>
                            <div>
                                <svg class="con con2"  viewBox="0 0 6144 1024" version="1.1" p-id="3267"><path d="M4787.2 947.2l1177.5744-435.2H5964.8h-0.0256L4787.2 76.8v358.4H179.2v153.6h4608z" p-id="3268"></path></svg>
                            </div>
                            <div class="sell_seat"><span>剩余座位:<%= Integer.parseInt(request.getParameter("all_seat"))-Integer.parseInt(request.getParameter("sell_seat"))%></span></div>
                        </div>
                        <div class="flight_time"><span>18:00</span></div>
                    </div>
                </div>

                <div class="site"><span>南京</span></div>

            </div>

            <div class="col-sm-6 col-md-4 alluser">
                <div class="thumbnail flight">

                    <div class="functionuser col-sm-3">
                        <div class="button add" data-toggle="modal" data-target="#myModal2">添加乘客</div>
                    </div>

                    <div class="user">
                        <div class="page-content">
                            <div class="list-block">
                                <ul>
                                </ul>
                            </div>
                        </div>
                    </div>


                </div>
            </div>

        </div><!-- /.row -->

    </div><!-- /#page-wrapper -->
</div><!-- /#wrapper -->

<div class="container userinformation">
    <!-- 模态框 -->
    <div class="modal fade model2" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog model2" >
            <div class="modal-content model2">

                <!-- 模态框主体 -->
                <div class="modal-body">
                    <form class="form form-box" action="../admin_flight" method="get">
                        <div class="form-group modal-body-div">
                            <div>
                                <label class="wenzi-5ex modal-body-label">请输入购买人的账号</label>
                            </div>
                            <div>
                                <input type="text" class="form-control" placeholder="name" name="s" id="name">
                            </div>
                        </div>

                        <div class="form-group modal-body-div child_vip_type">
                            <div>
                                <label class="wenzi-6ex modal-body-label">首先选择以下选项，如果都没有请点击"不选"</label>
                            </div>
                            <div class="RadioStyle">
                                <div class="Block PaddingL">
                                    <div id="a1">
                                        <div>
                                            <input type="checkbox" id="love1" name="Storage" class="Storage"/>
                                            <label for="love1" class="child_vip">是否带有儿童</label>
                                        </div>
                                        <div>
                                            <input type="checkbox" id="love2" name="Storage" class="Storage" />
                                            <label for="love2" class="child_vip">是否是vip</label>
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
                                <label class="modal-body-label">您第一想要的座位是在哪里？</label>
                            </div>
                            <div class="RadioStyle">
                                <div class="Block PaddingL" id="a2">
                                    <div>
                                        <input type="radio" name="Storage1" id="model7" class="Storage1" />
                                        <label for="model7" class="one">靠窗位置</label>
                                    </div>
                                    <div>
                                        <input type="radio" name="Storage1" id="model4" class="Storage1" />
                                        <label for="model4" class="one">靠门位置</label>
                                    </div>
                                    <div>
                                        <input type="radio" name="Storage1" id="model5" class="Storage1"/>
                                        <label for="model5" class="one">中间位置</label>
                                    </div>
                                    <div>
                                        <input type="radio" name="Storage1" id="model6" class="Storage1"/>
                                        <label for="model6" class="one">靠过道位置</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group modal-body-div attribute">
                            <div>
                                <label class="wenzi-5ex modal-body-label">如果没有第一想要的位置了，那么您还想要什么位置</label>
                            </div>
                            <div class="RadioStyle">
                                <div class="Block PaddingL" id="a3">
                                    <div>
                                        <input type="radio" name="Storage2" id="model11" class="Storage2"/>
                                        <label for="model11" class="second">靠窗位置</label>
                                    </div>
                                    <div>
                                        <input type="radio" name="Storage2" id="model8" class="Storage2"/>
                                        <label for="model8" class="second">靠门位置</label>
                                    </div>
                                    <div>
                                        <input type="radio" name="Storage2" id="model9" class="Storage2"/>
                                        <label for="model9" class="second">中间位置</label>
                                    </div>
                                    <div>
                                        <input type="radio" name="Storage2" id="model10" class="Storage2"/>
                                        <label for="model10" class="second">靠过道位置</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>

                <!-- 模态框底部 -->
                <div class="modal-footer">
                    <button class="btn btn-secondary close" id="sure_add" data-dismiss="modal">确认添加</button>
                </div>

            </div>
        </div>
    </div>
</div>
<%--<form method="post" action="../android/display_seat" id="display"></form>--%>
<form method="get" action="display_seat.jsp" id="display">
    <input type="hidden" name="flight_number" id="f_number"/>
    <input type="hidden" name="name" id="f_name"/>
    <input type="hidden" name="seat" id="f_seat"/>
    <input type="hidden" name="seatlist" id="f_seatlist"/>
</form>


<!-- JavaScript -->
<script src="<c:url value="../jquery/jquery.min.js" />"></script>
<script src="<c:url value="../bootstrap-3.3.7-dist/js/bootstrap.min.js" />"></script>


<!-- Page Specific Plugins -->
<script src="<c:url value="../js/raphael-min.js" />"></script>
<script src="<c:url value="../js/morris-0.4.3.min.js" />"></script>
<script src="<c:url value="../js/morris/chart-data-morris.js" />"></script>
<script src="<c:url value="../js/tablesorter/jquery.tablesorter.js" />"></script>
<script src="<c:url value="../js/tablesorter/tables.js" />"></script>

</body>

<script type="text/javascript" src="js/buy.js"></script>
<script type="text/javascript" src="js/framework7.min.js"></script>
<script type="text/javascript" src="js/upscroller.js"></script>
<script type="text/javascript" src="js/my-app.js"></script>

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

<script>
function bodyheight() {
    var flight=$(".flight");

    var h=flight[0].offsetHeight+flight[0].offsetTop;

    var bodyh=$("body").height();

    if(h>bodyh)$("body").height(h);
}
</script>
</html>
