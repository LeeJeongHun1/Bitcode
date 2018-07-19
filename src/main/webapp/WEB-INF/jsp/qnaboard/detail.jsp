<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>BIT CODE</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/board/detail.css">
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
	<div class="qnaBody">
		<div class="shell-container">
			<!-- <h2 class="shell_title">QnA질문게시판</h2> -->
		<div class="contents_header">
			<div class="title">
				<c:if test="${empty list.qna}">
			안
			</c:if>
				<c:out value="${list.qna.title}" />
				<span class="nowrap">|</span><span class="cf"><c:out
						value="${list.qna.codeName}" /></span> <span class="day"><fmt:formatDate value="${list.qna.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
			</div>

			<div class="header_info">
				<span class="shell_writer"><c:out value="${list.qna.nickName}"/></span><span
					class="shell_hits">조회<span><c:out value="${list.qna.viewCnt}" /></span></span>

			</div>

		</div>
		<div class="contents_body">
			<div class="detail">
				<c:forEach var="qna" items="${list.qna.fileList}">
			 파일명 : <a href="${pageContext.request.contextPath}/fileDown.do?filePath=${qna.filePath}&systemFileName=${qna.systemName}&originalFileName=${qna.oriName}">${qna.oriName}</a>
       		미리보기 : <img src="${pageContext.request.contextPath}/fileDown.do?filePath=${qna.filePath}&systemFileName=${qna.systemName}&originalFileName=${qna.oriName}"
						style="width: 150px; height: 150px">
					<br>
				</c:forEach>
				${list.qna.content}
			</div>
			<%-- 댓글 출력 --%>
			<ul class="reBody">
				
			</ul>
			
			<%-- 댓글 등록 --%>
			<ul class="writeComment">
			<li class="reWrite">
			<form id="commentR"
				action=''
				method="post">
				<input type="hidden" name="no" value="${list.qna.no}"> <input
					type="hidden" name="groupNo" value="${list.qna.groupNo}">
				<div class="reWriteDiv">
				<input type="text" name="id" value="${sessionScope.user.id}" hidden="hidden"/>
				<table>
					<tbody>
						<tr>
							<th>작성자</th>
							<td><input type="text" value="${sessionScope.user.nickName}" readonly="readonly"/></td>
						</tr>
						<tr>
							<td><textarea name="content"></textarea></td>
						</tr>
					</tbody>
				</table>
				</div>
				<div class="reBtn">
					<button id="Rbtn" class="resubmit">등록</button>
				</div>
			</form>
			</li>
			</ul>
			</div>

			<div class="contents_btn">
				<a href='<c:url value="/qnaboard/list.do" />'><button>목록</button></a>
				<a href='<c:url value="/qnaboard/insertReForm.do?no=${list.qna.no}"/>'><button>답변</button></a>
				<a href='<c:url value="/qnaboard/updateForm.do?no=${list.qna.no}" />'><button>수정</button></a>
				<a href='<c:url value="/qnaboard/delete.do?no=${list.qna.no}"/>'><button>삭제</button></a>
				<!-- <a href="#"><button>삭제</button></a> -->
			</div>

		</div>

	</div>
	<script>
	// 댓글 삭제
 	function commentDelete(commentNo) {
		$.ajax({
			url: "<c:url value='/qnaboard/commentDelete.json'/>",
			data: {
				no: "${list.no}", 
				commentNo: commentNo
			},
			dataType: "json",
			success:  commentList
		});
	} 
	
		/*
		<li class="reple">
			<form id="commentU" action="" method="post">
				<input type="hidden" name="no" value="${list.no}"> 
				<input type="hidden" name="groupNo" value="${list.groupNo}">
				<div class="reHeader">
					<p class="reWriter"><input type="text" name="id" value="aa"></p>
					<span class="reDay">2018.02.30 11:20</span> 
					<span class="recomment"> <a href="#">답글</a></span>
				</div>
				<div class="comment"><textarea name="content">이 코드는 이런이런 형식입니다.</textarea></div>
				<button id="Ubtn" class="resubmit" >수정</button>
				</form>
				<a href="">삭제</a>
		</li> */

					
	//댓글 업데이트 폼
	function commentUpdateForm(commentNo){
		
		$(".reBody li[id^=cN]").show();
		$(".reBody li[id^=modCN]").remove();
		var modId = $("#cN" + commentNo + " > p.reWriter").text();
		var modContent = $("#cN" + commentNo + " > div.comment").text();
		var html ="";
		
		/* 게시판 형태
		html += '<tr id="modRow' + commentNo + '">';
		html += '	<td>' + modId + '</td>';
		html += '	<td>';
		html += '		<div class="form-group">';
		html += '			<input type="text" name="content" value="' + modContent + '" class="form-control input-wp2" placeholder="내용을 입력하세요">';
		html += '		</div>';
		html += '	</td>';
		html += '	<td colspan="2">'; 
		html += '		<a href="javascript:commentUpdate(' + commentNo + ');" class="btn btn-success btn-sm" role="button">수정</a>';
		html += '		<a href="javascript:commentCancel(' + commentNo + ');" class="btn btn-warning btn-sm" role="button">취소</a>';
		html += '	</td>';
		html += '</tr>';
		*/
	
		html += '<li id="cN' + commentNo + '" class="commentOr"><div class="reHeader"><p class="reWriter">'+ modId +'</p>';
		html += '<a href="javascript:commentUpdate(' + commentNo + ')" id="cu' + commentNo + '" class="btn btn-success btn-sm" role="button">확인</a>';
		html += '<div class="comment"><input type="text" name="" value= ' + modContent + '></div></li>'; 
	
		/* 
		html+='<li id="cN' + commentNo + '" class="commentOr"><div class="reHeader"><p class="reWriter">'+ modId +'</p>';
		html += '<a href="javascript:commentUpdate(' + commentNo + ')" id="cu' + commentNo + '" class="btn btn-success btn-sm" role="button">수정</a>';
		html += '<a href="javascript:commentDelete(' + commentNo + ')" class="btn btn-success btn-sm" role="button">삭제</a>';
		html += '<div id="cNum' + commentNo + '" class="comment">'+ modContent +'</div></li>';
		*/
		
		$("ul.reBody li#cN" + commentNo + "").after(html);
		$("ul.reBody li#cN" + commentNo + "").hide();
					
	}
					
	// 댓글 업데이트
	function commentUpdate(commentNo) {

		$.ajax({
		url: "<c:url value='/qnaboard/commentUpdate.json'/>",
		type:"POST",
		data :{
			no:"${list.no}",
			commentNo:commentNo,
		}
	   })
	.done(function(data){
		
	})
	}
					
	// 댓글 등록
	$("#Rbtn").click(function(e){
		e.preventDefault();
		var formData = $("#commentR").serialize();	
		alert(formData)
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
	
	
	
	
	</script>
</body>
</html>