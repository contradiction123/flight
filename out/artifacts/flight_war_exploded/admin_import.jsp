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
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
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
    </style>
</head>

<body>
<!--判断是不是非法进入-->
<c:if test="${msg.user_name == null}">
    <script>
        alert("非法访问");
        window.history.back(-1);
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
                <li><a href="<c:url value="/admin" />"><i class="fa fa-dashboard"></i>首页</a></li>
                <li class="active"><a href="<a href="<c:url value="/admin_user" />"><i class="fa fa-bar-chart-o"></i> 用户管理</a></li>
                <li><a href="#"><i class="fa fa-table"></i> 机型售卖情况</a></li>
                <li><a href="#"><i class="fa fa-edit"></i> 用户满意度</a></li>
                <li><a href="<c:url value="/admin_import" /> "><i class="fa fa-font"></i> 整机迁移</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-caret-square-o-down"></i> Dropdown <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Dropdown Item</a></li>
                        <li><a href="#">Another Item</a></li>
                        <li><a href="#">Third Item</a></li>
                        <li><a href="#">Last Item</a></li>
                    </ul>
                </li>
            </ul>

            <!--管理员选项-->
            <ul class="nav navbar-nav navbar-right navbar-user">
                <li class="dropdown user-dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><c:out value="${msg.user_name}" /> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><i class="fa fa-gear"></i> 设置</a></li>
                        <li class="divider"></li>
                        <li><a href="#"><i class="fa fa-power-off"></i> 退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <h1>整机迁移信息</h1>
            </div>
        </div><!-- /.row -->
        <!--用户列表-->
        <div class="row">
            <div class="col-lg-8">
                <form method="post" action="./skip">
                    <table class="table table-striped" >
                        <thead>
                        <tr>
                            <th name="id">ID</th>
                            <th name="type_one">ONE</th>
                            <th name="type_two">TWO</th>
                            <th name="team">TEAM</th>
                        </tr>
                        </thead>
                        <tbody id="testTab"></tbody>
                    </table>
                    <input type="file" id="xlf">
                    <pre id="out" style="display: none;"></pre>
                    <input type="text" name="flight_number" value="b737_700" class="jsons" >
                    <button type="button" id="submitbtn">确认导入</button>
                </form>
            </div>
        </div>

    </div><!-- /#page-wrapper -->

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
        var $testTab = $("#testTab");
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

        for (var n in vJson) {
            for (var k = 1; k < vJson[n].length; k++) {
                var str = "<tr>";

                var jsonObj = {};

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

                $testTab.append(str);
                //str.parentNode.removeChild(str);
                //document.fileForm.submit();

            }
        };

        var json1=new Array();
        var j={};
        j["passenger_flight_number"]="b737_700";//航班号
        j["passenger_num"]=i;//人数
        j["passenger_info"]=passenger_info;//个人座位需求信息
        json1.push(j);

        alert(i);

        $("#submitbtn").click(function () {
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

                    // // alert(e);    //弹出返回过来的座位号我的写法是以zZz分割
                    // var seat_id_list=e.split("zZz");
                    // //seat_id_list的长度之所以减一，是在每一个的字符串后都是以zZz结尾，
                    // // 所以在字符串切割的时候回造成一个多余的字符串
                    // //所以长度减一
                    // for(let i=0;i<seat_id_list.length-1;i++){
                    //     // alert(seat_id_list[i]); //弹出每一个位置
                    //
                    //     //为每一个位置的颜色都设置为当前选择的，蓝色
                    //     document.getElementsByClassName(seat_id_list[i])[0].style.fill="blue";
                    // }
                }
            });//ajax——的结束


        })
    }
</script>

</body>
</html>