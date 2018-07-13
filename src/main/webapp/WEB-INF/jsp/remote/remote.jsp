<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remote</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/remote/remote.css">
<script src="https://192.168.0.104:10001/socket.io/socket.io.js"></script>

<script>
if(!location.hash.replace('#', '').length) {
    location.href = location.href.split('#')[0] + '#' + (Math.random() * 100).toString().replace('.', '');
    location.reload();
}


function abc() {
    alert("sss");
}
</script>

<style>
video {
    box-sizing: border-box;
}
</style>

<!-- scripts used for screen-sharing -->
<script src="https://cdn.webrtc-experiment.com/socket.io.js"> </script>
<script src="${pageContext.request.contextPath}/resources/js/remote/detectRTC.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/remote/adapterLatest.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/remote/codecsHandler.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/remote/bandwidthHandler.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/remote/iceServersHandler.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/remote/conference.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/remote/screenCapturing.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/remote/getScreenId.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/remote/screen.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/remote/embed.js"></script>

<link rel="preload" as="script" href="https://c.disquscdn.com/next/embed/common.bundle.5f8e47303ecf1055cd7c6905466d140a.js">
<link rel="preload" as="script" href="https://c.disquscdn.com/next/embed/lounge.bundle.33067ddbd4792de0b384ceb588602715.js">
<link rel="preload" as="script" href="https://disqus.com/next/config.js">
</head>
<style>
#strong, .link a {
	display: none;
}
</style>
</head>

<body>

<div class="shareTitle">
	<h3 id="number-of-participants">연결 대기중입니다..</h3>
	<!-- 화면 공유 페이지 링크 주소 -->
	<div class="hide-after-join">
		<input type="text" id="user-name" placeholder="Your Name" hidden="hidden" value="${sessionScope.user.id}">
	
	    <!-- 문의 주제 -->
	    <form id="qForm">
	    <input type="text" id="id" name="id" value="${sessionScope.user.id}" hidden="hidden">
	    <input type="text" id="nickName" name="nickName" value="${sessionScope.user.nickName}" hidden="hidden">
	    <input type="text" id="question" name="question" value="${sessionScope.question}" hidden="hidden">
	    <input type="text" id="link" name="link" hidden="hidden">
	    </form>
	    <button id="shareScreen" class="screenShare order btn btn-default btn-group-xs">화면 공유</button>
	</div>
	    <button id="endScreen" class="screenShare order btn btn-default btn-group-xs">상담 종료</button>

	<!-- 화면 공유 대기 리스트 -->
	<table style="width: 100%;" id="rooms-list" class="hide-after-join"></table>
</div>

<div class="embedded-container">
    <div class="embedded-player-az">
      <!-- the main interactions will be in the .core div-->
      <div class="media" style="position: relative;">
        <%-- 화면창 --%>
        <div class="screen media-left" id="videos-container">
        </div>
	
		<div class="chat media-right">
		<iframe id="chatIframe" src="https://192.168.0.104:10001">
		</iframe>
		</div>
		
      </div>
    </div>
  </div>
  
<script>
//alert("${sessionScope.nickName}");
//alert("${sessionScope.question}");

var videosContainer = document.getElementById("videos-container") || document.body;
var roomsList = document.getElementById('rooms-list');
var screensharing = new Screen();
var channel = location.href.replace(/\/|:|#|%|\.|\[|\]/g, '');
// 채팅방 번호
var roomId = location.href.split("#")[1];
//alert(channel);
/* 
if(channel){
	var link = document.querySelector('#link');
	link.setAttribute('value', location.href);
}
 */
//
$(document).ready(function() {
	if(channel){
		var link = document.querySelector('#link');
		link.setAttribute('value', location.href);
	}
});

var sender = Math.round(Math.random() * 999999999) + 999999999;

var SIGNALING_SERVER = 'https://socketio-over-nodejs2.herokuapp.com:443/';
io.connect(SIGNALING_SERVER).emit('new-channel', {
    channel: channel,
    sender: sender
});

var socket = io.connect(SIGNALING_SERVER + channel);
socket.on('connect', function () {
    // setup peer connection & pass socket object over the constructor!
});

socket.send = function (message) {
    socket.emit('message', {
        sender: sender,
        data: message
    });
};
screensharing.openSignalingChannel = function(callback) {
    return socket.on('message', callback);
};
screensharing.onscreen = function(_screen) {
    var alreadyExist = document.getElementById(_screen.userid);
    if (alreadyExist) return;
    if (typeof roomsList === 'undefined') roomsList = document.body;
    var tr = document.createElement('tr');
    tr.id = _screen.userid;
    tr.innerHTML = '<td>' + _screen.userid + ' shared his screen.</td>' +
            '<td><button class="join">View</button></td>';
    roomsList.insertBefore(tr, roomsList.firstChild);
    var button = tr.querySelector('.join');
    button.setAttribute('data-userid', _screen.userid);
    button.setAttribute('data-roomid', _screen.roomid);
    button.onclick = function() {
        var button = this;
        button.disabled = true;
        var _screen = {
            userid: button.getAttribute('data-userid'),
            roomid: button.getAttribute('data-roomid')
        };
        screensharing.view(_screen);
    };
};
// 스크린 출력시 비디오 태그 생성
screensharing.onaddstream = function(media) {
    media.video.id = media.userid;
    var video = media.video;
    video.setAttribute("class", "remoteScreen");
    videosContainer.insertBefore(video, videosContainer.firstChild);
    
    var hideAfterJoin = document.querySelectorAll('.hide-after-join');
    for(var i = 0; i < hideAfterJoin.length; i++) {
        hideAfterJoin[i].style.display = 'none';
    }
    if(media.type === 'local') {
        addStreamStopListener(media.stream, function() {
            location.reload();
        });
    }
};

screensharing.onuserleft = function(userid) {
    var video = document.getElementById(userid);
    if (video && video.parentNode) video.parentNode.removeChild(video);
    // location.reload();
};

// 화면 공유
screensharing.check();
document.getElementById('shareScreen').onclick = function() {
    var username = document.getElementById('user-name');
    username.disabled = this.disabled = true;
    screensharing.isModerator = true;
    screensharing.userid = username.value;
    screensharing.share();
};

// 상담 리스트에 출력하기 위한 링크
/* 
(function() {
    var uniqueToken = document.getElementById('unique-token');
    if (uniqueToken)
        if (location.hash.length > 2) uniqueToken.parentNode.parentNode.parentNode.innerHTML = '<h2 style="text-align:center; display: block"><a href="' + location.href + '" target="_blank">Right click to copy & share this private link</a></h2>';
        else uniqueToken.innerHTML = uniqueToken.parentNode.parentNode.href = '#' + (Math.random() * new Date().getTime()).toString(36).toUpperCase().replace( /\./g , '-');
})();
 */
// 공유화면 접속자 수 출력/상담 연결시
screensharing.onNumberOfParticipantsChnaged = function(numberOfParticipants) {
    if(!screensharing.isModerator) return;
    document.title = numberOfParticipants + ' users are viewing your screen!';
    var element = document.getElementById('number-of-participants');
    if (element) {
        //element.innerHTML = numberOfParticipants + ' users are viewing your screen!';
        element.innerHTML = '상담이 연결되었습니다.';
    }
};
</script>

<script>
var isChrome = !!navigator.webkitGetUserMedia;
var DetectRTC = {};
(function () {
    var screenCallback;
    DetectRTC.screen = {
        chromeMediaSource: 'screen',
        getSourceId: function(callback) {
            if(!callback) throw '"callback" parameter is mandatory.';
            screenCallback = callback;
            window.postMessage('get-sourceId', '*');
        },
        isChromeExtensionAvailable: function(callback) {
            if(!callback) return;
            if(DetectRTC.screen.chromeMediaSource == 'desktop') return callback(true);
            // ask extension if it is available
            window.postMessage('are-you-there', '*');
            setTimeout(function() {
                if(DetectRTC.screen.chromeMediaSource == 'screen') {
                    callback(false);
                }
                else callback(true);
            }, 2000);
        },
        onMessageCallback: function(data) {
            if (!(typeof data == 'string' || !!data.sourceId)) return;
            console.log('chrome message', data);
            // "cancel" button is clicked
            if(data == 'PermissionDeniedError') {
                DetectRTC.screen.chromeMediaSource = 'PermissionDeniedError';
                if(screenCallback) return screenCallback('PermissionDeniedError');
                else throw new Error('PermissionDeniedError');
            }
            // extension notified his presence
            if(data == 'rtcmulticonnection-extension-loaded') {
                if(document.getElementById('install-button')) {
                    document.getElementById('install-button').parentNode.innerHTML = '<strong>Great!</strong> <a href="https://chrome.google.com/webstore/detail/screen-capturing/ajhifddimkapgcifgcodmmfdlknahffk" target="_blank">Google chrome extension</a> is installed.';
                }
                DetectRTC.screen.chromeMediaSource = 'desktop';
            }
            // extension shared temp sourceId
            if(data.sourceId) {
                DetectRTC.screen.sourceId = data.sourceId;
                if(screenCallback) screenCallback( DetectRTC.screen.sourceId );
            }
        },
        getChromeExtensionStatus: function (callback) {
            if (!!navigator.mozGetUserMedia) return callback('not-chrome');
            var extensionid = 'ajhifddimkapgcifgcodmmfdlknahffk';
            var image = document.createElement('img');
            image.src = 'chrome-extension://' + extensionid + '/icon.png';
            image.onload = function () {
                DetectRTC.screen.chromeMediaSource = 'screen';
                window.postMessage('are-you-there', '*');
                setTimeout(function () {
                    if (!DetectRTC.screen.notInstalled) {
                        callback('installed-enabled');
                    }
                }, 2000);
            };
            image.onerror = function () {
                DetectRTC.screen.notInstalled = true;
                callback('not-installed');
            };
        }
    };
    // check if desktop-capture extension installed.
    if(window.postMessage && isChrome) {
        DetectRTC.screen.isChromeExtensionAvailable();
    }
})();
DetectRTC.screen.getChromeExtensionStatus(function(status) {
    if(status == 'installed-enabled') {
        if(document.getElementById('install-button')) {
            document.getElementById('install-button').parentNode.innerHTML = '<strong>Great!</strong> <a href="https://chrome.google.com/webstore/detail/screen-capturing/ajhifddimkapgcifgcodmmfdlknahffk" target="_blank">Google chrome extension</a> is installed.';
        }
        DetectRTC.screen.chromeMediaSource = 'desktop';
    }
});
window.addEventListener('message', function (event) {
    if (event.origin != window.location.origin) {
        return;
    }
    DetectRTC.screen.onMessageCallback(event.data);
});
console.log('current chromeMediaSource', DetectRTC.screen.chromeMediaSource);

// 화면공유시 상담신청 List에 정보 전달
$("#shareScreen").click(function() {
	var formData = $("#qForm").serialize();
	console.log(formData);
		$.ajax({
			type : "POST",
			url : "/bitcode/remote/remote.do",
			cache : false,
			data : formData,
			success : function() {
				console.log("상담신청 리스트 등록");
			}
	});
});

// 상담종료시 상담신청 List에서 정보 삭제
$("#endScreen").click(function() {
		$.ajax({
			type : "POST",
			url : "/bitcode/remote/remoteDel.do",
			data : {"id" : "${sessionScope.user.id}"},
			success : function() {
				console.log("상담신청 종료");
			}
	});
});

// 노드(채팅)서버로 방번호/아이디 보내기
setTimeout(function () {
	document.querySelector("#chatIframe").contentWindow.postMessage(JSON.stringify({"roomId": roomId, "sender": "${sessionScope.user.nickName}"}), "*");	
}, 1000);
</script>

</body>
</html>