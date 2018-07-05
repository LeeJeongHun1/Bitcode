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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/remote/remoteForm.css">
</head>
<body>
<body>

<div class="remoteForm">
 <form class="form-wrapper">
 	<input type="text" id="id" hidden="hidden" value="">
    <input type="text" id="question" placeholder="문의내용을 입력하세요." required>
    <input type="submit" value="상담신청" id="remoteSend">
</form>
</div>	
	
</body>

</body>
</html>