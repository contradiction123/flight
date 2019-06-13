<%--
  Created by IntelliJ IDEA.
  User: s8534
  Date: 2019/4/18
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%--b737_700--%>
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

    <!-- Add custom CSS here -->
    <link href="<c:url value="css/admin.css" />" rel="stylesheet">
    <!-- Page Specific CSS -->
    <link rel="stylesheet" href="<c:url value="/css/morris-0.4.3.min.css" />">

    <style>
        #flight-information{
            width: 100%;
            height: 300px;
            margin-bottom: 10%;
        }
        .table-flight{
            transform-origin:0 0;
            font-size: 22px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: rotate(-90deg) translateX(-100%) translate(-50%,-50%);
            text-align: center;
        }
        td{
            margin: 0px;
            height: 25px;
            width: 35px;
        }
        .seat-id:hover{
            background: rgba(255,0,0,0.5);
        }
        #flight-information{
            display: flex;
            width: 100%;
        }
        #flight-information>div{
            width: 20%;
            height: 100%;
        }
        #flight-information>div:nth-child(2){
            width: 20%;
            font-style: italic;
            font-family: -webkit-body;
            font-size: 17px;
        }
        #flight-information>div:nth-child(2)>div{
            margin-top: 10px;
        }
        #flight-information>div:nth-child(4){
            width: 50%;
        }
        .button{
            height: 66px;
            font-size: 20px;
            border-radius: 15px;
            font-family: cursive;
            margin-top: 10px;
        }
        .hoverBig:hover{
            transform: scale(1.2);
        }
    </style>
</head>


<body>
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
                <li class="active"><a href="<c:url value="/admin_flight" /> "><i class="fa fa-table"></i> 机型管理</a></li>
                <li><a href="<c:url value="/admin_satisfaction" /> "><i class="fa fa-edit"></i> 用户满意度</a></li>
                <li><a href="<c:url value="/admin_import" />"><i class="fa fa-font"></i> 一键导入乘客</a></li>
                <li><a href="<c:url value="/admin_create_flight.jsp" />"><i class="fa fa-font"></i> 创建新飞机</a></li>
            </ul>
            <!--管理员选项-->
            <ul class="nav navbar-nav navbar-right navbar-user">
                <li class="dropdown user-dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <c:out value="${msg.user_name}" /> <b class="caret"></b></a>
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
        <%--<input type="text" id="sell-seat" value="<c:out value="${seatstring}"/>">--%>
        <%--<input type="text" id="seatliststring" value="<c:out value="${seatstring}"/>">--%>
        <div class="row col-lg-10" style="margin-left: 10%;">
            <div id="flight-box">
                <div id="flight-information">
                    <div class="col-lg-8">
                        <h2>航班型号:</h2><br>
                        <h2 style="float: left" class="hoverBig"><c:out value="${flightmodel.getName()}"/></h2>
                    </div>
                    <div id="flightInformation">
                        <div class="hoverBig">座位总数：<span><c:out value="${flightmodel.getRow()*flightmodel.getCol()}"/></span></div>
                        <div class="hoverBig">以售卖数：<span><c:out value="${satasfiactionlist.get(0)+satasfiactionlist.get(1)}"/></span></div>
                        <div class="hoverBig">未售卖数：<span><c:out value="${(flightmodel.getRow()*flightmodel.getCol())-(satasfiactionlist.get(0)+satasfiactionlist.get(1))}"/></span></div>
                        <div class="hoverBig">满意人数：<span><c:out value="${satasfiactionlist.get(0)}"/></span></div>
                        <div class="hoverBig">不满意人数：<span><c:out value="${satasfiactionlist.get(1)}"/></span></div>
                        <div class="hoverBig">满意比例为：<span id="satafiactionlv"></span></div>
                    </div>
                    <div id="flightTools">
                        <div><button class="btn-block button hoverBig" id="selectSatasfiaction">查看满意度</button></div>
                        <div><button class="btn-block button hoverBig" id="selectAllot">查看分配过程</button></div>
                    </div>
                    <div id="baiduEcharts">
                        <div id="pieecheart" style="height: 100%"></div>
                    </div>
                </div>
                <div id="flight-table">

                </div>
            </div>
        </div><!-- /.row -->

    </div><!-- /#page-wrapper -->

    <div class="row" style="display: none;">
        <div class="col-lg-5" style="margin-top: 35%;">
            <div id="piechart" style="height: 300px;"></div>
        </div>
    </div>

</div><!-- /#wrapper -->


<!-- JavaScript -->
<script src="<c:url value="/jquery/jquery.min.js" />"></script>
<script src="<c:url value="/bootstrap-3.3.7-dist/js/bootstrap.min.js" />"></script>


<!-- Page Specific Plugins -->
<script src="<c:url value="js/raphael-min.js" />"></script>
<script src="<c:url value="js/morris-0.4.3.min.js" />"></script>
<script src="<c:url value="js/morris/chart-data-morris.js" />"></script>
<script src="<c:url value="js/tablesorter/jquery.tablesorter.js" />"></script>
<script src="<c:url value="js/tablesorter/tables.js" />"></script>
<script>
    var flight_number="<c:out value="${flightmodel.getName()}"/>";
    var sellSeat=new Array();
    var sellk=0;
    <c:forEach items="${seatlist}" var="seat">
        sellSeat[sellk++]="${seat}";
    </c:forEach>

    var satasfiactionT=<c:out value="${satasfiactionlist.get(0)}"/>;
    var satasfiactionF=<c:out value="${satasfiactionlist.get(1)}"/>;

    var s=Math.round(satasfiactionT/(satasfiactionF+satasfiactionT)*10000);
    if(s>0){
        document.getElementById("satafiactionlv").innerHTML=(s/100)+"%";
    }else {
        document.getElementById("satafiactionlv").innerHTML="";
    }


    var delete_seat="<c:out value="${flightmodel.getDelete_seat()}"/>";
    var dseat=delete_seat.split(",");
    var x=parseInt(<c:out value="${flightmodel.getRow()}"/>);
    var y=parseInt(<c:out value="${flightmodel.getCol()}"/>);
    var count=0;
    var str="";
    var sr="<c:out value="${flightmodel.getRow_aisle()}"/>";
    var start_aisle_row=sr.split(",");
    var strat_number=<c:out value="${flightmodel.getStart_number()}"/>
    var sc="<c:out value="${flightmodel.getSeat()}"/>";
    var start_aisle_col=sc.split(",");
    var col_aisle_count=0;
    var col_aisle_list=new Array();
    var jiange_list=new Array();
    var jgk=0;
    for(let i=0;i<start_aisle_col.length-1;i++){
        for(let j=0;j<start_aisle_col[i].length;j++){
            col_aisle_list[col_aisle_count++]=start_aisle_col[i].charAt(j)+"";
        }
        jiange_list[jgk++]=col_aisle_count-1;
    }

    for(let i=0;i<=x;i++){

        var judge_row=0;
        for(let z=0;z<start_aisle_row.length;z++){
            if(parseInt(start_aisle_row[z])==(parseInt(strat_number)+count))
            {
                judge_row=1;
                break;
            }
        }


        if(i==0){
            str+="<tr><td class=\"seat-col\"></td>";
            for(let j=0;j<y;j++){
                var judge_col=0;
                for(let z=0;z<jgk-1;z++){
                    if(parseInt(jiange_list[z])==j)
                    {
                        judge_col=1;
                        break;
                    }
                }

                str+="<td>"+col_aisle_list[j].toUpperCase()+"</td>";
                if(judge_col!=0){
                    str+="<td></td>"
                }
            }
            str+="<td class=\"seat-col\"></td></tr>";
        }else {
            str+="<tr><td class=\"seat-col\">"+(parseInt(strat_number)+count)+"</td>";
            for(let j=0;j<y;j++){
                var judge_col=0;
                for(let z=0;z<jgk-1;z++){
                    if(parseInt(jiange_list[z])==j)
                    {
                        judge_col=1;
                        break;
                    }
                }


                var dseatjudeg=0;
                for(let i=0;i<dseat.length-1;i++){
                    if((parseInt(strat_number)+count)+col_aisle_list[j].toUpperCase()==dseat[i]){
                        dseatjudeg=1;
                        break;
                    }
                }
                if(dseatjudeg==0){
                    str+="<td style='position: relative'><span class=\"tt \"><svg class=\"icon svg\" style=\"width: 1em; height: 1em;vertical-align: middle;fill: currentColor;overflow: hidden;\"                      viewBox=\"0 0 1024 1024\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" p-id=\"1056\">                     " +
                        "<path class='seatId "+((parseInt(strat_number)+count)+col_aisle_list[j].toUpperCase())+" colorss' d=\"M192 394.752V202.752c0-35.328 28.672-64 64-64h512c35.328 0 64 28.672 64 64                     v192h42.496c35.328 0 64 28.672 64 64v363.008c0 35.328-28.672 64-64 64H149.504c-35.328 0-64-28.672-64-64                     V458.752c0-35.328 28.672-64 63.488-64h43.008z\" fill=\"#fff\" p-id=\"1057\"></path>                     <path d=\"M192 394.752V202.752c0-35.328 28.672-64 64-64h512c35.328 0 64 28.672 64 64                     v192h42.496c35.328 0 64 28.672 64 64v363.008c0 35.328-28.672 64-64 64                     H149.504c-35.328 0-64-28.672-64-64V458.752c0-35.328 28.672-64 63.488-64                     h43.008z m597.504 0V202.752c0-11.776-9.216-21.504-20.992-21.504                     H256c-11.776 0-20.992 9.728-20.992 21.504v192c35.328 0 64 28.672 64 64v                     170.496c0 11.776 9.728 21.504 20.992 21.504h384.512c11.776 0 20.992-9.728 20.992-21.504                     V458.752c-0.512-35.328 28.16-64 64-64-0.512 0-0.512 0 0 0zM128 458.752v363.008c0 11.776 9.728 20.992 21.504                      20.992h724.992c11.776 0 21.504-9.728 21.504-20.992V458.752c0-11.776-9.728-20.992-21.504-20.992h-85.504                     c-11.776 0-21.504 9.728-21.504 21.504V629.76c0 35.328-28.672 64-64 64H320c-35.328 0-64-28.672-64-64V                     458.752c0-11.776-9.728-21.504-21.504-21.504H149.504c-11.776 0-21.504 9.216-21.504 21.504 0-0.512 0 0 0 0z\" p-id=\"1058\">                 </path></svg></span>\n";
                    str+="<div style='position: absolute;width: 100%;height: 100%;z-index: 10;transform: translateY(-100%);' " +
                        "class='seat-id' id='"+((parseInt(strat_number)+count)+col_aisle_list[j].toUpperCase())+"'></div></td>";

                }else {
                    str+="<td style='position: relative'></td>";
                }

                if(judge_col!=0){
                    str+="<td></td>"
                }
            }
            str+="<td class=\"seat-col\">"+((parseInt(strat_number)+count))+"</td></tr>";
            count++;
        }
        if(judge_row!=0){
            str+="<tr><td></td></tr>";
        }
    }

    $("#flight-table").append(
        //style="height:'+w+';width:'+h+';"
        '<table border="0px" class="table-flight" >'+str+
        '</table>'
    )

    for(var i=0;i<sellk;i++){
        document.getElementsByClassName(sellSeat[i])[0].style.fill="#56a1ff";
    }
</script>

<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>
<script type="text/javascript">
    var dom = document.getElementById("pieecheart");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    app.title = '环形图';

    option = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            x: 'right',
            data:['满意','不满意']
        },
        series: [
            {
                name:'用户满意度',
                type:'pie',
                radius: ['40%', '70%'],
                avoidLabelOverlap: false,
                label: {
                    normal: {
                        show: false,
                        position: 'center'
                    },
                    emphasis: {
                        show: true,
                        textStyle: {
                            fontSize: '30',
                            fontWeight: 'bold'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data:[
                    {value:satasfiactionT, name:'满意'},
                    {value:satasfiactionF, name:'不满意'},
                ]
            }
        ]
    };
    ;
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>

<script>

    //点击查看满意度的代码
    var satisfaction=document.getElementById("selectSatasfiaction");
    satisfaction.onclick=function () {
        if(satisfaction.innerHTML=="查看满意度"){
            satisfaction.innerHTML="看座位";

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
                seats[i].style.fill="#56a1ff"
            }
        }
    }

    //自定义函数清空座位，意思就是把所有的座位颜色改变为灰色
    function clear_seat(){
        var seats=document.getElementsByClassName("seatId");
        for(let i=0;i<seats.length;i++){
            seats[i].style.fill="#f2fcff";
        }
    }

    //点击查看分配过程
    document.getElementById("selectAllot").onclick=function () {
        clear_seat();
        //获取显示div的id

        $.ajax({
            type:"POST", //请求方式
            url:"./allotcourse", //请求路径
            cache: false,
            data:{flight_number:flight_number},
            dataType: 'text',   //设置返回值类型
            success:function(e){
                //返回的是一个字符串——
                // team zZz allotcourse zZz user_id zZz seat_id zZz user_id zZz seat_id YyY team zZz allotcourse zZz user_id zZz seat_id zZz user_id zZz seat_id
                //ZzZ是座位之间的间隔
                //zZz是座位号和满意之间的间隔
                // alert(e);    //弹出返回过来的座位号我的写法是以zZz分割
                //这样进行切割得到的是 31A zZz T
                var seat_satisfaction_list=e.split("YyY");

                var count=0;

                var asetinterval=setInterval(function () {
                    // console.log(seat_satisfaction_list[count]);
                    fn(seat_satisfaction_list[count++]);
                    if(count==seat_satisfaction_list.length-1){
                        clearInterval(asetinterval);
                    }
                },100)

            }
        });//ajax——的结束

    }

    //闭包延迟执行for
    function fn(string) {
        //得到每一个子 字符串，再进行切割，
        var list=string.split("zZz");
        // 第一个就是团队号，team
        // 第二个就是分配的先后顺序 allotcourse
        //第三个是用户账户
        //第四个是座位号
        //……………………三四循环，直到团队人全部显示完毕
        // display.innerHTML+="团队负责人:"+list[0]+"<br>";
        // for(let j=2,jj=1;j<list.length-1;j+=3,jj++){
        //     display.innerHTML+="成员"+(jj)+":"+list[j]+"座位是"+list[j+1]+"满意度："+list[j+2]+"<br>";
        // }
        for(let j=2;j<list.length-1;j+=3){
            var seat=document.getElementsByClassName(list[j+1])[0];
            var par=seat.parentNode;
            par.style.transform="scale(3)";
            if(list[j+2]=="T"){
                seat.style.fill="green";
            }else {
                seat.style.fill="red";
            }
        }
        setTimeout(function(){
            for(let j=2;j<list.length-1;j+=3){
                var seat=document.getElementsByClassName(list[j+1])[0];
                var par=seat.parentNode;
                par.style.transform="scale(1.5) ";
            }
        }, 100);
    }
</script>

</body>
</html>


