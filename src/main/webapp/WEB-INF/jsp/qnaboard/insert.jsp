<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board/detail.css">

</head>
<body>
	<div class="container">
		<div class="shell-container">
		<h2 class="shell_title">QnA질문게시판</h2>
			<table class="editTable">
			<tbody>
						<tr>
			<th>제목</th>
			<td><input class="editTitle" type="text" /><select class="editSelect"><option>분류</option></select></td>
			</tr>
			<tr>
			<th>작성자</th>
			<td><input type="text" /></td>
			</tr>

			<tr style="height:90%;">
			<th>내용</th>
			<td><textarea style="width: 100%;
    height: 100%;"></textarea></td>
			</tr>
			<tr>
			<th>파일첨부</th>
			<td><input type="file"></td>
			</tr>
			</tbody>			
			</table>
			<div class="contents_btn">
			<a href='<c:url value="/qnaboard/listBoard.do" />'><button>목록</button></a>
			<button>답변</button>
			<button>수정</button>
			<button>삭제</button>
			</div>
		</div>

	</div>
</body>
</html>