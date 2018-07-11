<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/board/detail.css">

</head>
<body>
	<div class="container">
		<div class="shell-container">
			<h2 class="shell_title">QnA질문게시판</h2>
			<form action='<c:url value="/qnaboard/update.do"/>' method="post"
				enctype="multipart/form-data">
				<table class="editTable">
					<tbody>
						<tr>
							<input type="hidden" name="no" value="${qna.no}"/>
							<th>제목</th>
							<td><input class="editTitle" type="text" name="title" value="${qna.title}"/> 
							<select class="editSelect" name="code">
									<option>분류</option>
							</select></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><input type="text" name="writer" value="${qna.id}"/></td>
						</tr>

						<tr style="height: 90%;">
							<th>내용</th>
							<td><textarea style="width: 100%; height: 100%; min-height: 232px;">
							<c:out value="${qna.content}"/>
							</textarea></td>
						</tr>
						<tr>
							<th>파일첨부</th>
							<td><input type="file" value="${qna.oriName}"></td>
						</tr>
					</tbody>
				</table>
			</form>
			<div class="contents_btn">
				<a href='<c:url value="/qnaboard/list.do" />'><button>목록</button></a>
				<button>답변</button>
				<button>수정</button>
				<button>삭제</button>
			</div>
		</div>

	</div>
</body>
	<script>
	window.onload = function(){
	}
	code();
	function code(){
		$.ajax({
			url: "<c:url value='/qnaboard/selectLanguage.json' />",
			dataType: "json"
		})
		.done(function (data){
			cosnole.log(data);
			for(var i=0; i<data.length; i++){
				$("select[name='code']").append('<option value="'+data[i].code+'">'+data[i].name+'</option>');
			}
		})
	}
	</script>
</html>