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
            <a href="#" id="coding"></a>
	        <%-- 단체대화방 --%>
            <a href="#" id="chat"></a>
	        <%-- 원격상담 --%>
            <a href="#" id="remote"></a>
	        <%-- Q&A 게시판 --%>
            <a href="${pageContext.request.contextPath}/qnaboard/viewDetail.do" id="question"></a>
	        <%-- IT News --%>
            <a href="#" id="news"></a>
	        <%-- 학원찾기 --%>
            <a href="#" id="search"></a>
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
	        <%-- 마이인포 --%>
	        <a href="${pageContext.request.contextPath}/user/userInfo.do" id="user"></a>
	        <a href="#notifications" id="notifications"><i class="far fa-bell"></i></a>
	        <a href="#" class="clear disabled"></a>
	        <a href="#" id="return"></a>
	        
        </div>
        </div>
    </div>
	
	
    </div>
</div>

<script>
</script>