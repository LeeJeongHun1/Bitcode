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
	<form>
	  <h1><span>Life's</span> Good</h1>
	  <input placeholder="Username" type="text"/>
	  <input placeholder="Password" type="password"/>
	  <button class="btn">Log in</button>
	  <h1><span id="sicial">Oh, social?</span><span id="signup">회원가입</span></h1>
<!-- 	  <h6>Oh, social?</h6> -->
	  <div class="social">
	  <button class="na btn">Naver</button>
	  <button class="ka btn">KaKaoTalk</button>
	  </div>
	</form>
	
	<script>
	$(document).ready(function(e){
		   $("#sicial").on('click',function(){
		      $('.social').stop().slideToggle();
		   });
		})
	</script>
</body>
</html>