<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div>
	<div class="footer-area">
	
	
 	<%-- 하단 메뉴바 --%>
    <div class="taskbar">
        <div class="icons">
        
        <%-- 메뉴 아이콘 --%>
        <div class="icons-left">
	        <%-- 메인링크 --%>
            <a href="/bitcode/main/main.do" id="start-menu"><i class="fab fa-windows"></i></a>
	        <%-- 코드공유게시판 --%>
            <a href="${pageContext.request.contextPath}/codeboard/list.do" id="coding"></a>
	        <%-- 단체대화방 --%>
            <a href="${pageContext.request.contextPath}/chat/chat.do" id="chat"></a>
	        <%-- 원격상담 --%>
            <a href="${pageContext.request.contextPath}/remote/list.do" id="remote"></a>
	        <%-- Q&A 게시판 --%>
            <a href="${pageContext.request.contextPath}/qnaboard/list.do" id="question"></a>
	        <%-- IT News --%>	
	        <c:if test="${sessionScope.user.id != null}">
            <a href="${pageContext.request.contextPath}/itnews/itnews.do" id="news"></a>
            </c:if>
	        <%-- 학원찾기 --%>
            <a href="${pageContext.request.contextPath}/searchcenter/searchCenter.do" id="search"></a>
            <%-- 크롬 브라우저 --%>
            <a href="#chrome-pop-up" id="chrome" class="border"></a>
            <%-- 폴더 --%>
            <c:if test="${!empty sessionScope.user}">
				<a href="#folder" id="folder" ondblclick="opencom()"></a>
            </c:if>
        </div>
        
        <%-- 마이인포 --%>
        <div class="icons-right">
	        <a href="#up" id="up" class="small-icons"><i class="fas fa-chevron-up"></i></a>
	        <a href="#sound-modal" id="sound" class="small-icons"></a>
	        <a href="#wifi-modal" id="wifi" class="small-icons"></a>
	        <div class="datetime">
	            <span class="hour">
	            	<c:set var="today" value="<%=new Date() %>" />
	                <fmt:formatDate value="${today}" pattern="HH:mm" var="toDayTime"/>
	                ${toDayTime}
	            </span>
	            <span class="date">
	                <fmt:formatDate value="${today}" pattern="dd/MM/yyyy" var="toDay"/>
	                ${toDay}
	            </span>
	        </div>
	        <%-- 알람 --%>
	             <a href="#notifications" id="notifications"><button style="position: absolute;top: 7px; right:0;"type="button" class="button-default show-notifications active js-show-notifications">
             	<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="32" viewBox="0 0 30 32">
            		<defs>
      					<g id="icon-bell">
	      				<path class="path1" d="M15.143 30.286q0-0.286-0.286-0.286-1.054 0-1.813-0.759t-0.759-1.813q0-0.286-0.286-0.286t-0.286 0.286q0 1.304 0.92 2.223t2.223 0.92q0.286 0 0.286-0.286zM3.268 25.143h23.179q-2.929-3.232-4.402-7.348t-1.473-8.652q0-4.571-5.714-4.571t-5.714 4.571q0 4.536-1.473 8.652t-4.402 7.348zM29.714 25.143q0 0.929-0.679 1.607t-1.607 0.679h-8q0 1.893-1.339 3.232t-3.232 1.339-3.232-1.339-1.339-3.232h-8q-0.929 0-1.607-0.679t-0.679-1.607q3.393-2.875 5.125-7.098t1.732-8.902q0-2.946 1.714-4.679t4.714-2.089q-0.143-0.321-0.143-0.661 0-0.714 0.5-1.214t1.214-0.5 1.214 0.5 0.5 1.214q0 0.339-0.143 0.661 3 0.357 4.714 2.089t1.714 4.679q0 4.679 1.732 8.902t5.125 7.098z" />
      					</g>
    					</defs>
    					<g fill="#000000">
	    				<use xlink:href="#icon-bell" transform="translate(0 0)"></use>
    					</g>
  				</svg>
  			<div class="notifications-count js-count"></div>
			</button></a>
			
	        <%-- 마이인포 --%>
	        	<c:choose>
	      			<c:when test="${sessionScope.user.auth == 'U'}">
		       		<a href="${pageContext.request.contextPath}/user/userInfo.do?id=${sessionScope.user.id}" id="user"></a>
					</c:when>
						
		        	<c:when test="${sessionScope.user.auth == 'S'}">
		       		<a href="${pageContext.request.contextPath}/admin/management.do" id="user"></a>
		        	</c:when>
		        	
		        	<c:otherwise>
		        	</c:otherwise>
	       		</c:choose>
	        
	        <%-- 로그인&아웃 --%>
            <c:choose>	
                <c:when test="${sessionScope.user.id == null}">            
                    <a href="${pageContext.request.contextPath}/login/loginForm.do" id="login"></a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login/logout.do" id="logout"></a>               
                </c:otherwise>
            </c:choose>
<%-- 	        <a href="${pageContext.request.contextPath}/login/loginForm.do" id="login"></a> --%>
	   
	        <a href="#" class="clear disabled"></a>
	        <a href="#" id="return"></a>
	         
        </div>
        </div>
    </div>
    
    
	    <!-- Chrome -->
	    <div class="chrome" id="chrome-pop-up">
	        <div class="pop-up">
	
	            <!-- Taskbar chrome-->
	            
	            <!-- Top -->
	            <div class="chrome-top">
	                <div class="chrome-tabs">
	                    <div class="triangle"></div>
	                    <div class="tabs">
	                        <span class="icons-tabs">
	                            <i class="fab fa-codepen"></i>
	                        </span>
	                        <span class="text-tabs">CodePen</span>
	                        <span class="close-tabs">x</span>
	                    </div>
	                    <div class="triangle-2"></div>
	                    <div class="new-tabs"></div>
	                </div>
	                <div class="chrome-close">
	                    <a href="#"><i class="fas fa-minus"></i></a>
	                    <a href="#"><i class="far fa-window-restore"></i></a>
	                    <a href="#"><i class="fas fa-times"></i></a>
	                </div>
	            </div>
	            <!-- Bottom -->
	            <div class="chrome-bottom">
	                <div class="options-bar">
	                    <div class="icons-bar">
	                        <div class="arrows">
	                            <a href="#"><i class="fas fa-arrow-left"></i></a>
	                            <a href="#"><i class="fas fa-arrow-right"></i></a>
	                            <a href="#"><i class="fas fa-sync"></i></a>
	                        </div>
	                        <div class="search-bar">
	                            <span class="info"><i class="fas fa-lock"></i> Securised</span>
	                            <input type="text" id="url" value="http://codepen.io/Guklam">
	                            <span class="star"><i class="far fa-star"></i></span>
	                        </div>
	                        <div class="points-bar">
	                            <div class="points">
	                                <span>•</span>
	                                <span>•</span>
	                                <span>•</span>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="bookmarks">
	                            <div class="folder-book">
	                                <a target="_blank" href="https://purecss.io/"><span>P</span> Pure</a>
	                            </div>
	                            <div class="folder-book">
	                                <a target="_blank" href="https://developer.mozilla.org/fr/docs/Web/CSS"><i class="fab fa-css3-alt"></i> CSS</a>
	                            </div>
	                            <div class="folder-book">
	                                <a target="_blank" href="https://www.microsoft.com/fr-fr/windows"><i class="fab fa-windows"></i> Windows 10</a>
	                            </div>
	                            <div class="folder-book">
	                                <a target="_blank" href="https://www.naver.com"><i class="fab fa-windows"></i> NAVER</a>
	                            </div>
	                    </div>
	                </div>
	                <!-- Bookmarks -->
	                
	            </div>
	            <!-- 폴더일 경우 div class='frame' -->
	            <div class="frame">
	            	<div class="col-sm-12">
		            	<div class="col-sm-2">
							<i class='fas fa-cloud'> 현재 용량</i>
		            	</div>
		            	<div class="col-sm-10">
<!-- 			            	<table> -->
<!-- 			            		<tr> -->
<!-- 				            		<th>파일명 ↑</th> -->
<!-- 				            		<th></th> -->
<!-- 				            		<th>최종 수정일</th> -->
<!-- 				            		<th>파일크기</th> -->
<!-- 			            		</tr> -->
<!-- 			            	</table> -->
		            	</div>
		            </div>
	            	</div>
	            <!-- 크롬 브라우저일 경우 iframe -->
	       		<iframe src="http://localhost/bitcode/main/main.do" frameborder="0" width="895px" height="404px"></iframe>
	        </div> 
	    </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.min.css">
<script>
	$("#chrome").click(function (){
		$(".frame").hide();
		$(".text-tabs").text('Chrome')
		$(".icons-tabs").find("i").removeClass().addClass("fab fa-chrome");
		$("iframe").show();
	})
	$("#folder").click(function (){
		$("iframe").hide();
		$(".text-tabs").text('id 님의 전용 폴더')
		$(".icons-tabs").find("i").removeClass().addClass("fas fa-folder-open");
		$("#url").val('https://drive.bitcode.com/my-drive');
		$(".frame").show();
	})
</script>


