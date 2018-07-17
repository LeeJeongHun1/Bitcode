/**
 * 
 */

var ws = null;

$(function () {
	ws = new WebSocket('ws://192.168.10.101/bitcode/chat.do');
	ws.onopen = function() {
		console.log("웹소켓 접속 성공");
		ws.send("login:" + loginId);
		console.log(loginId);
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
});

$('#sendBtn').click(function() { 
    var $msg = $("#message");
    // 웹소켓 서버에 데이터 전송하기
    ws.send(loginId + ":" + $msg.val());
    $msg.val(""); 
});
