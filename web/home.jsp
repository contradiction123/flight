<%--
  Created by IntelliJ IDEA.
  User: fanxi
  Date: 2019/5/31
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>主页</title>
    <link rel="stylesheet" href="<c:url value="/bootstrap-3.3.7-dist/css/bootstrap.css" />"/>
    <script src="<c:url value="/jquery/jquery.min.js" />"></script>
    <script src="<c:url value="/bootstrap-3.3.7-dist/js/bootstrap.min.js" />"></script>
    <link href="<c:url value="/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" />" rel="stylesheet" media="screen">
    <script type="text/javascript" src="<c:url value="/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js" />" charset="UTF-8"></script>
    <script type="text/javascript" src="<c:url value="/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js" />" charset="UTF-8"></script>

    <style>
        div{
            margin: 0;
            padding: 0;
        }
        .header_wrap{
            border-bottom: 0px solid #e5e5e5;
            width: 100%;
        }
        .header{
            width: 100%;
            display: table;
            margin: 0 auto;
            background-color: rgba(0,0,0,0);
            margin-bottom: -10px;
        }
        .topMenu{
            padding: 20px 0;
            height: 80px;
            margin-left: 10%;
            color: #FFFFFF;
        }

        .fySearch{
            margin: 0 auto;
            width: 100%;
        }

        .stopImg{
            padding-top: 80px;
            padding-right: 50px;
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
        span {
            color: #ffffff;
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



        .front{
            padding: 15px;
        }
        #uid,#pass,#user_email,#user_name,#user_passw{
            width: 80%;
            height: 40px;
            border-bottom: 1px #000 solid;
            margin-bottom: 20px;
            font-family: initial;
            font-style: italic;
            font-size: 17px;
            padding-left: 10px;
            background-color: rgba(255,255,255,0.7);
            border-radius: 7px;
        }
        .J_codeimg{
            width: 80px;
            position: absolute;
            right: 10%;
            transform: skewX(-45deg);
            -ms-transform: skewX(-45deg);
            -webkit-transform: skewX(-45deg);
        }
        #code,#register-code{
            width: 80%;
            height: 40px;
            border-bottom: 1px #000 solid;
            margin-bottom: 20px;
            font-family: initial;
            font-style: italic;
            font-size: 17px;
            padding-left: 10px;
            background-color: rgba(255,255,255,0.7);
            border-radius: 7px;
        }
        .modal-footer>div{
            display: flex;
            justify-content: space-around;
        }
        .modal-content{
            background-color: rgba(255,255,255,0.5);
        }
        .modal-body{
            padding-bottom: 50px;
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
            background: rgba(255,255,255,0.5);
        }
    </style>


</head>
<body style="overflow-y:hidden">

<div class="video-box" style="position: fixed;top: 0px;z-index: -100;">
    <!-- 嵌入视频 -->
    <div class="vedioiframe">
        <div >
            <img src="<c:url value="/photo/airplane.jpg"/> "style="width: 100%;height: 100%;">
        </div>
        <%--<video autoplay="autoplay" loop="loop" muted="muted" width="100%">--%>
            <%--<source src="<c:url value="/video/video.mp4"/> " type="video/mp4">--%>

        <%--</video>--%>
    </div>
</div>
<div class="header_wrap">
    <div class="header">
        <div class="topMenu">
            <div style="float: left">
                <img style="width: 50px;" src="<c:url value="/img/logo.png"/> " />
                <h1 style="float: right; line-height: 10px; margin-left: 20px;">Eyat</h1>
            </div>
            <%--<div style="margin-right: 10%">--%>
                <%--<ul class="nav navbar-right ">--%>
                    <%--<li>--%>
                        <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown"><c:out value="${msg.user_name}" />  用户你好 <b class="caret"></b></a>--%>
                        <%--<ul class="dropdown-menu">--%>
                            <%--<li><a href="#"><i class="fa fa-gear"></i> 个人信息</a></li>--%>
                            <%--<li class="divider"></li>--%>
                            <%--<li><a href="<c:url value="/out"/> "><i class="fa fa-power-off"></i> 退出登录</a></li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                <%--</ul>--%>
            <%--</div>--%>
        </div>

    </div>
</div>
</div>
<div class="f_content">
    <div class="big">
        <div class="fySearch">
            <div class="stopImg">
                <p class="mt text-right">Enjoy Your Air Time</p>
                <p class="mc text-right">基于互联网的座位分配系统</p>
            </div>
        </div>

        <div class="front pull-right">
            <div class="front">

                <form id="login" action="<c:url value="/login" />" method="post" class="grid xl-1">
                    <input type="text" id="uid" name="user_email" placeholder="用户名" />
                    <input type="password" id="pass" name="password" placeholder="密码"/>
                    <div >
                        <input id="code" placeholder='验证码' maxlength="4" type='text' class="col-lg-5" >
                        <canvas class="J_codeimg" id="myCanvas" onclick="Code();">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
                    </div>
                    <p style="color: red;position: absolute;font-size: 12px;right: 40%; bottom:0px"><c:if test="${error != ''}"><c:out value="${error}" /></c:if></p>
                </form>
            </div>

            <div class="modal-footer" style="padding-top: 100px;padding-right: 70px; border-top: 0px">
                <div>
                    <div><button type="button" class="btn btn-secondary" btn="primary" id="subbtn" onclick="login();" style="background-color:#4cd964;color: #fff9ec;">登录</button></div>
                    <div><button type="button" class="btn btn-secondary" btn="trans submit" id="register" data-dismiss="modal" data-toggle="modal" data-target="#myModal3">注册</button></div>
                </div>
            </div>

    </div>
</div>



<!-- 模态框 注册"-->
<div class="modal fade" id="myModal3">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">注册</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form id="register-form" action="<c:url value="/register" />" method="post" class="grid xl-1 a1">
            <!-- 模态框主体 -->
            <div class="modal-body">
                <div class="front">

                        <input type="text" name="user_email" id="user_email" placeholder="用户邮箱"/>
                        <input type="password" name="password" id="user_passw" placeholder="用户密码"/>
                        <input type="text" name="user_name" id="user_name" placeholder="用户姓名"/>


                </div>
            </div>

            <!-- 模态框底部 -->
            <div class="modal-footer">
                <div>
                    <div><button type="button" class="btn btn-secondary" data-dismiss="modal" btn="trans submit" onclick="document:register-form.submit();" btn="primary"id="register-submit">提交</button></div>
                    <div><button type="button" class="btn btn-secondary" data-dismiss="modal" data-toggle="modal" data-target="#myModal2">已注册？登陆</button></div>
                    <div><button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button></div>
                </div>
            </div>
            </form>
        </div>
    </div>
</div>

<i id="mysvg"></i>

</body>


<script src='<c:url value="/js/TweenMax.min.js"/>'></script>
<script src='<c:url value="/js/MorphSVGPlugin.min.js"/>'></script>




<script src='<c:url value="/js/login_Verification1.js" />' type="text/javascript"></script>
<script>

    // $('zhuce').on('click',function(){
    //     layer.open({
    //     type: 1 //Page层类型
    //     ,area: ['500px', '300px']
    //     ,title: '你好，layer。'
    //     ,shade: 0.6 //遮罩透明度
    //     ,maxmin: true //允许全屏最小化
    //     ,anim: 1 //0-6的动画形式，-1不开启
    //     ,content: '<div style="padding:50px;">这是一个非常普通的页面层，传入了自定义的html</div>'
    //     });
    // });

    //      layui.use('form', function(){
    //             var form = layui.form;
    //             form.render();
    //             //各种基于事件的操作，下面会有进一步介绍
    //           });
    $('#zhuce').on('click', function(){
        layer.open({
            type:2,
            area: ['30%', '70%'],
            maxmin: true,
            //   shadeClose: true, //点击遮罩关闭
            content: 'tt01.html'
        });
    });

    // 给input  date设置默认值
    var now = new Date();
    //格式化日，如果小于9，前面补0
    var day = ("0" + now.getDate()).slice(-2);
    //格式化月，如果小于9，前面补0
    var month = ("0" + (now.getMonth() + 1)).slice(-2);
    //拼装完整日期格式
    var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
    //完成赋值
    $('#time').val(today);
    



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
            forceParse: 0
        });
    })
</script>

<script>
    var form = document.getElementById("login")
    document.onkeydown=function(){
        if (event.keyCode == 13){
            login();
        }
    }
</script>
</html>
