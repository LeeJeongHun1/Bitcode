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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/itnews/itnews.css" />
</head>
<body>
<h1 id="h1ITNews">IT News BIT CODE</h1>
<c:if test="${sessionScope.user.auth == 'S'}">
<a href="${pageContext.request.contextPath}/crawling.do" class="crawlingBtn"><img src="${pageContext.request.contextPath}/resources/images/crawinfNews.png"></a>
</c:if>
<section class="cards-wrapper">
	<c:forEach var="newList" items="${newList}">
	  <div class="card-grid-space">
	    <a class="cardITNews" href="${pageContext.request.contextPath}/itnews/itnewsDetail.do?articleNo=${newList.articleNo}" style="--bg-img: url(https://images1-focus-opensocial.googleusercontent.com/gadgets/proxy?container=focus&resize_w=1500&url=https://codetheweb.blog/assets/img/posts/html-syntax/cover.jpg)">
	      <div><h3>IT News</h3><p>${newList.articleReporter}</p><p>${newList.articleTitle}</p></div>
	    </a>
	  </div>
  </c:forEach>
  
<!--   <div class="clear"></div> -->
 
<!--   페이징 할 곳.. -->
  <div> 1 2 3 4 5 6 7 </div>
  
</section>
  
</body>
</html>