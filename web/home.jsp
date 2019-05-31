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
    <c:url value="/jquery/jquery.min.js" />

    <link rel="stylesheet" href="<c:url value="/bootstrap-3.3.7-dist/css/bootstrap.min.css" />"/>
    <script src="<c:url value="/jquery/jquery.min.js" />"></script>
    <script src="<c:url value="/bootstrap-3.3.7-dist/js/bootstrap.min.js" />"></script>
    <link rel="stylesheet" href="layui-v2.4.5/layui/css/layui.css"  media="all">
    <script src="./layui-v2.4.5/layui/layui.all.js" type="text/javascript"></script>

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
            width: 1200px;
            display: table;
            margin: 0 auto;
        }
        .topMenu{
            padding: 20px 0;
            height: 80px;
        }
        .clearfix{
            zoom: 1;
        }
        .link logo{
            margin-top: 15px;
        }
        .pull-left{
            float: left;
        }
        .pull-right{
            float: right;
        }
        .menu{
            font-size: 16px;
            line-height: 65px;
            padding-right: 20px;
            padding-top: 8px;
        }
        .item{
            height: 68px;
        }
        .userLogin{
            margin-left: -20px;
        }

        .fySearch{
            width: 1500px;
            margin: 0 auto;
            height: 600px;
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
            margin-top: 40px;
        }
    </style>
</head>
<body>


<div class="header_wrap">
    <div class="header">
        <div class="topMenu clearfix">
            <div class="link logo pull-left">
                <a href="#">
                    ss
                    <img>
                </a>
            </div>

            <div class="myfeeyo_log pull-right menu item pull-left">
                <div class="userLogin loginRegPanel" style="display: block;">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a data-toggle="modal" data-target="#register" href=""><span class="glyphicon glyphicon-user"></span> 注册</a></li>
                        <li><a data-toggle="modal" data-target="#login" href=""><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
                    </ul>
                    <!-- 注册窗口 -->
                    <div id="register" class="modal fade" tabindex="-1">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <button class="close" data-dismiss="modal">
                                        <span>&times;</span>
                                    </button>
                                </div>
                                <div class="modal-title">
                                    <h1 class="text-center">注册</h1>
                                </div>
                                <div class="modal-body">
                                    <form class="form-group" action="">
                                        <div class="form-group">
                                            <label for="">用户名</label>
                                            <input class="form-control" type="text" placeholder="6-15位字母或数字">
                                        </div>
                                        <div class="form-group">
                                            <label for="">密码</label>
                                            <input class="form-control" type="password" placeholder="至少6位字母或数字">
                                        </div>
                                        <div class="form-group">
                                            <label for="">再次输入密码</label>
                                            <input class="form-control" type="password" placeholder="至少6位字母或数字">
                                        </div>
                                        <div class="form-group">
                                            <label for="">邮箱</label>
                                            <input class="form-control" type="email" placeholder="例如:123@123.com">
                                        </div>
                                        <div class="text-right">
                                            <button class="btn btn-primary" type="submit">提交</button>
                                            <button class="btn btn-danger" data-dismiss="modal">取消</button>
                                        </div>
                                        <a href="" data-toggle="modal" data-dismiss="modal" data-target="#login">已有账号？点我登录</a>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 登录窗口 -->
                    <div id="login" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <button class="close" data-dismiss="modal">
                                        <span>&times;</span>
                                    </button>
                                </div>
                                <div class="modal-title">
                                    <h1 class="text-center">登录</h1>
                                </div>
                                <div class="modal-body">
                                    <form class="form-group" action="">
                                        <div class="form-group">
                                            <label for="">用户名</label>
                                            <input class="form-control" type="text" placeholder="">
                                        </div>
                                        <div class="form-group">
                                            <label for="">密码</label>
                                            <input class="form-control" type="password" placeholder="">
                                        </div>
                                        <div class="text-right">
                                            <button class="btn btn-primary" type="submit">登录</button>
                                            <button class="btn btn-danger" data-dismiss="modal">取消</button>
                                        </div>
                                        <a href="" data-toggle="modal" data-dismiss="modal" data-target="#register">还没有账号？点我注册</a>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
</div>
</div>
<form action="test01" method="post">
    <div class="f_content" style="background:#88b7e4;width:100%;">
        <div class="big">
            <div class="fySearch">
                <div class="stopImg">
                    <p class="mt">Enjoy your flight</p>
                    <p class="mc">精准可靠的航班动态数据服务</p>
                </div>
                <div class="stopMain clearfix" >
                    <div>
                        <div style="margin-top: 10px;">
                            <div class="col-lg-2" style="width:160px;">
                                出发城市：
                                <select class="form-control"onchange="selectOnchang(this.value)" name="cfcity">

                                    <option value="上海">上海</option>
                                    <option value="广州">广州</option>
                                    <option value="成都">成都</option>
                                    <option value="深圳">深圳</option>
                                </select>
                            </div>
                        </div>
                        <div style="margin-top: 10px;">
                            <div class="col-lg-2" style="width:160px;">
                                到达城市：
                                <select class="form-control" onchange="selectOnchang(this.value)" name="ddcity">

                                    <option value="北京">北京</option>
                                    <option value="湖南">湖南</option>
                                    <option value="湖北">湖北</option>
                                    <option value="越南">越南</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div>
                            选择出行时间:
                            <input type="date" style="height: 50px;" value="" name="sdate"/>
                        </div>
                        <div>
                            <div style="margin-top: 10px;">
                                <div class="col-lg-2" style="width:160px;">
                                    航班号:
                                    <select class="form-control" onchange="selectOnchang(this.value)" name="hb">
                                        <option value="空客330-300B">空客330-300B</option>
                                        <option value="波音737-700">波音737-700</option>
                                        <option value="空客330-300A">空客330-300A</option>
                                        <option value="波音787-8">波音787-8</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="btn btn-primary" type="submit" >订购</button>
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


</script>
</html>
