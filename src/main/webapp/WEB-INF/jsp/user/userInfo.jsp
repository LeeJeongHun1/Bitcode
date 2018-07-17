<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/userInfo.css" />
<link href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.css" />
<script src="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/waitme/waitMe.min.css" />
<script src="${pageContext.request.contextPath}/resources/js/waitme/waitMe.min.js"></script>

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
	  <div id="calendar">
	    <div id="calendar_header"><i class="icon-chevron-left"></i>          <h1></h1><i class="icon-chevron-right"></i>         </div>
	    <div id="calendar_weekdays"></div>
	    <div id="calendar_content"></div>
	  </div>
				
    </div>
  </div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/userInfo/userInfo.js"></script>
</body>
</html>