var port = process.env.PORT || 3000;
var io = require('socket.io').listen(port);

var RoutingEvents = [
  'peer:signaling:offer',
  'peer:signaling:answer',
  'peer:ice:candidate'
];

io.sockets.on('connection', function(socket){
  socket.join('/');
  RoutingEvents.forEach(function(event_name){
    socket.on(event_name, function(message){
      socket.broadcast.emit(event_name, message);
    });
  });
  socket.on('disconnect', function(){
    socket.broadcast.emit('user disconnected');
  });
});
