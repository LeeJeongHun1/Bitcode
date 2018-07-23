<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListBoard</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/codeList.css">
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: underline;}
</style>
</head>

<body>
	<div class="codeBody">
		<%-- 상단 컬러바 --%>
	<div id="card1" class="card ten col">
		<div class="topbar yellow">
		<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
		<div class="xbtn" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">x</div>
		</div>
		<h1 class="information">코드공유게시판</h1>
	
	<div class="code">
                    <table class="codeList table table-hover">
                        <thead>
                            <tr>
                                <th style="width:100px;font-size:14px;">&nbsp;글번호</th>
                                <th style="width:100px;font-size:14px;">분류</th>
                                <th style="width:500px;font-size:14px;">제목</th>
                                <th style="width:120px;font-size:14px;">작성자</th>
                                <th style="width:150px;font-size:14px;"><a href="#" onclick="codeList(1, 1)">등록일</a></th>
                                <th style="width:100px;font-size:14px;"><a href="#" onclick="codeList(1, 2)">추천수</a></th>
                                <th style="width:100px;font-size:14px;"><a href="#" onclick="codeList(1, 3)">조회수</a></th>
                            </tr>
                        </thead>
                        <tbody id="listTbody">
                        </tbody>
                    </table>
                    <nav style="text-align: center;">
					<ul class="pagination"></ul>
					</nav>
        <form id="list" name="form1" style="margin-left: 370px;
        float:left">
        <select id="option" name="searchOption" style="background-color: #fff;">
        	<option value="0">분류</option>
        	<option value="1">이름</option>
        	<option value="2">내용</option>
        	<option value="3">제목</option>
        </select>
        <input name="keyword" id="input">
        <input id="search" type="button" value="조회">
        </form>
        <c:if test="${user.id!=null}">
            <button class="btn btn-primary" type="button" onclick="location.href='insertForm.do'" style="margin-left:-245px;margin-bottom: 50px;
    margin-top: -3px;">글쓰기</button>
        </c:if>
	</div>
	</div>
    </div>
    <script>
    var session = '${sessionScope.user.id}';
    </script>
	<script src="${pageContext.request.contextPath}/resources/js/codeboard/codeBoardList.js"></script>
</body>
</html>