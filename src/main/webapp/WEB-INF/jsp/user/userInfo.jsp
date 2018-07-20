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
<!-- <link href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css' rel='stylesheet' type='text/css'> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.css" />
<script src="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.all.min.js"></script>

<style>

.aaaa {
	color: red;
}

/* Kurien / Kurien's Blog / http://blog.kurien.co.kr */
/* @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css); */
/* * {font-family: 'Nanum Gothic', serif;} */

#kCalendar {width: 360px; height: 400px; border: 3px solid gray;}
#calTable {margin-left: 10px; margin-top: 10px;}
#kCalendar #header {height: 70px; line-height: 70px; text-align: center; font-size: 20px; 
					font-weight: bold; color: black; background-color: yellow;}
#date { color: black;}

#kCalendar .button {color: #000; text-decoration: none;}

#kCalendar table {width: 320px; height:279px;}
#kCalendar caption {display: none;}
/* td {font-size: 15px; } */

#kCalendar .sun {text-align: center; font-size: 20px; width: 70px; height: 44px; padding-left: 10px;}
#kCalendar .mon {text-align: center; font-size: 20px; width: 70px; height: 44px; padding-left: 1px;}
#kCalendar .tue {text-align: center; font-size: 20px; width: 70px; height: 44px; padding-left: 8px;}
#kCalendar .wed {text-align: center; font-size: 20px; width: 70px; height: 44px; padding-left: 5px;}
#kCalendar .thu {text-align: center; font-size: 20px; width: 70px; height: 44px; padding-left: 7px;}
#kCalendar .fri {text-align: center; font-size: 20px; width: 70px; height: 44px; padding-left: 5px;}
#kCalendar .sat {text-align: center; font-size: 20px; width: 70px; height: 44px; padding-left: 10px;}
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
		<div>
		<c:forEach var="attendList" items="${attendList}">
				<input name="attDate" id="${attendList.attID}" value='<fmt:formatDate value="${attendList.attDate}" pattern="yyyy-MM-dd" />' type="hidden" >
<%-- 				<fmt:formatDate value="${attendList.attDate}" pattern="yyyy-MM-dd" />  --%>
		</c:forEach>
		</div>
	  	<div id="kCalendar"></div>
	  	  <a href="#" id="attend">출첵</a>

	  
	  
	  	
				
    </div>
  </div>
</div>
<script>
//캘린더 로딩
// window.onload = function () {
	kCalendar('kCalendar');
// };
console.dir($("input[name=attDate]"))



var userid = $("#userId").val();
$("#attend").click(function () {
	//오늘 날짜
	var today = new Date();
	$.ajax({
		url : "/bitcode/user/attend.json",
		type: "POST",
		data : {
			"id"	  : userid,
			"attDate" : today
		},
		success : function(data){
			if(data != undefined){
				swal("출척이 체크 되었습니다.");
				kCalendar('kCalendar');
			}
			else{
				swal("오류 발생!! 다시 클릭 해주세요");
			}
		
		}
	})	
});


/* Kurien / Kurien's Blog / http://blog.kurien.co.kr */
function kCalendar(id, date) {
	var attdate;	
	var attMonth;
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
	
	
	// 디비에서 가져온 유저의 날짜 출력

	
	var calendar = '';
	
	calendar += '<div id="header">';
	calendar += '			<span><a href="#" class="button left" onclick="kCalendar(\'' +  id + '\', \'' + prevDate + '\')"><</a></span>';
	calendar += '			<span id="date">' + currentYear + '년 ' + currentMonth + '월</span>';
	calendar += '			<span><a href="#" class="button right" onclick="kCalendar(\'' + id + '\', \'' + nextDate + '\')">></a></span>';
	calendar += '		</div>';
	calendar += '		<table id="calTable" border="0" cellspacing="0" cellpadding="0">';
	calendar += '			<caption>' + currentYear + '년 ' + currentMonth + '월 달력</caption>';
	calendar += '			<thead>';
	calendar += '				<tr>';
	calendar += '				  <th class="sun" scope="row">sun</th>';
	calendar += '				  <th class="mon" scope="row">mon</th>';
	calendar += '				  <th class="tue" scope="row">tue</th>';
	calendar += '				  <th class="wed" scope="row">wed</th>';
	calendar += '				  <th class="thu" scope="row">thu</th>';
	calendar += '				  <th class="fri" scope="row">fri</th>';
	calendar += '				  <th class="sat" scope="row">sat</th>';
	calendar += '				</tr>';
	calendar += '			</thead>';
	calendar += '			<tbody>';
	
	var dateNum = 1 - currentDay;
	var attId = $("input[name=attDate]")
	var day = [];
	 for(let d = 0; d < attId.length; d++){
			var dbuser = attId[d]
			var attendate = dbuser.value;
			attendate = attendate.split('-');
			attendate[1]= attendate[1] - 1;
			attendate = new Date(attendate[0], attendate[1], attendate[2]);
			attdate = attendate.getDate();
			attMonth = attendate.getMonth() + 1;
// 			console.log(attdate);
			day.push(attdate);
// 			console.log(attMonth);
		 }
	console.dir(day)
	for(var i = 0; i < week; i++) {
		calendar += '			<tr>';
		
		for(var j = 0; j < 7; j++, dateNum++) {
			if( dateNum < 1 || dateNum > currentLastDate ) {
				calendar += '				<td class="' + dateString[j] + '"></td>';
				continue;
			}
// 			if(currentMonth == attMonth && attdate == dateNum){
// 				calendar += '				<td class="' + dateString[j] + '">' + dateNum + '0</td>';
				
// 			}
			var check = '';
			for(let dd of day){
				if(dd == dateNum){
					console.log(dateNum)
					check = dd;
					break;
				}
			}
			calendar += '				<td class="' + dateString[j] + '" data-check="'+check+'">' + dateNum + '</td>';
			$("td").data('check')
		}
		calendar += '			</tr>';
	}
	
	calendar += '			</tbody>';
	calendar += '		</table>';

	kCalendar.innerHTML = calendar;
	var td = $("#calTable").find("td");
	for(let t of td){
		if(t.dataset.check){
// 			console.dir(t)
			$(t).css("background", 'url(/bitcode/resources/images/attend2.png)')
			$(t).css("color", 'yellow')
// 			$(t).css("color", 'red')
		}
	}
// 	console.dir($("#calTable").find("td").data("ckeck"))
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
	    text: ''
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
//function fromattend(data) {
//	if( typeof(data) !== 'undefined'){
//		console.log(data);
//		for (let i = 0; i < data.length; i++) {
//			 var result =  data[i];
//			 var cal = new Date(result.attDate)
//		}
//	}
//}
</script>
</body>
</html>