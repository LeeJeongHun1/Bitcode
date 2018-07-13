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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/styles.css">
<style type="text/css">
 a:link { color: #80FF00; text-decoration: none;}
 a:visited { color: #80FF00; text-decoration: none;}
 a:hover { color: #80FF00; text-decoration: underline;}
</style>
</head>

<body>
	
	<div class="container" style="color:#80FF00; background-color: black;">
    <div>
        <div class="container">
                <div class="col-md-12">
                    <h1 class="text-center" style="margin:0px;margin-top:50px;margin-bottom:41px;">코드공유게시판</h1>
                </div>
        </div>
    </div>
    <div>
        <div class="container" style="height:402px;">
            <div class="col-md-12" style="height:380px;">
            	<div class="table-responsive">
                    <div class="list" style="height:380px;">
                    <table class="table">
                        <thead>
                            <tr>
                                <th style="width:74px;font-size:14px;">&nbsp;글번호</th>
                                <th style="width:56px;font-size:14px;">분류</th>
                                <th style="width:340px;font-size:14px;">제목</th>
                                <th style="width:123px;font-size:14px;">작성자</th>
                                <th style="width:58px;font-size:14px;">등록일</th>
                                <th style="width:60px;font-size:14px;">추천수</th>
                                <th style="width:71px;font-size:14px;">조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="cb" items="${list}">
                        <c:choose>
                        	<c:when test="${cb.groupOrder==1}">
                            <tr style="height:13px; type:text/css;">
                                <td style="font-size:14px;">${cb.no}</td>
                                <td style="font-size:14px;">${cb.languageName}</td>
                                <td style="font-size:14px; text-align:left;"><a href="detail.do?no=${cb.no}">${cb.title}</a></td>
                                <td style="font-size:14px;">${cb.id}</td>
                                <td style="font-size:12px;"><fmt:formatDate value="${cb.regDate}" pattern="yyyy-MM-dd" /></td>
                                <td style="font-size:14px;">${cb.likeCnt}</td>
                                <td style="font-size:14px;">${cb.viewCnt}</td>                        
                            </tr>                        	
                        	</c:when>
                        	<c:otherwise>
                            <tr style="height:13px; type:text/css;">
                            	<td style="font-size:14px;"></td>
                                <td style="font-size:14px;">${cb.languageName}</td>
                                
                                <td style="font-size:14px; text-align:left;">
                                <c:forEach var="i" begin="1" end="${cb.depth}">
                                	<span>&nbsp;&nbsp;&nbsp;</span>
                                </c:forEach>
                                <span>RE:</span>
                                <a href="detail.do?no=${cb.no}">${cb.title}</a>
                                </td>
                                
                                <td style="font-size:14px;">${cb.id}</td>
                                <td style="font-size:12px;"><fmt:formatDate value="${cb.regDate}" pattern="yyyy-MM-dd" /></td>
                                <td style="font-size:14px;">${cb.likeCnt}</td>
                                <td style="font-size:14px;">${cb.viewCnt}</td>                        
                            </tr>                        	
                        	</c:otherwise>
                        </c:choose>
                        </c:forEach>
                        </tbody>
                    </table>
                        </div>
                </div>
            </div>
        </div>
        <div class="container" style="margin-top:11px;height:64px;width:1093px;"><select style="margin-left:395px;width:121px;margin-top:12px; color:#80FF00; background-color: black;"><optgroup label="This is a group"><option value="12" selected="">This is item 1</option><option value="13">This is item 2</option><option value="14">This is item 3</option></optgroup></select>
            <input
                type="search" style="margin-left:3px; color:#80FF00; background-color: black;"><button class="btn btn-primary" type="button" onclick="location.href='insertForm.do'" style="margin-left:277px;">글쓰기</button></div>
        <div class="container" style="margin-top:-13px;height:53px;"><span style="font-size:20px;margin-left:485px;">&lt; &nbsp;1 2 3 4 5 &nbsp;&gt;</span></div>
    </div>
	</div>

	<script>
		
	</script>
</body>

</html>