/**
 * 
 */
//var cnt = 0;	
	$(function(){
		//ws = new WebSocket("ws://localhost/bitcode/websocket.do");
		ws = new WebSocket("wss://192.168.0.104/bitcode/websocket.do");
		ws.onopen = function(){
			console.log("웹소켓 서버 접속 성공");
			// 웹소켓 서버에 데이터 전송하기
			if(loginId){		    	
				ws.send("notice:" + loginId);
			}
		};
		 ws.onerror = function(evt) {
		   	    $(".details").prepend('웹소켓 에러 발생 : ' + evt.data)
		 };
		
		 ws.onmessage = function(evt) {
			
			// 알림 체크
			if((evt.data).startsWith("noticeA")){	
				var notice = (evt.data).split("noticeA:");
				var noticeA = '';
				noticeA += '<span class="title">' + notice[1] + '</span>';
				noticeA += '<span class="date">시간</span>';
		        $('li.notice1 div.details').html(noticeA);
		        var noticCnt = notice[2];
		        $('.notifications-count').html(noticCnt);
		        //$(".notice .details .title").data(id);
		        //$("notice").attr('data-fruit','7');
		       // $(".notice .details .title").append("<button type='button' class='noticeBtn button-default button-dismiss js-dismiss'>×</button>");
		        
			}
			
			if((evt.data).startsWith("noticeB")){	
				var notice = (evt.data).split("noticeB:");
				var noticeB = '';
				alert(notice[1]);
				noticeB += '<span class="title">' + notice[1] + '</span>';
				noticeB += '<span class="date">시간</span>';
		        $('li.notice2 div.details').html(noticeB);
		       // $(".notice2 .details .title").append("<button type='button' class='noticeBtn2 button-default button-dismiss js-dismiss'>×</button>");
			}			
			
			// 유저리스트 체크
			if((evt.data).startsWith("userList")){	
				var subId = (evt.data).split(":");
				$("#entranceUser").html("");
				for(var i=1; i<subId.length; i++){
					$("#entranceUser").append(subId[i] + "<br>");					
				}
				$("#entranceUser").scrollTop($("#entranceUser").height());			
			}
			
			// 입장 체크
			if((evt.data).startsWith("in")){
				var inmsg = (evt.data).split(":");
				$("#result").append(inmsg[1] + "<br>");
				$("#result").scrollTop($("#result").height());			
			}	
			
			// 퇴장 체크
			if((evt.data).startsWith("out")){
				var outmsg = (evt.data).split(":");
				$("#result").append(outmsg[1] + "<br>");
				$("#result").scrollTop($("#result").height());			
			}						
			
			// 메시지 체크
			if((evt.data).startsWith("chat")){
				var msg = (evt.data).split(":");
				$("#result").append(msg[1]+ " : " + msg[2]+"<br>");
				$("#result").scrollTop($("#result").height());			
			}			
			
	
	        console.log("메세지 전송")
	    };
		 ws.onclose = function(){
			 $(".details").prepend("웹소켓 연결이 종료됨");
		 };
		
	}) 
	
	$('#sendBtn').click(function() { 
    var $msg = $("#message");
    // 웹소켓 서버에 데이터 전송하기
    if($msg.val()!=""){
    	ws.send("chat:" + nick + ":" + $msg.val());
    	$msg.val("");    	
    }
	});

	$('#message').keypress(function(key) {
	if(key.which == 13){
		var $msg = $("#message");
		// 웹소켓 서버에 데이터 전송하기
	    if($msg.val()!=""){
	    	ws.send("chat:" + nick + ":" + $msg.val());
	    	$msg.val("");    	
	    }
	}
	});
