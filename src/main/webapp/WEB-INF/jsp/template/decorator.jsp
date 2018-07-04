<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main/footer.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board/detail.css">

<%-- favicon --%>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon" />


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