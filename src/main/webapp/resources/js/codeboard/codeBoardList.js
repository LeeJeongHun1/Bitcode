/**
 * 
 */

$(".codeBody").draggable();
window.onload = function(){
	document.querySelector("#search").onclick=function(){
		var target = document.getElementById("option");
		var input = document.getElementById("input").value;
		var option = target.options[target.selectedIndex].value;
		codeList(input,option);
	}
	codeList();
};


function codeList(searchInput,searchOption){
	if(searchInput == ""){
		searchInput == null;
	}
	if(searchOption == ""){
		searchOption == 0;
	}
//	console.log(searchOption);
//	console.log(searchInput);
	$.ajax({
		url:"list.json",
		data:{"searchInput" : searchInput, "searchOption" : searchOption},
		dataType:"json",
		
	})
	.done(function(data){
		makeCodeList(data);
	})
}

function makeCodeList(data){
	console.log(data);
	console.log("+++++++="+session);
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
		}                                                                        
	}
    document.querySelector("#listTbody").innerHTML=html;
}

