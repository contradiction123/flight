<%--
  Created by IntelliJ IDEA.
  User: fanxi
  Date: 2019/5/26
  Time: 9:18
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

    <title>航班分配系统后台管理</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/bootstrap-3.3.7-dist/css/bootstrap.min.css" />" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.14.2/dist/bootstrap-table.min.css">
    <script src="https://unpkg.com/bootstrap-table@1.14.2/dist/bootstrap-table.min.js"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <!-- Add custom CSS here -->
    <link href="<c:url value="css/admin.css" />" rel="stylesheet">
    <!-- Page Specific CSS -->
    <link rel="stylesheet" href="<c:url value="/css/morris-0.4.3.min.css" />">
    <style>
        th {
            text-align: center;
        }
        td {
            text-align: center;
            height: 50px;
        }
        .table tbody tr td{
            vertical-align: middle;
        }
        .page{
            padding: 5px;
            width: 40px;
            height: 40px;
            line-height: 30px;
            text-align: center;
            border: #cccccc solid 1px;
        }
        .page:hover{
            background-color: #327AB7;
            color: #ffffff;
        }
        .select1 {
            float: left;
        }

        body,
        html {
            height: 100%;
            width: 100%;

        }
        #mainSVG {
            width: 100%;
            height: 100%;
            /*display: none;*/
            z-index: 100;
            position: absolute;
            top: 0px;
            background: rgba(0,0,0,0.5);
        }
        .table-box{
            width: 100%;
        }
        .allpage{
            font-size: 15px;
            line-height: 40px;
            margin-left: 10px;
        }
    </style>
</head>

<body>
<!--判断是不是非法进入-->
<c:if test="${msg.user_name == null}">
    <script>
        alert("非法访问");
        window.location.href='<c:url value="/login" />';
    </script>
</c:if>

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
                <li><a href="<c:url value="/admin_flight" /> "><i class="fa fa-table"></i> 机型管理</a></li>
                <li><a href="<c:url value="/admin_satisfaction" /> "><i class="fa fa-edit"></i> 用户满意度</a></li>
                <li class="active"><a href="<c:url value="/admin_import" />"><i class="fa fa-font"></i> 一键导入乘客</a></li>
                <li><a href="<c:url value="/admin_create_flight.jsp" />"><i class="fa fa-font"></i> 创建新飞机</a></li>
            </ul>
            <!--管理员选项-->
            <ul class="nav navbar-nav navbar-right navbar-user">
                <li class="dropdown user-dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><c:out value="${msg.user_name}" /> <b class="caret"></b></a>
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

        <div class="row">
            <div class="col-lg-12" style="margin-bottom: 20px;">
                <h1>导入乘客信息</h1>
            </div>
        </div><!-- /.row -->
        <!--用户列表-->
        <div class="row">
            <div class="col-lg-8 table-box">
                <input type="file" id="xlf" class="select1">
                <pre id="out" style="display: none;"></pre>

                <form method="get" action="./display" class="col-lg-3">
                    <select id="flight_number" name="flight" class="form-control select1">
                        <c:forEach items="${flight}" var="flight">
                            <option value="<c:out value="${flight.name}"/>"><c:out value="${flight.name}"/>&nbsp;&nbsp;有<c:out value="${flight.null_seat}"/>个空座位</option>
                        </c:forEach>
                    </select>
                </form>
                <c:forEach items="${flight}" var="flight">
                    <input type="hidden" class="nullseat" value="<c:out value="${flight.null_seat}"/>">
                </c:forEach>
                <button type="button" class="btn btn-primary" id="submitbtn">确认导入</button>

                <div id="tablelist" style="position: relative;width: 100%">

                </div>

                <div id="pages" style="position: relative;width: 50%;margin: 0 auto;display: flex">

                </div>
            </div>
        </div>

    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->
<i id="mysvg"></i>

<script src='<c:url value="/js/TweenMax.min.js"/>'></script>
<script src='<c:url value="/js/MorphSVGPlugin.min.js"/>'></script>

<!-- JavaScript -->
<script src="<c:url value="/jquery/jquery.min.js" />"></script>
<script src="<c:url value="/bootstrap-3.3.7-dist/js/bootstrap.min.js" />"></script>


<!-- Page Specific Plugins -->
<script src="<c:url value="js/raphael-min.js" />"></script>
<script src="<c:url value="js/morris-0.4.3.min.js" />"></script>
<script src="<c:url value="js/morris/chart-data-morris.js" />"></script>
<script src="<c:url value="js/tablesorter/jquery.tablesorter.js" />"></script>
<script src="<c:url value="js/tablesorter/tables.js" />"></script>
<script type="text/javascript"  src="js/ga.js"></script>
<script type="text/javascript"  src="js/shim.js"></script>
<script type="text/javascript"  src="js/xlsx.full.min.js"></script>
<script type="text/javascript"  src="js/jquery.js"></script>
<script>
    var X = XLSX;

    var global_wb;

    var process_wb = (function() {
        var OUT = document.getElementById('out');
        var HTMLOUT = document.getElementById('htmlout');
        var to_json = function to_json(workbook) {
            var result = {};
            workbook.SheetNames.forEach(function(sheetName) {
                var roa = X.utils.sheet_to_json(workbook.Sheets[sheetName], {
                    header: 1
                });
                //var roa = X.utils.sheet_to_json(workbook.Sheets[sheetName]);
                if (roa.length) result[sheetName] = roa;
            });
            return JSON.stringify(result, 2, 2);
        };

        return function process_wb(wb) {
            global_wb = wb;
            var output = "";
            output = to_json(wb);
            if (OUT.innerText === undefined) OUT.textContent = output;
            else OUT.innerText = output;
            dealJson(output);
        };
    })();


    var do_file = (function() {
        return function do_file(files) {
            var f = files[0];
            var reader = new FileReader();
            reader.onload = function(e) {
                var data = e.target.result;
                data = new Uint8Array(data);
                process_wb(X.read(data, {
                    type: 'array'
                }));
            };
            reader.readAsArrayBuffer(f);
        };
    })();
    (function() {
        var xlf = document.getElementById('xlf');
        if (!xlf.addEventListener) return;

        function handleFile(e) {
            do_file(e.target.files);
        }
        xlf.addEventListener('change', handleFile, false);

    })();
</script>

<script type="text/javascript">
    function dealJson(sJson) {
        var vJson = eval('(' + sJson + ')');
        var $testTab = $("#tablelist");
        var conCout = 4
        var i = 0;
        var string_name = new Array("id", "type_one", "type_two","team");

        //这个是js创建的json模板
        // var json1=[{"passenger_num":userName.length,
        //             "passenger_flight_number":b737_700,
        //             "passenger_info":[
        //             {"id":"3","type_one":"window","type_second":"aisle"},
        //             {"id":"4","type_one":"child","type_second":"window"},
        //             {"id":"5","type_one":"aisle","type_second":"door"}
        //     ]}]


        //首先定义passenger_info的数组拿来存放每一个人选择位置的信息
        var passenger_info = new Array();

        var count=0;
        var informationcount=0;
        var tabledate="<div class=\"tablepage\" style=\"position: absolute; width: 100%;left: 0px;\"><table class=\"table table-striped\" ><thead><tr><th name=\"id\">ID</th><th name=\"id\">USER_ID</th><th name=\"type_one\">ONE</th><th name=\"type_two\">TWO</th><th name=\"team\">TEAM</th></tr></thead><tbody class=\"testTab\">";
        for (var n in vJson) {
            var str="";
            for (var k = 1; k < vJson[n].length; k++) {


                var jsonObj = {};

                if((k-1)%10==0){
                    count++;
                    str+= tabledate+"<tr>";
                }else {
                    str+="<tr>"
                }
                informationcount++;
                str += "<td josnval='' class='number' value='" + informationcount + "'>"+informationcount+"</td>";
                for (let c = 0; c < conCout; c++) {
                    var tm = vJson[n][k][c] == undefined ? "" : vJson[n][k][c];
                    // str += "<td><input type='text' id='lz" + n + "' value='" + tm + "'></td>";
                    str += "<td josnval='' class='" + string_name[c] + "' value='" + tm + "'>"+tm+"</td>";

                    if(string_name[c]=="id")jsonObj["Id"]=tm;
                    if(string_name[c]=="type_one")jsonObj["type_one"]=tm;
                    if(string_name[c]=="type_two")jsonObj["type_second"]=tm;
                    if(string_name[c]=="team"){
                        jsonObj["team"]=tm;
                        passenger_info.push(jsonObj);
                    }

                }
                i++;
                str += "</tr>";
                if(k%10==0 || k==vJson[n].length-1){
                    str+="</tbody></table></div>";
                    // console.log(str);
                    $testTab.append(str);
                    str="";
                }
                //str.parentNode.removeChild(str);
                //document.fileForm.submit();
            }
        };
        var tablepage=$(".tablepage");
        for(var i=1;i<tablepage.length;i++){
            tablepage[i].style.display="none";
        }

        document.getElementById("pages").style.marginTop = (parseInt(window.getComputedStyle(tablepage[0]).height) + 10)+'px';

        str="";
        for(let i=1;i<=count;i++){
            str="<div class=\"page text-center\">"+i+"</div>"
            $("#pages").append(str);
        }
        str="<div class=\"allpage text-center\">共"+count+"页，"+informationcount+"条记录</div>"
        $("#pages").append(str);
        var page=$(".page");

        page[0].style.backgroundColor="#327AB7";
        page[0].style.color="#fff";

        for(let i=0;i<page.length;i++){
            page[i].onclick=function () {
                for(var j=0;j<tablepage.length;j++){
                    tablepage[j].style.display="none";
                    page[j].style.backgroundColor="#fff";
                    page[j].style.color="#000";

                }
                tablepage[i].style.display="inline";
                page[i].style.backgroundColor="#327AB7";
            }
        }



        var json1=new Array();
        var j={};

        //点击了确认导入
        $("#submitbtn").click(function () {
            var seat_null=document.getElementsByClassName("nullseat");
            var numIndex=document.getElementById("flight_number").selectedIndex;
            if(informationcount<=parseInt(seat_null[numIndex].value)){
                addsvg();
                var flight_model = document.getElementById("flight_number");
                var flight_name = flight_model.options[flight_model.selectedIndex].value;

                j["passenger_flight_number"]=flight_name//航班机型
                j["passenger_num"]=passenger_info.length;//人数
                j["passenger_info"]=passenger_info;//个人座位需求信息
                json1.push(j);
                // console.log(json1);
                // 使用ajax用post的方式传到后台进行处理，为每一个人分配位置
                $.ajax({
                    type:"POST", //请求方式
                    url:"./allAllotservlet", //请求路径
                    cache: true,
                    data:{//传参_传递刚才创建的json1数组
                        "jsonArr":json1,
                    },
                    dataType: 'text',   //设置返回值类型
                    success:function(e){
                        document.getElementsByTagName("form")[0].submit();

                    }
                });//ajax——的结束
            }else {
                alert("导入的人数大于本航班的空余座位，请重新选择航班");
            }

        })




    }
</script>

<script>
    function  addsvg() {
        $("#mysvg").append(
            '<svg id="mainSVG" viewBox="0 0 800 600">'+
            '<defs>'+
            '<circle id="dot" cx="0" cy="0" r="5" fill="#fff" />'+
            '</defs>'+
            '<circle id="mainCircle" fill="none" stroke="none" stroke-width="2" stroke-miterlimit="10" cx="400" cy="300" r="70" />'+
            '<circle id="circlePath" fill="none" stroke="none" stroke-width="2" stroke-miterlimit="10" cx="400" cy="300" r="80" />'+
            '<g id="mainContainer">'+
            '<path id="plane" fill="#FFF" d="M38.1,19.6c0.2-0.2,0.3-0.5,0.3-0.7s-0.1-0.6-0.3-0.7c-1.2-1-2.8-1.6-4.4-1.6l-8.7,0L12.2,0L8.2,0l6.3,16.5	l-5.9,0c-0.5,0-1.1,0.1-1.6,0.4L3.1,11L0,11l3.1,7.9L0,26.7l3.1,0l3.9-5.9c0.5,0.3,1,0.4,1.6,0.4l5.9,0L8.2,37.7h3.9l13-16.5l8.7,0	C35.4,21.2,36.9,20.6,38.1,19.6"'+
            '/>'+
            '</g>'+
            '</svg>'
        )

        var script = document.createElement("script");
        script.id="mainsvgsrc1";
        script.src = "js/TweenMax.min.js";
        document.body.appendChild(script);
        var script = document.createElement("script");
        script.id="mainsvgsrc2";
        script.src = "js/MorphSVGPlugin.min.js";
        document.body.appendChild(script);
        var script = document.createElement("script");
        script.id="mainsvgsrc3";
        script.src = "jquery/jquery.min.js";
        document.body.appendChild(script);
        var script = document.createElement("script");
        script.id="mainsvgsrc4";
        script.src = "js/mysvg.js";
        document.body.appendChild(script);
    }
    function clearsvg() {

        var my=document.getElementById("mainsvgsrc1");
        my.parentNode.removeChild(my);
        var my=document.getElementById("mainsvgsrc2");
        my.parentNode.removeChild(my);
        var my=document.getElementById("mainsvgsrc3");
        my.parentNode.removeChild(my);
        var my=document.getElementById("mainsvgsrc4");
        my.parentNode.removeChild(my);
        var my=document.getElementById("mainSVG");
        my.parentNode.removeChild(my);
    }
</script>

</body>
</html>