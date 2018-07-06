<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/mustache.js/0.7.2/mustache.min.js'></script>
<script src="${pageContext.request.contextPath}/resources/js/notify/index.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/notify/notify.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/waitme/waitMe.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/sweetalertFile/sweetalert2.all.min.js"></script>

<%-- 하단메뉴 --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main/footer.css">




<%-- favicon --%>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon" />

<%-- 부트스트랩 --%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<%-- 알림 --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/notify/style.css">
<title><sitemesh:write property="title" /></title>
<sitemesh:write property="head" />
<style>
.content{
	overflow-y: scroll;
}
</style>
</head>
<body>
		<div class="header">
			<c:import url="/WEB-INF/jsp/decorator/topMenu.jsp" />
		</div>
	
		<div class="content">
			<sitemesh:write property="body" />
		</div>
		
		<div class="footer">
			<c:import url="/WEB-INF/jsp/decorator/footer.jsp" />
		</div>
		
		
		
		
		
		
</body>


</html>