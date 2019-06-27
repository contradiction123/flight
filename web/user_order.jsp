<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: s8534
  Date: 2019/6/27
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <button id="but">123</button>
</body>
<script src="<c:url value="/jquery/jquery.min.js" />"></script>
    <SCRIPT>
        var btn=document.getElementById("but");

        btn.onclick=function () {

            var numcount=2;//循环次数

            var employees='[';

            for ( var j = 0; j < numcount; j++) {
                employees+= '{';

                employees+="\"user_id\":\"111\",";

                employees+="\"flight_number\":\"b737_700\",";

                employees+="\"seat_number\":\"31A\",";

                employees+="\"start_site\":\"chengdu\",";

                employees+="\"end_site\":\"beijing\",";

                employees+="\"start_time\":\"2019-9-9 08:00\",";

                employees+="\"end_time\":\"2019-9-9 10:00\"";

                employees +='}';

                if(j!=numcount-1){
                    employees+=','
                };
            }
            employees+=']';

            alert(employees);
            $.ajax({
                type:"POST", //请求方式
                url:"./userorder", //请求路径
                cache: true,
                data:{//传参_传递刚才创建的json1数组
                    employees,
                },
                dataType: 'text',   //设置返回值类型
                success:function(e){
                   alert(e);
                }
            });//ajax——的结束
        }
    </SCRIPT>
</html>
