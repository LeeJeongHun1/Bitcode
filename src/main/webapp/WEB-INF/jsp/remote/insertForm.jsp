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
<link href='https://fonts.googleapis.com/css?family=Noto+Sans' rel='stylesheet' type='text/css'>
</head>
<body>
<body>

<div class="remoteForm">
 <form class="form-wrapper" action="${pageContext.request.contextPath}/remote/remote.do" method="post">
     <!-- 세션기능 완성 후 ID값 설정 추가 -->
     <input type="text" id="id" hidden="hidden" value="">
     
    <div class="window">
      <div class="middle">
      </div>
    </div>
    <h1 id="title">실시간 상담</h1>
    <p id="subject">회원님의 화면이 공유되며 상담이 진행됩니다.</p>
    <input type="text" id="question" placeholder="문의 내용을 입력하세요." required>
    <input type="submit" value="➔" id="remoteSend">
</form>
</div>    
    
</body>

</body>
</html>
