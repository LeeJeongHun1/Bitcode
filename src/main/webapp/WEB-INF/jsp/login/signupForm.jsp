<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/signup.css" />
<link rel="stylesheet" href="/bitcode/sweetalertFile/sweetalert2.css" />
<script src="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.all.min.js"></script>
</head>
<body>
	<form action="${pageContext.request.contextPath}/login/signup.do" method="post" id="userForm">
	  <h1 id="#signup">Sign UP! <img src="${pageContext.request.contextPath}/resources/images/signupIcon.png"></h1>
	  <input name="id" placeholder="ID를 입력하세요" type="text" id="userId" data-flag="no" class="inputDetail" maxlength="15"/>
	  <p class="innerText"></p>
	  <input name="name" placeholder="이름을 입력하세요" type="text" id="userName" data-flag="no" class="inputDetail" maxlength="15"/>
	  <p class="innerText"></p>
	  <input name="nickName" placeholder="Nick name을 입력하세요" type="text" id="nickName" data-flag="no" class="inputDetail" maxlength="15"/>
	  <p class="innerText"></p>
	  <input name="password" placeholder="비밀번호를 입력하세요" type="password" id="userPass" data-flag="no" class="inputDetail" maxlength="16"/>
	  <p class="innerText"></p>
	  <input name="conformpass" placeholder="비밀번호를  재입력하세요" type="password" id="userPassCheck" data-flag="no" class="inputDetail" maxlength="16"/>
	  <p class="innerText"></p>	  
	  <input name="email" placeholder="Email을 입력하세요" type="text" id="userEmail" data-flag="no" class="emailDetail"/>
	  <p class="innerText"></p>
	  <input name="birthday" placeholder="생년월일 입력하세요" type="text" id="userBirth" data-flag="no" class="inputDetail" />
	  <p class="innerText"></p>
<!-- 	  <button class="btn" id="submitBtn">Sign UP</button> -->
	  <div id="submitBox">
	 	 <a href="#1" id="submitBtn"><span class="signupbtn">Sign UP</span></a>
	  </div>
	</form>
<script src="${pageContext.request.contextPath}/resources/js/signUp/signUp.js"></script>
</body>
</html>