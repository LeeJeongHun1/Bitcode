$(".inputDetail, inputDetail1, #userEmail").focus(function(){
		$(this).prev().addClass("show");
});
$(".inputDetail, inputDetail1, #userEmail").blur(function(){
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
//$("#userBirth").focus(function(){
//	if($("#userBirth").val() == ""){
//		$("#userBirth").data("flag","no");
//	}else{
//		$("#userBirth").data("flag","yes");
//	}
////	var birthday = $("#userBirth").val();
////	console.log(birthday);
////	console.log(Number(birthday.substr(0,5)));
////	console.log(Date($("#userBirth").val()).toString());
//	
//});




// 생년월일 체크
var year = null;
var month = null;
var date = null;

$("#birth1").keyup(function(){
	year = $("#birth1").val();
	if($("#birth1").val() == "" || year < 1899) {
//		$("#birth3").next().text("정확한 년도를 기입해주세요 ");
		$("#birth1").data("flag","no");
		return;
	}else{
		$("#birth1").data("flag","yes");
//		$("#birth3").next().text("");
		return;
	}
});
$("#birth2").keyup(function(){
	 month = ($("#birth2").val());
	if($("#birth2").val() == "" || month < 1 || month >= 13) {
//		$("#birth3").next().text("1월부터 12월까지 입력 가능합니다. ");
		$("#birth2").data("flag","no");
		return;
	}else{
		$("#birth2").data("flag","yes");
//		$("#birth3").next().text("");
		return;
	}

});	     




//
$("#birth3").keyup(function(){
	date = $("#birth3").val();
	month = $("#birth2").val();
	year = $("#birth1").val();
//	if (date < 1 || date > 31) {
		if ($("#birth3").val() == "" || date < 1 || date > 31) {
		$("#birth3").data("flag","no");
//		$("#birth3").next().text("일은 1일부터 31일까지 입력가능합니다. ");
		return;
	}else{
		$("#birth3").data("flag","yes");
//		$("#birth3").next().text("");
		
	}	
	
	if ((month==4 || month==6 || month==9 || month==11) && date==31) {
		$("#birth3").data("flag","no");
//		$("#birth3").next().text(month +"월은 31일이 존재하지 않습니다.");
		return;
	}else{
		$("#birth3").data("flag","yes");
//		$("#birth3").next().text("");
		
	} 	
//	
	if (month == 2) {
		var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
		if (date>29 || (date==29 && !isleap)) {
			$("#birth3").data("flag","no");
//			$("#birth3").next().text(year + "년 2월은  " + day + "일이 없습니다.");
			return;
		}
	}else{
		$("#birth3").data("flag","yes");
//		$("#birth3").next().text("");
		
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
var birthday = null;
$("#submitBtn").click(function(){
	var id = $("#userId").data("flag");
	var pass = $("#userPassCheck").data("flag");
	var name = $("#userName").data("flag");
	var nickName = $("#nickName").data("flag");
	var year = $("#birth1").data("flag");
	var month = $("#birth2").data("flag");
	var date = $("#birth3").data("flag");
//	var birth = $("#userBirth").data("flag");
	var email = $("#userEmail").data("flag");
	id = isEmpty($("#userId"), id , "아이디를 입력해주세요");
	pass = isEmpty($("#userPassCheck"), pass , "비밀번호를 입력해주세요");
	name = isEmpty($("#userName"), name , "이름을 입력해주세요");
	nickName = isEmpty($("#nickName"), nickName , "별명을 입력해주세요");
	year = isEmpty($("#birth1"), year , "정확한 년도를 입력해주세요");
	month = isEmpty($("#birth2"), month , "1월부터 12월까지 입력 가능합니다. ");
	date = isEmpty($("#birth3"), date , "정확한 날짜를 입력해주세요");
//	birth = isEmpty($("#userBirth"), birth , "생년월일을 입력해주세요");
	email = isEmpty($("#userEmail"), email , "이메일를 입력해주세요");
	if(id == false || pass == false || name == false || nickName == false || year == false ||year == false ||month == false || date == false){
		return;
	}
	
	birthday = $("#birthday").val();
	$("#birthday").val($("#birth1").val() + $("#birth2").val() + $("#birth3").val());

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


