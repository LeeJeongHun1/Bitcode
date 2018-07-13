var fs = require('fs');
var cors = require('cors')
//var app = require('express')();
var _static = require('node-static');

/*app.use(cors())*/
var file = new _static.Server('./static', {
    cache: false
});
// SSL 인증서 파일
var options = {
    key: fs.readFileSync('fake-keys/privatekey.pem'),
    cert: fs.readFileSync('fake-keys/certificate.pem')
};
// SSL 서버 생성
var app = require('https').createServer(options, handler),
io = require('socket.io').listen(app);

function handler(req, res) {
    res.writeHead(200);
    res.end("welcome sir!");
}
/*io.sockets.on('connection', function (socket) {
    socket.on('message', function (data) {
        socket.broadcast.emit('message', data);
    });
});*/
io.on("connection", function (socket) {
	  console.log(socket.id);

	  socket.on("join", function (data){
		  console.log("join : ", data);
	    socket.join("room" + data.roomid);
	    io.emit("msg", socket.id);
	  })

	  socket.on("msg", function (data) {
	    // 개별통신 : 데이터를 보낸 사용자에게만 보내기
	    // socket.emit("msg", data);
		  console.log("data : ", data);
	    io.sockets.in("room" + data.roomid).emit("msg")
	    // server.socket으로 접속한 사용자 모두에게 데이터 전송
		  io.emit("msg", data);
	    
	    // 나를 제외한 접속자 모두에게
	    // socket.broadcast.emit("msg", data);
	  });
	  
	  socket.on('disconnect', function() {
	    // 새로고침, 페이지 종료시 자동 emit 발생
		 console.log('연결 종료 : ' + socket.id);
		 io.emit("msg", socket.id);
	  });
	});
/*
app.get('/', function(req, res) {
	  res.header("Access-Control-Allow-Origin", "*");
		res.sendFile(__dirname + '/chat.html');
	});*/
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
//var io = require('socket.io')(server);




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
app.listen(10001, function() {
  console.log('SSL server listening on port 10001');
});