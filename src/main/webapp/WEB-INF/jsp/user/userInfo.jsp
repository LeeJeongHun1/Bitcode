<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/user.css" />
<link href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css' rel='stylesheet' type='text/css'>

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
		  	<a href="${pageContext.request.contextPath}/user/updatePassForm.do" id="submitBtn"><span id="userInfoUpdate">비밀번호 수정</span></a>
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



<script>

//달력

$(function() {
	  function c() {
		    p();
		    var e = h();
		    var r = 0;
		    var u = false;
		    l.empty();
		    while (!u) {
		      if (s[r] == e[0].weekday) {
		        u = true;
		      } else {
		        l.append('<div class="blank"></div>');
		        r++;
		      }
		    }
		    for (var c = 0; c < 42 - r; c++) {
		      if (c >= e.length) {
		        l.append('<div class="blank"></div>');
		      } else {
		        var v = e[c].day;
		        var m = g(new Date(t, n - 1, v)) ? '<div class="today">' : "<div>";
		        l.append(m + "" + v + "</div>");
		      }
		    }
		    var y = o[n - 1];
		    a
		      .css("background-color", y)
		      .find("h1")
		      .text(i[n - 1] + " " + t);
		    f.find("div").css("color", y);
		    l.find(".today").css("background-color", y);
		    d();
		  }
		  function h() {
		    var e = [];
		    for (var r = 1; r < v(t, n) + 1; r++) {
		      e.push({ day: r, weekday: s[m(t, n, r)] });
		    }
		    return e;
		  }
		  function p() {
		    f.empty();
		    for (var e = 0; e < 7; e++) {
		      f.append("<div>" + s[e].substring(0, 3) + "</div>");
		    }
		  }
		  function d() {
		    var t;
		    var n = $("#calendar").css("width", e + "px");
		    n
		      .find((t = "#calendar_weekdays, #calendar_content"))
		      .css("width", e + "px")
		      .find("div")
		      .css({
		        width: e / 7 + "px",
		        height: e / 7 + "px",
		        "line-height": e / 7 + "px"
		      });
		    n
		      .find("#calendar_header")
		      .css({ height: e * (1 / 7) + "px" })
		      .find('i[class^="icon-chevron"]')
		      .css("line-height", e * (1 / 7) + "px");
		  }
		  function v(e, t) {
		    return new Date(e, t, 0).getDate();
		  }
		  function m(e, t, n) {
		    return new Date(e, t - 1, n).getDay();
		  }
		  function g(e) {
		    return y(new Date()) == y(e);
		  }
		  function y(e) {
		    return e.getFullYear() + "/" + (e.getMonth() + 1) + "/" + e.getDate();
		  }
		  function b() {
		    var e = new Date();
		    t = e.getFullYear();
		    n = e.getMonth() + 1;
		  }
		  var e = 280;
		  var t = 2013;
		  var n = 9;
		  var r = [];
		  var i = [
		    "JANUARY",
		    "FEBRUARY",
		    "MARCH",
		    "APRIL",
		    "MAY",
		    "JUNE",
		    "JULY",
		    "AUGUST",
		    "SEPTEMBER",
		    "OCTOBER",
		    "NOVEMBER",
		    "DECEMBER"
		  ];
		  var s = [
		    "Sunday",
		    "Monday",
		    "Tuesday",
		    "Wednesday",
		    "Thursday",
		    "Friday",
		    "Saturday"
		  ];
		  var o = [
		    "#16a085",
		    "#1abc9c",
		    "#c0392b",
		    "#27ae60",
		    "#FF6860",
		    "#f39c12",
		    "#f1c40f",
		    "#e67e22",
		    "#2ecc71",
		    "#e74c3c",
		    "#d35400",
		    "#2c3e50"
		  ];
		  var u = $("#calendar");
		  var a = u.find("#calendar_header");
		  var f = u.find("#calendar_weekdays");
		  var l = u.find("#calendar_content");
		  b();
		  c();
		  a.find('i[class^="icon-chevron"]').on("click", function() {
		    var e = $(this);
		    var r = function(e) {
		      n = e == "next" ? n + 1 : n - 1;
		      if (n < 1) {
		        n = 12;
		        t--;
		      } else if (n > 12) {
		        n = 1;
		        t++;
		      }
		      c();
		    };
		    if (e.attr("class").indexOf("left") != -1) {
		      r("previous");
		    } else {
		      r("next");
		    }
		  });
		});

</script>
</body>
</html>