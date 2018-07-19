<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIT CODE</title>
<%-- favicon --%> 
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/music/player.css">
</head>
<body>

	<div class="musicBody">
		<div id="card1" class="card ten col">
			<div class="topbar blue">
				<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
				<div class="xbtn" onclick="callMain();">x</div>
			</div> 
			
			<h3 class="userInformation">내 음악</h3>
			
<!-- 			<audio src='download.do?path=" + encodeURI(path) + "&fileName="+fileName'> -->
			<audio id="myMusic" controls="controls" autoplay="autoplay" loop>
			
			</audio>
			<div class="musicList">
				
			</div>
			
		</div>

	</div>
	
<script>

	$(".musicBody").draggable();
	
	function callMain() {
		//window.opener.location.href = '${pageContext.request.contextPath}/main/main.do';
		self.close();
	};
	console.dir($("#myMusic"))
	$.ajax({
		url: "musicList.json",
		dataType: "json",
		data: {
			id: `${sessionScope.user.id}`
		}
	})
	.done(function (result) {
		var html = '';
		for(let f of result){
			html += '<div>'+f.title+'</div>'
		}
		$(".musicList").html(html);
		$("#myMusic").attr('src',
				'${pageContext.request.contextPath}/main/download.do?path=' + encodeURI(`c:/java-lec/upload/music_${sessionScope.user.id}`) + '&fileName='+result[0].title+'')
		$("#myMusic").attr('autoplay', 'autoplay')
	})

</script>
</body>
</html>