<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>chat</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
	<div id="msgBox">
		<input type="text" id="message" name="message" />
		<button id="sendBtn">메세지 보내기</button>
	</div>
	
	<div id="result"></div>
	
	<div class="container" style="color:#80FF00; background-color: black; height:600px">
    <div class="container" style="height:150px;">
        <h1 class="text-center" style="margin-top:50px;">대화방</h1>
        <h1 style="width:140px;margin-left:800px;font-size:20px;">사용자 목록</h1>
    </div>
    <div class="container" style="width:900px;height:392px;"><img style="width:605px;height:374px;"></img><img style="height:374px;margin-left:54px;"></img></div><input type="text" style="background-color:black; margin-left:140px;width:520px;">
    <button style="margin-left:25px; background-color: black" >전송</button>
    <button class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/main/main.do'" type="button" style="margin-left:100px;">나가기</button>
    <script
        src="assets/js/jquery.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
	</div>
<script>
var loginId= '${sessionScope.user.id}';
</script>
<script src="${pageContext.request.contextPath}/resources/js/chat/chat.js"></script>

</body>

</html>