var fs = require('fs');
var cors = require('cors');
var app = require('express')();
var _static = require('node-static');
var file = new _static.Server('./static', {
    cache: false
});
// SSL 인증서 파일
var options = {
    key: fs.readFileSync('fake-keys/privatekey.pem'),
    cert: fs.readFileSync('fake-keys/certificate.pem')
};
// SSL 서버 생성
var server = require('https').createServer(options, app);
app.use(cors());
app.get('/', function(req, res) {
	  res.header("Access-Control-Allow-Origin", "*");
		res.sendFile(__dirname + '/chat.html');
	});
/*
var io = require('socket.io').listen(server, {
    log: true,
    origins: '*:*'
});

io.set('transports', [
    // 'websocket',
    'xhr-polling',
    'jsonp-polling'
]);
*/

var roomArr = [];
var rooms = [];

var io = require('socket.io')(server);

io.on("connection", function (socket) {
  console.log(socket.id);

  // 방번호로 룸 조인
  socket.on('joinroom', function(data){
	  console.log("룸번호 : " + data.room);
	  socket.join(data.room);
  })
  
  socket.on("msg", function (data){
	// 방번호
    console.log("roomId : " + data.roomId);
    console.log("sender : " + data.sender);
    console.log("msg : " + data.msg);
    roomArr[data.roomId] = [socket.id];
  })

  socket.on("msg", function (data) {
    // 개별통신 : 데이터를 보낸 사용자에게만 보내기
	  io.to(roomArr[data.roomId]).emit("msg", data);
  });
  
  socket.on('disconnect', function() {
    // 새로고침, 페이지 종료시 자동 emit 발생
	 console.log('연결 종료 : ' + socket.id);
  });
});


/*
var channels = {};
// 소켓 페이지 접속
io.sockets.on('connection', function (socket) {
    var initiatorChannel = '';
    if (!io.isConnected) {
        io.isConnected = true;
    }

    socket.on('new-channel', function (data) {
        if (!channels[data.channel]) {
            initiatorChannel = data.channel;
        }

        channels[data.channel] = data.channel;
        onNewNamespace(data.channel, data.sender);
    });

    socket.on('presence', function (channel) {
        var isChannelPresent = !! channels[channel];
        socket.emit('presence', isChannelPresent);
    });

    socket.on('disconnect', function (channel) {
        if (initiatorChannel) {
            delete channels[initiatorChannel];
        }
    });
});
*/
/*
function onNewNamespace(channel, sender) {
    io.of('/' + channel).on('connection', function (socket) {
        var username;
        if (io.isConnected) {
            io.isConnected = false;
            socket.emit('connect', true);
        }

        socket.on('message', function (data) {
            if (data.sender == sender) {
                if(!username) username = data.data.sender;
                
                socket.broadcast.emit('message', data.data);
            }
        });
        
        socket.on('disconnect', function() {
            if(username) {
                socket.broadcast.emit('user-left', username);
                username = null;
            }
        });
    });
}
*/
// 서버 구동
server.listen(10001, function() {
  console.log('SSL server listening on port 10001');
});