<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Search Center</title>
<meta name="viewport" 
      content="width=device-width, user-scalable=no, initial-scale=1">
<meta charset="utf-8">
<script src="https://maps.google.com/maps/api/js?sensor=false"></script>
<script src="${pageContext.request.contextPath}/resources/js/searchcenter/searchcenter.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/searchcenter/searchcenter.css">
</head>
<body>
<div class="mapBody">

	<div id="card1" class="card six col">
		<div class="topbar green">
		<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
		<div class="xbtn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">x</div>
		</div>
<div class="map">
<form>
	<input type="button" id="watch" value="찾기" />
<!-- 	<input type="button" id="clearWatch" value="clearWatch" /> -->
</form>

<div id="location">
당신의 현재 위치
</div>

<div id="distance">
비트캠프 강남지점까지의 거리 : 
</div>

<div id="map" style="margin-left: 100px;border-style: dashed;border-width: 3px;border-color: green;">
</div>

</div>
</div>
</div>
<script>
$(".mapBody").draggable();
</script>
</body>
</html>