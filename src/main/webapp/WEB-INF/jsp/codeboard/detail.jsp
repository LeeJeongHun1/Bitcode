<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board/detail.css">
<style>
a {color:#333333}
button{
color:#80FF00;
background-color: black;}
</style>
<style type="text/css">
 a:link { color: #80FF00; text-decoration: none;}
 a:visited { color: #80FF00; text-decoration: none;}
 a:hover { color: #80FF00; text-decoration: underline;}
</style>
</head>
<body>
	<div class="container">
		<div class="shell-container" style="color:#80FF00; background-color: black;">
		<!-- <h2 class="shell_title">QnA질문게시판</h2> -->
			<div class="contents_header" style="color:#80FF00; background-color: black;">
				<div class="title" style="color:#80FF00; background-color: black;">
					<c:out value="${cb.title}" /><span class="nowrap">|</span>
					<span class="cf" style="color:#80FF00; background-color: black;">JAVA</span> 
					<span class="day" style="color:#80FF00; background-color: black;">2018-02-10</span>
			<input type="hidden" name="groupOrder" value="${cb.groupOrder}" /> 
			<input type="hidden" name="depth" value="${cb.depth}" />
			<input type="hidden" name="groupNo" value="${cb.groupNo}" />
				</div>

				<div class="header_info">
					<span class="shell_writer" style="color:#80FF00; background-color: black;"><c:out value="${cb.id}" /></span>
					<span class="shell_hits" style="color:#80FF00; background-color: black;">조회<span><c:out value="${cb.viewCnt}" /></span></span>

				</div>
			</div>
			<div class="contents_body" style="color:#80FF00; background-color: black;">
				<div class="detail">
					<c:out value="${cb.content}" />
				</div>
				<div>
				<c:forEach var="cbFile" items="${cbFileList}">
				파일명 : <a href="${pageContext.request.contextPath}/fileDown.do?filePath=${cbFile.filePath}&systemFileName=${cbFile.systemName}&originalFileName=${cbFile.oriName}">${cbFile.oriName}</a> 크기 : ${cbFile.fileSize}(bytes) <br>
        		미리보기 : <img src="${pageContext.request.contextPath}/fileDown.do?filePath=${cbFile.filePath}&systemFileName=${cbFile.systemName}&originalFileName=${cbFile.oriName}" style="width: 150px; height: 150px "><br>
					${cbFile.filePath}
				</c:forEach>
				</div>
				<ul class="reBody" style="color:#80FF00; background-color: black;">
					<li>
						<div class="reHeader">
							<p class="reWriter" style="color:#80FF00; background-color: black;">김기영</p>
							<span class="reDay"><fmt:formatDate value="${cb.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></span> 
							<span class="recomment"> <a href="#" style="color:#80FF00;">답글</a>
							</span>
						</div>
						<div class="comment">이 코드는 이런이런 형식입니다.</div>
					</li>
					<li class="reple">
						<div class="reHeader">
							<p class="reWriter" style="color:#80FF00; background-color: black;">김기영</p>
							<span class="reDay">2018.02.30 11:20</span> <span
								class="recomment"> <a href="#" style="color:#80FF00;">답글</a>
							</span>
						</div>
						<div class="comment">이 코드는 이런이런 형식입니다.</div>
					</li>
					<li class="repleW" style="display:none;">
						<div class="comment">
							<div class="reWriteDiv"
								style="  width: 87%; clear: both; padding: 10px; border-width: 1px; border-style: solid; background-color: #ffffff; background-image: none; background-repeat: repeat; border-color: #e5e5e5;">
								<table>
									<tbody>
										<tr>
											<td><textarea></textarea></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="reBtn">
								<button class="resubmit">등록</button>
							</div>

						</div>
					</li>

					<li class="reWrite">
						<div class="reWriteDiv" style="background-color: black">
							<table>
								<tbody>
									<tr>
										<td><textarea style="background-color: black"></textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="reBtn">
							<button class="resubmit" style="color:#80FF00; background-color: black;">등록</button>
						</div>
					</li>
				</ul>
			</div>
			<div class="contents_btn">
    		<a href='<c:url value="list.do" />'><button>목록</button></a>
			<a href='<c:url value="replyForm.do?no=${cb.no}" />'><button>답변</button></a>
			<a href='<c:url value="updateForm.do?no=${cb.no}" />'><button>수정</button></a>
			<a href='<c:url value="delete.do?no=${cb.no}"/>'><button>삭제</button></a>
			</div>
		</div>

	</div>
</body>
</html>