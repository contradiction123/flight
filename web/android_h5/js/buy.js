

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

$("#sure_add").click(function () {
    sureClick();
});

function sureClick() {
    if($("#name").val().length>1){
        if(isselect>1){
            document.getElementById("name").style.border="2px solid #ced4da";

            var type_attribute=new Array(2);
            var typek=0;
            if(storage[0].checked)type_attribute[typek++]="child";
            if(storage[1].checked)type_attribute[typek++]="vip";
            if(storage1[0].checked)type_attribute[typek++]="windows";
            if(storage1[1].checked)type_attribute[typek++]="door";
            if(storage1[2].checked)type_attribute[typek++]="middle";
            if(storage1[3].checked)type_attribute[typek++]="aisle";
            if(storage2[0].checked)type_attribute[typek++]="windows";
            if(storage2[1].checked)type_attribute[typek++]="door";
            if(storage2[2].checked)type_attribute[typek++]="middle";
            if(storage2[3].checked)type_attribute[typek++]="aisle";

            // alert($("#name").val()+","+type_attribute[0]+","+type_attribute[1]);
            addusertype($("#name").val(),type_attribute[0],type_attribute[1]);
            
            if($(".swipeout").length==8){
                $(".add:eq(0)").attr("disabled",true);
            }
        }else{
            document.getElementsByClassName("modal-body")[0].style.border="2px solid red";
        }

    }else {
        $("#name").focus();
        document.getElementById("name").style.border="2px solid red";
    }
}

$($("#name")).keydown(function(event){

    if($("#name").val().length>1){
        document.getElementById("name").style.border="2px solid #ced4da";
    }

});
$(".addbtn").click(function(){
    var iuser=new Array($(".iuser").length);
    var ione=new Array($(".iuser").length);
    var isecond=new Array($(".iuser").length);
    var flight_number=$(".flight_number:eq(0)").find('span').text();

    //首先定义passenger_info的数组拿来存放每一个人选择位置的信息
    var passenger_info = new Array();


    //首先获取每一个人的想要的位置信息
    for(let i=0;i<$(".iuser").length;i++){
        //获取到后在存进passenger_info对象里面
        var jsonObj = {};
        user_name+=document.getElementsByClassName("iuser")[i].innerHTML+",";
        jsonObj["Id"]=document.getElementsByClassName("iuser")[i].innerHTML;
        jsonObj["type_one"]=document.getElementsByClassName("ione")[i].innerHTML;
        jsonObj["type_second"]=document.getElementsByClassName("isecond")[i].innerHTML;
        passenger_info.push(jsonObj);

    }//获取每一个人选择的信息——结束

    //新建一个json数组并存进航班号和有多少个人和每一个人的选座信息
    //这里位置顺序不能弄乱因为在后台是按照顺序读取的
    var json1=new Array();
    var j={};
    j["passenger_flight_number"]=flight_number;//航班号
    j["passenger_num"]=$(".iuser").length;//人数
    j["passenger_info"]=passenger_info;//个人座位需求信息
    json1.push(j);

    //使用ajax用post的方式传到后台进行处理，为每一个人分配位置
    $.ajax({
        type:"POST", //请求方式
        url:"../android/android_Ticket", //请求路径
        cache: false,
        data:{//传参_传递刚才创建的json1数组
            "jsonArr":json1,
        },
        dataType: 'text',   //设置返回值类型
        success:function(e){

            document.getElementById("f_number").value=flight_number;
            document.getElementById("f_name").value=user_name;

            var list=e.split("zZz");

            var seat_l="";

            for(let i=1;i<list.length-2;i++){
                seat_l+=list[i]+",";
            }
            document.getElementById("f_seat").value=seat_l;
            document.getElementById("f_seatlist").value=list[list.length-2];

            document.getElementById("display").submit();

        }
    });//ajax——的结束

});
function addusertype(x,y,z) {
    $("ul").append(
        '<li class="swipeout" >'+
        '<div class="item-content">'+
        '<div class="item-inner">'+
        '<div class="item-title label">' +
        '<div class="user_id_type">' +
        '<div>账号：<i class="iuser">'+x+'</i></div>' +
        '<div><span class="attribute_type">成人票</span></div>' +
        '</div>' +
        '<div class="user_id_type1">' +
        '<div>主要属性：<i class="ione">'+y+'</i></div>' +
        '<div><span class="attribute_type">次要属性：<i class="isecond">'+z+'</i></span></div>' +
        '</div>' +
        '</div>'+
        '</div>'+
        '<div class="swipeout-actions-right">'+
        '<a href="#" class="swipeout-delete">删除</a>'+
        '</div>'+
        '</div>'+
        '</li>'

    );
    
    $('.item-input').each(function(i){
        $(this).find('img:first').attr('id','zoom'+i)
        $(this).find('img:first').next().attr('id','add'+i)
    })
    $(".swipeout-delete").click(function () {
        // var a=$('.swipeout-delete').index(this);
        userconut--;
        if(userconut<8){
            $(".add:eq(0)").attr("disabled",false);
        }
    });


}