var myApp=new Framework7({});var $$=Framework7.$;var mainView=myApp.addView('.view-main',{dynamicNavbar:true});$$(document).on('pageInit',function(e){var page=e.detail.page;})
$$(document).on('pageInit','.page[data-page="form"]',function(e){myApp.alert('Here comes About page');})
$$('.action1').on('click',function(){myApp.alert('Action 1');});$$('.action2').on('click',function(){myApp.alert('Action 2');});var songs=['Yellow Submarine','Don\'t Stop Me Now','Billie Jean','Californication'];var authors=['Beatles','Queen','Michael Jackson','Red Hot Chili Peppers'];var ptrContent=$$('.pull-to-refresh-content');ptrContent.on('refresh',function(e){setTimeout(function(){var picURL='img/i-f7-material.png';var song=songs[Math.floor(Math.random()*songs.length)];var author=authors[Math.floor(Math.random()*authors.length)];var itemHTML='<li class="item-content">'+
'<div class="item-media"><img src="'+picURL+'" width="44"/></div>'+
'<div class="item-inner">'+
'<div class="item-title-row">'+
'<div class="item-title">'+song+'</div>'+
'</div>'+
'<div class="item-subtitle">'+author+'</div>'+
'</div>'+
'</li>';ptrContent.find('ul').prepend(itemHTML);myApp.pullToRefreshDone();},2000);});$$('.form-from-json').on('click',function(){var formData=myApp.formToJSON('#my-form');alert(JSON.stringify(formData));});$$('.form-from-json1').on('click',function(){var formData={'name':'John','email':'john@doe.com','gender':'female','switch':['yes'],'slider':10}
myApp.formFromJSON('#my-form1',formData);});var myPhotoBrowserStandalone=myApp.photoBrowser({swipeToClose:true,theme:'dark',backLinkText:'关闭',lazyLoading:true,lazyLoadingOnTransitionStart:true,photos:[{url:'http://lorempixel.com/1024/1024/sports/1/',caption:'标题1'},{url:'http://lorempixel.com/1024/1024/sports/2/',caption:'标题2'},{html:'<div style="width: 500px;height: 200px;background: #ccc;">1111111111111111</div>',caption:'标题3'}]});$$('.pb-standalone').on('click',function(){myPhotoBrowserStandalone.open();});myApp.upscroller('Go up');