<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board/detail.css">
<style>
button{
color:#80FF00;
background-color: black;}
</style>
</head>
<body>
	<div class="container">
		<div class="shell-container" style="color:#80FF00; background-color: black;">
		<h2 class="shell_title" style="color:#80FF00;">QnA질문게시판</h2>
			<table class="editTable" >
			<tbody>
						<tr>
			<th style="color:#80FF00; background-color: black;">제목</th>
			<td><input class="editTitle" style="color:#80FF00; background-color: black;"type="text" /><select style="color:#80FF00; background-color: black;" class="editSelect"><option>분류</option></select></td>
			</tr>
			<tr>
			<th style="color:#80FF00; background-color: black;">작성자</th>
			<td><input style="color:#80FF00; background-color: black;" type="text" /></td>
			</tr>

			<tr style="height:90%;">
			<th style="color:#80FF00; background-color: black;">내용</th>
			<td><textarea style="width: 100%; color:#80FF00; background-color: black;
    		height: 100%;"></textarea></td>
			</tr>
			<tr>
			<th style="color:#80FF00; background-color: black;">파일첨부</th>
			<td><input type="file" ></td>
			</tr>
			</tbody>			
			</table>
			<div class="contents_btn">
			<button onclick="location.href='board.do'">목록</button>
			<button>답변</button>
			<button>수정</button>
			<button>삭제</button>
			</div>
		</div>

	</div>
</body>
</html>