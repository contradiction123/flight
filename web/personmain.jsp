<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fanxi
  Date: 2019/6/3
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <link rel="stylesheet" href="<c:url value="/bootstrap-3.3.7-dist/css/bootstrap.css" />"/>
    <script src="<c:url value="/jquery/jquery.min.js" />"></script>
    <script src="<c:url value="/bootstrap-3.3.7-dist/js/bootstrap.min.js" />"></script>
    <c:url value="/" />
    <link rel='stylesheet' href='<c:url value="/layui-v2.4.5/layui/css/layui.css" />'  media='all'>
    <script src='<c:url value="/layui-v2.4.5/layui/layui.all.js" />' type='text/javascript'></script>
    <title>Document</title>
    <link href="./bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <script type="text/javascript" src="./bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="./bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <style>
        .member-box{
            margin-right: 0px;
            position: relative;
            height: 104px;
            background: #4baaec url(//pic.c-ctrip.com/platform/online/my/home/bg-member-info.png) 0 0 no-repeat;
            background-size: 100% 100%;
            overflow: hidden;
        }
        .message-alert{
            position: absolute;
            right: -217px;
            top: 20px;
            width: 200px;
            height: 55px;
            padding: 5px 10px 5px 65px;
            background: rgba(255,255,255,0.3);
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            color: #001e3b;
            cursor: pointer;
        }
        .home-mail{
            position: absolute;
            top: 10px;
            left: 5px;
            width: 44px;
            height: 44px;
        }
        a{
            color: #06c;
        }
        .member-info{
            padding-right: 250px;
            position: relative;
            padding: 15px 275px 0 125px;
            color: #FFF;
        }
        .member-pic{
            position: absolute;
            top: 12px;
            left: 30px;
            width: 78px;
            height: 78px;
            overflow: hidden;
        }
        .member-pic-bg{
            position: absolute;
            top: 0;
            left: 0;
            display: inline-block;
            width: 78px;
            height: 78px;
            background: url(//pic.c-ctrip.com/platform/online/my/home/border-head.png) no-repeat left top;
        }
        .sidebar{
            width:340px;
            float:left;

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
    </style>
</head>
<body style="overflow-y:hidden">
<div class="member-box" id="memberInfo">
    <div class="member-message">

        <div class="message-alert message-has" id="messageHref">

            <a href="" class="home-mail" target="_blank">
                <i class="i-mail"></i>

                <span class="unread">1</span>

                <!-- <span class="unread2"></span> -->
            </a>
            <ul>

                <li>• 订单通知</li>

            </ul>
        </div>
    </div><div class="member-info">
    <div id="memberEdit" class="member-pic">
        <span class="member-pic-bg"></span>

        <img width="68" height="68" src="https://dimg04.c-ctrip.com/images/t1/headphoto/646/318/109/a865fe5f5465407d8befd5dc487a8554.jpg" alt="">

        <div class="member-edit" style="display: none;">
            <a href="" target="_blank">
                <i class="i-edit"></i>
                <br>
                编辑资料
            </a>
        </div>
    </div>
    <div class="member-name">
        <a href="http://you.ctrip.com/members/" class="member-id" target="_blank">尊敬的会员</a>
        <span class="account-security">
        <!--  账户安全：-->
            <!-- <a href=""><i class="tag-level level-high">高</i></a>-->
            <!--<a href=""><i class="tag-level level-high">高</i></a>-->
            <!-- <i class="tag-level level-middle">中</i> -->
            <!-- <i class="tag-level level-low">低</i> -->
    </span>
    </div>
    <a href="http://pages.c-ctrip.com/commerce/promote/201606/other/hytq/index.html" target="_blank">
        <div class="member-level">
            领<span class="start">会员</span>福利&gt;
        </div>
    </a>
</div>
</div>
<div>

    <div class="sidebar">
        <div class="sidebar-cont">
            <div>
                <div class="flight-info" style="border-bottom: none;padding-bottom: 0">
                    <div class="flight-city">
                        <div class="flt-date">
                            05-27
                            <span class="week">周二</span>
                            <div class="flt-depart">上海</div>
                            <div class="flt-depart">--></div>
                            <div class="flt-depart">上海</div>
                        </div>
                    </div>
                    <div class="flight-tit">
                        <div class="plane-type">
                            波音330-300A
                        </div>
                        <div class="plane-type">
                            经济舱
                        </div>
                    </div>
                    <div class="flight-detail">
                        <div class="flt-arrow">
                            <!-- 您的座位:31K -->
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
<iframe id="ll" name="l" width="1340" height="500"  src="787-8.html"></iframe>
<a href="./330-300A.html"></a>



</body>
</html>



