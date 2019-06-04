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
    <style>
        .header_wrap{
            border-bottom: 1px solid #e5e5e5;
            width: 100%;
        }
        .header{
            width: 100%;
            display: table;
            margin: 0 auto;
            margin-bottom: -10px;
        }
        .topMenu{
            padding: 20px 0;
            height: 80px;
            margin-left: 10%;

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
    <%--<link href="<c:url value="/android_h5/css/buy.css"/>" rel="stylesheet">--%>
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
    </style>
</head>
<body>
<div class="header_wrap">
    <div class="header">
        <div class="topMenu">
            <div style="float: left">
                <h1>四川信息职业技术学院</h1>
            </div>
            <div style="margin-right: 10%">
                <ul class="nav navbar-right ">
                    <li>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><c:out value="${msg.user_name}" />  用户你好 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><i class="fa fa-gear"></i> 个人中心</a></li>
                            <li class="divider"></li>
                            <li><a href="<c:url value="/out"/>"><i class="fa fa-power-off"></i> 退出登录</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>

    </div>
</div>
<div class="fly-middle">
    <div class="main">
        <div class="box-message">
            <div class="box-tit">
                <h2>乘客</h2>
                <div class="box-tips">
                    <div>一次最多为8位乘客添加购票信息
                        <button type="button" class="btn btn-info" style="margin-left: 330px;" id="add">+添加乘客</button>
                    </div>
                </div>


            </div>
        </div>

        <div class="p-message" id="cc">
            <div class="p-card">
                <div class="p-num">
                    <i class="num-1"></i>
                </div>
                <div class="input-group" style="margin-left: 15px;">
                    <span class="input-group-addon">姓名</span>
                    <input type="text" class="form-control " value='<c:out value="${msg.user_name}" />'  aria-label="..." style="width:360px;">
                </div>
                <div>
                    <div style="margin-top: 10px;">
                        <div class="input-group" style="margin-left: 15px;">
                            <span class="input-group-addon">账号</span>
                            <input type="text" class="form-control  user-id" value=''  placeholder="账号" aria-label="..." style="width:360px;">
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
                        <input type="text" class="form-control" placeholder="证件号码" style="width:270px;">
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


        </div>
        <div style="margin-bottom:30px;">
            <div class="box-tit">
                <h2>联系人</h2>
            </div>
            <div class="p-card">
                <div>
                    <div style="margin-top: 10px;">
                        <div class="col-lg-2" style="width:160px;">
                            <select class="form-control" onchange="selectOnchang(this)">
                                <option>中国大陆区号86</option>
                                <option>中国香港区号852</option>
                                <option>中国澳门区号853</option>
                                <option>中国台湾区号886</option>
                            </select>
                        </div>
                        <input type="text" class="form-control" placeholder="乘机人手机号码" style="width:270px;">
                    </div>
                </div>
                <div style="margin-top: 10px;margin-left:15px;">
                    <input type="text" class="form-control" placeholder="Email(选填，接收航变信息）" style="width:415px;">

                </div>
            </div>
        </div>
        <div style="width:700px;text-align: center;">
            <a href="javascript:;" class="b-go" id="go">提交</a>
        </div>
    </div>

</div>
<div class="sidebar">
    <div class="sidebar-cont">
        <div>
            <div class="flight-info" style="border-bottom: none;padding-bottom: 0">
                <div class="flight-city">
                    <div class="flt-date">
                        <c:out value="${time}" />
                        <span class="week">周二</span>
                        <div class="flt-depart"><c:out value="${cfcity}" /></div>
                        <div class="flt-depart">--></div>
                        <div class="flt-depart"><c:out value="${ddcity}" /></div>
                    </div>
                </div>
                <div class="flight-tit">
                    <div class="plane-type">
                        <c:out value="${flight_number}" />
                    </div>
                    <form method="post" action="user_info_b737_700.jsp" id="formflight">
                        <input type="hidden" name="flight" value="<c:out value="${flight_number}" />">
                        <input type="hidden" name="seat" id="user-seat">
                    </form>
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
        <div class="flight-cost">
            <div class="cost-detail">
                <div class="cost-row">
                    <div class="cost-tit">
                        <span>成人</span>
                        <span class="abb">
                                        退改
                                        <dfn style="padding-left:3px;">￥</dfn>
                                        15起
                                    </span>
                        <span class="abb">行李额</span>
                        <div class="corner">
                                            <span class="price">
                                                <dfn>￥</dfn>
                                                150
                                            </span>
                        </div>
                    </div>
                </div>

                <div class="cost-row">
                    <div class="cost-tit">
                        <span>机建</span>
                        <div class="corner">
                                                <span class="price">
                                                    <dfn>￥</dfn>
                                                    50
                                                </span>
                        </div>
                    </div>
                </div>
                <div class="cost-row">
                    <div class="cost-tit">
                        <span>燃油费</span>
                        <div class="corner">免费</div>
                    </div>
                </div>
                <div>
                    <div class="total-price">
                        <span>
                            <dfn style="font-size: 18px;">￥</dfn>
                            200
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</div>
<div>
</div>
</body>

<script type="text/javascript">
    var add = document.getElementById('add');
    var container =document.getElementById('cc');
    var node=container.nextSibling;
    add.onclick = function(){
        oDiv = document.createElement('div');
        oDiv.innerHTML = "<div class='p-message'><div class='p-card'><div class='p-num' id='num'><i class='num-1'></i>    </div>    <div class='input-group' style='margin-left: 15px;'>        <span class='input-group-addon'>账号</span>        <input type='text' class='form-control user-id' placeholder='账号' aria-label='...' style='width:360px;'>    </div>        <div>        <div style='margin-top: 10px;'>            <div class='col-lg-2' style='width:160px;'>            <select class='form-control' onchange='selectOnchang(this)'>            <option>身份证</option>            <option>护照</option>            <option>军人证</option>            </select>            </div>            <input type='text' class='form-control' placeholder='登机证件号码' style='width:270px;'>        </div>    </div>          <div>            <div style='margin-top: 10px;'>                <div class='col-lg-2' style='width:160px;'>                <select class='form-control' onchange='selectOnchang(this)'>                <option>中国大陆区号86</option>                <option>中国香港区号852</option>                <option>中国澳门区号853</option>                <option>中国台湾区号886</option>                </select>                </div>                <input type='text' class='form-control' placeholder='乘机人手机号码' style='width:270px;'>            </div>         </div>                   <button class='layui-btn layui-btn-sm p-del' style='background: red; position: absolute;right: 15px;top: 10px;'  onclick='dell(0)'>          <i class='layui-icon'>&#xe640;</i>            </button>                             </div>        </div>              </div></div>";
        container.parentNode.insertBefore(oDiv, node)
        node=oDiv.nextSibling;
        layui.use('form', function(){
            var form = layui.form;
            form.render();
            //各种基于事件的操作，下面会有进一步介绍
        });
    }
    function dell(e){
        // var delse=document.getElementsByClassName('p-del')[e].parentNode;
        // delse.parentNode.removeChild(delse);
        $(".p-del").click(function(){
            var a=$(".p-del").index(this);
            var delse=document.getElementsByClassName('p-del')[a].parentNode;
            delse.parentNode.removeChild(delse);
        })
    }

</script>
<script>
    layui.use('form', function(){
        var form = layui.form;
        form.render();
        //各种基于事件的操作，下面会有进一步介绍
    });
    $("#go").on('click',function(){

        // layer.open({
        //     type: 1 //Page层类型
        //     ,area: ['500px', '300px'],
        //     title: '你好，layer。',
        //     shade: 0.6 ,//遮罩透明度
        //     maxmin: true ,//允许全屏最小化
        //     content: '<div style="padding:50px;">这是一个非常普通的页面层，传入了自定义的html</div>',
        //     end:function(){
        //         location.href='main.jsp'
        //     }
        // });
        var user_id=$(".user-id");
        var judge=0;
        for(let i=0;i<$(".user-id").length;i++){

            if(user_id[i].value.length<2){
                judge=1;
                document.getElementsByClassName("user-id")[i].style.border="2px solid #red";
                break;
            }
        }

        if(judge==0){
            //首先定义passenger_info的数组拿来存放每一个人选择位置的信息
            var passenger_info = new Array();
            var user_name="";
            var json1=new Array();
            if($(".user-id").length==1){

                var attribute=new Array(2);
                var arbk=0;
                var user_attribute=$(".attribute-user");
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

                // console.log(attribute[0]+","+attribute[1]);

                var jsonObj = {};
                user_name+=$(".user-id:eq(0)").val()+",";
                jsonObj["Id"]=$(".user-id:eq(0)").val();
                jsonObj["type_one"]=attribute[0];
                jsonObj["type_second"]=attribute[1];

                passenger_info.push(jsonObj);

                //新建一个json数组并存进航班号和有多少个人和每一个人的选座信息
                //这里位置顺序不能弄乱因为在后台是按照顺序读取的

                var j={};
                j["passenger_flight_number"]="<c:out value="${flight_number}" />";//航班号
                j["passenger_num"]=$(".user-id").length;//人数
                j["passenger_info"]=passenger_info;//个人座位需求信息
                json1.push(j);


            }else {
                for(let i=0;i<$(".user-id").length;i++){
                    user_name+=document.getElementsByClassName("user-id")[i].value+",";
                    var jsonObj = {};
                    jsonObj["Id"]=document.getElementsByClassName("user-id")[i].value;
                    jsonObj["type_one"]="null";
                    jsonObj["type_second"]="null";
                    passenger_info.push(jsonObj);
                }

                //新建一个json数组并存进航班号和有多少个人和每一个人的选座信息
                //这里位置顺序不能弄乱因为在后台是按照顺序读取的
                var json1=new Array();
                var j={};
                j["passenger_flight_number"]="<c:out value="${flight_number}" />";//航班号
                j["passenger_num"]=$(".user-id").length;//人数
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
                    document.getElementById("formflight").action="user_info_<c:out value="${flight_number}" />.jsp";
                    document.getElementById("formflight").submit();
                    // console.log(e);
                }
            });//ajax——的结束
        }
    });
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
</script>
</html>
