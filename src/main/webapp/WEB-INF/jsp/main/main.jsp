<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIT CODE</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main/main.css">
<script src="//static.codepen.io/assets/editor/live/console_runner-ce3034e6bde3912cc25f83cccb7caa2b0f976196f2f2d52303a462c826d54a73.js"></script>
<script src="//static.codepen.io/assets/editor/live/css_live_reload_init-890dc39bb89183d4642d58b1ae5376a0193342f9aed88ea04330dc14c8d52f55.js"></script>
<meta name="robots" content="noindex">
<link rel="mask-icon" type="" href="//static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111">
<link rel="canonical" href="https://codepen.io/MohamedElGhandour/pen/GEbwEW">

<link rel="stylesheet prefetch" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet prefetch" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<div class="wrapp">
  <div class="text">
    <span class="mainText">BIT CODE</span>
  </div>
  <div class="logo">
    <span class="top-left"></span>
    <span class="bottom-right"></span>
  </div>
</div>

<div id="window" class="windows" style="height: 734px;">
	<c:if test="${!empty sessionScope.user }">
		<div class="icon-computer text-center" id="icon-computer" ondblclick="opencom()">
			<img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg" class="img-responsive" style="margin: auto;">
			<p>공유 폴더</p>
		</div>
	</c:if>
    <div class="overlay-computer" id="overlay-computer" style="transform: scale(0); left: 142px; top: 29px; z-index: 1000;s">
        <div class="fluid-container">
            <div class="first-row-win" id="first-row-win">
                <div class="left">
                    <i class="fa fa-hdd-o"></i>
                    <i class="fa fa-file-o"></i>
                    <i class="fa fa-folder"></i>
                    <span>id님의 Share Folder</span>
                </div>
                <!-- 닫기, 최소화, 최대화 -->
                <div class="right">
                    <i class="fa fa-window-minimize" onclick="closeopencom()"></i>
                    <i class="fa fa-window-restore" onclick="returncom()" id="returncam" style="display:none;"></i>
                    <i class="fa fa-window-maximize" onclick="upercom()" id="upercam"></i>
                    <i class="fa fa-times" onclick="closecom()"></i>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="second-row-win">
                <div>
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a class="home-a" href="#home" aria-controls="home" role="tab" data-toggle="tab">File</a></li>
                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Home</a></li>
                        <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Share</a></li>
                        <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">View</a></li>
                    </ul>
                    <!-- Tab panes -->
<!--                     <div class="tab-content"> -->
<!--                         <div role="tabpanel" class="tab-pane active" id="home"> -->
<!--                             <div class="col-xs-1 text-center"> -->
<!--                                 <i class="fa fa-envelope-open fa-2x"></i> -->
<!--                                 <p>Mail</p> -->
<!--                             </div> -->
<!--                             <div class="col-xs-1 text-center"> -->
<!--                                 <i class="fa fa-file-code-o  fa-2x"></i> -->
<!--                                 <p>Code</p> -->
<!--                             </div> -->
<!--                             <div class="col-xs-1 text-center"> -->
<!--                                 <i class="fa fa-sticky-note-o fa-2x"></i> -->
<!--                                 <p>Note</p> -->
<!--                             </div> -->
<!--                             <div class="clearfix"></div> -->
<!--                         </div> -->
<!--                         <div role="tabpanel" class="tab-pane" id="profile"> -->
<!--                             <div class="col-xs-1 text-center"> -->
<!--                                 <i class="fa fa-user-circle fa-2x"></i> -->
<!--                                 <p>User</p> -->
<!--                             </div> -->
<!--                             <div class="col-xs-1 text-center"> -->
<!--                                 <i class="fa fa-battery-4  fa-2x"></i> -->
<!--                                 <p>battery</p> -->
<!--                             </div> -->
<!--                             <div class="col-xs-1 text-center"> -->
<!--                                 <i class="fa fa-book fa-2x"></i> -->
<!--                                 <p>Book</p> -->
<!--                             </div> -->
<!--                             <div class="clearfix"></div> -->
<!--                         </div> -->
<!--                         <div role="tabpanel" class="tab-pane" id="messages"> -->
<!--                             <div class="col-xs-1 text-center"> -->
<!--                                 <i class="fa fa-car fa-2x"></i> -->
<!--                                 <p>Car</p> -->
<!--                             </div> -->
<!--                             <div class="col-xs-1 text-center"> -->
<!--                                 <i class="fa fa-camera-retro  fa-2x"></i> -->
<!--                                 <p>cam</p> -->
<!--                             </div> -->
<!--                             <div class="col-xs-1 text-center"> -->
<!--                                 <i class="fa fa-building fa-2x"></i> -->
<!--                                 <p>build</p> -->
<!--                             </div> -->
<!--                             <div class="clearfix"></div> -->
<!--                         </div> -->
<!--                         <div role="tabpanel" class="tab-pane" id="settings"> -->
<!--                             <div class="col-xs-1 text-center"> -->
<!--                                 <i class="fa fa-cubes fa-2x"></i> -->
<!--                                 <p>cubes</p> -->
<!--                             </div> -->
<!--                             <div class="col-xs-1 text-center"> -->
<!--                                 <i class="fa fa-coffee fa-2x"></i> -->
<!--                                 <p>coffee</p> -->
<!--                             </div> -->
<!--                             <div class="col-xs-1 text-center"> -->
<!--                                 <i class="fa fa-film fa-2x"></i> -->
<!--                                 <p>film</p> -->
<!--                             </div> -->
<!--                             <div class="clearfix"></div> -->
<!--                         </div> -->
<!--                     </div> -->
                </div>
            </div>
            <div class="third-row-win">
            	<!-- 뒤로가기 앞으로가기 화살표  -->
                <div class="col-xs-2">
                    <i class="fa fa-long-arrow-left"></i>
                    <i class="fa fa-long-arrow-right"></i>
                    <i class="fa fa-chevron-down"></i>
                    <i class="fa fa-arrow-up"></i>
                </div>
                <div class="col-xs-7">
                	<!-- 폴더 경로 -->
                    <div class="path-input">
                        <span class="path-icon-input">This pc</span>
                        <span class="path-icon-input">Mohamed Yahya (E:)</span>
                        <span class="path-icon-input">programming</span>
                        <span class="path-icon-input">Front End</span>
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
                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="">
                            
                            	<!-- 왼쪽 영역  -->
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        <span class="fa fa-desktop">This PC</span>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                <div class="panel-body">
                                    <p><span class="fa fa-desktop">Desktop</span></p>
                                    <p><span class="fa fa-download">Downloads</span></p>
                                    <p><span class="fa fa-file-text">documents</span></p>
                                    <p><span class="fa fa-picture-o ">Picture</span></p>
                                    <p><span class="fa fa-folder ">Folder</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-9 ">
                    <div class="row main-folders" id="folder-area">
						<!-- 폴더 ajax 추가 -->
                        <div class="col-xs-2 folders text-center">
                            <p class="contain"><img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg" class="img-responsive  center-block" style="height: 64px;" alt=""></p>
                            <span>Share Folder</span>
                        </div>
                        <div class="col-xs-2 folders text-center">
                            <p class="contain"><img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg" class="img-responsive  center-block" style="height: 64px;" alt=""></p>
                            <span>Folder</span>
                        </div>
                        <div class="col-xs-2 folders text-center">
                            <p class="contain"><img src="" class="img-responsive  center-block" style="height: 64px;" alt=""></p>
                            <span>Folder</span>
                        </div>
<!--                         <div class="clearfix"></div> -->
                    </div>
                </div>
            </div>
            <div class="fived-row-win"></div>
        </div>
        <div class="resizer"></div>
    </div>
    <div class="clearfix"></div>




    <footer class="nav navbar-inverse navbar-fixed-bottom footer text-center" style="display: none;">
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
	    if (item.isFile) {
	        // Get file
	        item.file(function(file) {
	        	if(path == ''){
	        		console.log("파일만 올림")
		            console.log("File: " + path + file.name);
	                var html = '';
	                html += '<div class="col-xs-2 folders text-center">';
	                html += '	<p class="contain"><img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg" class="img-responsive  center-block" style="height: 64px;" alt=""></p>';
	                html += '	<span>Folder</span>';
	                html += '</div>';
	                fDiv.append(html);
	        	}else{
	        		console.log("폴더포함 올림")
		            console.log("File: " + path + file.name);
	        	}
	        }, error);
	    } else if (item.isDirectory) {
	        // Get folder contents
	        var dirReader = item.createReader();
	        dirReader.readEntries(function(entries) {
	            for (var i=0; i<entries.length; i++) {
	                traverseFileTree(entries[i], path + item.name + "/")
	            }
	        }, error_from_readentries);
	    }
	}
	
	function handleFileSelect(evt) {
	    evt.stopPropagation();
	    evt.preventDefault();
	        var items = evt.dataTransfer.items;
	    for (var i = 0; i < items.length; i++) {
	        var item = items[i].webkitGetAsEntry();
	        if (item) {
	            traverseFileTree(item);
	        }
	    }
	}
	
	function handleDragOver(evt) {
	    evt.stopPropagation();
	    evt.preventDefault();
	    evt.dataTransfer.dropEffect = 'copy';
	}
	
	//Setup the dnd listeners.
	var dropZone = document.getElementById('overlay-computer');
	dropZone.addEventListener('dragover', handleDragOver, false);
	dropZone.addEventListener('drop', handleFileSelect, false);	
    var fDiv = $("#folder-area");

//     div.ondragover = function (e) {
//         return false;
//     }
    
//     div.ondrop = function (e) {
//         var files = e.dataTransfer.files;
//         console.log(files)
//         for(var i of files){
//             console.log(i.name, i.size);
//             var html = '';
//             html += '<div class="col-xs-2 folders text-center">';
//             html += '	<p class="contain"><img src="https://res.cloudinary.com/dr5ei3rt1/image/upload/v1500502735/if_folder-blue_285658_f5jeko.svg" class="img-responsive  center-block" style="height: 64px;" alt=""></p>';
//             html += '	<span>Folder</span>';
//             html += '</div>';
//             fDiv.append(html);
//         }
//         return false;
//     }
</script>
</body>
</html>