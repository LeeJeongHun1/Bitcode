<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/login.css" />
</head>
<body>
	<form id="loginUi">
	  <h1>Hello Bit Code !!</h1>
	  <input name="id" placeholder="UserId" type="text"/>
	  <input name="poassword" placeholder="Password" type="password"/>
	  <button class="btn">Log in</button>
	  <h1><span id="siciallogin">social login ?</span>
	  <span id="signup"><a href="${pageContext.request.contextPath}/login/signupForm.do">회원가입</a></span>
	  </h1>
	  <div class="social">
	  <button class="na btn">Naver</button>
	  <button class="ka btn">KaKaoTalk</button>
	  </div>
	</form>
	
	<script>
	$(document).ready(function(e){
		   $("#siciallogin").on('click',function(){
		      $('.social').stop().slideToggle();
		   });
		})
	</script>
</body>
</html>