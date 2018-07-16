<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css" />
<link href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.css" />
<script src="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/waitme/waitMe.min.css" />
<script src="${pageContext.request.contextPath}/resources/js/waitme/waitMe.min.js"></script>

</head>
<body>
<div class="container1">
  <h1 class="title1 twelve" id="profileName">관리</h1>
  <div class="row cf">
  
    <div id="card1" class="card six col">
		<div class="topbar red">
			<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
			<div class="maxbtn"><span></span></div>
			<div class="xbtn">x</div>
		</div>    
		  <h3 class="userInformation">문의글 통계</h3>
		  
    </div>
<%-- ${pageContext.request.contextPath}/user/updatePassForm.do --%>
    <div id="card2" class="card six col">
		<div class="topbar blue">
			<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
			<div class="maxbtn"><span></span></div>
			<div class="xbtn">x</div>
		</div>     
    	<h3 class="userInformation">Q&A 답변률</h3>
    	<div>총 Q&A ${allCnt}개</div>
    	<div>총 Q&A 답변 ${ansCnt}개</div>
	</div>	

    <div id="card3" class="card six col">
		<div class="topbar yellow">
			<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
			<div class="maxbtn"><span></span></div>
			<div class="xbtn">x</div>
		</div>
		<div>
			<h3 class="userInformation">Q&A 답변 만족률</h3>
		</div>
		<div></div>
				
    </div>
  </div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/userInfo/userInfo.js"></script>
<script>

</script>
</body>
</html>