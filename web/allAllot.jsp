<%--
  Created by IntelliJ IDEA.
  User: s8534
  Date: 2019/4/18
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%--这是jsp是买票分配的jsp--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>学生表</title>

    <link rel="stylesheet" href="./bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <style>
        body {
            min-height: 2000px;
            padding-top: 70px;
        }
        .studentIdtext1{
            visibility: hidden;
            margin-top: -1000px;
        }
        .Seat{
            transform: rotate(90deg);
        }
        .displaySeat{
            width: 50%;
        }
        #satisfactionBtn{
            margin-bottom: 50px;
        }
    </style>
    <script src="./jquery/jquery.min.js"></script>
    <script src="./bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>


<body>
<!-- Fixed navbar -->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li class="dropdown-header">Nav header</li>
                        <li><a href="#">Separated link</a></li>
                        <li><a href="#">One more separated link</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="../navbar/">Default</a></li>
                <li><a href="../navbar-static-top/">Static top</a></li>
                <li class="active"><a href="./">Fixed top <span class="sr-only">(current)</span></a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>


<div class="container">
    <button id="satisfactionBtn">查看满意度</button>
    <!-- Main component for a primary marketing message or call to action -->
    <div class="jumbotron Seat">
        <div class="form-group displaySeat">
            <svg width="300" height="1000"style="border:#70d5dd 1px solid ">
                <ellipse cx="152" cy="160" rx="128" ry="160" style="stroke: #70d5dd; fill: white" />
                <ellipse cx="152" cy="835" rx="128" ry="160" style="stroke: #70d5dd; fill: white" />
                <rect x="25" y="150" height="720" width="255" style="stroke: #70d5dd; fill: white"/>


                <text x="0" y="195" fill="red">1</text>
                <text x="0" y="220" fill="red">2</text>
                <rect x="50" y="180" height="20" width="30" style="stroke:black; fill: white" />
                <rect x="90" y="180" height="20" width="30" style="stroke:black; fill: white" />
                <rect x="180" y="180" height="20" width="30" style="stroke:black; fill: white" />
                <rect x="215" y="180" height="20" width="30" style="stroke:black; fill: white" />

                <rect x="50" y="205" height="20" width="30" style="stroke:black; fill: white" />
                <rect x="90" y="205" height="20" width="30" style="stroke:black; fill: white" />
                <rect x="180" y="205" height="20" width="30" style="stroke:black; fill: white" />
                <rect x="215" y="205" height="20" width="30" style="stroke:black; fill: white" />

                <text x="35" y="280" height="20" width="30"  fill="red">A</text>
                <text x="70" y="280" height="20" width="30"  fill="red">B</text>
                <text x="105" y="280" height="20" width="30" fill="red">C</text>
                <text x="165" y="280" height="20" width="30" fill="red">H</text>
                <text x="200" y="280" height="20" width="30" fill="red">J</text>
                <text x="235" y="280" height="20" width="30" fill="red">K</text>

                <text x="0" y="295" fill="red">31</text>
                <text x="0" y="320" fill="red">32</text>
                <text x="0" y="345" fill="red">33</text>
                <text x="0" y="370" fill="red">34</text>
                <text x="0" y="395" fill="red">35</text>
                <text x="0" y="420" fill="red">36</text>

                <rect class="seatId 31A" x="35" y="280" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 31B" x="70" y="280" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 31C" x="105" y="280" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 31H" x="165" y="280" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 31J" x="200" y="280" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 31K" x="235" y="280" height="20" width="30" style="stroke:black; fill: white" />

                <rect class="seatId 32A" x="35"  y="305" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 32B" x="70"  y="305" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 32C" x="105" y="305" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 32H" x="165" y="305" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 32J" x="200" y="305" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 32K" x="235" y="305" height="20" width="30" style="stroke:black; fill: white" />

                <rect class="seatId 33A" x="35"  y="330" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 33B" x="70"  y="330" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 33C" x="105" y="330" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 33H" x="165" y="330" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 33J" x="200" y="330" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 33K" x="235" y="330" height="20" width="30" style="stroke:black; fill: white" />

                <rect class="seatId 34A" x="35"  y="355" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 34B" x="70"  y="355" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 34C" x="105" y="355" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 34H" x="165" y="355" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 34J" x="200" y="355" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 34K" x="235" y="355" height="20" width="30" style="stroke:black; fill: white" />

                <rect class="seatId 35A" x="35"  y="380" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 35B" x="70"  y="380" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 35C" x="105" y="380" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 35H" x="165" y="380" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 35J" x="200" y="380" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 35K" x="235" y="380" height="20" width="30" style="stroke:black; fill: white" />

                <rect class="seatId 36A" x="35"  y="405" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 36B" x="70"  y="405" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 36C" x="105" y="405" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 36H" x="165" y="405" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 36J" x="200" y="405" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 36K" x="235" y="405" height="20" width="30" style="stroke:black; fill: white" />


                <text x="0" y="450" fill="red">37</text>
                <text x="0" y="475" fill="red">38</text>
                <text x="0" y="500" fill="red">39</text>
                <text x="0" y="525" fill="red">40</text>
                <text x="0" y="550" fill="red">41</text>
                <text x="0" y="575" fill="red">42</text>
                <text x="0" y="600" fill="red">43</text>
                <text x="0" y="625" fill="red">44</text>
                <text x="0" y="650" fill="red">45</text>
                <text x="0" y="675" fill="red">46</text>
                <text x="0" y="700" fill="red">47</text>
                <text x="0" y="725" fill="red">48</text>
                <text x="0" y="750" fill="red">49</text>


                <rect class="seatId 37B"x="70"  y="435" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 37C"x="105" y="435" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 37H"x="165" y="435" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 37J"x="200" y="435" height="20" width="30" style="stroke:black; fill: white" />


                <rect class="seatId 38A" x="35"  y="460" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 38B" x="70"  y="460" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 38C" x="105" y="460" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 38H" x="165" y="460" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 38J" x="200" y="460" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 38K" x="235" y="460" height="20" width="30" style="stroke:black; fill: white" />

                <rect class="seatId 39A" x="35"  y="485" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 39B" x="70"  y="485" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 39C" x="105" y="485" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 39H" x="165" y="485" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 39J" x="200" y="485" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 39K" x="235" y="485" height="20" width="30" style="stroke:black; fill: white" />

                <rect class="seatId 40A" x="35"  y="510" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 40B" x="70"  y="510" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 40C" x="105" y="510" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 40H" x="165" y="510" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 40J" x="200" y="510" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 40K" x="235" y="510" height="20" width="30" style="stroke:black; fill: white" />

                <rect class="seatId 41A" x="35"  y="535" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 41B" x="70"  y="535" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 41C" x="105" y="535" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 41H" x="165" y="535" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 41J" x="200" y="535" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 41K" x="235" y="535" height="20" width="30" style="stroke:black; fill: white" />

                <rect class="seatId 42A" x="35"  y="560" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 42B" x="70"  y="560" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 42C" x="105" y="560" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 42H" x="165" y="560" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 42J" x="200" y="560" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 42K" x="235" y="560" height="20" width="30" style="stroke:black; fill: white" />

                <rect class="seatId 43A" x="35"  y="585" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 43B" x="70"  y="585" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 43C" x="105" y="585" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 43H" x="165" y="585" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 43J" x="200" y="585" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 43K" x="235" y="585" height="20" width="30" style="stroke:black; fill: white" />

                <rect class="seatId 44A" x="35"  y="610" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 44B" x="70"  y="610" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 44C" x="105" y="610" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 44H" x="165" y="610" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 44J" x="200" y="610" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 44K" x="235" y="610" height="20" width="30" style="stroke:black; fill: white" />

                <rect class="seatId 45A" x="35"  y="635" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 45B" x="70"  y="635" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 45C" x="105" y="635" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 45H" x="165" y="635" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 45J" x="200" y="635" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 45K" x="235" y="635" height="20" width="30" style="stroke:black; fill: white" />

                <rect class="seatId 46A" x="35"  y="660" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 46B" x="70"  y="660" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 46C" x="105" y="660" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 46H" x="165" y="660" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 46J" x="200" y="660" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 46K" x="235" y="660" height="20" width="30" style="stroke:black; fill: white" />

                <rect class="seatId 47A" x="35"  y="685" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 47B" x="70"  y="685" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 47C" x="105" y="685" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 47H" x="165" y="685" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 47J" x="200" y="685" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 47K" x="235" y="685" height="20" width="30" style="stroke:black; fill: white" />

                <rect class="seatId 48A" x="35"  y="710" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 48B" x="70"  y="710" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 48C" x="105" y="710" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 48H" x="165" y="710" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 48J" x="200" y="710" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 48K" x="235" y="710" height="20" width="30" style="stroke:black; fill: white" />

                <rect class="seatId 49A" x="35"  y="735" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 49B" x="70"  y="735" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 49C" x="105" y="735" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 49H" x="165" y="735" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 49J" x="200" y="735" height="20" width="30" style="stroke:black; fill: white" />
                <rect class="seatId 49K" x="235" y="735" height="20" width="30" style="stroke:black; fill: white" />

            </svg>
        </div>
    </div>
</div>


</body>

<script>
    //首次进入这个页面时 接收后台传送过来的数据 已经选择的座位信息
    <c:forEach items="${select_seat}" var="seat">
    //设置已近选择的座位，为黑色
    document.getElementsByClassName("${seat}")[0].style.fill="black";
    </c:forEach>


    //点击查看满意度的代码
    var satisfaction=document.getElementById("satisfactionBtn");
    satisfaction.onclick=function () {
        if(satisfaction.innerHTML=="查看满意度"){
            satisfaction.innerHTML="看座位"

            //住在这里设置航班号
            var flight_number="b737_700";
            $.ajax({
                type:"POST", //请求方式
                url:"./satisfaction", //请求路径
                cache: false,
                data:{flight_number:flight_number},
                dataType: 'text',   //设置返回值类型
                success:function(e){
                    //返回的是一个字符串——31K zZz T ZzZ 32A zZz F
                    //ZzZ是座位之间的间隔
                    //zZz是座位号和满意之间的间隔
                    // alert(e);    //弹出返回过来的座位号我的写法是以zZz分割
                    //这样进行切割得到的是 31A zZz T
                    var seat_satisfaction_list=e.split("ZzZ");
                    for(var i=0;i<seat_satisfaction_list.length;i++){
                        //得到每一个子 字符串，再进行切割，第一个就是座位号，第二个就是是否满意，T满意，F不满意
                        var list=seat_satisfaction_list[i].split("zZz");
                        if(list[1]=="T"){
                            //满意就是绿色
                            document.getElementsByClassName(list[0])[0].style.fill="green";
                        }else {
                            //不满意就是红色
                            document.getElementsByClassName(list[0])[0].style.fill="red";
                        }
                    }
                }
            });//ajax——的结束
        }else {
            seat_black("green");
            seat_black("red");
            satisfaction.innerHTML="查看满意度"
        }//判断是否是查看满意度-结束
    }//点击查看满意度的按钮 结束

    //自定义一个函数来将所有 有人的座位颜色改变为黑色
    function seat_black(colors) {
        var seats=document.getElementsByClassName("seatId");

        for(let i=0;i<seats.length;i++){
            if(seats[i].style.fill==colors){
                seats[i].style.fill="black"
            }
        }
    }
</script>
</html>
