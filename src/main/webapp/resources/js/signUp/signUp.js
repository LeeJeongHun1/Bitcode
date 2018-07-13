$(".inputDetail, #userEmail").focus(function(){
		$(this).prev().addClass("show");
});
$(".inputDetail,  #userEmail").blur(function(){
	if(!$(this).val()){
		$(this).prev().removeClass("show");
	}
});


//ID 중복 체크

$("#userId").keyup(function () {
	if($(this).val() == ""){
		$("#userId").next().text("영문/숫자를 조합하여 입력");
		return;
	}
	console.log("아이디 중복 체크 작동중..");
	$.ajax({
		url: "/bitcode/login/signUpIdCheck.json",
		data: {
			"id" : $(this).val()	
		},
		dataType: "json",
		success: function (data) {
			var	result = "";
			if (data == false) {
				result = "사용가능한 아이디입니다.";
				$("#userId").data("flag","yes");
			}else{
				result = "사용이 불가능한 아이디입니다.";
				$("#userId").data("flag","no");
			}
			$("#userId").next().text(result);
		}
	});
});

//email 중복 체크
$("#userEmail").keyup(function () {
	if($(this).val() == ""){
		$("#userEmail").next().text("정확한 이메일를 기입해주세요 ");
		return;
	}
	console.log("이메일 중복 체크 작동중..");
	$.ajax({
		url: "/bitcode/login/emailCheck.json",
		data: {
			"email" : $(this).val()	
		},
		dataType: "json",
		success: function (data) {
			var	result = "";
			if (data == false) {
				result = "사용가능한 이메일 입니다.";
				$("#userEmail").data("flag","yes");
			}else{
				result = "사용 불가능한 또는 중복된 이메일입니다. ";
				$("#userEmail").data("flag","no");
			}
			$("#userEmail").next().text(result);
		}
	});
});




//비번 체크
$("#userPassCheck").keyup(function(){
	console.log($(this).val().length)
	if($(this).val() == ""){
		$("#userPassCheck").next().text("");
		return;
	}
	if($(this).val() == $("#userPass").val()){
		$("#userPassCheck").next().text("비밀번호가 일치합니다.");
		$("#userPassCheck").data("flag","yes");
	}else{
		$("#userPassCheck").next().text("비밀번호가 일치하지 않습니다.");
		$("#userPassCheck").data("flag","no");
	}
});

//생년원일
$("#userBirth").keyup(function(){
	if($("#userBirth").val() == ""){
		$("#userBirth").data("flag","no");
	}else{
		$("#userBirth").data("flag","yes");
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

//별명 
$("#nickName").keyup(function(){
	if($(this).val() == ""){
		$(this).data("flag","no");
	}else{
		$(this).data("flag","yes");
	}
})


//공백 체크
$("#submitBtn").click(function(){
	var id = $("#userId").data("flag");
	var pass = $("#userPassCheck").data("flag");
	var name = $("#userName").data("flag");
	var nickName = $("#nickName").data("flag");
	var birth = $("#userBirth").data("flag");
	var email = $("#userEmail").data("flag");
	id = isEmpty($("#userId"), id , "아이디를 입력해주세요");
	pass = isEmpty($("#userPassCheck"), pass , "비밀번호를 입력해주세요");
	name = isEmpty($("#userName"), name , "이름을 입력해주세요");
	nickName = isEmpty($("#nickName"), nickName , "별명을 입력해주세요");
	birth = isEmpty($("#userBirth"), birth , "생년월일을 입력해주세요");
	email = isEmpty($("#userEmail"), email , "이메일를 입력해주세요");
	if(id == false || pass == false || name == false || nickName == false || birth == false || email == false){
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


