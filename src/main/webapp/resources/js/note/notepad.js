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
var myNote = $("#myNoteContent").val();

// 실행시 출력/숨기기
function notepad(){
	$(".noteBody").toggle();
	$(".noteBody").css("margin-top", "-700px");
};

// 내용 변경시 * 표시
$("#myNoteContent").keyup(function(){
	$("#nTitle").html("*BIT NOTE");
});


// new
$("#newNote").click(function(){
	$("#nTitle").html("BIT NOTE");

});

// save
$("#saveNote").click(function(){
	$("#nTitle").html("BIT NOTE");
});

// exit
$("#exitNote").click(function(){
	$(".noteBody").css("margin-top", "2000px");
	$(".noteBody").hide();
});
