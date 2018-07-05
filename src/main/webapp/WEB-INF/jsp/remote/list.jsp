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
        <td><a class="folder" href="#">글씨 출력이 안되요!!</a></td>
        <td>지연</td>
        <td>대기</td>
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
  <button type="button" class="btn btn-default btn-group-xs">상담신청</button>
</div>
	
  </body>

</body>
</html>