/*!
 *
 * WebRTC Lab 
 * @author dodortus (codejs.co.kr / dodortus@gmail.com)
 *
 */
$(function() {
  if (typeof webkitSpeechRecognition != 'function') {
    alert('크롬에서만 동작 합니다.');
    return false;
  }

  var recognition = new webkitSpeechRecognition();
  var isRecognizing = false;
  var ignoreOnend = false;
  var finalTranscript = '';
  var audio = document.getElementById('audio');
  var $btnMic = $('#btn-mic');
  var $result = $('#result');
  var $iconMusic = $('#icon-music');
  var $folder =  $('#icon-computer');
  recognition.continuous = true;
  recognition.interimResults = true;

  recognition.onstart = function() {
    console.log('onstart', arguments);
    isRecognizing = true;

    $btnMic.attr('class', 'on');
  };

  recognition.onend = function() {
    console.log('onend', arguments);
    isRecognizing = false;

    if (ignoreOnend) {
      return false;
    }

    // DO end process
    $btnMic.attr('class', 'off');
    if (!finalTranscript) {
      console.log('empty finalTranscript');
      return false;
    }

    if (window.getSelection) {
      window.getSelection().removeAllRanges();
      var range = document.createRange();
      range.selectNode(document.getElementById('final-span'));
      window.getSelection().addRange(range);
    }

  };

  recognition.onresult = function(event) {
    console.log('onresult', event);

    var interimTranscript = '';
    if (typeof(event.results) == 'undefined') {
      recognition.onend = null;
      recognition.stop();
      return;
    }

    for (var i = event.resultIndex; i < event.results.length; ++i) {
      if (event.results[i].isFinal) {
        finalTranscript += event.results[i][0].transcript;
      } else {
        interimTranscript += event.results[i][0].transcript;
      }
    }

    finalTranscript = capitalize(finalTranscript);
    final_span.innerHTML = linebreak(finalTranscript);
    interim_span.innerHTML = linebreak(interimTranscript);

    console.log('finalTranscript', finalTranscript);
    console.log('interimTranscript', interimTranscript);
    fireCommand(interimTranscript);
  };

  /**
   * changeColor
   *
   */
  /*
	  .red 		{ background: red; }
		.blue 	{ background: blue; }
		.green 	{ background: green; }
		.yellow { background: yellow; }
		.orange { background: orange; }
		.grey 	{ background: grey; }
		.gold   { background: gold; }
		.white 	{ background: white; }
		.black  { background: black; }
 	*/
  function fireCommand(string) {
  	if (string.endsWith('폴더 열어') || string.endsWith('폴더 열어줘') || string.endsWith('오픈')) {
  	      console.dir($("#icon-computer"));
	      console.log('opencom() 호출');
//	      opencom();
	      $folder.dblclick(function () {});
	      $("#icon-computer").dblclick(function () {
	    	  
	      })
      // opencom() 함수 호출
  	}
  }

  recognition.onerror = function(event) {
    console.log('onerror', event);

    if (event.error == 'no-speech') {
      ignoreOnend = true;
    } else if (event.error == 'audio-capture') {
      ignoreOnend = true;
    } else if (event.error == 'not-allowed') {
      ignoreOnend = true;
    }

    $btnMic.attr('class', 'off');
  };

  var two_line = /\n\n/g;
  var one_line = /\n/g;
  var first_char = /\S/;

  function linebreak(s) {
    return s.replace(two_line, '<p></p>').replace(one_line, '<br>');
  }

  function capitalize(s) {
    return s.replace(first_char, function(m) {
      return m.toUpperCase();
    });
  }

  function start(event) {
    if (isRecognizing) {
      recognition.stop();
      return;
    }
    recognition.lang = 'ko-KR';
    recognition.start();
    ignoreOnend = false;

    finalTranscript = '';
    final_span.innerHTML = '';
    interim_span.innerHTML = '';

  }

  /**
   * textToSpeech
   * 지원: 크롬, 사파리, 오페라, 엣지
   */
  function textToSpeech(text) {
    console.log('textToSpeech', arguments);

    /*
    var u = new SpeechSynthesisUtterance();
    u.text = 'Hello world';
    u.lang = 'en-US';
    u.rate = 1.2;
    u.onend = function(event) {
      log('Finished in ' + event.elapsedTime + ' seconds.');
    };
    speechSynthesis.speak(u);
    */

    // simple version
    speechSynthesis.speak(new SpeechSynthesisUtterance(text));
  }

  /**
   * requestServer
   * key - AIzaSyDiMqfg8frtoZflA_2LPqfGdpjmgTMgWhg
   */
  function requestServer() {
    $.ajax({
      method: 'post',
      url: 'https://www.google.com/speech-api/v2/recognize?output=json&lang=en-us&key=AIzaSyDiMqfg8frtoZflA_2LPqfGdpjmgTMgWhg',
      data: '/examples/speech-recognition/hello.wav',
      contentType: 'audio/l16; rate=16000;', // 'audio/x-flac; rate=44100;',
      success: function(data) {

      },
      error: function(xhr) {

      }
    });
  }

  /**
   * init
   */
  // $btnMic.click(start);
  start();
  $('#btn-tts').click(function() {
    textToSpeech($('#final_span').text() || '전 음성 인식된 글자를 읽습니다.');
  });
});
