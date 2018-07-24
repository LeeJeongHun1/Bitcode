<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIT CODE</title>
<%-- favicon --%>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon" />

<%-- jquery  --%> 
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<%-- 부트스트랩  --%> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/music/player.css">
</head>
<body>
	<div class="wrapBody">
	
	<div class="wrap">
		<div id="result" style="display: none;">
			<span class="final" id="final_span"></span>
			<span class="interim" id="interim_span"></span>
		</div>
	</div>

	<div class="musicBody">
		<!-- <audio src='download.do?path=" + encodeURI(path) + "&fileName="+fileName'> -->
		<!-- <audio id="myMusic" autoplay="autoplay" controls="controls" loop> -->
		<audio id="myMusic" autoplay="autoplay" loop>
		</audio>
		<div class="musicList">
			<div id="playstation">
				<div id="controlpanel">
					<div id="backward" class="inlineblo">
						<i class="fa fa-backward glyphicon glyphicon-backward"></i>
					</div>
					<div id="songpro" class="inlineblo">
					<span class="musicPlay glyphicon glyphicon-play"></span>
					</div>
					<div id="forward" class="inlineblo">
						<i class="fa fa-forward glyphicon glyphicon-forward"></i>
					</div>
					<h2>노래노래노래</h2>
				</div>
				<progress max="100" value="80"></progress>
				<%-- 음악리스트 --%>
				<ol class="fList">
				</ol>
			</div>
		</div>
	</div>
	
	</div>

<script src="${pageContext.request.contextPath}/resources/js/folderjs/Speech.js"></script>
<script>
	window.onload = function () {
		<%-- 
		// 팝업 창 크기를 HTML 크기에 맞추어 자동으로 크기를 조정하는 함수.
		var strWidth;
		var strHeight;
		//innerWidth / innerHeight / outerWidth / outerHeight 지원 브라우저
		if ( window.innerWidth && window.innerHeight && window.outerWidth && window.outerHeight ) {
			strWidth = $('.musicBody').outerWidth() + (window.outerWidth - window.innerWidth);
			strHeight = $('.musicBody').outerHeight() + (window.outerHeight - window.innerHeight);
		}
		else {
			var strDocumentWidth = $(document).outerWidth();
			var strDocumentHeight = $(document).outerHeight();

			window.resizeTo ( strDocumentWidth, strDocumentHeight );

			var strMenuWidth = strDocumentWidth - $(window).width();
			var strMenuHeight = strDocumentHeight - $(window).height();

			strWidth = $('.musicBody').outerWidth() + strMenuWidth;
			strHeight = $('.musicBody').outerHeight() + strMenuHeight;
		}
		//resize
		window.resizeTo( strWidth, strHeight );
		 --%>
		$(".musicBody").draggable();
		console.dir($("#myMusic"))
		$.ajax({
			url: "musicList.json",
			dataType: "json",
			data: {
				id: `${sessionScope.user.id}`
			}
		})
		.done(function (result) {
			var html = '';
			if(result.length == 0){
				$(".fList").html('<li>음악 폴더에 파일이 없습니다.</li>');
				return;
			}
			for(let f of result){
				html += '<li>' + f.title + '</li>'
			}
			$(".fList").html(html);
			$("#myMusic").attr('src',
					'${pageContext.request.contextPath}/main/download.do?path=' + encodeURI(`c:/java-lec/upload/${sessionScope.user.id}_music`) + '&fileName='+result[0].title+'')
			$("#myMusic").attr('autoplay', 'autoplay');
	// 		$("#myMusic")[0].onloadstart=function(){$("#myMusic")[0].play();};
			console.dir($(".fList li"));
			$(".fList li").dblclick(function () {
// 				alert(this.innerHTML);
				$("#myMusic").attr('src',
						'${pageContext.request.contextPath}/main/download.do?path=' + encodeURI(`c:/java-lec/upload/${sessionScope.user.id}_music`) + '&fileName='+this.innerHTML+'')
			})
		})
	}
// 	console.dir($(".musicList"));
// 	$(".musicList").dblclick(function () {
// 		console.dir(this)
// 		for(let f of this.children){
// 			f.innerHTML;
// 		}
// 	})


	function callMain() {
		//window.opener.location.href = '${pageContext.request.contextPath}/main/main.do';
		self.close();
	}
</script>
</body>
</html>