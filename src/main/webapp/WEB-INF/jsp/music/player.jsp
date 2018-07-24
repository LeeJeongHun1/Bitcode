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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/music/player.css">
</head>
<body>
	<div class="wrap">
		<div id="result" style="display: none;">
			<span class="final" id="final_span"></span> <span class="interim"
				id="interim_span"></span>
		</div>
	</div>


	<div class="musicBody">
		<!-- 			<audio src='download.do?path=" + encodeURI(path) + "&fileName="+fileName'> -->
		<audio id="myMusic" autoplay="autoplay" loop>
		</audio>
		<div class="musicList">

		<section id="playstation">
			<div id="controlpanel">
				<div id="backward" class="inlineblo">
					<i class="fa fa-backward"></i>
				</div>
				<div id="songpro" class="inlineblo"></div>
				<div id="forward" class="inlineblo">
					<i class="fa fa-forward"></i>
				</div>
				<h2>노래노래노래</h2>
			</div>
			<progress max="100" value="80"></progress>
			<ol class="fList">
				<li>노래1<span class="time">3:24</span></li>
				<li>노래2<span class="time">4:09</span></li>
				<li class="active">재생중<span class="time">3:19</span></li>
				<li>노래4<span class="time">3:54</span></li>
				<li>노래5<span class="time">4:38</span></li>
			</ol>
		</section>


		</div>
	</div>

<script src="${pageContext.request.contextPath}/resources/js/folderjs/Speech.js"></script>
<script>
	window.onload = function () {
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
		})
	}
// 	console.dir($(".musicList"));
// 	$(".musicList").dblclick(function () {
// 		console.dir(this)
// 		for(let f of this.children){
// 			f.innerHTML;
// 		}
// 	})
	console.dir($(".musicList").children());
	$(".musicList1").click(function () {
		console.dir(this);
	});
	function callMain() {
		//window.opener.location.href = '${pageContext.request.contextPath}/main/main.do';
		self.close();
	}

</script>
</body>
</html>