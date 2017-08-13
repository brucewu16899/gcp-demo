var log = require('nodeutil').simplelog;
var util = require('util');
var socket_host = util.format('http://%s:%s/', 
		process.env.HOST || 'localhost',
		process.env.PORT || '8000' );

var io = require('socket.io-client');
var opts = { reconnect: true, connect_timeout: 5000 };

var socket = io.connect(socket_host, opts);

socket.on('connect', function(){
  log.info('connected...');
  socket.emit('event1', {
    msg: 'test...'
  });
});

socket.on('news', function(data){
  log.info('got news:', data);
});

socket.on('roomevent', function(data){
  var id = socket.io ? socket.io.engine.id : socket.socket.sessionid;
  log.info('[%s][%s]got news:', id, new Date().toString(), data);
});
