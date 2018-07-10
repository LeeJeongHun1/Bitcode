<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/user.css" />
<link href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="/bitcode/sweetalertFile/sweetalert2.css" />
<script src="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.all.min.js"></script>

</head>
<body>
<div class="container1">
  <h1 class="title1 twelve" id="profileName">Your Profile</h1>
  <div class="row cf">
    <div id="card1" class="card three col">
		<div class="topbar red">
			<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
			<div class="maxbtn"><span></span></div>
			<div class="xbtn">x</div>
		</div>    
		  <h3 class="userInformation">Information</h3>
		  <p id="pName">이름</p>
		  <input name="name" type="text" id="userName" value="${user.name}" readonly="readonly"/>
		  <p id="pName">별명</p>
		  <input name="nickName" type="text" id="nickName" data-flag="no" class="inputDetail" value="${user.nickName}" readonly="readonly"/>
		 <p id="pName">ID</p>
		  <input name="id" type="text" id="userId" value="${user.id}" readonly="readonly"/>
		 <p id="pName">Birthday</p>
		  <input name="birthday" type="text" id="birthday" data-flag="no" class="inputDetail" value="${user.birthday}" readonly="readonly"/>
		 <p id="pName">Email</p>
		  <input name="email" type="text" id="userEmail" data-flag="no" class="emailDetail" value="${user.email}" readonly="readonly"/>
		 <div class="updateBtns">
		  <span id="submitBox">
		  	<a href="${pageContext.request.contextPath}/user/updateUserForm.do" id="submitBtn"><span id="userInfoUpdate">나의 정보 수정</span></a>
		  </span>
		  <span id="submitBox">
		  	<a href="#" id="submitPassBtn"><span id="userInfoUpdate">비밀번호 수정</span></a>
  		  </span>
 		 </div>   
    </div>
<%-- ${pageContext.request.contextPath}/user/updatePassForm.do --%>
    <div id="card2" class="card six col">
		<div class="topbar blue">
			<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
			<div class="maxbtn"><span></span></div>
			<div class="xbtn">x</div>
		</div>     
    	<h3 class="userInformation">My Question</h3>
    	
    	<table class="table table-hover">
	    	<tr>
				<th>NickName</th>
				<th>Title</th>
				<th>Answer 만족률</th>
			</tr>
			<tr>
				<td>홍길동</td>				
				<td>자바스크립 질문</td>				
				<td>****</td>				
			</tr>
			<tr>
				<td>홍길자</td>				
				<td>자바 질문 있습니다!!!!!! </td>				
				<td>**</td>				
			</tr>
			<tr>
				<td>홍길군</td>				
				<td>자바 & css 질문 있습니다!!!!!! </td>				
				<td>**</td>				
			</tr>			
			
		</table>
	</div>	

    <div id="card3" class="card three col">
		<div class="topbar yellow">
			<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
			<div class="maxbtn"><span></span></div>
			<div class="xbtn">x</div>
		</div>
		<div>
			<p class="userInfoPoint">초보<span class="userInfobattery"><img class="userInfobattery1" src="${pageContext.request.contextPath}/resources/images/1battery.png"></span> (500 P)</p>
		</div>
		<div></div>
		<div></div>
<!-- 		캘린더 -->
	  <div id="calendar">
	    <div id="calendar_header"><i class="icon-chevron-left"></i>          <h1></h1><i class="icon-chevron-right"></i>         </div>
	    <div id="calendar_weekdays"></div>
	    <div id="calendar_content"></div>
	  </div>
				
    </div>
  </div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/userInfo/userInfo.js"></script>
<script>

//Pass 찾기
var id1 = $("#userId").val();
$("#submitPassBtn").on('click',function () {
	swal.mixin({
	  input: 'text',
	  confirmButtonText: '전송',
	  showCancelButton: true,
	  progressSteps: ['1', '2']
	}).queue([
	  {
	    title: '변경할 비밀번호를 입력하세요',
	    text: '...'
	  },
	  '비밀번호를 재입력 하세요',
	]).then(function(result){
		if(result.value[1] == result.value[1] ){
			fnFindPass(result);
		}else {
			swal("다시 입력하세요");
		}
	
	})
});

function fnFindPass(data) {
	$.ajax({
		url : "${pageContext.request.contextPath}/user/updatePassForm.json",
		type: "POST",
		data : {
			"password" : data.value[0],
			"password": data.value[1],
			"id"	  : id1
		},
		success : function(data){
			if(data != undefined){
				swal("비밀번호가 수정되었습니다.");
			}else{
				swal("다시 시도 해주시기 바랍니다.");
			}
			
			console.log(data + "성공")
		
		}
	})

}
</script>
</body>
</html>