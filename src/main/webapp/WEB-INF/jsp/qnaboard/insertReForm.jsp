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
			<form action='<c:url value="/qnaboard/insertRe.do"/>' method="post"
				enctype="multipart/form-data">
				<table class="editTable">
					<tbody>
						<tr>
							<th>제목</th>
							<input type="hidden" name="no" value="${list.no}">
							<input type="hidden" name="groupNo" value="${list.groupNo}">
							<input type="hidden" name="depth" value="${list.depth}">
							<input type="hidden" name="groupOrder" value="${list.groupOrder}">
							<td><input class="editTitle" type="text" name="title" value="${list.title}"/> 
							<input type="hidden" name="code" value="${list.code}"/> /${list.codeName}</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><input type="text" name="id" value="bbbb"/></td>
						</tr>

						<tr style="height: 90%;">
							<th>내용</th>
							<td><textarea name="content" style="width: 100%; height: 100%; min-height: 232px;"></textarea></td>
						</tr>
						<tr>
							<th>파일첨부</th>
							<td><input type="file" name="file" multiple="multiple"></td>
						</tr>
					</tbody>
				</table>
			<div class="contents_btn">
				<a href='<c:url value="/qnaboard/list.do" />'><button type="button">목록</button></a>
				<button type="submit">등록</button>
			</div>
			</form>
		</div>
	</div>
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
			for(var i=0; i<data.length; i++){
				$("select[name='code']").append('<option value="'+data[i].code+'">'+data[i].name+'</option>');
			}
		})
	}
	</script>
</body>