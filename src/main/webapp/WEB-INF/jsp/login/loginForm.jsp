<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/login.css" />
<link rel="stylesheet" href="/bitcode/sweetalertFile/sweetalert2.css" />
<script src="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.all.min.js"></script>
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

	//Pass 찾기
	$("#forgetpass").on('click',function () {
		swal.mixin({
		  input: 'text',
		  confirmButtonText: '전송',
		  showCancelButton: true,
		  progressSteps: ['1', '2']
		}).queue([
		  {
		    title: '이메일를 입력하세요',
		    text: '이메일로 임시비밀번호가 전송되니 정확하게 기입해주세요'
		  },
		  'ID를 입력하세요',
		]).then(function(result){
			fnFindPass(result);
		
		})
	});
	function fnFindPass(data) {
		$.ajax({
			url : "${pageContext.request.contextPath}/sendMail/findPass.json",
			type: "POST",
			data : {
				"email" : data.value[0],
				"id": data.value[1]
			},
			success : function(data){
				console.log(data.id)
				if(data.id == null){
					swal("입력하신 이메일의 회원정보와 가입된 아이디가 일치하지 않습니다.");
				}else{
					swal("귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.");
				}
			},
		})
	
	}		
	
	
	
	
	
	
	
	
	
	
	
	
	
	//로그인 실패시 alert창 뜸.
		if ("${msg}") { 
			swal("${msg}");
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
			fnFindId(result);
		
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
			success : function(data){
				console.log(data)
				console.log(data.id)
				if(data.id == null){
					swal("이름과 이메일이 일치 하지 않습니다.");
				}else{
					swal("아이디는 " + data.id + "입니다.");
				}
			},
		})
	
	}		
	</script>
</body>
</html>