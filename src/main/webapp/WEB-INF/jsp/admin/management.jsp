<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIT CODE</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css" />
<link href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.css" />
<script src="${pageContext.request.contextPath}/resources/sweetalertFile/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/waitme/waitMe.min.css" />
<script src="${pageContext.request.contextPath}/resources/js/waitme/waitMe.min.js"></script>

</head>
<body>
<div class="container1">
  <h1 class="title1 twelve" id="profileName">관리</h1>
  <div class="row cf">
  
    <div id="card1" class="card six col">
		<div class="topbar red">
			<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
			<div class="maxbtn"><span></span></div>
			<div class="xbtn">x</div>
		</div>    
		  <h3 class="userInformation">문의글 통계</h3>
		  
    </div>
<%-- ${pageContext.request.contextPath}/user/updatePassForm.do --%>
    <div id="card2" class="card six col">
		<div class="topbar blue">
			<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
			<div class="maxbtn"><span></span></div>
			<div class="xbtn">x</div>
		</div>     
    	<h3 class="userInformation">Q&A 답변률</h3>
    	<div class="allCnt">총 Q&A ${allCnt}개</div>
    	<div class="ansCnt">총 Q&A 답변 ${ansCnt}개</div>
        <div id="donutchart"></div>
	</div>	

    <div id="card3" class="card six col">
		<div class="topbar yellow">
			<div class="swatches"><span class="red"></span><span class="orange"></span><span class="yellow"></span><span class="green"></span><span class="blue"></span></div>
			<div class="maxbtn"><span></span></div>
			<div class="xbtn">x</div>
		</div>
		<div>
			<h3 class="userInformation">Q&A 답변 만족률</h3>
		</div>

				
    </div>
  </div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/userInfo/userInfo.js"></script>


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script>
	// 답변률 통계 스크립트
	cnt();
	function cnt() {
		$.ajax({
			url: "/bitcode/admin/answerCnt.json",
			dataType: "json",
			success: answerCnt
		});
	};
	
	var allCnt = 0;
	var ansCnt = 0;
	var cCnt = 0;
	var javaCnt = 0;
	var javascriptCnt = 0;
	var pythonCnt = 0;
	var aspCnt = 0;
	var phpCnt = 0;
	
	// 답변률 통계 카운트출력
	function answerCnt (result) {
		allCnt = result.allCnt;
		ansCnt = result.ansCnt;
		cCnt = result.cCnt;
		javaCnt = result.javaCnt;
		javascriptCnt = result.javascriptCnt;
		pythonCnt = result.pythonCnt;
		aspCnt = result.aspCnt;
		phpCnt = result.phpCnt;

		$(".allCnt").html("총 Q&A " + allCnt + "개");
		$(".ansCnt").html("총 Q&A 답변 " + ansCnt + "개");
		
		google.charts.load("current", {packages:["corechart"]});
	    google.charts.setOnLoadCallback(drawChart);
	    function drawChart() {
	      var data = google.visualization.arrayToDataTable([
	        ['Task', 'Hours per Day'],
	        ['C', cCnt],
	        ['Java', javaCnt],
	        ['JavaScript', javascriptCnt],
	        ['Python', pythonCnt],
	        ['ASP', aspCnt],
	        ['PHP', phpCnt]
	      ]);
	
	      var options = {
	        title: 'Q&A 문의 주제',
	        pieHole: 0.4,
	      };
	
	      var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
	      chart.draw(data, options);
	    }
	}
	

</script>
</body>
</html>