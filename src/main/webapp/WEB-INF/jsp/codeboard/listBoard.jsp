<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListBoard</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/codeboard/styles.css">
</head>

<body>
	
	<div class="container" style="color: white; background-color: red">
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="text-center" style="margin:0px;width: 1170px;margin-top:50px;margin-bottom:41px;">코드공유게시판</h1>
                </div>
            </div>
        </div>
    </div>
    <div>
        <div class="container" style="height:402px;">
            <div class="col-md-12" style="height:380px;">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th style="width:74px;font-size:14px;">&nbsp;글번호</th>
                                <th style="width:56px;font-size:14px;">분류</th>
                                <th style="width:356px;font-size:14px;">제목</th>
                                <th style="width:123px;font-size:14px;">작성자</th>
                                <th style="width:42px;font-size:14px;">등록일</th>
                                <th style="width:60px;font-size:14px;">추천수</th>
                                <th style="width:71px;font-size:14px;">조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr style="height:13px;">
                                <td style="font-size:14px;">10</td>
                                <td style="font-size:14px;">JAVA</td>
                                <td style="font-size:14px;">안녕하세요</td>
                                <td style="font-size:14px;">임</td>
                                <td style="font-size:14px;">2018.07.04</td>
                                <td style="font-size:14px;">1</td>
                                <td style="font-size:14px;">22</td>
                            </tr>
                            <tr>
                                <td style="font-size:14px;">9</td>
                                <td style="font-size:14px;">JAVA<br></td>
                                <td style="font-size:14px;">안녕하세요<br></td>
                                <td style="font-size:14px;">임</td>
                                <td style="font-size:14px;">2018.07.04<br></td>
                                <td style="font-size:14px;">0</td>
                                <td style="font-size:14px;">1</td>
                            </tr>
                            <tr>
                                <td style="font-size:14px;">8</td>
                                <td style="font-size:14px;">C</td>
                                <td style="font-size:14px;">안녕하세요<br></td>
                                <td style="font-size:14px;">임</td>
                                <td style="font-size:14px;">2018.07.04<br></td>
                                <td style="font-size:14px;">0</td>
                                <td style="font-size:14px;">0</td>
                            </tr>
                            <tr>
                                <td style="font-size:14px;">7</td>
                                <td style="font-size:14px;">JAVA<br></td>
                                <td style="font-size:14px;">안녕하세요</td>
                                <td style="font-size:14px;">임</td>
                                <td style="font-size:14px;">2018.07.04<br></td>
                                <td style="font-size:14px;">0</td>
                                <td style="font-size:14px;">0</td>
                            </tr>
                            <tr>
                                <td style="font-size:14px;">6</td>
                                <td style="font-size:14px;">C++</td>
                                <td style="font-size:14px;">안녕</td>
                                <td style="font-size:14px;">임</td>
                                <td style="font-size:14px;">2018.07.04<br></td>
                                <td style="font-size:14px;">0</td>
                                <td style="font-size:14px;">0</td>
                            </tr>
                            <tr>
                                <td style="font-size:14px;">5</td>
                                <td style="font-size:14px;">C</td>
                                <td style="font-size:14px;">안녕</td>
                                <td style="font-size:14px;">임</td>
                                <td style="font-size:14px;">2018.07.04<br></td>
                                <td style="font-size:14px;">0</td>
                                <td style="font-size:14px;">3</td>
                            </tr>
                            <tr>
                                <td style="font-size:14px;">4</td>
                                <td style="font-size:14px;">C</td>
                                <td style="font-size:14px;">안녕</td>
                                <td style="font-size:14px;">임</td>
                                <td style="font-size:14px;">2018.07.04<br></td>
                                <td style="font-size:14px;">0</td>
                                <td style="font-size:14px;">0</td>
                            </tr>
                            <tr>
                                <td style="font-size:14px;">3</td>
                                <td style="font-size:14px;">C</td>
                                <td style="font-size:14px;">안녕</td>
                                <td style="font-size:14px;">임</td>
                                <td style="font-size:14px;">2018.07.04<br></td>
                                <td style="font-size:14px;">0</td>
                                <td style="font-size:14px;">2</td>
                            </tr>
                            <tr>
                                <td style="font-size:14px;">2</td>
                                <td style="font-size:14px;">C</td>
                                <td style="font-size:14px;">안냥</td>
                                <td style="font-size:14px;">임</td>
                                <td style="font-size:14px;">2018.07.04<br></td>
                                <td style="font-size:14px;">22</td>
                                <td style="font-size:14px;">0</td>
                            </tr>
                            <tr>
                                <td style="font-size:14px;">1</td>
                                <td style="font-size:14px;">C#</td>
                                <td style="font-size:14px;">안녕</td>
                                <td style="font-size:14px;">임</td>
                                <td style="font-size:14px;">2018.07.04<br></td>
                                <td style="font-size:14px;">0</td>
                                <td style="font-size:14px;">3</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="container" style="margin-top:11px;height:64px;width:1093px;"><select style="margin-left:395px;width:121px;margin-top:12px;"><optgroup label="This is a group"><option value="12" selected="">This is item 1</option><option value="13">This is item 2</option><option value="14">This is item 3</option></optgroup></select>
            <input
                type="search" style="margin-left:3px;"><button class="btn btn-primary" type="button" style="margin-left:277px;">글쓰기</button></div>
        <div class="container" style="margin-top:-13px;height:53px;"><span style="font-size:20px;margin-left:485px;">&lt; &nbsp;1 2 3 4 5 &nbsp;&gt;</span></div>
    </div>
	</div>

</body>

</html>