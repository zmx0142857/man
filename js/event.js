const events = require('events');
const eventEmitter = new events.EventEmitter();

eventEmitter.on('connection', function () {
    console.log('connected to server');
    eventEmitter.emit('received');
});

eventEmitter.on('received', function() {
    console.log('received data 1024KB');
});

eventEmitter.emit('connection');
console.log('---- end ---');
