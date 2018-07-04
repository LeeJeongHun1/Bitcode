<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/user.css" />
</head>
<body>
<div class="container1">
  <h1 class="title twelve">홍길동 Profile Cards</h1>
  <div class="row cf">
    <div id="card1" class="card three col">
	    <form id="userInfoUI" action="${pageContext.request.contextPath}/user/user.do" method="post" id="userInfoChanged">
		  <h3>회원 정보</h3>
		  <input name="name" type="text" id="userName" value="name" readonly="readonly"/>
		  <input name="nickName" type="text" id="nickName" data-flag="no" class="inputDetail" maxlength="15" value="nickName"/>
		  <input name="id" type="text" id="userId" value="id" readonly="readonly"/>
		  <input name="password" type="password" id="userPass" data-flag="no" class="inputDetail" maxlength="16" value="password"/>
		  <p class="innerText"></p>
		  <input name="conformpass" type="password" id="userPassCheck" class="inputDetail" maxlength="16" value="conformpass"/>
		  <p class="innerText"></p>	  
		  <input name="email" placeholder="Email" type="text" id="userEmail" data-flag="no" class="emailDetail" maxlength="16"/>
		  <p class="innerText"></p>
		  <div id="submitBox">
		  	<a href="#1" id="submitBtn"><span id="userInfoUpdate">수정 Click</span></a>
		  </div>
		</form>
    </div>

    <div id="card2" class="card seven col">
       <table class="tableUserInfo">
			<tr>
				<th colspan="1">번호</th><th colspan="4">글쓴이</th><th colspan="1">제목</th><th colspan="1">만족률</th>
			</tr>
			<tr>
				<td>1</td>				
				<td>홍길동</td>				
				<td colspan="4"><a id="board_title" href='BoardDetail?no=${board.no}'>자바스크립 질문입니다.</a></td>				
				<td>***</td>				
			</tr>
		</table>
    </div>

    <div id="card3" class="card two col">
    </div>
  </div>
</div>
</body>
</html>