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
            <a href="/bitcode/main/main.do" id="start-menu" data-toggle="tooltip" title="홈"><i class="fab fa-windows"></i></a>
	        <%-- 코드공유게시판 --%>
            <a href="${pageContext.request.contextPath}/codeboard/list.do" id="coding" data-toggle="tooltip" title="코드 공유 게시판"></a>
	        <%-- 단체대화방 --%>
            <a href="${pageContext.request.contextPath}/chat/chat.do" id="chat" class="chatLoginCheck" data-toggle="tooltip" title="단체 대화방"></a>
	        <%-- 원격상담 --%>
            <a href="${pageContext.request.contextPath}/remote/list.do" id="remote" data-toggle="tooltip" title="실시간 상담"></a>
	        <%-- Q&A 게시판 --%>
            <a href="${pageContext.request.contextPath}/qnaboard/list.do" id="question" data-toggle="tooltip" title="Q&A"></a>
	        <%-- IT News --%>	
            <a href="${pageContext.request.contextPath}/itnews/list.do" id="news" data-toggle="tooltip" title="IT News"></a>
	        <%-- 학원찾기 --%>
            <a href="${pageContext.request.contextPath}/searchcenter/searchCenter.do" id="search" data-toggle="tooltip" title="학원 안내"></a>
<%--             폴더 --%>
<%--             <c:if test="${!empty sessionScope.user}"> --%>
<!-- 				<a href="#folder" id="folder" ondblclick="opencom()" data-toggle="tooltip" title="내문서"></a> -->
<%--             </c:if> --%>
            <%-- 메모장 --%>
            <c:if test="${!empty sessionScope.user}">
				<a href="#note" id="notepad" onclick="notepad();" data-toggle="tooltip" title="메모장"></a>
            </c:if>
            <%-- 플레이어 --%>
            <c:if test="${!empty sessionScope.user}">
				<a onclick="window.open('${pageContext.request.contextPath}/music/player.do?id=${sessionScope.user.id}', 'player', 'width=550 height=500')" id="wmplayer" data-toggle="tooltip" title="비트 플레이어"></a>
            </c:if>
        </div>
        
        <%-- 마이인포 --%>
        <div class="icons-right">
	        <!-- <a href="#up" id="up" class="small-icons"><i class="fas fa-chevron-up"></i></a> -->
	        <a href="#sound-modal" id="sound" class="small-icons" data-toggle="tooltip" title="볼륨"></a>
	        <!-- <a href="#wifi-modal" id="wifi" class="small-icons"></a> -->
	        <div class="datetime" data-toggle="tooltip" title="시간">
	            <span class="hour">
	            	<c:set var="today" value="<%=new Date() %>" />
	                <fmt:formatDate value="${today}" pattern="HH:mm" var="toDayTime"/>
	                ${toDayTime}
	            </span>
	            <span class="date">
	                <fmt:formatDate value="${today}" pattern="yyyy/MM/dd" var="toDay"/>
	                ${toDay}
	            </span>
	        </div>
	        
	        <%-- 알람 --%>
	        <c:if test="${!empty sessionScope.user}">
	             <a href="#notifications" id="notifications" data-toggle="tooltip" title="알림"><button style="position: absolute;top: 7px; right:0;"type="button" class="button-default show-notifications active js-show-notifications">
             	<svg style="width: 36px; position: absolute; height: 25px; right: 0px; top: 5px;"  version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="32" viewBox="0 0 30 32">
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
			</c:if>
			
	        <%-- 마이인포 --%>
	        	<c:choose>
	      			<c:when test="${sessionScope.user.auth == 'U'}">
		       		<a href="${pageContext.request.contextPath}/user/userInfo.do?id=${sessionScope.user.id}" id="user" data-toggle="tooltip" title="내정보"></a>
					</c:when>
						
		        	<c:when test="${sessionScope.user.auth == 'S'}">
		       		<a href="${pageContext.request.contextPath}/admin/management.do" id="user" data-toggle="tooltip" title="관리자 화면"></a>
		        	</c:when>
		        	
		        	<c:otherwise>
		        	</c:otherwise>
	       		</c:choose>
	        
	        <%-- 로그인&아웃 --%>
            <c:choose>	
                <c:when test="${sessionScope.user.id == null}">            
                    <a href="${pageContext.request.contextPath}/login/loginForm.do" id="login" data-toggle="tooltip" title="로그인"></a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login/logout.do" id="logout" data-toggle="tooltip" title="로그아웃"></a>               
                </c:otherwise>
            </c:choose>
<%-- 	        <a href="${pageContext.request.contextPath}/login/loginForm.do" id="login"></a> --%>
	   
	        <a href="#" class="clear disabled"></a>
	        <a href="#" id="return"></a>
	         
        </div>
        </div>
    </div>
    
    
	    <!-- Chrome start -->
	    <div class="chrome chromeBody" id="chrome-pop-up">
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
	                        <span class="text-tabs">BIT Browser</span>
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
                        <!-- 크롬브라우저 주소표시줄 -->
                        <div class="search-bar">
                            <span class="info"><i class="fas fa-lock"></i> Securised</span>
                            <input type="text" id="bitUrl" value="">
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
                    
                    <!-- 크롬브라우저 즐겨찾기 -->
                    <div class="bookmarks">
                            <div class="folder-book">
                                <a target="bitBrowser" href="https://purecss.io/"><span>P</span> Pure</a>
                            </div>
                            <div class="folder-book">
                                <a target="bitBrowser" href="https://developer.mozilla.org/fr/docs/Web/CSS"><i class="fab fa-css3-alt"></i> CSS</a>
                            </div>
                            <div class="folder-book">
                                <a target="bitBrowser" href="https://www.microsoft.com/fr-fr/windows"><i class="fab fa-windows"></i> Windows 10</a>
                            </div>
                            <div class="folder-book">
                                <a target="bitBrowser" href="https://www.naver.com"><i class="fab fa-windows"></i> NAVER</a>
                            </div>
                    </div>
                </div>
	                
                <!-- Bookmarks -->
	            </div>
	            <!-- 크롬 브라우저일 경우 iframe -->
 	       		<iframe src="" frameborder="0" width="800px" height="400px"
 	       				 name="bitBrowser" id="bitBrowser"></iframe>
	        </div> 
	    </div>
	    <!-- Chrome end -->
    
    
    <!-- 메모장 시작 -->
	<div id="w-frame" class="noteBody">
		<div id="w-frame-white">
			<div id="title">
			<h4 id="nTitle">BIT NOTE</h4>
			<div id="button-wrap">
				<div class="bt close" title="Close" id="noteClose"></div>
			</div>
			<div class="clear"></div>
			</div>
			<!-- 메모장 메뉴바 -->
			<div id="container">
			<div id="menu"><ul>
			<li><a href="#">File</a>
				<div class="sub">
				<ul>
					<li><a href="#" id="newNote">New <span>Ctrl+N</span></a></li>
					<li><a href="#" id="saveNote">Save <span>Ctrl+S</span></a></li>
					<li class="topline"><a href="#" id="exitNote">Exit</a></li>
				</ul>
				</div>
				</li>
			</ul></div>
			<!-- end menu -->
			
			<!-- 메모장 내용 -->
			<textarea autofocus="autofocus" spellcheck="false" name="myNoteContent" id="myNoteContent"></textarea>
			<!-- END NOTEPAD CONTENTS -->
			</div>
			<!-- container -->
		</div>
		<!-- w-frame white -->
	</div>
	<!-- w-frame -->
	<!-- 메모장 끝 -->
	
	<!-- dock bar -->
	  <div id="dockContainer">
	    <div id="dock">
	      <ul>
	        <li>
	          <span>folder</span> 
	          <a href="#folder" id="folder" ondblclick="folderOpen()">
	          	<img src="${pageContext.request.contextPath}/resources/images/File-Explorer.ico">
	          </a>
<!-- 	          <a href="#"><img src="http://icons.iconarchive.com/icons/johanchalibert/mac-osx-yosemite/1024/launchpad-icon.png"></a> -->
	        </li>
					<li>
	          <span>System pereferences</span> <a href="#"><img src=
	          "http://icons.iconarchive.com/icons/johanchalibert/mac-osx-yosemite/1024/system-preferences-icon.png"></a>
	        </li>
					<li>
	          <span>Siri</span> <a href="#"><img src=
	          "https://pre00.deviantart.net/008b/th/pre/f/2017/169/1/3/siri_by_hs1987-dbd58rs.png"></a>
	        </li>
					<li>
	          <span>iTunes</span> <a href="#"><img src=
	          "https://forums.macrumors.com/attachments/itunes-1024x1024-png.565323/"></a>
	        </li>
	      </ul>
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


var ws = null;
var loginId = '${sessionScope.user.id}';

// 로그인 필요한 서비스 체크
$(".chatLoginCheck").click(function(e){
	e.preventDefault();
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
	} // if
	else{
		location.href='/bitcode/chat/chat.do';
	}
});

if(loginId){
	$(".chromeBody").draggable();
	
	// 브라우저 주소표시줄 입력 이벤트설정
	//$("#bitUrl")
	 $("#bitUrl").keydown(function (key) {
		if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
			$("#bitBrowser").attr('src', $("#bitUrl").val());
		}
	});
}

</script>

<!-- 알림/단체대화 스크립트 -->
<script src="${pageContext.request.contextPath}/resources/js/websocket/websocket.js"></script>
<!-- 폴더 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main/folder.css">
<script src="${pageContext.request.contextPath}/resources/js/folderjs/folder.js"></script>
<!-- 음성인식 -->
<script src="${pageContext.request.contextPath}/resources/js/folderjs/Speech.js"></script>
