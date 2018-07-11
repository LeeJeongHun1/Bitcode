<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/login.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.css" />
<script src="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/waitme/waitMe.min.css" />
<script src="${pageContext.request.contextPath}/resources/js/waitme/waitMe.min.js"></script>
</head>
<body>
	<div id="loginUi">
		<form action="${pageContext.request.contextPath}/login/login.do" method="post" id="userForm">
		  <h1>Hello Bit Code !!</h1>
		  <input name="id" placeholder="UserId" type="text"/>
		  <input name="password" placeholder="Password" type="password"/>
		  <button class="btn">Log in</button>
		  <span id="forgetid">Forget ID?</span>
		  <span id="forgetpass">Forget Password?</span><br><br>
		  <span id="siciallogin">social login ?</span>
		  <span id="signup"><a href="${pageContext.request.contextPath}/login/signupForm.do">회원가입</a></span><br>
		</form>
	<div class="social">
	<button class="na btn">Naver</button>
	<button class="ka btn">KaKaoTalk</button>
	</div>
</div>	
<script src="${pageContext.request.contextPath}/resources/js/loginform/loginForm.js"></script>
</body>
</html>