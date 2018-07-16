/**
 * 
 */

var ws = null;
var loginId= null;

$(function () {
	ws = new WebSocket('ws://localhost/bitcode/chat.do');
	ws.onopen = function() {
		console.log("웹소켓 접속 성공");
	};
	ws.onmessage = function(evt) {
		$("#result").prepend(evt.data + "<br>");
	};
	ws.onerror = function(evt) {
		$("#result").prepend("웹소켓 에러 발생:" + evt.data)
	};
	ws.onclose = function() {
		$("#result").prepend("웹소켓 연결이 종료됨");
	};
	
	$("#msgBox, #logoutBox").hide();
	
});

$('#loginBtn').click(function() { 
	$.ajax({
		url: "<c:url value='/websocket/login.do' />",
		type: "POST",
		data: {
			id: $("#id").val(),
			pass: $("#pass").val()
		}
	})
	.done(function (result) {
		
		loginId = $("#id").val();
		
		$("#logoutBox > span").text(loginId);
		
		ws.send("login:" + loginId);
		
		$("#id").val("");
		$("#pass").val("");
		
		$("#loginBox, #msgBox, #logoutBox").toggle();
		
	});
});


$('#sendBtn').click(function() { 
    var $msg = $("#message");
    // 웹소켓 서버에 데이터 전송하기
    ws.send(loginId + ":" + $msg.val());
    $msg.val(""); 
});

$('#logoutBtn').click(function() { 
	$.ajax({
		url: "<c:url value='/websocket/logout.do' />"
	})
	.done(function (result) {
		
		ws.send("logout:" + loginId);
		
		$("#loginBox, #msgBox, #logoutBox").toggle();
		
		loginId = null;
		
		$("#result").html("");
	});
});