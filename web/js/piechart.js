function piechart(a,b) {

    if (a==0 && b==0){
        return;
    }
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
                    {value:a, name:'满意',itemStyle:{color:'green'}},//数据量，名字,颜色
                    {value:b, name:'不满意',itemStyle:{color:'red'}},//数据量，名字,颜色
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
}