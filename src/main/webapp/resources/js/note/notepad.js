// 메모장 드래그
$(".noteBody").draggable();

// 기본 숨기기로 시작
$(".noteBody").hide();

// 닫기
$("#noteClose").click(function(){
	$(".noteBody").css("margin-top", "2000px");
	$(".noteBody").hide();
});

// 메모장 내용
//var myNote = $("#myNoteContent").val();
//var myNote = "";

$.ajax({
	url: "/bitcode/main/myNote.json?id=" + loginId,
	success: function(result) {
		var myNote = $("#myNoteContent").html(result.replace(/<br>/g, "&#10;"));
	}
});


// 실행시 출력/숨기기
function notepad(){
	$(".noteBody").toggle();
	$(".noteBody").css("margin-top", "-600px");
	//$(".noteBody").css("margin-top", "-50%");
};

// 내용 변경시 * 표시
$("#myNoteContent").keyup(function(){
	$("#nTitle").html("*BIT NOTE");
});


// new
$("#newNote").click(function(){
	var noteContent = {"id": loginId, "content": ""};
	$.ajax({
		type: "POST",
		url: "/bitcode/main/modNote.json",
		data: noteContent, 
		success: function(result) {
			var myNote = $("#myNoteContent").html(result.replace(/<br>/g, "&#10;"));
		}
	});	
	$("#nTitle").html("BIT NOTE");
});

// save
$("#saveNote").click(function(){
	var modNote = $("#myNoteContent").val();
	modNote = modNote.replace(/(?:\r\n|\r|\n)/g, '<br>');
	var noteContent = {"id": loginId, "content": modNote};
	
	$.ajax({
		type: "POST",
		url: "/bitcode/main/modNote.json",
		data: noteContent, 
		success: function(result) {
			var myNote = $("#myNoteContent").html(result.replace(/<br>/g, "&#10;"));
		}
	});	
	
	$("#nTitle").html("BIT NOTE");
});

// exit
$("#exitNote").click(function(){
	$(".noteBody").css("margin-top", "2000px");
	$(".noteBody").hide();
});
