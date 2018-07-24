<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>chat</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chat/chat.css">    
</head>

<body>
	<div class="chatBody" style="height:600px">
	<div id="card1" class="card ten col">
		<div class="topbar orange">
		<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
		<div class="xbtn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">x</div>
		</div>
		<h1 class="information">채팅방</h1>
    <div class="chat" style="height:150px;">
        <h1 style="width:140px;margin-left:777px;font-size:20px;">사용자 목록</h1>
    <div id="chatResult" style="overflow:auto;text-align:left;margin-left:100px;width:620px;height:392px;float:left;border-style: dashed;border-width: 3px;border-color: orange;">
    </div>
	<div id="entranceUser" style="overflow:auto;width:200px;height:392px;float:left;margin-left:30px;border-style: dashed;border-width: 3px;border-color: orange;"></div>

	<div id="msgBox">
		<input type="text" id="message" name="message" style="width:520px;"/>
		<button class="btn btn-default" id="sendBtn" style="margin-bottom: 10px;margin-top: 5px;margin-left: 10px;">전송</button>
    	<button class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/main/main.do'" type="button" style="margin-left:110px;" >나가기</button>
	</div>
    </div>
	</div>
	</div>
<!--     <script src="assets/js/jquery.min.js"></script> -->
<!--         <script src="assets/bootstrap/js/bootstrap.min.js"></script> -->
<script>
$(".chatBody").draggable();
var nick = '${sessionScope.user.nickName}';
setTimeout(function(){
ws.send("in:"+nick + "님 입장");
}, 1000);

$(window).on("unload", function(e){
    if(nick != ""){
       ws.send("out:" + nick + "님 퇴장");
     }   
 });
</script>
<script src="${pageContext.request.contextPath}/resources/js/websocket/websocket.js"></script>
</body>
</html>