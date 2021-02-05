const http = require('http');
const port = 2333;

http.createServer((request, response) => {
    response.writeHead(200, {'Content-Type': 'text/plain'});
    response.end('Hello, World\n');
}).listen(port);

console.log('Server running at http://localhost:' + port);
