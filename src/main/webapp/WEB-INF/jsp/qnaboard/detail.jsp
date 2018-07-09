<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board/detail.css">
<style>
a {color:#333333}

</style>
</head>
<body>
	<div class="container">
		<div class="shell-container">
		<!-- <h2 class="shell_title">QnA질문게시판</h2> -->
			<div class="contents_header">
				<div class="title">
					제목입니다.<span class="nowrap">|</span><span class="cf">JAVA</span> <span
						class="day">2018-02-10</span>
				</div>

				<div class="header_info">
					<span class="shell_writer">홍길동</span><span class="shell_hits">조회<span>4</span></span>

				</div>
			</div>
			<div class="contents_body">
				<div class="detail">
					<!-- <img src="../images/test.png">  -->
					코드 관련 질문입니다.
				</div>
				<ul class="reBody">
					<li>
						<div class="reHeader">
							<p class="reWriter">김기영</p>
							<span class="reDay">2018.02.30 11:20</span> <span
								class="recomment"> <a href="#">답글</a>
							</span>
						</div>
						<div class="comment">이 코드는 이런이런 형식입니다.</div>
					</li>
					<li class="reple">
						<div class="reHeader">
							<p class="reWriter">김기영</p>
							<span class="reDay">2018.02.30 11:20</span> <span
								class="recomment"> <a href="#">답글</a>
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
						<div class="reWriteDiv">
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
					</li>
				</ul>
			</div>
			<div class="contents_btn">
    		<a href='<c:url value="/qnaboard/list.do" />'><button>목록</button></a>
			<a href='#'><button>답변</button></a>
			<a href="#"><button>수정</button></a>
			<a href="#"><button>삭제</button></a>
			</div>
		</div>

	</div>
</body>
</html>