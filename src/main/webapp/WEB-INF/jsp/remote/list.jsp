<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remote</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/remote/remoteList.css">
</head>
<body>

	<div class="remoteBody">
		<div id="card1" class="card ten col">
			<div class="topbar blue">
			<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
			<div class="xbtn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">x</div>
			</div> 
			
			<h3 class="userInformation">상담 신청 목록</h3>
			
			<div class="remote">
			<table class="remoteList table table-hover">
				<tr>
					<th>문의주제</th>
					<th>신청자</th>
					<th>진행상태</th>
				</tr>

				<c:choose>
					<c:when test="${not empty remoteList}">
						<c:forEach var="remote" items="${remoteList}">
							<tr>
								<td>${remote.question}</td>
								<td>${remote.nickName}</td>
								<td><a href="${remote.link}">상담</a></td>
							</tr>
						</c:forEach>
					</c:when>

					<c:otherwise>
						<tr>
							<td colspan="3">대기중인 상담이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>

			</table>
			</div>
		<button type="button" class="btn btn-default btn-group-xs pull-right">상담신청</button>
		</div>

	</div>
	<script>
//alert("${sessionScope.link}");

$(".order").click(function(){
	  swal({
	    title: '결제하시겠습니까',
	    text: "상담을 위해서는 결제가 필요한 서비스입니다",
	    type: 'warning',
	    showCancelButton: true,
	    confirmButtonColor: '#3085d6',
	    cancelButtonColor: '#d33',
	    cancelButtonText: '아니오',
	    confirmButtonText: '네,결제를 진행하겠습니다.'
	  }).then((result) => {
	    if (result.value) {
	    	location.href='insertForm.do'
	   /*    swal(
	        '결제페이지로 이동합니다.',
	        location.href='remoteForm.do',
	        'success'
	      ) */
	    }
	  })
	})

$(".remoteBody").draggable();

</script>
</body>
</html>