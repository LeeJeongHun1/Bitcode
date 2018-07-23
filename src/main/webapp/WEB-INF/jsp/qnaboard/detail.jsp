<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>BIT CODE</title>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board/detail.css"> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board/qnaDetail.css">
<style>
a {
	color: #333333
}
</style>
</head>
<body>


	<input type="hidden" name="groupNo" value="${list.qna.groupNo}">
	<input type="hidden" name="depth" value="${list.qna.depth}">
	<input type="hidden" name="groupOrder" value="${list.qna.groupOrder}">
	<input type="hidden" name="oriId" value="${list.id}"> 
	
	<div class="qnaDetailBody">
	<div id="card1" class="card ten col">
		<div class="topbar blue">
		<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
		<div class="xbtn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">x</div>
		</div> 
		
		<div class="shell-container qna">
			<!-- <h2 class="shell_title">QnA질문게시판</h2> -->
		<div class="contents_header">
			<div class="titleWrap">
				<c:if test="${empty list.qna}">없습니다.</c:if>
				<div class="title">
				<span class="qnaTitle"><c:out value="${list.qna.title}" /></span>
				<span class="nowrap">|</span>
				<span class="cf"><c:out value="${list.qna.codeName}" /></span>
				</div>
				<span class="day"><fmt:formatDate value="${list.qna.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
			</div>

			<div class="header_info">
				<span class="shell_writer"><c:out value="${list.qna.nickName}"/></span>
				<span class="shell_hits">조회<span><c:out value="${list.qna.viewCnt}" /></span></span>
			</div>
		</div>
		<div class="qnaList">
		<div class="contents_body">
			<div class="detail">
			<div class="contents" style="">
			<c:forEach var="qna" items="${list.qna.fileList}">파일명 : 
			<a href="${pageContext.request.contextPath}/fileDown.do?filePath=${qna.filePath}&systemFileName=${qna.systemName}&originalFileName=${qna.oriName}">${qna.oriName}</a>
       		미리보기 : 
       		<img src="${pageContext.request.contextPath}/fileDown.do?filePath=${qna.filePath}&systemFileName=${qna.systemName}&originalFileName=${qna.oriName}"
				style="width: 150px; height: 150px">
			<br>
			</c:forEach>
			${list.qna.content}
			</div>
			<div class="like">
			<a id="qnaLike" href="javascript:recommend()">추천 </a>
            <span class="like_count"><c:out value="${list.qna.likeCnt}" /></span>
			</div>
			</div>
			
			<%-- 댓글 출력 --%>
			<ul class="reBody">
				
			</ul>
			
			<%-- 댓글 등록 --%>
			<ul class="writeComment">
			<li class="reWrite">
			<form id="commentR" action='' method="post">
				<input type="hidden" name="no" value="${list.qna.no}">
				<input type="hidden" name="groupNo" value="${list.qna.groupNo}">
				<div class="reWriteDiv">
				<input type="text" name="id" value="${sessionScope.user.id}" hidden="hidden"/>
				<table>
					<tbody>
						<tr>
							<td style="width:130px;">${sessionScope.user.nickName}</td>
							<td width="500px"><textarea name="content" style="resize: none;"></textarea></td>
							<td width="100px"><button id="Rbtn" class="resubmit btn btn-default btn-group-xs">등록</button></td>
						</tr>
					</tbody>
				</table>
				</div>
				<!-- 
				<div class="reBtn">
				</div>
				 -->
			</form>
			</li>
			</ul>
			</div>

			<div class="contents_btn">
				<a href='<c:url value="/qnaboard/list.do" />'><button>목록</button></a>
				<a id="cBtn" href='<c:url value="/qnaboard/insertReForm.do?no=${list.qna.no}"/>'><button>답변</button></a>
				<a href='<c:url value="/qnaboard/updateForm.do?no=${list.qna.no}" />'><button>수정</button></a>
				<a href='<c:url value="/qnaboard/delete.do?no=${list.qna.no}"/>'><button>삭제</button></a>
				<!-- <a href="#"><button>삭제</button></a> -->
			</div>

			
		</div>
		<!-- qnaList -->
		</div>
		<!-- qna -->
		</div>
		<!-- card1 -->
	</div>
	<!-- qnaBody -->
	
	
	<script>
	// 추천 
	//var oriWriter = $("input[name='id']").val();
	
	
	var session = '${sessionScope.user.auth}';
	var sessionP = '${sessionScope.user.point}';
	//alert(sessionP);
	 
	// 답글 관리자및 고수로 제한
	$("#cBtn").click(function(){ 
		if(session != 'S' && sessionP <= 250 ){
			alert("관리자 와 고수외에는 답글이 불가능 합니다.")
			return false;
		}
		
	});
	
	function recommend(){
		$.ajax({
		    url:"<c:url value='/qnaboard/likeUpdate.json'/>",
		   data:{no:"${list.qna.no}",
			     id: $("input[name='id']").val()},
		   dataType: "json"
		})
		.done(function(result){
 			if(result == '0'){
				alert("이미 추천한 글입니다.")
		 	} else{
		 		$(".like_count").html(result);				
		 	};
		});
	}
	// 댓글 삭제
 	function commentDelete(commentNo) {
		$.ajax({
			url: "<c:url value='/qnaboard/commentDelete.json'/>",
			data: {
				no: "${list.qna.no}", 
				commentNo: commentNo
			},
			dataType: "json",
			success:  commentList
		});
	} 
	
	//댓글 업데이트 폼
	function commentUpdateForm(commentNo){
		$(".reBody li[id^=cN]").show();
		$(".reBody li[id^=modCN]").remove();
		
		var modId = $("#cN" + commentNo + " > div.reHeader > p.reWriter").text();
		var modContent = $("#cNum" + commentNo).text();
		
		var html = '';
	
		html += '<li id="cN' + commentNo + '" class="commentOr">';
		html += '<div class="reHeader">';
		html += '<p class="reWriter">'+ modId +'</p>';
		html += '<span class="reDay"></span>';
		html += '<div>';
		html += '<a href="javascript:commentUpdate(' + commentNo + ');" id="cu' + commentNo + '" class="btn btn-success btn-sm" role="button">확인</a>';
		html += '<a href="javascript:commentCancel(' + commentNo + ');" id="cu' + commentNo + '" class="btn btn-success btn-sm" role="button">취소</a>';
		html += '</div>';
		html += '<div id="cNum' + commentNo + '" class="comment"><input type="text" name="content" id="modComment' + commentNo + '" value="' + modContent + '"></div>'; 
		html += '</li>';
		
		$("#cN" + commentNo).after(html);
		$("#cN" + commentNo).hide();
	} // 댓글 업데이트 폼
					
	// 댓글 업데이트
	function commentUpdate(commentNo) {
		$.ajax({
		url: "<c:url value='/qnaboard/commentUpdate.json'/>",
		type:"POST",
		data :{
			no:"${list.qna.no}",
			commentNo:commentNo,
			content: $("#modComment" + commentNo).val()
			},
		dataType: "json"
	   })
	.done(function(data){
		commentList(data);
	});
	} // 댓글 업데이트
	
	// 댓글 수정 취소
	function commentCancel(commentNo) {
		$("#cN" + commentNo).show();
		$("#modCN" + commentNo).remove();
	} // 댓글 수정 취소
	
	// 댓글 등록
	$("#Rbtn").click(function(e){
		e.preventDefault();
		var formData = $("#commentR").serialize();	
	$.ajax({
		url: "<c:url value='/qnaboard/commentRegist.json'/>",
		type:"POST",
		cache: false,
		data: formData
	}).done(function(data){
		$("#commentR > div.reWriteDiv textarea").val("");
		commentList(data);
	})
	})
	
	// 댓글 리스트 출력
	function  commentList(data){
		var html ="";
		$("ul.reBody").html("");
		for(let i of data){
			html+='<li id="cN' + i.commentNo + '" class="commentOr"><div class="reHeader"><p class="reWriter">'+i.id+'</p>';
			var date = new Date(i.regDate);
			var time = date.getFullYear() + "년" 
			         + (date.getMonth() + 1) + "울" 
			         + date.getDate() + "일"
			         + date.getHours() + ":"
			         + date.getMinutes() + ":"
			         + date.getSeconds();
			html += '<span class="reDay">' + time + '</span>';
 			html += '<a href="javascript:commentUpdateForm(' + i.commentNo + ')" id="cu' + i.commentNo + '" class="btn btn-success btn-sm" role="button">수정</a>';
			html += '<a href="javascript:commentDelete(' + i.commentNo + ')" class="btn btn-success btn-sm" role="button">삭제</a>';
			/* html += '<span class="recomment"><a href="#">답글</a></span></div>';   */
			html += '<div id="cNum' + i.commentNo + '" class="comment">'+i.content+'</div></li>'; 
		}
		if(data.length == 0){
			html += '<div class="comment">리뷰가 존재하지 않습니다.</div></li>';
		}
		$("ul.reBody").html(html);
	
} 
	function selectComment(){
		$.ajax({
			url: "<c:url value='/qnaboard/commentList.json'/>",
			data:{no:"${list.qna.no}"},
			dataType:"json",
		}).done(function(data){
			commentList(data);
		})
	}
	
	selectComment();
	
	
	$(".qnaDetailBody").draggable();
	
	
	</script>
</body>
</html>