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
<script src="http://localhost:10001/socket.io/socket.io.js"></script>
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
        <video></video>
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
			url: "http://localhost:10001",
			data: msg,
			success: function (result){
				console.log(result);
				$("#chat").html(result);
			}
		});
	});
	
	const gotStream = screenStream => {
	    const videoElement = document.getElementById('video');
	    videoElement.src = URL.createObjectURL(screenStream);
	    videoElement.play();
	};

	const onFail = err => {
	    console.log(err);
	};

	window.addEventListener('message', event => {
	    const streamId = event.data.streamId;

	    if (streamId) {
	        navigator.mediaDevices.getUserMedia({
	            audio: false, // or true
	            video: {
	                mandatory: {
	                    chromeMediaSourceId: streamId,
	                    chromeMediaSource: 'desktop',
	                    maxWidth: window.screen.width,
	                    maxHeight: window.screen.height
	                    //...
	              }
	            }
	        })
	        .then(gotStream)
	        .catch(onFail);
	    } else {
	      //... stream Id 가져오기 실패
	    }
	});
	
	</script>
</body>
</html>