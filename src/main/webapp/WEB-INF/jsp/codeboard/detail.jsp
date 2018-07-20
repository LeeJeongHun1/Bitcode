<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board/codeDetail.css">
</head>
<body>
<div class="detailBoay">
	<div id="card1" class="card ten col">
		<div class="topbar yellow">
		<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
		<div class="xbtn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">x</div>
		</div>
<!-- 		<h1 class="information">상세보기</h1> -->
<!-- 	<div class="detail"> -->
<!-- 		<div class="detailList"> -->
<%-- 					<c:out value="${cb.title}"/> --%>
<!-- 					<span class="nowrap">|</span> -->
<%-- 					<span class="cf" >${cb.languageName}</span>  --%>
<!-- 					<span class="day" >2018-02-10</span> -->
<%-- 			<input type="hidden" name="groupOrder" value="${cb.groupOrder}" />  --%>
<%-- 			<input type="hidden" name="depth" value="${cb.depth}" /> --%>
<%-- 			<input type="hidden" name="groupNo" value="${cb.groupNo}" /> --%>
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->
<!-- </div> -->

	<div class="container">
		<div class="shell-container">
			<div class="contents_header" >
				<div class="title" >
					<c:out value="${cb.title}" /><span class="nowrap">|</span>
					<span class="cf" >${cb.languageName}</span> 
					<span class="day" >2018-02-10</span>
			<input type="hidden" name="groupOrder" value="${cb.groupOrder}" /> 
			<input type="hidden" name="depth" value="${cb.depth}" />
			<input type="hidden" name="groupNo" value="${cb.groupNo}" />
				</div>

				<div class="header_info">
					<span class="shell_writer" ><c:out value="${cb.id}" /></span>
					<span class="shell_hits" >조회<c:out value="${cb.viewCnt}" /></span>
					<span class="shell_recommend" id='likeCnt'>추천<c:out value="${cb.likeCnt}" /></span>

				</div>
			</div>
			<div class="contents_body" >
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
				<ul class="reBody" >
					<li>
						<div class="reHeader">
							<p class="reWriter" >a</p>
							<span class="reDay"><fmt:formatDate value="${cb.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></span> 
							<span class="recomment"> <a href="#" >답글</a>
							</span>
						</div>
						<div class="comment">cmt</div>
					</li>
					<li class="reple">
						<div class="reHeader">
							<p class="reWriter" >a</p>
							<span class="reDay">2018.02.30 11:20</span> <span
								class="recomment"> <a href="#" >답글</a>
							</span>
						</div>
						<div class="comment">cmt</div>
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
						<div class="reWriteDiv" >
							<table>
								<tbody>
									<tr>
										<td><textarea ></textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="reBtn">
							<button class="resubmit">등록</button>
						</div>
					</li>
				</ul>
			</div>
			<div class="contents_btn">
    		<a href='<c:url value="list.do" />'><button>목록</button></a>
			<a href='<c:url value="replyForm.do?no=${cb.no}" />'><button>답변</button></a>
			<a href='<c:url value="updateForm.do?no=${cb.no}" />'><button>수정</button></a>
			<a href='<c:url value="delete.do?no=${cb.no}"/>'><button>삭제</button></a>
			<a href='#'><button onclick="recommend();">추천</button></a>
			</div>
		</div>
		</div>
	</div>
	<script>
	function recommend() {
		$.ajax({
			url: "like.json",
			dataType: "json",
			data: {
				id: '${sessionScope.user.id}',
				no: ${cb.no}
			}
		})
		.done(function (result){
			if(result == '0'){
				alert('이미 추천한 게시글 입니다.')
			}else{
				alert('추천 완료');
				$("#likeCnt").html('추천' + result)
			}
		})
	}
	</script>
</body>
</html>