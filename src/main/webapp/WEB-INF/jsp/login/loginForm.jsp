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
	<script>
	
	//로그인 실패시 alert창 뜸.
		if ("${msg}") { 
			alter("${msg}");
		} 
		
	$(document).ready(function(e){
		   $("#siciallogin").on('click',function(){
		      $('.social').stop().slideToggle();
		   });
		   
		})

		
	//ID 찾기
	var findId;
	$("#forgetid").on('click',function () {
		swal.mixin({
		  input: 'text',
		  confirmButtonText: '전송',
		  showCancelButton: true,
		  progressSteps: ['1', '2']
		}).queue([
		  {
		    title: '이름을 입력하세요',
		    text: '...'
		  },
		  '이메일을 입력하세요',
		]).then(function(result){
			findId = result;
			fnFindId(findId);
		
		})
	});
	function fnFindId(data) {
		$.ajax({
			url : "${pageContext.request.contextPath}/login/fogetId.json",
			type: "POST",
			data : {
				"name" : data.value[0],
				"email": data.value[1]
			},
		}).done(function (val) {
			swal("회원의 아이디는 "+val.id + "입니다");
			console.log(val);
		}).fail(function () {
			swal('이름과 이메일의 정보가 일치 하지 않습니다.!')
		});
	}		
	</script>
</body>
</html>