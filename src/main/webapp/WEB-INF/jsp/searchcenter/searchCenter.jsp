<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Search Center</title>
<meta name="viewport" 
      content="width=device-width, user-scalable=no, initial-scale=1">
<meta charset="utf-8">
<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script src="${pageContext.request.contextPath}/resources/js/searchcenter/searchcenter.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/searchcenter/searchcenter.css">
</head>
<body>
<form>
	<input type="button" id="watch" value="watch" />
	<input type="button" id="clearWatch" value="clearWatch" />
</form>

<div id="location">
당신의 현재 위치
</div>

<div id="distance">
강남역과의 거리 : 
</div>

<div id="map">
</div>

</body>
</html>