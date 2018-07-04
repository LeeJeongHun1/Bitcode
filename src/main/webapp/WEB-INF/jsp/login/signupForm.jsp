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
	  <h1>Sign UP !!</h1>
	  <input name="name" placeholder="name" type="text" id="userName" data-flag="no" class="inputDetail" maxlength="15"/>
	  <p class="innerText"></p>
	  <input name="nickName" placeholder="Nick Name" type="text" id="nickName" data-flag="no" class="inputDetail" maxlength="15"/>
	  <p class="innerText"></p>
	  <input name="id" placeholder="ID" type="text" id="userId" data-flag="no" class="inputDetail" maxlength="15"/>
	  <p class="innerText"></p>
	  <input name="password" placeholder="Password" type="password" id="userPass" data-flag="no" class="inputDetail" maxlength="16"/>
	  <p class="innerText"></p>
	  <input name="conformpass" placeholder="confirm password" type="password" id="userPassCheck" class="inputDetail" maxlength="16"/>
	  <p class="innerText"></p>	  
	  <input name="email" placeholder="Email" type="text" id="userEmail" data-flag="no" class="emailDetail" maxlength="16"/>
	  <p class="innerText"></p>
<!-- 	  <button class="btn" id="submitBtn">Sign UP</button> -->
	  <div id="submitBox">
	 	 <a href="#1" id="submitBtn"><span id="signupbtn">Sign UP</span></a>
	  </div>
	</form>

<script>
$(".inputDetail, #userEmail").focus(function(){
	$(this).prev().addClass("hide");
});
$(".inputDetail,#userEmail").blur(function(){
if(!$(this).val()){
	$(this).prev().removeClass("hide");
}
});

//비번
$("#userPassCheck").keyup(function(){
	console.log($(this).val().length)
	if($(this).val() == ""){
		$("#userPass").next().text("영문/숫자를 조합하여 입력");
		return;
	}
	if($(this).val() == $("#userPass").val()){
		$("#userPass").next().text("비밀번호가 일치합니다.");
		$("#userPass").data("flag","yes");
	}else{
		$("#userPass").next().text("비밀번호가 일치하지 않습니다.");
		$("#userPass").data("flag","no");
	}
});
$("#userPass").keyup(function(){
	if($(this).val() == ""){
		$("#userPass").next().text("영문/숫자를 조합하여 입력");
		return;
	}
	if($(this).val() == $("#userPassCheck").val()){
		$("#userPass").next().text("비밀번호가 일치합니다.");
		$("#userPass").data("flag","yes");
	}else{
		$("#userPass").next().text("비밀번호가 일치하지 않습니다.");
		$("#userPass").data("flag","no");
	}
})

//이메일
$("#userEmail").keyup(function(){
	if($("#userEmail").val() == ""){
		$("#userEmail").data("flag","no");
// 		$("#emailResult > p").text("이메일을 입력하세요");
	}else{
		$("#userEmail").data("flag","yes");
// 		$("#emailResult > p").text("");
	}
});



//이름
$("#userName").keyup(function(){
	if($(this).val() == ""){
		$(this).data("flag","no");
	}else{
		$(this).data("flag","yes");
	}
})

//별명 중복확인(디비 만들어진 후에)
$("#nickName").keyup(function(){
	if($(this).val() == ""){
		$(this).data("flag","no");
	}else{
		$(this).data("flag","yes");
	}
})

//ID 중복확인(디비 만들어진 후에)
$("#userId").keyup(function(){
	if($(this).val() == ""){
		$(this).data("flag","no");
	}else{
		$(this).data("flag","yes");
	}
})


//공백 체크
$("#submitBtn").click(function(){
	var id = $("#userId").data("flag");
	var pass = $("#userPass").data("flag");
	var name = $("#userName").data("flag");
	var nickName = $("#nickName").data("flag");
	var email = $("#userEmail").data("flag");
	id = isEmpty($("#userId"), id , "아이디를 입력해주세요");
	pass = isEmpty($("#userPass"), pass , "비밀번호를 입력해주세요");
	name = isEmpty($("#userName"), name , "이름을 입력해주세요");
	name = isEmpty($("#nickName"), nickName , "별명을 입력해주세요");
	email = isEmpty($("#userEmail"), email , "이메일를 입력해주세요");
	if(id == false || pass == false || name == false || nickName == false || email == false){
		return;
	}
	
	$("#userForm").submit();
})

function isEmpty(obj, flag ,msg) {
	if(flag != "yes"){
		obj.focus();
		swal(msg);
		return false;
	}
	return true;
}	

</script>
</body>
</html>