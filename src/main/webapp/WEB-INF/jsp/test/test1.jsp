<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


</style>
</head>
<body>
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
                        <span class="close-tabs">X</span>
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
                            <input type="text" value="http://codepen.io/Guklam">
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
                    </div>
                </div>
                <!-- Bookmarks -->
                
            </div>
            <iframe src="http://codepen.io/Guklam" frameborder="0" width="895px" height="404px"></iframe>
        </div> 
    </div>
	
	<script>
		$("#msgBtn").click(function () {
			$.notify("Hello World");
		})
	</script>
</body>
</html>