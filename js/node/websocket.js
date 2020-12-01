const WebSocket = require('ws'); // 3.0.0
const port = 3000;

const server = new WebSocket.Server({ port });

server.on('connection', ws => {
    console.log(`[SERVER] connection()`);
    ws.on('message', msg => {
        console.log(`[SERVER] received: ${msg}`);
        ws.send(`[SERVER] ${msg}`, (err) => {
            if (err) {
                console.error(`[SERVER] ${err}`);
            }
        });
    })
});

console.log(`listening ws://localhost:${port}`);

// 浏览器打开 localhost:3000, 在控制台输入：
//var ws = new WebSocket('ws://localhost:3000/test');
//ws.onmessage = msg => console.log(msg);
//ws.send('Hello!');

// 或者，用 node 编写客户端：
//const ws = new WebSocket('ws://localhost:3000/test');
//ws.on('open', function () {
//    console.log(`[CLIENT] open()`);
//    ws.send('Hello!');
//});
//ws.on('message', function (message) {
//    console.log(`[CLIENT] received: ${message}`);
//}

