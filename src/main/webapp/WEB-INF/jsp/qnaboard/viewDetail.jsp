<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.contents_header {
	position: relative;
	padding: 20px;
	background-color: #f3f3f3;
	border: 1px solid #e6e6e6;
	border-top: 1px solid #b3b3b3;
	width: 900px;
	    margin: auto;
	height:85px;
}

.contents_header>.title {
	color: #1a1a1a;
	font-size: 17px;
	font-weight: 600;
	word-wrap: break-word;
}

.contents_body {
	font-family: Arial, Verdana, "Trebuchet MS", sans-serif;
	font-size: 12px;
	color: #333;
	background-color: #fff;
	border: 1px solid #e6e6e6;
	border-top: none;
	padding: 20px;
	font-size: 13px;
	line-height: 1.6;
	width: 900px;
	height: 500px;
	overflow-y: scroll;
	    margin: auto;
}
.detail { min-height:240px;}
.nowrap {
	font-weight: normal;
	padding-left: 6px;
	font-weight: normal;
	color: #666666;
}

.cf {
	padding-left: 5px;
	line-height: 1.5;
	color: #666666;
	font-size: 15px;
	font-weight: normal;
}

.day {
	padding-left: 5px;
	line-height: 1.5;
	position: absolute;
	color: #666666;
	font-size: 15px;
	right: 20px;
	font-weight: normal;
	font-size: 13px;
}

.shell_writer {
	float: left;
	margin-right: 20px;
	margin-top: 10px;
}

.shell_hits {
	float: right;
	color:#666666;
	margin-top: 10px;
	font-size: 13px;
}
.shell_hits > span {padding-left:5px;}
.reHeader{
}

.reBody {
	background: #f5f5f5;
	border-radius: 4px;
	padding: 10px;
}

.reWriter {
	display: inline-block;
	margin:5px 0 0 6px;
	vertical-align: top;
	color: #666;
	word-wrap: break-word;
	font-weight: bold;
}

.reDay {
	font-size: 11px;
	font-family: '돋움', dotum, Helvetica, sans-serif;
	margin: 6px 0 0 1px;
    display: inline-block;
}
.recomment{    padding-left: 10px;
    background: url(../images/arrow.png) no-repeat 0 0;
    background-size:21px;
    }
.comment { margin:5px;}
</style>
</head>
<body>
	<div class="container">
		<div class="shell-container">
			<div class="contents_header">
				<div class="title">
					제목입니다.<span class="nowrap">|</span><span class="cf">JAVA</span> <span
						class="day">2018-02-10</span>
				</div>

				<div class="header_info">
					<span class="shell_writer">홍길동</span><span class="shell_hits">조회<span>4</span></span>

				</div>
			</div>
			<div class="contents_body">
				<div class="detail">
					<!-- <img src="../images/test.png">  -->코드 관련 질문입니다.
				</div>
				<div class="reBody">
					<div class="reHeader">
						<p class="reWriter">김기영</p>
						<span class="reDay">2018.02.30 11:20</span> <span
							class="recomment"> <a href="#">답글</a>
						</span>
					</div>
					<div class="comment">이 코드는 이런이런 형식입니다.</div>
				</div>
			</div>

		</div>
		<!--  <div class="shell-container">
    <div class="header-shell">
      <img class="cli-img" src="https://upload.wikimedia.org/wikipedia/en/e/ef/Command_prompt_icon_%28windows%29.png" alt="windows_cli.png" />
      <p class="shell-title">C:\\Windows\system32\cmd.exe</p>
      <span class="minimize"></span>
      <span class="maximize"></span>
      <span class="close"></span>
    </div>
    <div class="body-shell">
    <p class="microsoft-label">Microsoft Windows [version 10.0.10586]</p>
    <p class="microsoft-label">(c) 2015 Microsoft Corporation. All rights reserved.</p>
      <p class="input">C:\Users\Guest> I am in love with codepen <3 <span class="ping"></span> </p>    
    </div>
  </div> -->
	</div>
</body>
</html>