<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIT CODE</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main/main.css">
<script
	src="//static.codepen.io/assets/editor/live/console_runner-ce3034e6bde3912cc25f83cccb7caa2b0f976196f2f2d52303a462c826d54a73.js"></script>
<script
	src="//static.codepen.io/assets/editor/live/css_live_reload_init-890dc39bb89183d4642d58b1ae5376a0193342f9aed88ea04330dc14c8d52f55.js"></script>
<meta name="robots" content="noindex">
<link rel="mask-icon" type=""
	href="//static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111">
<link rel="canonical"
	href="https://codepen.io/MohamedElGhandour/pen/GEbwEW">

<link rel="stylesheet prefetch"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet prefetch"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/fancytree/jquery-ui.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/fancytree/jquery.fancytree.js"></script>
<script
	src="//cdn.jsdelivr.net/npm/jquery-contextmenu@2.6.4/dist/jquery.contextMenu.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/jquery-contextmenu@2.6.4/dist/jquery.contextMenu.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fancytree/ui.fancytree.css" />

<script>

</script>
<style>
.ellipsis {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	display: block;
}
</style>
</head>
<body>
	<c:if test="${empty sessionScope.user}">
		<div class="wrapp">
			<div class="text">
				<span class="mainText">BIT CODE</span>
			</div>
			<div class="logo">
				<span class="top-left"></span> <span class="bottom-right"></span>
			</div>
		</div>
	</c:if>
	
	<input type="hidden" id="sId" value="${sessionScope.user.id}" />
	<div id="window" class="windows" style="height: 734px;">
		<c:if test="${!empty sessionScope.user }">
			<div class="icon-computer text-center" id="icon-computer"
				ondblclick="opencom()">
				<img
					src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg"
					class="img-responsive" style="margin: auto;">
				<p>사용자 폴더</p>
			</div>
		</c:if>
		<div class="icon-computer text-center" id="icon-computer-share"
			ondblclick="opencom()">
			<img
				src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg"
				class="img-responsive" style="margin: auto;">
			<p>공유 폴더</p>
		</div>
		<div class="icon-computer text-center" id="icon-computer-music"
			ondblclick="opencom()">
			<img
				src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg"
				class="img-responsive" style="margin: auto;">
			<p>음악 폴더</p>
		</div>
		<div class="overlay-computer" id="overlay-computer"
			style="transform: scale(0); left: 142px; top: 29px; z-index: 1000;">
			<div class="fluid-container">
				<div class="first-row-win" id="first-row-win">
					<div class="left">
						<i class="fa fa-folder"></i>
						<span>${sessionScope.user.nickName}님의 Share Folder</span>
					</div>
					<!-- 닫기, 최소화, 최대화 -->
					<div class="right">
						<i class="fa fa-window-minimize" onclick="closeopencom()"></i> <i
							class="fa fa-window-restore" onclick="returncom()" id="returncam"
							style="display: none;"></i> <i class="fa fa-window-maximize"
							onclick="upercom()" id="upercam"></i> <i class="fa fa-times"
							onclick="closecom()"></i>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="second-row-win">
					<div>
						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a class="home-a"
								href="#home" aria-controls="home" role="tab" data-toggle="tab">File</a></li>
<!-- 							<li role="presentation"><a href="#profile" -->
<!-- 								aria-controls="profile" role="tab" data-toggle="tab">Home</a></li> -->
<!-- 							<li role="presentation"><a href="#messages" -->
<!-- 								aria-controls="messages" role="tab" data-toggle="tab">Share</a></li> -->
<!-- 							<li role="presentation"><a href="#settings" -->
<!-- 								aria-controls="settings" role="tab" data-toggle="tab">View</a></li> -->
						</ul>
					</div>
				</div>
				<div class="third-row-win">
					<!-- 뒤로가기 앞으로가기 화살표  -->
					<div class="col-xs-2">
						<i class="fa fa-long-arrow-left" id="forward"></i>
						<i class="fa fa-long-arrow-right" id="backwards"></i>
						<i class="glyphicon glyphicon-home" id="hoomroot"></i>
					</div>
					<div class="col-xs-7">
						<!-- 폴더 경로 -->
						<div class="path-input" id="share-path">
							<span class="path-icon-input">${sessionScope.user.id}</span>
<!-- 							<span class="path-icon-input">aaaa/test/test1</span> -->
							<!-- <span class="path-icon-input">programming</span> -->
							<!-- <span class="path-icon-input">Front End</span> -->
						</div>
						<!-- 폴더 경로 부분 아이콘 새로고침 -->
						<i class="fa fa-hdd-o path-icon"></i>
						<span class="fa fa-repeat path-icon-1"></span>
						<i class="path-icon-2">|</i>
					</div>
					<div class="col-xs-3">
						<input class="search-input" type="text" placeholder="Search">
						<span id="sasa" class="fa fa-search path-icon-1"></span>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="fourd-row-win">
					<div class="col-xs-3" style="border-right: 1px solid #808080;">
						<div class="panel-group" id="accordion" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="">
									<!-- 왼쪽 영역  -->
									<h4 class="panel-title">
										<a class="collapsed" role="button" data-toggle="collapse"
											data-parent="#accordion" href="#collapseThree"
											aria-expanded="false" aria-controls="collapseThree"> <span
											class="fa fa-desktop">This PC</span>
										</a>
									</h4>
								</div>
								<div id="collapseThree" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="headingThree">
<!-- 									<div class="panel-body"> -->
<!-- 										<p> -->
<!-- 											<span class="fa fa-desktop">Desktop</span> -->
<!-- 										</p> -->
<!-- 										<p> -->
<!-- 											<span class="fa fa-download">Downloads</span> -->
<!-- 										</p> -->
<!-- 										<p> -->
<!-- 											<span class="fa fa-file-text">documents</span> -->
<!-- 										</p> -->
<!-- 										<p> -->
<!-- 											<span class="fa fa-picture-o ">Picture</span> -->
<!-- 										</p> -->
<!-- 										<p> -->
<!-- 											<span class="fa fa-folder ">Folder</span> -->
<!-- 										</p> -->
<!-- 									</div> -->
								</div>
							</div>
						</div>
						<div id="tree" style="overflow-x: auto; height: 420px;"></div>
						<!-- 저장 용량 -->
						<div class="saveSize" style="position: fixed; bottom: 40px; width: 145px;" >
							<span>저장용량</span><img src="${pageContext.request.contextPath}/resources/images/cloud.PNG" style="width: 40px; margin-left: 8px;"><br>
							<span></span>
						</div>
					</div>
					<div class="col-xs-9 ">
						<div class="row main-folders" id="folder-area">
							<!-- 폴더 ajax 추가 -->
							<!-- 공유 폴더 -->
<!-- 							<div class="col-xs-2 folders text-center" id="99999" data-path="" data-title="shareFolder" ondblclick='test(9999)'> -->
<!-- 								<p class="contain"> -->
<!-- 									<img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg" -->
<!-- 										class="img-responsive  center-block" style="height: 64px;" -->
<!-- 										alt=""> -->
<!-- 								</p> -->
<!-- 								<span class="ellipsis">Share Folder</span> -->
<!-- 							</div> -->
<!-- 							<div class="col-xs-2 folders text-center"> -->
<!-- 								<p class="contain"> -->
<!-- 									<img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500505134/if_sticky-note_299111_px7waa.png" -->
<!-- 										class="img-responsive  center-block" style="height: 64px;" > -->
<!-- 								</p> -->
<!-- 								<span class="ellipsis">Folder</span> -->
<!-- 							</div> -->
<!-- 							<div class="col-xs-2 folders text-center"> -->
<!-- 								<p class="contain"> -->
<!-- 									<img src="https://image.noelshack.com/fichiers/2018/22/1/1527527145-logo-microsoft-powerpoint-2013.png" -->
<!-- 										class="img-responsive  center-block" style="height: 64px;" > -->
<!-- 								</p> -->
<!-- 								<span class="ellipsis">pptx</span> -->
<!-- 							</div> -->
<!-- 							<div class="col-xs-2 folders text-center"> -->
<!-- 								<p class="contain"> -->
<!-- 									<img src="https://image.noelshack.com/fichiers/2018/22/1/1527527145-logo-microsoft-excel-20132.png" -->
<!-- 										class="img-responsive  center-block" style="height: 64px;" > -->
<!-- 								</p> -->
<!-- 								<span class="ellipsis">exel</span> -->
<!-- 							</div> -->
<!-- 							<div class="col-xs-2 folders text-center"> -->
<!-- 								<p class="contain"> -->
<!-- 									<img src="https://image.noelshack.com/fichiers/2018/22/1/1527527145-logo-microsoft-word-20132.png" -->
<!-- 										class="img-responsive  center-block" style="height: 64px;" > -->
<!-- 								</p> -->
<!-- 								<span class="ellipsis">word</span> -->
<!-- 							</div> -->
							<!--                         <div class="clearfix"></div> -->
						</div>
					</div>
				</div>
				<div class="fived-row-win"></div>
			</div>
			<div class="resizer"></div>
		</div>
		<div class="clearfix"></div>




		<footer
			class="nav navbar-inverse navbar-fixed-bottom footer text-center"
			style="display: none;">
			<div class="fluid-container">
				<div class="row">
					<div class="left">
						<div class="col-xs-1-me" id="a1" style="display: none;">
							<div class="icon-bottom">
								<i class="fa fa-folder fa-2x"></i>
							</div>
						</div>
						<span class=".clearfix"></span>
					</div>
				</div>
			</div>
		</footer>
	</div>

	<script>
	// fancyTree
	$(function() {
		$.contextMenu({
			selector: "#folder-area p",
			items: {
				"add": {name: "AddFolder", icon: "add" },
				"copy": {name: "Copy", icon: "copy"},
				"delete": {name: "Delete", icon: "delete", disabled: true }
			},
			callback: function (itemKey, opt) {
				var node = $.ui.fancytree.getNode(opt.$trigger);
				console.dir(opt)
				console.dir(this)
				alert("select " + itemKey + " on " + opt);
				
			}
		});
        $.contextMenu({
          selector: "#tree span.fancytree-title",
          items: {
            "cut": {name: "Cut", icon: "cut",
                callback: function(key, opt){
                  var node = $.ui.fancytree.getNode(opt.$trigger);
                  // alert("Clicked on " + key + " on " + node);
                }
              },
            "copy": {name: "Copy", icon: "copy"},
            "paste": {name: "Paste", icon: "paste", disabled: false },
            "sep1": "----",
            "edit": {name: "Edit", icon: "edit", disabled: false },
            "delete": {name: "Delete", icon: "delete", disabled: true },
            "more": {name: "More", items: {
              "sub1": {name: "Sub 1"},
              "sub1": {name: "Sub 2"}
              }}
            },
          callback: function(itemKey, opt) {
           var node = $.ui.fancytree.getNode(opt.$trigger);
           console.dir(node)
            alert("select " + itemKey + " on " + node);
          }
        });
    });
	var d = '';
	//Setup the dnd listeners.
	var dropZone = document.getElementById('overlay-computer');
	dropZone.addEventListener('dragover', handleDragOver, false);
	dropZone.addEventListener('drop', handleFileSelect, false);
	
	var rootFolderName = '';
	var fDiv = $("#folder-area");
	var fileList;
	var id;
	var loadingFolder = {
			id: $("#sId").val(),
	}
	if($("#sId").val() != ''){
		$.ajax({
			url: "selectFolder.json",
			data: loadingFolder,
			dataType: "json"
		})
		.done(function (data) {
			console.dir(data)
			fileList = data;
			id = Number(data.length);
// 			console.log(data);
			for(var f of data){
				var appendFile = '';
				if(f.folder){
// 					console.log("폴더")
					appendFile += '<div class="col-xs-2 folders text-center" id="'+f.key+'" data-path="'+f.parentPath+'" data-title="'+f.title+'" ondblclick="test('+f.key+')">';
					appendFile += '<p class="contain">';
					appendFile += '	<img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg"';
					appendFile += '		class="img-responsive  center-block" style="height: 64px;"';
					appendFile += '		alt="">';
// 					appendFile += '	<img src="download.do?filePath='+f.parentPath+'&systemFileName=attach&originalFileName='+f.title+'" style="height: 64px;">';
					appendFile += '	</p>';
					appendFile += '	<span class="ellipsis">' + f.title + '</span>';
					appendFile += '</div>';
					$("#folder-area").append(appendFile);
				}else{
					appendFile += '<div class="col-xs-2 folders text-center" id="'+f.key+'" data-path="'+f.parentPath+'" data-title="'+f.title+'" ondblclick="test1()">';
					appendFile += '<p class="contain">';
					if(f.type == 'img'){
						appendFile += `	<img src="${pageContext.request.contextPath}/resources/images/jpg-icon.png"`;
					}else{
						appendFile += '	<img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500505134/if_sticky-note_299111_px7waa.png"';
					}
					appendFile += '		class="img-responsive  center-block" style="height: 64px;"';
					appendFile += '		alt="">';
// 					appendFile += '	<img src="download.do?filePath='+f.parentPath+'&systemFileName=attach&originalFileName='+f.title+'" style="height: 64px;">';
					appendFile += '	</p>';
					appendFile += '	<span class="ellipsis">' + f.title + '</span>';
					appendFile += '</div>';
					$("#folder-area").append(appendFile);
				}
			}
			loadFancytree(data);
			$("#share-path").data("root","c:/java-lec/upload/"+$("#sId").val());
		})
	}
	
	// file 더블클릭 -> img는 미리보여주기 후 다운
	function test1 () {
		alert("더블 클릭 파일")
		location.href = "download.do";
	}
	
	function loadFancytree(data) {
		$("#tree").fancytree({
			extensions: [],
			autoScroll: true,
			source: data,
			click: function(event, data) {
				var node = data.node,
					targetType = data.targetType;

				if(node.folder){
					console.log("폴더 선택");
					console.log(node);
					node.setExpanded(); // 폴더 확장
					fancyTreeClick(node)
				}
			},
			lazyLoad: function (e, data) {
				console.dir(data);
				console.dir(e);
				
			    var dfd = new $.Deferred();
			    data.result = dfd.promise();
			    
		        $.ajax({
					url: "lazyLoad.json",
					data: {
						parentPath: data.node.data.parentPath,
						key: data.node.key,
						title: data.node.title
					},
					dataType: "json"
				})
				.done(function (result){
					dfd.resolve(result);
				});
				
			}
		});
	}
	// fancyTree 폴더 선택
	function fancyTreeClick(node){
		var path = node.data.parentPath + '\\' + node.title;
		var selectInfo = {
				parentPath: path,
				title: node.title
		}
		$.ajax({
			url: "enterDirectory.json",
			data: {
				parentPath: path,
				key: node.key
			},
			dataType: "json"
		})
		.done(function (result) {
			console.dir(result)
			reload(result, selectInfo)
		})
	}
	
	
	
	// folder 더블클릭 -> enter 후 리스트 노출
	function test(key) {
// 		console.log(key)
		var $div = $("#"+key);
// 		$div.data("parent", "path");
		console.log("아이디 찾기 : " + $div.data("title"));
// 		console.log($div.data("parent"));
		var parentPath = $div.data("path")+'\\'+$div.data("title");
		console.log("경로 : " + parentPath);
		var selectInfo = {
				parentPath: parentPath,
				title: $div.data("title")
		}
		$.ajax({
			url: "enterDirectory.json",
			data: {
				parentPath: parentPath,
				key: key
			},
			dataType: "json"
		})
		.done(function (result) {
			console.log(result)
			reload(result, selectInfo)
			console.log($div.data("path"));
			console.log($div.data("title"));
		})
	}
	
	function reload(data, selectInfo){
		console.dir(selectInfo)
		fileList = data
		console.dir(fileList)
		
		$("#share-path").data("root", selectInfo.parentPath)
		alert($("#share-path").data("root"))
		var r = $("#share-path").data("root").split($("#sId").val()+'\\')[1].split('\\');
		$("#share-path").html('');
		for(let path of r){
			$("#share-path").append("<span class='path-icon-input'>"+path+"</span>");
		}
		$("#folder-area").html('');
		if(data.length == 0){
// 			$("#share-path").data("root", selectInfo.parentPath)
// // 			alert($("#share-path").data("root"))
// 			$("#share-path").append("<span class='path-icon-input'>"+selectInfo.title+"</span>")
			return;
		}
		for(var f of data){
			var appendFile = '';
			if(f.folder){
				console.log("폴더")
				appendFile += '<div class="col-xs-2 folders text-center" id="'+f.key+'" data-path="'+f.parentPath+'" data-title="'+f.title+'" ondblclick="test('+f.key+')">';
				appendFile += '<p class="contain">';
				appendFile += '	<img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg"';
				appendFile += '		class="img-responsive  center-block" style="height: 64px;"';
				appendFile += '		alt="">';
				appendFile += '	</p>';
				appendFile += '	<span class="ellipsis">' + f.title + '</span>';
				appendFile += '</div>';
				$("#folder-area").append(appendFile);
			}else{
				appendFile += '<div class="col-xs-2 folders text-center" id="'+f.key+'" data-path="'+f.parentPath+'" data-title="'+f.title+'" ondblclick="test1()">';
				appendFile += '<p class="contain">';
				appendFile += '	<img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500505134/if_sticky-note_299111_px7waa.png"';
				appendFile += '		class="img-responsive  center-block" style="height: 64px;"';
				appendFile += '		alt="">';
				appendFile += '	</p>';
				appendFile += '	<span class="ellipsis">' + f.title + '</span>';
				appendFile += '</div>';
				$("#folder-area").append(appendFile);
			}
		}
// 		$("#share-path").data("root", selectInfo.parentPath)
// 		alert($("#share-path").data("root"))
// 		$("#share-path").append("<span class='path-icon-input'>"+selectInfo.title+"</span>");
	}
	
	function error(e) {
	    console.log('error');
	    console.log(e);
	}
	
	function error_from_readentries(e) {
	    console.log('error_from_readentries');
	    console.log(e);
	}
	
	function traverseFileTree(item, path) {
		path = path || "";
		console.dir(item)
		console.log($("#share-path").data("root"));
		if (item.isFile) {
			// Get file
			item.file(function(file) {
				var html = '';
				if(path == ''){
					console.log("파일만 올림")
					console.log("File: " + file.name);
					console.log("path: " + path);
					console.log("확장자: " + file.type.split('\.')[1]);
					console.dir(file);
					html += '<div class="col-xs-2 folders text-center" id="'+ ++id +'" data-path="'+$("#share-path").data("root")+'" data-title="'+file.name+'" ondblclick="test1()">';
					html += '	<p class="contain">';
					if(file.type.split('\.')[1] == 'image'){
						html += `	<img src="${pageContext.request.contextPath}/resources/images/jpg-icon.png" class="img-responsive  center-block" style="height: 64px;" alt="">`;
					}else{
						html += '	<img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500505134/if_sticky-note_299111_px7waa.png" class="img-responsive  center-block" style="height: 64px;" alt="">';
					}
					html += '	</p>';
					html += '	<span class="ellipsis">'+file.name+'</span>';
					html += '</div>';
					fDiv.append(html);
					sendFile(file);
				}else{
					// 폴더 형태에 파일이 온경우
// 					console.log("File: " + file.name);
// 					console.log("path: " + path);
// 					console.dir("폴더에 파일객체: " + file);
// 					html += '<div class="col-xs-2 folders text-center">';
// 					html += '	<p class="contain"><img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg" class="img-responsive  center-block" style="height: 64px;" alt=""></p>';
// 					html += '	<span class="ellipsis">Folder</span>';
// 					html += '</div>';
// 					fDiv.append(html);
					console.log("디렉토리 path : " + path)
					sendFile(file, path);
				}
			}, error);
		} else if (item.isDirectory) {
			console.log("최상위 폴더 이름 : " + item.fullPath.split('/')[1])
			console.dir(item)
			rootFolderName = item.fullPath.split('/')[1];
			// Get folder contents
			var dirReader = item.createReader();
			dirReader.readEntries(function(entries) {
				console.dir(entries)
				if(entries.length == 0){
					console.log('빈폴더')
					console.dir(item)
					createFolder(item);
				}else{
					console.log("빈폴더 아님")
					for (var i=0; i<entries.length; i++) {
						console.dir(entries[i])
						traverseFileTree(entries[i], path + item.name + "/")
					}
				}
			}, error_from_readentries); 
		}
	}
	
	
	// 파일 업로드 후 fancyTree 갱신
	function sendFile(file, path) {
		console.log("넘어온 path : ");
		console.log(path);
		console.log("sendfile root : ");
		console.log($("#share-path").data("root"));
		if(path){
			path = $("#share-path").data("root") + '//' + path;
		}else{
			path = $("#share-path").data("root");
		}
		console.log("send path : ");
		console.log(path);
		var fd = new FormData();
		fd.append("attach", file);
		fd.append("id", $("#sId").val());
		fd.append("parentPath", path);
		$.ajax({
			url: "upload.json",
			data: fd,
			type: "POST",
			contentType: false,
			processData: false
		})
		.done(function (result) {
			console.log("업로드 후 result : ")
			console.dir(result)
			console.dir(file)
			$('#tree').fancytree('option', 'source', result);
// 			var rootNode = $("#tree").fancytree("getRootNode");
// 			var childNode = rootNode.addChildren({
// 				title: file.name,
// 				key: "",
// 				folder: false,
// 				parentPath: path,
// 				type: null,
// 				lazy: false
// 			});
		})
	}
	
	function createFolder(item){
		console.dir(item)
		$.ajax({
			url: "createFolder.json",
			data: {
				path: item.fullPath,
				id: $("#sId").val()
			},
			dataType: "json"
		})
		.done(function (result) {
			$('#tree').fancytree('option', 'source', result);
		})
	}
	
	function handleFileSelect(evt) {
		console.log("언제들어오나")
		evt.stopPropagation();
		evt.preventDefault();
		var items = evt.dataTransfer.items;
		console.dir(items[0].webkitGetAsEntry());
		console.dir(fileList);
		for(let checkFile of fileList){
			if(checkFile.title == items[0].webkitGetAsEntry().name){
				swal(	'warning',
						'이 위치에 이름이 같은 파일이 존재합니다.',
						'question');
				return;
// 				swal({
// 					title: '이 위치에 이름이 같은 파일이 존재합니다.',
// 					text: "이동하는 파일로 덮어 쓰시겠습니까??",
// 					type: 'warning',
// 					showCancelButton: true,
// 					confirmButtonColor: '#3085d6',
// 					cancelButtonColor: '#d33',
// 					cancelButtonText: '취소',
// 					confirmButtonText: '덮어쓰기'
// 					})
// 					.then((result) => {
// 						if (result.value) {
// 							result = result.value;
// 							swal(
// 							'success!',
// 							'해당 파일로 덮어쓰기 하였습니다.',
// 							'success'
// 							)
// 							for (var i = 0; i < items.length; i++) {
// 								var item = items[i].webkitGetAsEntry();
// 								if (item) { traverseFileTree(item); }
// 							}
// 						}
// 					})
			}
		}
		if(items[0].webkitGetAsEntry().isDirectory){
			createFolder(items[0].webkitGetAsEntry());
			var html = '';
			html += '<div class="col-xs-2 folders text-center" id="'+ ++id +'" data-path="'+$("#share-path").data("root")+'" data-title="'+items[0].webkitGetAsEntry().name+'" ondblclick="test('+id+')">';
			html += '	<p class="contain"><img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg" class="img-responsive  center-block" style="height: 64px;" alt=""></p>';
			html += '	<span>'+items[0].webkitGetAsEntry().name+'</span>';
			html += '</div>';
			fDiv.append(html);
	    }
	    for (var i = 0; i < items.length; i++) {
	        var item = items[i].webkitGetAsEntry();
	        if (item) { traverseFileTree(item); }
	    }
	}
	
	function handleDragOver(evt) {
	    evt.stopPropagation();
	    evt.preventDefault();
	    evt.dataTransfer.dropEffect = 'copy';
	}
	
	// 뒤로가기 기능
	$("#forward").click(function () {
		alert('뒤로가기')
	})
	
	// 앞으로가기 기능
	$("#backwards").click(function () {
		alert('앞으로가기')
		alert($("#share-path").data("root"))
	})
	
	// 홈으로 이동
	$("#hoomroot").click(function () {
		$.ajax({
			url: "selectFolder.json",
			data: {id: $("#sId").val()},
			dataType: "json"
		})
		.done(function (data) {
			console.dir(data)
			$("#folder-area").html('');
			fileList = data;
			id = Number(data.length);
			for(var f of data){
				var appendFile = '';
				if(f.folder){
					appendFile += '<div class="col-xs-2 folders text-center" id="'+f.key+'" data-path="'+f.parentPath+'" data-title="'+f.title+'" ondblclick="test('+f.key+')">';
					appendFile += '<p class="contain">';
					appendFile += '	<img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg"';
					appendFile += '		class="img-responsive  center-block" style="height: 64px;"';
					appendFile += '		alt="">';
					appendFile += '	</p>';
					appendFile += '	<span class="ellipsis">' + f.title + '</span>';
					appendFile += '</div>';
					$("#folder-area").append(appendFile);
				}else{
					appendFile += '<div class="col-xs-2 folders text-center" id="'+f.key+'" data-path="'+f.parentPath+'" data-title="'+f.title+'" ondblclick="test1()">';
					appendFile += '<p class="contain">';
					if(f.type == 'img'){
						appendFile += `	<img src="${pageContext.request.contextPath}/resources/images/jpg-icon.png"`;
					}else{
						appendFile += '	<img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500505134/if_sticky-note_299111_px7waa.png"';
					}
					appendFile += '		class="img-responsive  center-block" style="height: 64px;"';
					appendFile += '		alt="">';
					appendFile += '	</p>';
					appendFile += '	<span class="ellipsis">' + f.title + '</span>';
					appendFile += '</div>';
					$("#folder-area").append(appendFile);
				}
			}
			$('#tree').fancytree('option', 'source', data);
			$("#share-path").data("root","c:/java-lec/upload/"+$("#sId").val());
			$("#share-path").html('<span class="path-icon-input">Share:</span><span class="path-icon-input">${sessionScope.user.id}</span>');
			
		});
	})
	
</script>
</body>
</html>