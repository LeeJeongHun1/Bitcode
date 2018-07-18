/**
 * 
 */
//var cnt = 0;	
	$(function(){
		ws = new WebSocket("ws://localhost/bitcode/websocket.do");
		//ws = new WebSocket("wss://192.168.0.104/bitcode/notification.do");
		 ws.onerror = function(evt) {
		   	    $(".details").prepend('웹소켓 에러 발생 : ' + evt.data)
		 };
		ws.onmessage = function(evt) {
			
			// 알림 체크
			if((evt.data).startsWith("notice")){	
				var notice = (evt.data).split("notice");
				$(".details").html("");				
		        $(".details").prepend(notice);				
			}			
			
			// 유저리스트 체크
			if((evt.data).startsWith("userList")){	
				var subId = (evt.data).split(":");
				$("#entranceUser").html("");
				$("#entranceUser").append(subId);
				$("#result").scrollTop($("#result").height());			
			}
			
			// 입장 체크
			if((evt.data).startsWith("in")){
				$("#result").append(evt.data + "<br>");
				$("#result").scrollTop($("#result").height());			
			}						
			
			// 메시지 체크
			if((evt.data).startsWith("chat")){
				$("#result").append(evt.data + "<br>");
				$("#result").scrollTop($("#result").height());			
			}			
			
	
		

			
	        console.log("메세지 전송")
	    };
		 ws.onclose = function(){
			 $(".details").prepend("웹소켓 연결이 종료됨");
		 };
		ws.onopen = function(){
			console.log("웹소켓 서버 접속 성공");
		    // 웹소켓 서버에 데이터 전송하기
		    if(loginId){		    	
			    ws.send(loginId);
		    }
		};
		
	}) 
