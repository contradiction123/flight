var canGetCookie = 0; //是否支持存储Cookie 0 不支持 1 支持
var CodeVal = 0;
Code();
function Code() {
    if (canGetCookie == 1) {
        createCode("AdminCode");
        var AdminCode = getCookieValue("AdminCode");
        showCheck(AdminCode);
    } else {
        showCheck(createCode(""));
    }
}

function showCheck(a) {
    CodeVal = a;
    var c = document.getElementById("myCanvas");
    var ctx = c.getContext("2d");
    ctx.clearRect(0, 0, 1000, 1000);
    ctx.font = "80px 'Hiragino Sans GB'";
    ctx.fillStyle = "rgb(115,115,90)";
    ctx.fillText(a, 0, 100);
}

//生成验证码
var code = "";
function createCode(e) {
    code = "";
    var codeLength = 4;
    var selectChar = new Array(1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
    for (var i = 0; i < codeLength; i++) {
        var charIndex = Math.floor(Math.random() * 60);
        code += selectChar[charIndex];
    }
    if (code.length != codeLength) {
        createCode(e);
    }
    if(canGetCookie == 1){
        setCookie(e, code, 60 * 60 * 60, '/');
    }else{
        return code;
    }
}

function login() {

    var uid = document.getElementById("uid");
    var password = document.getElementById("pass");
    var ValidateNum = document.getElementById("code");
    var from = document.getElementById("login");
    if (uid.value != null && password.value != null && ValidateNum.value != null) {
        if (ValidateNum.value.toUpperCase() == CodeVal.toUpperCase()) {
            $('#myModal2').modal('hide');
            addsvg();
            from.submit();

        } else {

            alert("验证码输入错误");

            Code();
        }
    } else {
        alert("用户名或者密码错误");

    }
}
$(document).keypress(function(e) {
    // 回车键事件
    if (e.which == 13) {
        $('#log_on').click();
    }
});

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