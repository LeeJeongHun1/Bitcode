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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/remote/remoteList.css">
</head>
<body>
<body>

  <div class="remote">
   <table cellspacing="0" class="remoteList">
     <tbody>
       <tr>
         <td class="head">문의주제</td>
         <td class="head">신청자</td>
         <td class="head">진행상태</td>
       </tr>
       
       <tr>
        <td><a class="folder" href="#">${sessionScope.question}</a></td>
        <td>${sessionScope.nickName}</td>
        <td><a href="${sessionScope.link}">상담</a></td>
       </tr>
       
       <tr>
        <td><a class="file" href="#">이클립스 오류 문의</a></td>
        <td>정훈</td>
        <td>대기중</td>
       </tr>
       
       <tr>
         <td><a class="folder" href="#">톰캣 에러</a></td>
         <td>종민</td>
         <td>상담중</td>
       </tr>

       <tr>
         <td><a class="file" href="#">컴퓨터가 느려요</a></td>
         <td>선영</td>
         <td>대기중</td>
       </tr>
      </tbody>
  </table>
<%--
  <button type="button" class="order btn btn-default btn-group-xs" onclick="location.href='${pageContext.request.contextPath}/remote/insertForm.do'">상담신청</button>
 --%>  
  <button type="button" class="order btn btn-default btn-group-xs">상담신청</button>
</div>
<script>
alert("${sessionScope.link}");

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

</script>
</body>
</html>