/**
 * 
 */

var ws = null;


$(function () {
	ws = new WebSocket('ws://localhost/bitcode/chat.do');
	ws.onopen = function() {
		console.log("웹소켓 접속 성공");
		ws.send(loginId + "님 입장");
		$("#result").scrollTop($("#result").height());
//		$("#entranceUser").append(loginId+"님");
		console.log(loginId);
	};
	ws.onmessage = function(evt) {
		if((evt.data).startsWith("userList")){	
			var subId = (evt.data).split(":");
			$("#entranceUser").html("");
			$("#entranceUser").append(subId);
			$("#result").scrollTop($("#result").height());			
		}
		else{
			$("#result").append(evt.data + "<br>");
			$("#result").scrollTop($("#result").height());			
		}

	};
	ws.onerror = function(evt) {
		$("#result").append("웹소켓 에러 발생:" + evt.data);
		$("#result").scrollTop($("#result").height());
	};
	ws.onclose = function() {
		$("#result").append("웹소켓 연결이 종료됨");
		$("#result").scrollTop($("#result").height());
	};	
});

$('#sendBtn').click(function() { 
    var $msg = $("#message");
    // 웹소켓 서버에 데이터 전송하기
    ws.send(loginId + ":" + $msg.val());
    $msg.val(""); 
});

$('#message').keypress(function(key) {
	if(key.which == 13){
		var $msg = $("#message");
		// 웹소켓 서버에 데이터 전송하기
		ws.send(loginId + ":" + $msg.val());
		$msg.val(""); 
	}
});

