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

    <script src="<c:url value="/jquery/jquery.min.js" />"></script>
    <script src="<c:url value="/bootstrap-3.3.7-dist/js/bootstrap.min.js" />"></script>
    <link rel="stylesheet" type="text/css" href="js/jquery.step.css" />
    <script src="js/jquery.step.min.js"></script>
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
            background: rgba(0,0,0,0.5);
            left:0px
        }
        .main{
            padding-top: 15px;
        }
        .side-nav{
            top: 98px;
            position: fixed;
            z-index: -100;
        }
        .sidebar{
            margin-top: 84px;
            position: fixed;
            right: 0px;
        }
        .topMenu{
            padding: 20px 0;
            height: 80px;
            margin-left: 10%;

        }
        .head_color{
            background-color: #304f89;

        }
        .head_bar{
            position: relative;
            margin-top: 90px;
            margin-right:90px;
        }
        #wrappera{
            padding-left: 125px;
        }
    </style>
</head>


<body>



<div class="wrapper" id="wrappera">

    <!-- 侧边栏 -->
    <nav class="navbar navbar-inverse navbar-fixed-top " role="navigation">
        <div class="navbar-header topMenu">
            <img style="width: 50px;" src="<c:url value="/img/logo.png"/> " />
            <h1 style=" float: right; line-height: 10px; margin-left: 20px;margin-top:20px;">Eyat</h1>
        </div>

        <!-- 左侧栏列表-->
        <div class="collapse navbar-collapse navbar-ex1-collapse head_color">

            <%--添加一个用户图标到用户名旁边 还没弄好--%>
            <div style="float: right;">
                <svg class="icon" style="width: 1em; height: 1em;vertical-align: middle;fill: currentColor;overflow: hidden;fill-color:red; transform:scale(1.5);" viewBox="0 0 1024 1024" version="1.1"><path d="M511.997 597.333c125.778 0 241.87-109.881 254.883-270.586C780.487 158.596 668.816 0 511.997 0 355.184 0 243.506 158.596 257.124 326.747 270.131 487.452 386.225 597.333 511.997 597.333zM509.719 684.073C228.208 684.073 0 796.019 0 934.112c0 47.221 43.411 65.423 171.081 79.221C269.777 1024 387.61 1024 512 1024c127.414 0 253.777 0 342.675-10.667 125.756-15.09 169.325-32 169.325-79.221C1024 796.019 791.22 684.073 509.719 684.073z" p-id="1301"></path></svg>
            </div>
            <!--管理员选项-->
            <ul class="nav navbar-nav navbar-right navbar-user">

                <li class="dropdown user-dropdown" style="height: 80px;">

                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #fff;font-size: 36px;line-height: 200%;height: 80px;"><i class="fa fa-user"></i><c:out value="${msg.user_name}" /> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><i class="fa fa-gear"></i> 设置</a></li>
                        <li class="divider"></li>
                        <li><a href="<c:url value="/out"/>"><i class="fa fa-power-off"></i> 退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
    <div class="head_bar">
        <div id="step"></div>
    </div>
    <div id="page-wrapper">
        <div class="row col-lg-10" style="margin-left: 10%;">
            <div id="flight-box">
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

<script>
    var flight_number="<c:out value="${flightmodel.getName()}"/>";
    var sellSeat=new Array();
    var sellk=0;
    <c:forEach items="${seatlist}" var="seat">
    sellSeat[sellk++]="${seat}";
    </c:forEach>




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
<script type="text/javascript">
    var $step = $("#step");
    var $index = $("#index");

    $step.step({
        index: 2,
        time: 500,
        title: ["选择航班", "选择座位", "查看座位"]
    });

    $index.text($step.getIndex());

    $("#prevBtn").on("click", function() {
        $step.prevStep();
        $index.text($step.getIndex());
    });

    $("#nextBtn").on("click", function() {
        $step.nextStep();
        $index.text($step.getIndex());
    });

    $("#btn1").on("click", function() {
        $step.toStep(1);
        $index.text($step.getIndex());
    });

    $("#btn2").on("click", function() {
        $step.toStep(2);
        $index.text($step.getIndex());
    });
</script>
</body>
</html>


