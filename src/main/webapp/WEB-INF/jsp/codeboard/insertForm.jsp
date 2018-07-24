<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board/codeDetail.css">
<style>
button{
color:#80FF00;
background-color: black;}
</style>
</head>
<body>
	<div class="codeDetailBody">
	<div id="card1" class="card ten col">
		<div class="topbar yellow">
		<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
		<div class="xbtn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">x</div>
		</div>
		
		<div class="shell-container code">
			<form method='post' action='${pageContext.request.contextPath}/codeboard/insert.do'
			enctype="multipart/form-data">
			<input type="hidden" name="id" value="${sessionScope.user.id}" />
		<h2 class="shell_title" style="color:#80FF00;">코드공유게시판</h2>
			<table class="editTable" >
			<tbody>
			<tr>
			<th style="color:#80FF00; background-color: black;">제목</th>
			<td><input class="editTitle" name="title" style="color:#80FF00; background-color: black;"type="text" />
			<select style="color:#80FF00; background-color: black;" class="editSelect" id="code" name="languageCode">
			</select>
			</td>
			</tr>
			<tr>
			<th style="color:#80FF00; background-color: black;">작성자</th>
			<td><input style="color:#80FF00; background-color: black;" type="text" name="nickname" value='${sessionScope.user.nickName}' readonly="readonly"/></td>
			</tr>

			<tr style="height:90%;">
			<th style="color:#80FF00; background-color: black;">내용</th>
			<td><div style="width:670px;height:240px;" ><textarea name="content" style="width: 100%; color:#80FF00; background-color: black;
    		height: 230px;"></textarea></div></td>
			</tr>
			<tr>
			<th style="color:#80FF00; background-color: black;">파일첨부</th>
			<td><input type="file" name="file" multiple="multiple" ></td>
			</tr>
			</tbody>			
			</table>
			<div class="contents_btn">
			<button type='submit'>등록</button>
			<a href='<c:url value="list.do" />'><button type="button">목록</button></a>
			</div>
			</form>
		</div>
	</div>
	</div>
	
	<script>
	window.onload = function(){}
	code();
	function code(){
		$.ajax({
			url: `${pageContext.request.contextPath}/qnaboard/selectLanguage.json`,
			dataType: "json"
		})
		.done(function (data){

			for(var count=0; count<data.length; count++){
				var option = $("<option value='"+data[count].code+"'>"+data[count].name+"</option>");
				$('#code').append(option);
			}
		})
	}
	</script>
</body>
</html>