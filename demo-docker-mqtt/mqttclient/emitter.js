var mqtt = require('mqtt')
var client  = mqtt.connect('mqtt://localhost')

client.on('connect', function () {
  client.subscribe('presence')
  setInterval(function() {
  	client.publish('presence', 'Hello mqtt [' + new Date() + ']' )
	},3000);
})

