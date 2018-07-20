<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BIT CODE</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/qnaList.css">
</head>

<body>

	<div class="qnaBody">
	
	<%-- 상단 컬러바 --%>
	<div id="card1" class="card ten col">
		<div class="topbar blue">
		<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
		<div class="xbtn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">x</div>
		</div>
		<h1 class="information">QnA게시판</h1>
	
	
	<%-- Q&A 게시판 내용 출력 --%>
	<div class="qna">
		<table class="qnaList table table-hover">
		<thead>
		<tr>
			<th style="width: 100px; font-size: 14px;">&nbsp;글번호</th>
			<th style="width: 100px; font-size: 14px;">분류</th>
			<th style="width: 500px; font-size: 14px;">제목</th>
			<th style="width: 120px; font-size: 14px;">작성자</th>
			<th style="width: 150px; font-size: 14px;">등록일</th>
			<th style="width: 100px; font-size: 14px;">추천수</th>
			<th style="width: 100px; font-size: 14px;">조회수</th>
		</tr>
		</thead>
		<tbody>
		<%-- <c:forEach var="i" items="${list.list}">
                <tr style="height:13px; type:text/css;">
                <c:choose>
                <c:when test="${i.groupOrder == 0}">
                  <td style="font-size:14px;">${i.no}</td>
                    <td style="font-size:14px;">${i.codeName}</td>
                    <td style="font-size:14px;"><a href="detail.do?no=${i.no}">${i.title}</a></td>
                    <td style="font-size:14px;">${i.id}</td>
                    <td style="font-size:14px;"><fmt:formatDate value="${i.regDate}" pattern="yyyy-MM-dd HH-mm-ss" /></td>
                    <td style="font-size:14px;">${i.likeCnt}</td>
                    <td style="font-size:14px;">${i.viewCnt}</td>
                </c:when>
                <c:otherwise>
                    <td style="font-size:14px;"></td>
                    <td style="font-size:14px;">${i.codeName}</td>
                    <td style="font-size:14px;"><a href="detail.do?no=${i.no}">${i.title}</a></td>
                    <td style="font-size:14px;">${i.id}</td>
                    <td style="font-size:14px;"><fmt:formatDate value="${i.regDate}" pattern="yyyy-MM-dd HH-mm-ss" /></td>
                    <td style="font-size:14px;">${i.likeCnt}</td>
                    <td style="font-size:14px;">${i.viewCnt}</td>
                </c:otherwise>
                </c:choose>
                </tr>
                </c:forEach>   --%>
		</tbody>
		</table>
		<%-- <navi:page data="${pageResult}" />  --%>
		<nav style="text-align: center;">
			<ul class="pagination"></ul>
		</nav>

		<form id="list" action=''>
			<select style="margin-left: 395px; width: 121px; margin-top: 12px; height: 35px;
					border: 1px solid #d1d0cf; background-color: #fff; line-height: 29px;"
					name="type">
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="writer">글쓴이</option>
				<option value="code">분류</option>
			</select> <input type="text" id="search" name="keyword"
				style="margin-left: 3px;">
			<button id="btn" type="submit">검색</button>
		</form>
		
		 <button class="btn btn-default btn-group-xs pull-right order" type="button" onclick="location.href='insertForm.do'">글쓰기</button>		 
				 <!-- type="button" onclick="location.href='insertForm.do'">글쓰기</button> -->

	<!-- <span style="font-size:20px;margin-left:485px;">&lt; &nbsp;1 2 3 4 5 &nbsp;&gt;</span> -->
	
	</div>
	</div>
	</div>
	
	<script>
	/*
	function goPage(pageNo) {
		location.href = "list.do?pageNo=" + pageNo;
	}
	*/
	
  	window.onload = function(){
 		pageList();
	} 
	 // 페이징 처리 
	function makePageLink(data) {
		var html = "";
		if (data.count != 0) {
			var clz = "";
			if (data.prev == false) {
				clz = "disabled";
			}
			html += '<li class="' + clz + '">';
			var fn = "";
			if (data.prev == true) {
				console.log(data.beginPage +"개");
				fn = "javascript:pageList(" + (data.beginPage - 1) + ");";
			}else{
				fn = "#1"
			}
			html += '<a href="' + fn + '" aria-label="Previous">';
			html += '    <span aria-hidden="true">&laquo;</span>';
			html += '</a>';
		    html += '</li>';
		    for (var i = data.beginPage; i <= data.endPage; i++) {
		    	if (i == data.pageNo) {
				    html += '<li class="active"><a href="#1">' + i + '</a></li>';
		    	}
		    	else {
		    		html += '<li><a href="javascript:pageList(' + i + ');">' + i + '</a></li>';
		    	}
		    }
			clz = "";
			if (data.next == false) {
				clz = "disabled";
			}
			html += '<li class="' + clz + '">';
			fn = "";
			if (data.next == true) {
				fn = "javascript:pageList(" + (data.endPage + 1) + ");";
			}else{
				fn = "#1";
			}
			html += '<a href="' + fn + '" aria-label="Next">';
			html += '    <span aria-hidden="true">&raquo;</span>';
			html += '</a>';
		    html += '</li>';
		}
		$("nav > ul.pagination").html(html);
	}
	 // 리스트 출력
	function pageList(pageNo){
		if (pageNo === undefined) {
			pageNo = 1;
		}
		$.ajax({
			url: "<c:url value='/qnaboard/list.json' />",
			data: {pageNo: pageNo},
			dataType: "json"
		})
		.done(function (data){
			makeList(data)
			makePageLink(data.pageResult)
		});
		return false;
		}
	
	 //검색 페이징
	  function searchMakePageLink(data) {
		var html = "";
		if (data.count != 0) {
			var clz = "";
			if (data.prev == false) {
				clz = "disabled";
			}
			html += '<li class="' + clz + '">';
			var fn = "";
			if (data.prev == true) {
				console.log(data.beginPage +"개");
				fn = "javascript:searchList(" + (data.beginPage - 1) + ");";
			}else{
				fn = "#1"
			}
			html += '<a href="' + fn + '" aria-label="Previous">';
			html += '    <span aria-hidden="true">&laquo;</span>';
			html += '</a>';
		    html += '</li>';
			
		    for (var i = data.beginPage; i <= data.endPage; i++) {
		    	if (i == data.pageNo) {
				    html += '<li class="active"><a href="#1">' + i + '</a></li>';
		    	}
		    	else {
		    		html += '<li><a href="javascript:searchList(' + i + ');">' + i + '</a></li>';
		    	}
		    }
			clz = "";
			if (data.next == false) {
				clz = "disabled";
			}
			html += '<li class="' + clz + '">';
			fn = "";
			if (data.next == true) {
				fn = "javascript:searchList(" + (data.endPage + 1) + ");";
			}else{
				fn = "#1";
			}
			html += '<a href="' + fn + '" aria-label="Next">';
			html += '    <span aria-hidden="true">&raquo;</span>';
			html += '</a>';
		    html += '</li>';
		}
		$("nav > ul.pagination").html(html);
	}
	
	// 검색 
	function searchList(pageNo){
	$("#btn").click(function(){
		$.ajax({
			//type:'post',
			url:"<c:url value='/qnaboard/search.json'/>",
			data:{type: $("select[name='type']").val(), 
				  keyword: $("input[name='keyword']").val(),
				  pageNo: pageNo},
			dataType: "json"
		})
		.done(function (data){
			makeList(data);
			searchMakePageLink(data.pageResult)
		});
		return false;
		})
		
	}
	
	// Q&A 리스트 출력
	function makeList(data){
		var html="";
		$(".table tbody").html("");
			for(let i of data.list){
			console.log(data.list);
			if(i.groupOrder == 0){
				html+='<tr>';
				html+='<td>'+i.no+'</td>';
				html+='<td>'+i.codeName+'</td>';
				html+='<td style="text-align:left;"><a href="detail.do?no='+i.no+'">'+i.title+'</a></td>';
				html+='<td>'+i.nickName+'</td>';
				var date = new Date(i.regDate);
				var time = date.getFullYear() + "-" 
				         + (date.getMonth() + 1) + "-" 
				         + date.getDate();
				         /* + date.getHours() + ":"
				         + date.getMinutes() + ":"
				         + date.getSeconds(); */
				html+= '<td>' + time + '</td>'; 
				html+= '<td>'+i.likeCnt+'</td>';
                html+= '<td>'+i.viewCnt+'</td>'; 
				html+= '</tr>'	
			}else{
				html+='<tr>';
				html+='<td></td>';
				html+='<td>'+i.codeName+'</td>';
				html+='<td style="text-align:left;"><a href="detail.do?no='+i.no+'">⤷ '+i.title+'</a></td>';
				html+='<td>'+i.nickName+'</td>';
				var date = new Date(i.regDate);
				var time = date.getFullYear() + "-" 
				         + (date.getMonth() + 1) + "-" 
				         + date.getDate();
				        /*  + date.getHours() + ":"
				         + date.getMinutes() + ":"
				         + date.getSeconds(); */
				html+= '<td>' + time + '</td>'; 
				html+= '<td>'+i.likeCnt+'</td>';
                html+= '<td>'+i.viewCnt+'</td>'; 
				html+= '</tr>'	
			}
 		}	
		$(".table tbody").html(html);
	}	
	
	searchList();
		
	// 글쓰기버튼 로그인 확인
	$(".order").click(function(){
		if("${sessionScope.user}" == ""){
			swal({
				  title: '로그인이 필요한 서비스 입니다.',
				  text: "확인을 누르시면 로그인 페이지로 이동합니다.",
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '확인'
				}).then((result) => {
				  if (result.value) {
					  location.href='/bitcode/login/loginForm.do'
				  }
				})
		} // 로그인알림
	})
	
	$(".qnaBody").draggable();

	</script>

</body>

</html>