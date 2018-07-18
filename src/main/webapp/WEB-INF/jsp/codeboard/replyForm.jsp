<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" 
href="${pageContext.request.contextPath}/resources/css/board/detail.css">
<style>
button{
color:#80FF00;
background-color: black;}
</style>
</head>
<body>
	<div class="container">
		<div class="shell-container" style="color:#80FF00; background-color: black;">
			<form method='post' action='${pageContext.request.contextPath}/codeboard/reply.do'
			enctype="multipart/form-data">
		<h2 class="shell_title" style="color:#80FF00;">코드공유게시판</h2>
			<table class="editTable" >
			<tbody>
			<tr>
			<th style="color:#80FF00; background-color: black;">제목</th>
			<td><input class="editTitle" name="title" style="color:#80FF00; background-color: black;"type="text"; />
			<select style="color:#80FF00; background-color: black;" class="editSelect" id="code" name="languageCode">
				<option value='${cb.languageCode}'>${cb.languageName}</option>
			</select>
			</td>
			</tr>
			<tr>
			<th style="color:#80FF00; background-color: black;">작성자</th>
			<td><input style="color:#80FF00; background-color: black;" type="text" name="id" value='${user.id}' readonly="readonly"/>
			<input type="hidden" name="no" value="${cb.no}" /> 
			<input type="hidden" name="groupOrder" value="${cb.groupOrder}" /> 
			<input type="hidden" name="depth" value="${cb.depth}" />
			<input type="hidden" name="groupNo" value="${cb.groupNo}" />
			</td>
			</tr>
			<tr style="height:90%;">
			<th style="color:#80FF00; background-color: black;">내용</th>
			<td>
			<textarea name="content" style="width: 100%; color:#80FF00; background-color: black;
    		height: 100%;">
    		</textarea></td>
			</tr>
			<tr>
			<th style="color:#80FF00; background-color: black;">파일첨부</th>
			<td><input type="file" name="file" multiple="multiple" ></td>
			</tr>
			</tbody>			
			</table>
			<div class="contents_btn">
			<button type='submit'>답변등록</button>
			<a href='<c:url value="list.do" />'><button type="button">목록</button></a>
			</div>
			</form>
		</div>

	</div>
	

</body>
</html>