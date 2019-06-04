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

    </style>
</head>
<body style="overflow-y:hidden">

<div class="video-box" style="position: absolute;top: 80px; z-index: -5;">
    <!-- 嵌入视频 -->
    <div class="vedioiframe">
        <video autoplay="autoplay" loop="loop" muted="muted" width="100%">
            <source src="<c:url value="/video/video.mp4"/> " type="video/mp4">

        </video>
    </div>
</div>
<div class="header_wrap">
    <div class="header">
        <div class="topMenu">
            <div style="float: left">
                <img style="width: 50px;" src="<c:url value="/img/logo.png"/> " />
                <h1 style="float: right; line-height: 10px; margin-left: 20px;">Eyat</h1>
            </div>
            <div style="margin-right: 10%">
                <ul class="nav navbar-right ">
                    <li>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><c:out value="${msg.user_name}" />  用户你好 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><i class="fa fa-gear"></i> 个人信息</a></li>
                            <li class="divider"></li>
                            <li><a href="<c:url value="/out"/> "><i class="fa fa-power-off"></i> 退出登录</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>

    </div>
</div>
</div>
<form action="<c:url value="/buy"/> " method="post">
    <div class="f_content">
        <div class="big">
            <div class="fySearch">
                <div class="stopImg">
                    <p class="mt text-center">Enjoy Your Air Time</p>
                    <p class="mc text-center">精准可靠的航班动态数据服务</p>
                </div>
                <div class="stopMain clearfix" >
                    <div>
                        <div style="margin-top: 10px;">
                            <div class="col-lg-2" style="width:160px;">
                                <span>出发城市：</span>
                                <select class="form-control" name="cfcity">

                                    <option value="上海">上海</option>
                                    <option value="广州">广州</option>
                                    <option value="成都">成都</option>
                                    <option value="深圳">深圳</option>
                                </select>
                            </div>
                        </div>
                        <div style="margin-top: 10px;">
                            <div class="col-lg-2" style="width:160px;">
                                <span>到达城市：</span>
                                <select class="form-control" name="ddcity">

                                    <option value="北京">北京</option>
                                    <option value="湖南">湖南</option>
                                    <option value="湖北">湖北</option>
                                    <option value="越南">越南</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="col-lg-2">
                            <span>选择出行时间:</span>
                            <input type="text" class="form-control lot-time" id="time"  name="time">
                        </div>
                        <div>
                            <div style="margin-top: 10px;">
                                <div class="col-lg-2">
                                    <span>航班号:</span>
                                    <select class="form-control" name="flight_number">
                                        <option value="k330_300b">空客330-300B</option>
                                        <option value="b737_700">波音737-700</option>
                                        <option value="k330_300a">空客330-300A</option>
                                        <option value="b787_8">波音787-8</option>
                                        <option value="a100_1">自定义航班a100_1</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 text-center" style="margin-top: 18px;">
                            <c:if test="${msg.user_name == null}"><button class="btn btn-primary col-lg-4" onclick="login()" type="button" >登录订购</button></c:if>
                            <c:if test="${msg.user_name != null}"><button class="btn btn-primary col-lg-4" type="submit" >订购</button></c:if>
                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>
</form>
</body>
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
    
    function login() {
        window.location.href="<c:url value="/login"/> ";
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
            forceParse: 0
        });
    })
</script>
</html>
