var app = require('express')();
var server = require('http').Server(app);
var io = require('socket.io').listen(server);

server.listen(process.env.PORT || 8000);

app.get('/', function (req, res) {
  res.end('ok');
});

var prefix = 'room';
io.on('connection', function (socket) {
  room = prefix + "-" + new Date().getTime();
  socket.join(room);
  var loop = setInterval(function(){
    var ts = new Date().getTime();
    io.sockets.in(room).emit('roomevent', {room: room, ts: ts, msg: 'sent to room...'})
  }, 3000);

  socket.on('event1', function (data) {
    console.log(data);
  });

  socket.on('disconnect', function(){
    clearInterval(loop);
  });

});
