<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/userupdate.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.css" />
<script src="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/waitme/waitMe.min.css" />
<script src="${pageContext.request.contextPath}/resources/js/waitme/waitMe.min.js"></script>
</head>
<body>
	<form action="${pageContext.request.contextPath}/user/updateUser.do" method="post" id="userForm">
	  <h1 id="#signup">나의 정보 수정 <img src="${pageContext.request.contextPath}/resources/images/signupIcon.png"></h1>
	  <p id="pName">ID</p>	  
	  <input name="id" type="text" id="userId" data-flag="no" class="inputDetail" readonly="readonly" value="${sessionScope.user.id}"/>
	  <p id="pName">이름</p>
	  <input name="name" type="text" id="userName" data-flag="no" class="inputDetail" readonly="readonly" value="${user.name}"/>
	  <p id="pName">별명</p>	 
	  <input name="nickName" type="text" id="nickName" data-flag="no" class="inputDetail" value="${user.nickName}" />
	  <p id="pName">Email</p>
	  <input name="email" type="text" id="userEmail" data-flag="no" class="emailDetail" value="${user.email}"/>
	  <p id="pName">Birthday</p>	
	  <input name="birthday" type="text" id="userBirth" data-flag="no" class="inputDetail" value="${user.birthday}"/>
	  <div id="submitBox">
	 	 <a href="#1" id="submitBtn"><span class="signupbtn">Sign UP</span></a>
	  </div>
	</form>
<script>
	$("#submitBtn").click(function () {
		$("#userForm").submit();
	})
</script>
</body>
</html>