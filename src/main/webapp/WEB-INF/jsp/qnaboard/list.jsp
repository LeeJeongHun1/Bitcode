<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListBoard</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/styles.css">
<style type="text/css">
.table-responsive{clear: both;
    border-top: 1px solid #b3b3b3;
    border-bottom: 1px solid #e6e6e6;
    text-align: center;}
/*  a:link { color: #80FF00; text-decoration: none;} */
/*  a:visited { color: #80FF00; text-decoration: none;}*/ 
/*  a:hover { color: #80FF00; text-decoration: underline;} */
 .container {color:#727272; background-color:#fff;}
 .table {color:#727272; margin-bottom:0}
 table thead tr { background:#f3f3f3;    }
 .table>thead>tr>th {border-bottom: 1px solid #ddd;}
 table thead tr th {height: 40px;
    padding: 10px 8px; }
.table>tbody>tr>td{vertical-align: middle;}
.table tr:hover td{background-color:#fcf9ce}
 
</style>
</head>

<body>
	
	<div class="container">
    <div>
        <div class="container">
                <div class="col-md-12">
                    <h1 class="text-center" style="margin:0px;margin-top:50px;margin-bottom:41px;">QnA게시판</h1>
                </div>
        </div>
    </div>
    <div>
        <div class="container" style="height:430px;">
            <div class="col-md-12" style="height:380px;">
            	<div class="table-responsive" >
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
                            <c:forEach var="i" items="${list}">
                            <tr style="height:13px; type:text/css;">
                                <td style="font-size:14px;">${i.no}</td>
                                <td style="font-size:14px;">${i.codeName}</td>
                                <td style="font-size:14px;"><a href="detail.do?no=${i.no}">${i.title}</a></td>
                                <td style="font-size:14px;">${i.id}</td>
                                <td style="font-size:14px;">${i.regDate}</td>
                                <td style="font-size:14px;">${i.likeCnt}</td>
                                <td style="font-size:14px;">${i.viewCnt}</td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="container" style="height:64px;"><select style="margin-left:395px;width:121px;margin-top:12px;"><optgroup label="This is a group"><option value="12" selected="">This is item 1</option><option value="13">This is item 2</option><option value="14">This is item 3</option></optgroup></select>
            <input type="search" style="margin-left:3px;"><button class="btn btn-primary" type="button" onclick="location.href='insert.do'" style="margin-left:277px;">글쓰기</button></div>
        <div class="container" style="    margin-top: -14px;
    height: 89px;"><span style="font-size:20px;margin-left:485px;">&lt; &nbsp;1 2 3 4 5 &nbsp;&gt;</span></div>
    </div>
	</div>

</body>

</html>