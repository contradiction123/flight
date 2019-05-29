<%--
  Created by IntelliJ IDEA.
  User: s8534
  Date: 2019/5/29
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html style="height: 100%">
<head>
    <meta charset="utf-8">
    <title>echarts</title>

    <style>
        #box{
            width: 80%;
            height: 500px;
            margin: 0 auto;
            display: flex;
            border: #0f0f0f 1px solid;
            margin-top: 50px;
        }
        #piechart{
            width: 50%;
            height: 100%;
        }
        #linechart{
            width:50%;
            height: 100%;
            border-left: #2aabd2 1px solid;
        }
    </style>
</head>
<body style="height: 100%; margin: 0">

<div id="box">
    <div id="piechart"></div>
    <div id="linechart"></div>
</div>


</body>

<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
<!-- <script type="text/javascript" src="https://api.map.baidu.com/api?v=20&ak=xfhhaTThl11qYVrqLZii6w8qE5ggnhrY&__ec_v__=20190126"></script> -->
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>
<%--满意度的饼状图piechart--%>
<script type="text/javascript">
    var dom = document.getElementById("piechart");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    option = {
        title : {
            text: '用户满意度',
            subtext: '数据来自数据库',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'right',
            bottom:'bottom',
            data: ['满意','不满意']
        },
        series : [
            {
                name: '是否满意',
                type: 'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:[
                    {value:120, name:'满意',itemStyle:{color:'green'}},//数据量，名字,颜色
                    {value:20, name:'不满意',itemStyle:{color:'red'}},//数据量，名字,颜色
                ],

                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(255, 255, 255, 0.8)'
                    }
                }
            }
        ],


    };
    ;
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>
<%--用户喜好座位属性的和安排的属性图--%>
<script type="text/javascript">
    var dom = document.getElementById("linechart");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    app.title = '乘客座位属性图';

    option = {
        title: {
            text: '乘客座位属性',
            subtext: '数据来自数据库'
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        legend: {
            data: ['理想属性', '安排属性']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: {
            type: 'value',
            boundaryGap: [0, 0.01]
        },
        yAxis: {
            type: 'category',
            data: ['过道(aisle)','中间(middle)','门口(door)','窗户(windows)','贵宾(vip)','带小孩(child)']
        },
        series: [
            {
                name: '理想属性',
                type: 'bar',
                data: [50, 5, 20, 50, 10, 6]
            },
            {
                name: '安排属性',
                type: 'bar',
                data: [50, 40, 10, 30, 5, 4]
            }
        ]
    };
    ;
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>
</html>
