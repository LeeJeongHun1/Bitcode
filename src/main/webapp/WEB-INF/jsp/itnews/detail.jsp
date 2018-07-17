<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/itnews/itnewsdetail.css" />
</head>
<body>
	<!--   기사 내용부분 -->
	  <div class="card-grid-space1">
		<div class="cardITNewsDetail1">  
	      <div>
	        <h1 id="articleTitle">${article.articleTitle}</h1>
	        <hr>
		    <span id="articleReport">${article.articleReporter}</span><span id="articleReport">${article.articleDate}</span>
		    <a href="${article.articleUrl}" id="articleUrl">원본 기사 보기 클릭...</a>
	<!-- 이미지 부분 -->
	<!-- 	<div class="card-grid-space"> -->
		    <div class="cardITNewsDetail"><img src="${article.articleThumb}"></div>
	<!-- 	  </div> -->
			<hr>
			<p id="articleContent">${fn:replace(article.articleContent, '다.', "다.<br/>")}</p>
			<a href="${article.articleUrl}" id="articleUrl">원본 기사 보기 클릭...</a>
	      </div>
	    </div>  
	  </div> 
	  <div class="btnITList">
	  <a href='${pageContext.request.contextPath}/itnews/itnews.do' class="ITList" role="button" >목록</a>
	  </div>	
<!--   댓글부분 -->
<!--  
		<div class="container-boardIT">
			<div class="rowIT">
			<form action="commentITUpdateIT" method="post">
				<div class="rowIT">
					<div class="col-md-1">
						<input type="hidden" name="no" value="${board.no}" />
						<input type="hidden" name="commentITNo" value="${commentITNo}" />
					</div>
				</div>
				<div class="rowIT">
					<div id="commentITList"></div>
				</div>	
			</form>
			</div>
		</div>
		<div class="container-boardIT">
			<div class="rowIT">
				<div id="commentIT">
					<div class="col-md-2" >
						<input type="text" name="writer" class="form-control" value="${user.name}" placeholder="ID" readonly="readonly">
					</div>
					<div class=".col-md-8" >
						<input type="text" name="content" class="form-control-input-wp1" placeholder="로그인을 해주세요" readonly="readonly">
					</div>
				</div>
			</div>
		</div>
-->	
		<div class="container-boardIT">
					<div class="rowIT">
					<form id="rForm" class="form-inline" >
						<div id="commentIT">
							<div class="col-md-1" >
								<input type="text" name="writer" class="form-control" value="홍길동" readonly="readonly">
							</div>
							<div class="col-md-10" >
								<input type="text" name="content" class="form-control-input-wp1" placeholder="내용을 입력하세요" value="기사내용 좋아요!!!!!!!!">
							</div>
							<div class="col-md-1">
								<button class="btn1 btn-primary1">등록</button>
							</div>
						</div>
					</form>
					</div>
				</div>


</body>
</html>