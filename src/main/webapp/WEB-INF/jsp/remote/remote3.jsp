<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<link rel="author" type="text/html" href="https://plus.google.com/+MuazKhan">
<meta name="author" content="Muaz Khan">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/remote/remote.css">
<script src="https://192.168.0.104:10001/socket.io/socket.io.js"></script>
<style>
video {
	box-sizing: border-box;
}
</style>
<title>Remote</title>

<script>
	if(!location.hash.replace('#', '').length) {
	    location.href = location.href.split('#')[0] + '#' + (Math.random() * 100).toString().replace('.', '');
	    location.reload();
	}
</script>

<link rel="stylesheet" href="https://cdn.webrtc-experiment.com/style.css">
<style>
video {
	-moz-transition: all 1s ease;
	-ms-transition: all 1s ease;
	-o-transition: all 1s ease;
	-webkit-transition: all 1s ease;
	transition: all 1s ease;
	vertical-align: top;
	width: 100%;
}

input {
	border: 1px solid #d9d9d9;
	border-radius: 1px;
	font-size: 2em;
	margin: .2em;
	width: 30%;
}

select {
	border: 1px solid #d9d9d9;
	border-radius: 1px;
	height: 50px;
	margin-left: 1em;
	margin-right: -12px;
	padding: 1.1em;
	vertical-align: 6px;
	width: 18%;
}

.setup {
	border-bottom-left-radius: 0;
	border-top-left-radius: 0;
	font-size: 102%;
	height: 47px;
	margin-left: -9px;
	margin-top: 8px;
	position: absolute;
}

p {
	padding: 1em;
}

li {
	border-bottom: 1px solid rgb(189, 189, 189);
	border-left: 1px solid rgb(189, 189, 189);
	padding: .5em;
}
</style>
<script>
	document.createElement('article');
	document.createElement('footer');
</script>

<link rel="chrome-webstore-item" href="https://chrome.google.com/webstore/detail/ajhifddimkapgcifgcodmmfdlknahffk">

<!-- scripts used for screen-sharing -->
<script src="https://cdn.webrtc-experiment.com/socket.io.js"> </script>
<script src="https://cdn.webrtc-experiment.com/DetectRTC.js"></script>
<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
<script src="https://cdn.webrtc-experiment.com/CodecsHandler.js"></script>
<script src="https://cdn.webrtc-experiment.com/BandwidthHandler.js"></script>
<script src="https://cdn.webrtc-experiment.com/IceServersHandler.js"></script>
<script src="https://cdn.webrtc-experiment.com/Screen-Capturing.js"></script>
<script src="https://cdn.webrtc-experiment.com/Pluginfree-Screen-Sharing/conference.js"> </script>
<script type="text/javascript" async="" src="https://webrtcexperiment.disqus.com/embed.js"></script>
<link rel="preload" as="style" href="https://c.disquscdn.com/next/embed/styles/lounge.3999ac261b914f8b8b5e85df0ff3eaea.css">
<link rel="preload" as="script" href="https://c.disquscdn.com/next/embed/common.bundle.5f8e47303ecf1055cd7c6905466d140a.js">
<link rel="preload" as="script" href="https://c.disquscdn.com/next/embed/lounge.bundle.33067ddbd4792de0b384ceb588602715.js">
<link rel="preload" as="script" href="https://disqus.com/next/config.js">
</head>

<body>
	<article>
		<header style="text-align: center;"> </header>

		<!-- just copy this <section> and next script -->
		<section class="experiment">

			<section id="chrome-warning"
				style="display: none; background: yellow; margin: 20px; border: 2px dotted red; font-size: 20px;">
				<p style="margin: 0;">Please install following chrome extension:
				</p>

				<p style="margin-top: 0;">
					<a
						href="https://chrome.google.com/webstore/detail/screen-capturing/ajhifddimkapgcifgcodmmfdlknahffk"
						target="_blank">https://chrome.google.com/webstore/detail/screen-capturing/ajhifddimkapgcifgcodmmfdlknahffk</a>
				</p>
			</section>

			<!-- list of all available broadcasting rooms -->
			<table style="width: 100%; display: none;" id="rooms-list"
				class="hide-after-join"></table>

			<!-- local/remote videos container -->
			<div id="videos-container">
				<video autoplay="" playsinline="" controls=""
					style="transform: rotate(360deg);"></video>
			</div>
		</section>

		<script>
                // Muaz Khan     - https://github.com/muaz-khan
                // MIT License   - https://www.webrtc-experiment.com/licence/
                // Documentation - https://github.com/muaz-khan/WebRTC-Experiment/tree/master/Pluginfree-Screen-Sharing

                var CHROME_MEDIA_SOURCE = 'screen';
                var CHROME_MEDIA_SOURCE_ID = null;
                var CHROME_MEDIA_SOURCE_AUDIO = false;

                var config = {
                    // via: https://github.com/muaz-khan/WebRTC-Experiment/tree/master/socketio-over-nodejs
                    openSocket: function(config) {
                        var SIGNALING_SERVER = 'https://socketio-over-nodejs2.herokuapp.com:443/';

                        config.channel = config.channel || location.href.replace(/\/|:|#|%|\.|\[|\]/g, '');
                        var sender = Math.round(Math.random() * 999999999) + 999999999;

                        io.connect(SIGNALING_SERVER).emit('new-channel', {
                            channel: config.channel,
                            sender: sender
                        });

                        var socket = io.connect(SIGNALING_SERVER + config.channel);
                        socket.channel = config.channel;
                        socket.on('connect', function () {
                            if (config.callback) config.callback(socket);
                        });

                        socket.send = function (message) {
                            socket.emit('message', {
                                sender: sender,
                                data: message
                            });
                        };

                        socket.on('message', config.onmessage);
                    },
                    onRemoteStream: function(media) {
                        if(isbroadcaster) return;

                        var video = media.video;
                        videosContainer.insertBefore(video, videosContainer.firstChild);
                        rotateVideo(video);

                        var hideAfterJoin = document.querySelectorAll('.hide-after-join');
                        for(var i = 0; i < hideAfterJoin.length; i++) {
                            hideAfterJoin[i].style.display = 'none';
                        }
                    },
                    onRoomFound: function(room) {
                        if(isbroadcaster) return;

                        if(location.hash.replace('#', '').length) {
                            // private rooms should auto be joined.
                            conferenceUI.joinRoom({
                                roomToken: room.roomToken,
                                joinUser: room.broadcaster
                            });
                            return;
                        }

                        var alreadyExist = document.getElementById(room.broadcaster);
                        if (alreadyExist) return;

                        if (typeof roomsList === 'undefined') roomsList = document.body;

                        var tr = document.createElement('tr');
                        tr.setAttribute('id', room.broadcaster);
                        tr.innerHTML = '<td>' + room.roomName + '</td>' +
                            '<td><button class="join" id="' + room.roomToken + '">Open Screen</button></td>';
                        roomsList.insertBefore(tr, roomsList.firstChild);

                        var button = tr.querySelector('.join');
                        button.onclick = function() {
                            var button = this;
                            button.disabled = true;
                            conferenceUI.joinRoom({
                                roomToken: button.id,
                                joinUser: button.parentNode.parentNode.id
                            });
                        };
                    },
                    onNewParticipant: function(numberOfParticipants) {
                        document.title = numberOfParticipants + ' users are viewing your screen!';
                        var element = document.getElementById('number-of-participants');
                        if (element) {
                            element.innerHTML = numberOfParticipants + ' users are viewing your screen!';
                        }
                    },
                    oniceconnectionstatechange: function(state) {
                        if(state == 'failed') {
                            alert('Failed to bypass Firewall rules. It seems that target user did not receive your screen. Please ask him reload the page and try again.');
                        }

                        if(state == 'connected') {
                            alert('A user successfully received your screen.');
                        }
                    }
                };

                function captureUserMedia(callback) {
                    console.log('captureUserMedia chromeMediaSource', CHROME_MEDIA_SOURCE);

                    var video = document.createElement('video');
                    video.muted = true;
                    video.volume = 0;
                    try {
                        video.setAttributeNode(document.createAttribute('autoplay'));
                        video.setAttributeNode(document.createAttribute('playsinline'));
                        video.setAttributeNode(document.createAttribute('controls'));
                    } catch (e) {
                        video.setAttribute('autoplay', true);
                        video.setAttribute('playsinline', true);
                        video.setAttribute('controls', true);
                    }

                    var screen_constraints = {
                        mandatory: {
                            chromeMediaSource: CHROME_MEDIA_SOURCE,
                            maxWidth: screen.width > 1920 ? screen.width : 1920,
                            maxHeight: screen.height > 1080 ? screen.height : 1080
                            // minAspectRatio: 1.77
                        },
                        optional: [{ // non-official Google-only optional constraints
                            googTemporalLayeredScreencast: true
                        }, {
                            googLeakyBucket: true
                        }]
                    };

                    if(isEdge) {
                        navigator.getDisplayMedia({video: true}).then(stream => {
                            video.srcObject = stream;
                            videosContainer.insertBefore(video, videosContainer.firstChild);

                            addStreamStopListener(stream, function() {
                                location.reload();
                            });

                            config.attachStream = stream;
                            callback && callback();
                            rotateVideo(video);

                            addStreamStopListener(stream, function() {
                                location.reload();
                            });
                        }, error => {
                            if (location.protocol === 'http:') {
                                alert('Please test this WebRTC experiment on HTTPS.');
                            } else {
                                alert('Please use Edge >= 17.');
                            }
                        });
                        return;
                    }

                    if(DetectRTC.browser.name === 'Chrome' && CHROME_MEDIA_SOURCE == 'desktop' && !CHROME_MEDIA_SOURCE_ID) {
                        // https://github.com/muaz-khan/Chrome-Extensions/tree/master/Screen-Capturing.js#getsourceidwithaudio
                        getSourceIdWithAudio(function(sourceId, canRequestAudioTrack) {
                            CHROME_MEDIA_SOURCE_ID = sourceId;
                            CHROME_MEDIA_SOURCE_AUDIO = canRequestAudioTrack === true;
                            captureUserMedia(callback);
                        });
                        return;
                    }

                    if(DetectRTC.browser.name === 'Chrome' && CHROME_MEDIA_SOURCE == 'desktop') {
                        if(screen_constraints.mandatory) {
                            screen_constraints.mandatory.chromeMediaSourceId = CHROME_MEDIA_SOURCE_ID;
                        }
                        else {
                            screen_constraints.chromeMediaSourceId = CHROME_MEDIA_SOURCE_ID;
                        }
                    }

                    var constraints = {
                        audio: false,
                        video: screen_constraints
                    };

                    if(CHROME_MEDIA_SOURCE_AUDIO === true) {
                        // system audio i.e. speakers
                        constraints.audio = screen_constraints;
                    }

                    if(!!navigator.mozGetUserMedia) {
                        constraints.audio = false;
                        constraints.video = {
                            mozMediaSource: 'window',
                            mediaSource: 'window',
                            width: screen.width,
                            height: screen.height
                        };
                    }

                    console.log( JSON.stringify( constraints , null, '\t') );

                    getUserMedia({
                        video: video,
                        constraints: constraints,
                        onsuccess: function(stream) {
                            video.srcObject = stream;
                            videosContainer.insertBefore(video, videosContainer.firstChild);

                            config.attachStream = stream;
                            callback && callback();

                            video.setAttribute('muted', true);
                            rotateVideo(video);

                            addStreamStopListener(stream, function() {
                                location.reload();
                            });
                        },
                        onerror: function(error) {
                            if (DetectRTC.browser.name === 'Chrome' && location.protocol === 'http:') {
                                alert('Please test this WebRTC experiment on HTTPS.');
                            } else if(DetectRTC.browser.name === 'Chrome') {
                                alert('Screen capturing is either denied or not supported. Please install chrome extension for screen capturing or run chrome with command-line flag: --enable-usermedia-screen-capturing');
                            } else {
                                alert(error.toString());
                            }
                        }
                    });
                }

                /* on page load: get public rooms */
                var conferenceUI = conference(config);

                /* UI specific */
                var videosContainer = document.getElementById("videos-container") || document.body;
                var roomsList = document.getElementById('rooms-list');

                document.getElementById('share-screen').onclick = function() {
                    var roomName = document.getElementById('room-name') || { };
                    roomName.disabled = true;
                    captureUserMedia(function() {
                        conferenceUI.createRoom({
                            roomName: (roomName.value || 'Anonymous') + ' shared his screen with you'
                        });
                    });
                    this.disabled = true;
                };

                function rotateVideo(video) {
                    video.style[navigator.mozGetUserMedia ? 'transform' : '-webkit-transform'] = 'rotate(0deg)';
                    setTimeout(function() {
                        video.style[navigator.mozGetUserMedia ? 'transform' : '-webkit-transform'] = 'rotate(360deg)';
                    }, 1000);
                }

                (function() {
                    var uniqueToken = document.getElementById('unique-token');
                    if (uniqueToken)
                        if (location.hash.length > 2) uniqueToken.parentNode.parentNode.parentNode.innerHTML = '<h2 style="text-align:center;display: block""><a href="' + location.href + '" target="_blank">Right click to copy & share this private link</a></h2>';
                        else uniqueToken.innerHTML = uniqueToken.parentNode.parentNode.href = '#' + (Math.random() * new Date().getTime()).toString(36).toUpperCase().replace( /\./g , '-');
                })();

            </script>

<script>
	if(DetectRTC.browser.name === 'Chrome') {
	    document.getElementById('room-name').disabled = true;
	    document.getElementById('share-screen').disabled = true;
	
	    // https://github.com/muaz-khan/Chrome-Extensions/tree/master/Screen-Capturing.js#getchromeextensionstatus
	    getChromeExtensionStatus(function(status) {
	        if(status == 'installed-enabled') {
	            if(document.getElementById('install-button')) {
	                document.getElementById('install-button').parentNode.innerHTML = '<strong>Great!</strong> <a href="https://chrome.google.com/webstore/detail/screen-capturing/ajhifddimkapgcifgcodmmfdlknahffk" target="_blank">Google chrome extension</a> is installed.';
	            }
	            CHROME_MEDIA_SOURCE = 'desktop';
	
	            document.getElementById('room-name').disabled = false;
	            document.getElementById('share-screen').disabled = false;
	        }
	        else  {
	            document.getElementById('chrome-warning').style.display = 'block';
	        }
	    });
	}
</script>

	</article>

	<!-- commits.js is useless for you! -->
	<script src="https://cdn.webrtc-experiment.com/commits.js" async=""> </script>
	<script src="https://api.github.com/repos/muaz-khan/WebRTC-Experiment?callback=callback00" async=""></script>
	<script src="https://cdn.webrtc-experiment.com/common.js" async=""></script>
	<script src="https://api.github.com/repos/muaz-khan/WebRTC-Experiment?callback=callback00" async=""></script>
	<script src="https://api.github.com/users/muaz-khan?callback=callback00" async=""></script>
</body>
</html>