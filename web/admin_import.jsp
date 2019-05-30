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
            border: #0f0f0f solid 1px;
        }
        .page:hover{
            background-color: #2aabd2;
        }
    </style>
</head>

<body>
<!--判断是不是非法进入-->
<c:if test="${msg.user_name == null}">
    <script>
        alert("非法访问");
        window.location.href="http://localhost:8080/flight/login";
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
                <li><a href="<c:url value="/admin_user" />"><i class="fa fa-bar-chart-o"></i> 用户管理</a></li>
                <li><a href="#"><i class="fa fa-table"></i> 机型管理</a></li>
                <li><a href="#"><i class="fa fa-edit"></i> 用户满意度</a></li>
                <li class="active"><a href="<c:url value="/admin_import" /> "><i class="fa fa-font"></i> 一件导入乘客</a></li>
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
                <input type="file" id="xlf">
                <pre id="out" style="display: none;"></pre>


                <form method="post" action="./skip">
                    <select id="flight_number" name="flight_number">
                        <c:forEach items="${flight}" var="flight">
                            <option value="<c:out value="${flight.name}"/>"><c:out value="${flight.name}"/></option>
                        </c:forEach>
                    </select>
                </form>

                <button type="button" id="submitbtn">确认导入</button>

                <div id="tablelist" style="position: relative;width: 100%">

                </div>

                <div id="pages" style="position: relative;width: 50%;margin: 0 auto;display: flex">

                </div>
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

        var tabledate="<div class=\"tablepage\" style=\"position: absolute; width: 100%\"><table class=\"table table-striped\" ><thead><tr><th name=\"id\">ID</th><th name=\"type_one\">ONE</th><th name=\"type_two\">TWO</th><th name=\"team\">TEAM</th></tr></thead><tbody class=\"testTab\">";
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
            str="<div class=\"page\">"+i+"</div>"
            $("#pages").append(str);
        }

        var page=$(".page");

        page[0].style.backgroundColor="#2aabd2";

        for(let i=0;i<page.length;i++){
            page[i].onclick=function () {
                for(var j=0;j<tablepage.length;j++){
                    tablepage[j].style.display="none";
                    page[j].style.backgroundColor="#fff";
                }
                tablepage[i].style.display="inline";
                page[i].style.backgroundColor="#2aabd2";
            }
        }



        var json1=new Array();
        var j={};

        //点击了确认导入
        $("#submitbtn").click(function () {

            var flight_model = document.getElementById("flight_number");
            var flight_name = flight_model.options[flight_model.selectedIndex].value;

            j["passenger_flight_number"]=flight_name//航班机型
            j["passenger_num"]=i;//人数
            j["passenger_info"]=passenger_info;//个人座位需求信息
            json1.push(j);

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