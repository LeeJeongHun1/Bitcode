<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remote</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/remote/remote.css">
<script src="http://192.168.0.104:10001/socket.io/socket.io.js"></script>
<style>
video{
	box-sizing: border-box;
}
</style>
</head>
<body>

<div class="embedded-container">
    <div class="embedded-player-az">
      <!-- the main interactions will be in the .core div-->
      <div class="media" style="position: relative;">
        <%-- 화면창 --%>
        <div class="screen media-left">
        <video class="remoteScreen"></video>
        </div>
        
		<%-- 대화창 --%>
		<!-- 
		<div class="chat media-right">
			<div class="bottom-bar">
				<input type="text" name="msg" id="msg" />
				<button id="msgBtn">메세지 전송</button>
			</div>
		</div>
		 -->
	
		<div class="chat media-right">
		<iframe src="http://192.168.0.104:10001">
		</iframe>
		</div>
		
      </div>
    </div>
  </div>
  
  <script src="https://cdn.rawgit.com/muaz-khan/getScreenId/master/getScreenId.js"></script>
  
	<script>
	
	$("#msgBtn").click(function() {
		alert(1);
		var msg = $("#msg");
		$.ajax({
			url: "http://192.168.0.104:10001",
			data: msg,
			success: function (result){
				console.log(result);
				$("#chat").html(result);
			}
		});
	});
	
	// 비디오 수신
	getScreenId((error, sourceId, screenConstraints) => {
	    if (error === 'not-installed') return alert('The extension is not installed');
	    if (error === 'permission-denied') return alert('Permission is denied.');
	    if (error === 'not-chrome') return alert('Please use chrome.');

	    navigator.mediaDevices.getUserMedia(screenConstraints)
	        .then(stream => {
	            const video = document.querySelector('video');
	            video.src = URL.createObjectURL(stream);
	            video.autoplay = true;
	            video.controls = true;
	            video.play();
	        })
	        .catch(err => {
	            console.log(err);
	        });
	});
	
	// 컨텐츠 스크립트 주입
	chrome.runtime.onConnect.addListener(port => {
    port.onMessage.addListener(msg => {
        if (msg.type === 'REQUEST_SCREEN_STREAM_ID') {
            requestScreenStreamId(port, msg);
        }
        // ...
    });
	});
	
	// 메시지 수신
	function requestScreenStreamId(port, msg) {
    const sendMessage = {};
    const tab = port.sender.tab;
    tab.url = msg.url;
	// chooseDesktopMedia 호출
    chrome.desktopCapture.chooseDesktopMedia(['screen'], tab, streamId => {
        if (streamId) {
            sendMessage.streamId = streamId;
            //...
        } else { // Stream Id를 가져오는데 실패한 경우
            //...
        }
    });
    port.postMessage(sendMessage);
	}

	</script>
</body>
</html>