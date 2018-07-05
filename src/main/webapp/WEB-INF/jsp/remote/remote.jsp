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
</head>
<body>
<body>



<div class="embedded-container">
    <div class="embedded-player-az">
      <!-- the main interactions will be in the .core div-->
      <div class="media" style="position: relative;">
        <%-- 화면창 --%>
        <div class="screen media-left">
        
        </div>
		<%-- 대화창 --%>
		<div class="chat media-right">
			<div class="bottom-bar">
				<input type="text" name="msg" id="msg" />
				<button id="msgBtn">메세지 전송</button>
			</div>
		</div>
      </div>
    </div>
  </div>
	
</body>

</body>
</html>