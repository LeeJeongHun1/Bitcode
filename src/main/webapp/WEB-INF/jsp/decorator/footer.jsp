<%@ page contentType="text/html; charset=UTF-8" %>


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
            <a href="${pageContext.request.contextPath}/itnews/itnews.do" id="news"></a>
	        <%-- 학원찾기 --%>
            <a href="${pageContext.request.contextPath}/searchcenter/searchCenter.do" id="search"></a>
            <%-- 디렉토리 --%>
            <a href="#chrome-pop-up" id="chrome" class="border"></a>
        </div>
        
        <%-- 마이인포 --%>
        <div class="icons-right">
	        <a href="#up" id="up" class="small-icons"><i class="fas fa-chevron-up"></i></a>
	        <a href="#sound-modal" id="sound" class="small-icons"></a>
	        <a href="#wifi-modal" id="wifi" class="small-icons"></a>
	        <div class="datetime">
	            <span class="hour">
	                23:58
	            </span>
	            <span class="date">
	                03/05/2018
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
	        <a href="${pageContext.request.contextPath}/user/userInfo.do" id="user"></a>
	        <a href="${pageContext.request.contextPath}/login/login.do" id="login"></a>
	   
	        <a href="#" class="clear disabled"></a>
	        <a href="#" id="return"></a>
	         
        </div>
        </div>
    </div>
	
	
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.min.css">
