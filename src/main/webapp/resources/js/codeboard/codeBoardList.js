/**
 * 
 */

$(".codeBody").draggable();
window.onload = function(){
//	$("body").waitMe({
//		effect: "ios",
//		text: "Loding.. :D",
//		bg: 'rgba(255,255,255, 0.7)',
//		color: '#000'
//			
//	});
	//var target = document.getElementById("option");
	//var input = document.getElementById("input").value;
	//var option = target.options[target.selectedIndex].value;
	codeList();
};

document.querySelector("#search").onclick=function(){
	
	//console.log("input++++++++++++" + input);
	//console.log("option+++++++++++" + option);
	codeList();
}



function makeCodeList(data){
	console.dir(pageNumber);
	var html="";
	for(let codeBoard of data){
		var date = new Date(codeBoard.regDate);
		var day = date.getFullYear() + "-"
		+ (date.getMonth() + 1) + "-"
		+ date.getDate();
		if(codeBoard.groupOrder==1){
			html+='    <tr style="height:13px; type:text/css;">                                                                  ';
			html+='        <td style="font-size:14px;">'+codeBoard.no+'</td>                                                             ';
			html+='        <td style="font-size:14px;">'+codeBoard.languageName+'</td>                                                   ';
			if(session!=""){
			html+='        <td style="font-size:14px; text-align:left;"><a href="detail.do?no='+codeBoard.no+'">'+codeBoard.title+'</a></td>     ';				
			}
			else{
			html+='        <td style="font-size:14px; text-align:left;">'+codeBoard.title+'</td>     ';					
			}
			html+='        <td style="font-size:14px;">'+codeBoard.id+'</td>                                                             ';
			html+='        <td style="font-size:14px;">'+day+'</td>        ';
			html+='        <td style="font-size:14px;">'+codeBoard.likeCnt+'</td>                                                        ';
			html+='        <td style="font-size:14px;">'+codeBoard.viewCnt+'</td>                                                        ';
			html+='    </tr>                        	                                                                         ';
		}
		else{
			html+='    <tr style="height:13px; type:text/css;">                                                                  ';
			html+='    	<td style="font-size:14px;"></td>                                                                        ';
			html+='        <td style="font-size:14px;">'+codeBoard.languageName+'</td>                                                   ';
			if(session!=""){
				html+='        <td style="font-size:14px; text-align:left;">                                                         ';				
				for(var i = 1; i<codeBoard.depth; i++ ){
					html+='        	<span>&nbsp;&nbsp;&nbsp;</span>                                                                      ';
				}
				html+='        <span style="color:black;">⤷</span>                                                                                      ';
				html+='        <a href="detail.do?no='+codeBoard.no+'">'+codeBoard.title+'</a>                                                       ';
				html+='        </td>                                                                                                 ';
			}
				else{
					html+='        <td style="font-size:14px; text-align:left;">                                                         ';					
					for(var i = 1; i<codeBoard.depth; i++ ){
						html+='        	<span>&nbsp;&nbsp;&nbsp;</span>                                                                      ';
					}
					html+='        <span style="color:black;">⤷</span>                                                                                      ';
					html+='      '+codeBoard.title+'                                                     ';
					html+='        </td>                                                                                                 ';			
				}
                                                                                          
			html+='        <td style="font-size:14px;">'+codeBoard.id+'</td>                                                             ';
			html+='        <td style="font-size:14px;">'+day+'</td>        ';
			html+='        <td style="font-size:14px;">'+codeBoard.likeCnt+'</td>                                                        ';
			html+='        <td style="font-size:14px;">'+codeBoard.viewCnt+'</td>                                                        ';
			html+='    </tr>                        	                                                                         ';
			html+='   <input type="hidden" id="pNo" value="'+pageNumber+'" />';
		}
	}
    document.querySelector("#listTbody").innerHTML=html;
}
var pageNumber;
function makePage(data){
	pageNumber = data.pageResult.pageNo;
	console.log(pageNumber);
	var html = "";
	if (data.pageResult.count != 0) {
		var clz = "";
		if (data.pageResult.prev == false) {
			clz = "disabled";
		}
		html += '<li class="' + clz + '">';
		var fn = "";
		if (data.pageResult.prev == true) {
			console.log(data.pageResult.beginPage +"개");
			fn = "javascript:codeList(" + (data.pageResult.beginPage - 1) + ");";
		}else{
			fn = "#1"
		}
		html += '<a href="' + fn + '" aria-label="Previous">';
		html += '    <span aria-hidden="true">&laquo;</span>';
		html += '</a>';
	    html += '</li>';
	    for (var i = data.pageResult.beginPage; i <= data.pageResult.endPage; i++) {
	    	if (i == data.pageResult.pageNo) {
			    html += '<li class="active"><a href="#1">' + i + '</a></li>';
	    	}
	    	else {
	    		html += '<li><a href="javascript:codeList('+ i +');">' + i + '</a></li>';
	    	}
	    }
		clz = "";
		if (data.pageResult.next == false) {
			clz = "disabled";
		}
		html += '<li class="' + clz + '">';
		fn = "";
		if (data.pageResult.next == true) {
			fn = "javascript:codeList(" + (data.pageResult.endPage + 1) + ");";
		}else{
			fn = "#1";
		}
		html += '<a href="' + fn + '" aria-label="Next">';
		html += '    <span aria-hidden="true">&raquo;</span>';
		html += '</a>';
	    html += '</li>';
	}
	$("nav > ul.pagination").html(html);	
}

function codeList(pageNo, sort){
	var target = document.getElementById("option");
	var input = document.getElementById("input").value;
	var option = target.options[target.selectedIndex].value;
	
	if(pageNo == ""){
		pageNo = 1;
	}
	if(input == ""){
		input = null;
	}
	if(option == ""){
		option = 0;
	}
	if(sort === undefined){
		sort = 0;
	}
	console.log(sort);
//	console.log(searchOption);
//	console.log(searchInput);
	$.ajax({
		url:"list.json",
		data:{
			"searchInput" : input,
			"searchOption" : option,
			"pageNo" : pageNo,
			"sort": sort
			},
		dataType:"json"
	})
	.done(function(data){
		makePage(data)
		makeCodeList(data.list);
//		$("body").waitMe("hide");
	})
	.fail(function(e){
		console.log(e);
	})
}
