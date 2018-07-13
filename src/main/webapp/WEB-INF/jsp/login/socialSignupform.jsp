<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/socialSignup.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.css" />
<script src="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/waitme/waitMe.min.css" />
<script src="${pageContext.request.contextPath}/resources/js/waitme/waitMe.min.js"></script>
</head>
<body>
	<form action="${pageContext.request.contextPath}/login/signup.do" method="post" id="userSocialForm">
	  <h1 id="#signup">Sign UP! <img src="${pageContext.request.contextPath}/resources/images/signupIcon.png"></h1>
	 	<p id="commentSignup">더 나은 이용을 위해서는 사용자의 정보가 필요합니다.</p>
	  <input name="id" placeholder="ID를 입력하세요" type="text" id="userId" data-flag="no" class="inputDetail" value="${id}" />
	  <p class="innerText"></p>
	  <input name="name" placeholder="이름을 입력하세요" type="text" id="userName" data-flag="no" class="inputDetail" value="${name}"/>
	  <p class="innerText"></p>
	  <input name="nickName" placeholder="Nick name을 입력하세요" type="text" id="nickName" data-flag="no" class="inputDetail" value="${nickName}"/>
	  <p class="innerText"></p>
	  <input name="email" placeholder="Email을 입력하세요" type="text" id="userEmail" data-flag="no" class="inputDetail" value="${email}"/>
	  <p class="innerText"></p>
	  <input name="birthday" placeholder="생년월일 입력하세요" type="text" id="userBirth" data-flag="no" class="inputDetail" />
	  <p class="innerText"></p>
<!-- 	  <button class="btn" id="submitBtn">Sign UP</button> -->
	  <div id="submitBox">
	 	 <a href="#1" id="submitBtn"><span class="signupbtn">Sign UP</span></a>
	  </div>
	</form>
<script src="${pageContext.request.contextPath}/resources/js/signUp/socialSignup.js"></script>
<script>
if("${msg}") {
	swal("${msg}")
}
</script>
</body>
</html>