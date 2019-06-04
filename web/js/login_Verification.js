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
    ctx.fillStyle = "rgb(26, 82, 204)";
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
            from.submit();
        } else {
            alert("验证码输入错误");
        }
    } else {
        alert("请输入账号和密码！");
    }
}
$(document).keypress(function(e) {
    // 回车键事件
    if (e.which == 13) {
        $('#log_on').click();
    }
});