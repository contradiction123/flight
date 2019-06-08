$(".col-id").keyup(function (e) {
    var a=$(".col-id").index(this);

    if(document.getElementsByClassName("col-id")[a].value.length>0){
        if(a<$(".col-id").length-1){
            var s=parseInt(a)+1;
            document.getElementsByClassName("col-id")[s].focus();
        }
    }


});

$(".start-col").keyup(function (e) {
    var a=$(".start-col").index(this);
    if(a<$(".start-col").length-1){
        var s=parseInt(a)+1;
        document.getElementsByClassName("start-col")[s].focus();
    }
});
$(".start-row").keyup(function (e) {
    var a=$(".start-row").index(this);
    if(a<$(".start-row").length-1){
        var s=parseInt(a)+1;
        document.getElementsByClassName("start-row")[s].focus();
    }
});
$(".seat-id").click(function () {
    var a=$(".seat-id").index(this);
    if(document.getElementsByClassName("svg")[a].style.visibility=="hidden"){
        document.getElementsByClassName("svg")[a].style.visibility="visible";
    }else {
        document.getElementsByClassName("svg")[a].style.visibility="hidden";//visible
    }
});