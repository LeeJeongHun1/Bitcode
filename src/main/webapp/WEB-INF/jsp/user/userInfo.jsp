<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIT CODE</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/userInfo.css" />
<link href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.css" />
<script src="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/waitme/waitMe.min.css" />
<script src="${pageContext.request.contextPath}/resources/js/waitme/waitMe.min.js"></script>

<style>

/* Kurien / Kurien's Blog / http://blog.kurien.co.kr */
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
* {font-family: 'Nanum Gothic', serif;}

#kCalendar {width: 250px; height: 250px; border: 1px solid black;}

#kCalendar #header {height: 50px; line-height: 50px; text-align: center; font-size: 18px; font-weight: bold}
#kCalendar .button {color: #000; text-decoration: none;}

#kCalendar table {width: 250px; height: 200px;}
#kCalendar caption {display: none;}

#kCalendar .sun {text-align: center; color: deeppink;}
#kCalendar .mon {text-align: center;}
#kCalendar .tue {text-align: center;}
#kCalendar .wed {text-align: center;}
#kCalendar .thu {text-align: center;}
#kCalendar .fri {text-align: center;}
#kCalendar .sat {text-align: center; color: deepskyblue;}
</style>

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
    <div id="card2" class="card six col">
		<div class="topbar blue">
			<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
			<div class="maxbtn"><span></span></div>
			<div class="xbtn">x</div>
		</div>     
    	<h3 class="userInformation">My Question</h3>
    	
		<table class="table table-hover">
			<tr>
				<th colspan="1">번호</th><th colspan="1">글쓴이</th><th colspan="4">제목</th><th colspan="3">만족도</th>
			</tr>
			<c:forEach var="qnaList" items="${qnaList}">
			<c:if test="${qnaList.id == user.id}">
			<tr>
				<td>${qnaList.no}</td>			
				<td>${user.nickName}</td>				
				<td colspan="4"><a id="board_title" href='${pageContext.request.contextPath}/qnaboard/detail.do?no=${qnaList.no}'>${qnaList.title}</a></td>				
				<td>${qnaList.stsfcCode}</td>
			</tr>
			</c:if>
			</c:forEach>
		</table>
	</div>	

    <div id="card3" class="card three col">
		<div class="topbar yellow">
			<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
			<div class="maxbtn"><span></span></div>
			<div class="xbtn">x</div>
		</div>
		<div>
<%-- 		<c:forEach var="userList" items="${userList}"> --%>
			<c:choose>
				<c:when test="${100 >= userInfo.point }">
				<p class="userInfoPoint"><img class="lelvel" src="${pageContext.request.contextPath}/resources/images/level2.png">초보&nbsp;<span class="userInfobattery"><img class="userInfobattery1" src="${pageContext.request.contextPath}/resources/images/1battery.png"></span>&nbsp;${userInfo.point}Point</p>
				</c:when>
				<c:when test="${userInfo.point >= 201 }">
				<p class="userInfoPoint"><img class="lelvel" src="${pageContext.request.contextPath}/resources/images/level2.png">고수&nbsp;<span class="userInfobattery"><img class="userInfobattery1" src="${pageContext.request.contextPath}/resources/images/4battery.png"></span>&nbsp;${userInfo.point}Point</p>
				</c:when>			
	        	<c:when test="${userInfo.point >= 101 && 201 >= userInfo.point}">
	        	<p class="userInfoPoint"><img class="lelvel" src="${pageContext.request.contextPath}/resources/images/level2.png">중수&nbsp;<span class="userInfobattery"><img class="userInfobattery1" src="${pageContext.request.contextPath}/resources/images/3battery.png"></span>&nbsp;${userInfo.point}Point</p>
	        	</c:when>		
			</c:choose>
<%-- 		</c:forEach> --%>
		</div>
		<div></div>
		<div></div>
<!-- 		캘린더 -->
<!-- 	  <div id="calendar"> -->
<!-- 	    <div id="calendar_header"><i class="icon-chevron-left"></i>          <h1></h1><i class="icon-chevron-right"></i>         </div> -->
<!-- 	    <div id="calendar_weekdays"></div> -->
<!-- 	    <div id="calendar_content"></div> -->
<!-- 	  </div> -->
	  	<div id="kCalendar"></div>
	  	  <a href="#" id="attend">출첵</a>

	  
	  
	  	
				
    </div>
  </div>
</div>
<script>


window.onload = function () {
	kCalendar('kCalendar');
};
var userid = $("#userId").val();
$("#attend").click(function () {
	var date = new Date();
	$.ajax({
		url : "/bitcode/user/attend.json",
		type: "POST",
		data : {
			"id"	  : userid
		},
		success : function(data){
			if(data != undefined){
				swal("출척이 체크 되었습니다.");
				console.log(data.attDate);
				console.log(date);
				
			}
			else{
				swal("오류 발생!! 다시 클릭 해주세요");
			}
		
		}
	})	
	
	
	
	
	
});



/* Kurien / Kurien's Blog / http://blog.kurien.co.kr */
function kCalendar(id, date) {
	var kCalendar = document.getElementById(id);
	
	if( typeof( date ) !== 'undefined' ) {
		date = date.split('-');
		date[1] = date[1] - 1;
		date = new Date(date[0], date[1], date[2]);
	} else {
		var date = new Date();
	}
	var currentYear = date.getFullYear();
	//년도를 구함
	
	var currentMonth = date.getMonth() + 1;
	//연을 구함. 월은 0부터 시작하므로 +1, 12월은 11을 출력
	
	var currentDate = date.getDate();
	//오늘 일자.
	
	date.setDate(1);
	var currentDay = date.getDay();
	//이번달 1일의 요일은 출력. 0은 일요일 6은 토요일
	
	var dateString = new Array('sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat');
	var lastDate = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	if( (currentYear % 4 === 0 && currentYear % 100 !== 0) || currentYear % 400 === 0 )
		lastDate[1] = 29;
	//각 달의 마지막 일을 계산, 윤년의 경우 년도가 4의 배수이고 100의 배수가 아닐 때 혹은 400의 배수일 때 2월달이 29일 임.
	
	var currentLastDate = lastDate[currentMonth-1];
	var week = Math.ceil( ( currentDay + currentLastDate ) / 7 );
	//총 몇 주인지 구함.
	
	if(currentMonth != 1)
		var prevDate = currentYear + '-' + ( currentMonth - 1 ) + '-' + currentDate;
	else
		var prevDate = ( currentYear - 1 ) + '-' + 12 + '-' + currentDate;
	//만약 이번달이 1월이라면 1년 전 12월로 출력.
	
	if(currentMonth != 12) 
		var nextDate = currentYear + '-' + ( currentMonth + 1 ) + '-' + currentDate;
	else
		var nextDate = ( currentYear + 1 ) + '-' + 1 + '-' + currentDate;
	//만약 이번달이 12월이라면 1년 후 1월로 출력.

	
	if( currentMonth < 10 )
		var currentMonth = '0' + currentMonth;
	//10월 이하라면 앞에 0을 붙여준다.
	
	var calendar = '';
	
	calendar += '<div id="header">';
	calendar += '			<span><a href="#" class="button left" onclick="kCalendar(\'' +  id + '\', \'' + prevDate + '\')"><</a></span>';
	calendar += '			<span id="date">' + currentYear + '년 ' + currentMonth + '월</span>';
	calendar += '			<span><a href="#" class="button right" onclick="kCalendar(\'' + id + '\', \'' + nextDate + '\')">></a></span>';
	calendar += '		</div>';
	calendar += '		<table border="0" cellspacing="0" cellpadding="0">';
	calendar += '			<caption>' + currentYear + '년 ' + currentMonth + '월 달력</caption>';
	calendar += '			<thead>';
	calendar += '				<tr>';
	calendar += '				  <th class="sun" scope="row">일</th>';
	calendar += '				  <th class="mon" scope="row">월</th>';
	calendar += '				  <th class="tue" scope="row">화</th>';
	calendar += '				  <th class="wed" scope="row">수</th>';
	calendar += '				  <th class="thu" scope="row">목</th>';
	calendar += '				  <th class="fri" scope="row">금</th>';
	calendar += '				  <th class="sat" scope="row">토</th>';
	calendar += '				</tr>';
	calendar += '			</thead>';
	calendar += '			<tbody>';
	
	var dateNum = 1 - currentDay;
	
	for(var i = 0; i < week; i++) {
		calendar += '			<tr>';
		
		for(var j = 0; j < 7; j++, dateNum++) {
			if( dateNum < 1 || dateNum > currentLastDate ) {
				calendar += '				<td class="' + dateString[j] + '"> </td>';
				continue;
			}
			calendar += '				<td class="' + dateString[j] + '">' + dateNum + '</td>';
		}
		calendar += '			</tr>';
	}
	
	calendar += '			</tbody>';
	calendar += '		</table>';
	
	kCalendar.innerHTML = calendar;
}




























<%-- <script src="${pageContext.request.contextPath}/resources/js/userInfo/userInfo.js"></script> --%>
//Pass 찾기
var id = $("#userId").val();
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
		url : "/bitcode/user/updatePassForm.json",
		type: "POST",
		data : {
			"password" : data.value[0],
			"password": data.value[1],
			"id"	  : id
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