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
<!--  <div class="card ten col"> -->
	 <div class="cardITNewsDetail1">  
		<div class="articleall"> 
	 	<h1 id="articleTitle">${article.articleTitle}</h1>
	    <hr>
	    <span id="articleReport">${article.articleReporter}</span><span id="articleReport">${article.articleDate}${article.articleNo}</span>
	    <a href="${article.articleUrl}" id="articleUrl">원본 기사 보기 클릭...</a>
	    <div class="cardITNewsDetail"><img src="${article.articleThumb}"></div>
		<hr>
<!-- 		<p id="articleContent"></p> -->
		${fn:replace(article.articleContent, '다.', "다.<br/>")}
		<a href="${article.articleUrl}" id="articleUrl">원본 기사 보기 클릭...</a>
		<!-- 댓글	-->
			<div id="comment">
				<hr><br>
				<div id="commentList"></div>
				<div><br>
					<form id="writeForm">
						<h5>댓글쓰기</h5>
						<textarea name="commentText"></textarea>
						<button>등록</button>
					</form>
					<div style="text-align: right;">
						<c:if test="${sessionScope.user.id eq newsComment.id}">
							<button class="btn" onclick="location.href='updateForm.do?articleNo=${user.id}'">수정</button>
							<button class="btn" onclick="location.href='delete.do?articleNo=${user.id}'">삭제</button>
						</c:if>
						<div class="btnITList"><a href='${pageContext.request.contextPath}/itnews/itnews.do' class="ITList" role="button" >목록</a></div>	
					</div>
				</div>
			</div>	 
		</div>		 
	  </div> 
</div> 
	  



<!--   댓글부분 -->
<script>
	function makeCommentList(result) {
		var html = "";
		for (let i = 0; i < result.length; i++) {
			var comment = result[i];
// 		console.log("-------------")
			html += '<div class="comment_box" id="comment'+comment.commentNo+'">';
			html += '  <h5><span id="commentId">'+comment.id+'</span>';
// 			if (${sessionScope.user.id} == comment.id) {
			html += '    <button class="btn" onclick="commentUpdateForm('+comment.commentNo+');">수정</button>'
			html += '    <button class="btn" onclick="commentDelete('+comment.commentNo+');">삭제</button></h5>';
// 			}
			html += '  <div id="commentTextDiv">'+comment.content+'</div>';
			html += '  <br>';
// 			var date = new Date(comment.commentDate);
// 			var time = date.getFullYear() + "-" 
// 			         + (date.getMonth() + 1) + "-" 
// 			         + date.getDate() + " "
// 			         + date.getHours() + ":"
// 			         + date.getMinutes() + ":"
// 			         + date.getSeconds();
// 			html += '  <span>'+ time +'</span>';
			html += '</div>';
			html += '<br><br><hr><br>';
		}
		if (result.length == 0) {
			html += '<div class="comment_box">댓글이 존재하지 않습니다.</div>'
		}
		$("#commentList").html(html);
	}
	
	function commentList() {
		$.ajax({
			url: "/bitcode/itnews/commentList.json",
			type: "GET",
			data: {articleNo:"${article.articleNo}"},
			dataType: "json",
			success: makeCommentList
		});
	}

	
	$("#writeForm").submit(function (e) {
		e.preventDefault();
		$.ajax({
			url: "/bitcode/itnews/commentWrite.json",
			type: "GET",
			data: {
				id: "${sessionScope.user.id}",
				articleNo: "${article.articleNo}",
				content: $("#writeForm textarea").val()
			},
			dataType: "json"
		})
		.done(function (result) {
			console.log(result)
			$("#writeForm textarea").val("");
			makeCommentList(result);
		});
	});
	
	function commentDelete(commentNo) {
		$.ajax({
			url: "/bitcode/itnews/commentDelete.json",
			data: {
				articleNo: "${article.articleNo}",
				commentNo: commentNo
			},
			dateType: "json",
			success: makeCommentList
		});
	}
	
	function commentUpdateForm(commentNo) {
		var html = '';
		html += '<div id="modComment'+ commentNo +'">';
		html += '  <h5>' + $("#comment"+commentNo+"> h5 > #commentName").text();
		html += '  <button class="btn" onclick="commentUpdate('+ commentNo +');">수정</button>';
		html += '  <button class="btn" onclick="commentCancel('+ commentNo +');">취소</button></h5>';
		html += '<textarea name="commentText" id="commentText'+ commentNo +'">';
		html += $("#comment"+commentNo+"> #commentTextDiv").text();
		html += '</textarea>';
		html += '</div>';
		$("#comment" + commentNo).after(html);
		$("#comment" + commentNo).hide();
	}
	
	function commentUpdate(commentNo) {
		$.ajax({
			url: "/bitcode/itnews/commentUpdate.json",
			type: "GET",
			data: {
				articleNo: "${article.articleNo}",
				commentNo: commentNo,
				content: $("#commentText" + commentNo).val()
			},
			dateType: "json",
			success: function (result) {
				makeCommentList(result);
			}
		});
	}
	
	function commentCancel(commentNo) {
		$("#comment" + commentNo).show();
		$("#modComment" + commentNo).remove();
	}
	commentList();
</script>


</body>
</html>