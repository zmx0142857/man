import socket, threading, time, sys

ip = '127.0.0.1'
port = 9999
argv = sys.argv
if len(argv) == 3:
    ip = argv[1]
    port = int(argv[2])

def tcplink(sock, addr):
    print('Accept new connection from %s:%s...' % addr)
    sock.send(b'Welcome!')
    while True:
        data = sock.recv(1024)
        time.sleep(0.1)
        if not data or data.decode('utf-8') == 'exit':
            sock.send(b'bye')
            break
        sock.send(('Hello, %s!' % data.decode('utf-8')).encode('utf-8'))
    sock.close()
    print('Connection from %s:%s closed.' % addr)

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((ip, port))              # listen to port
    s.listen(5)                     # max connection = 5
    print('Listening to %s:%s...' % (ip, port))

    while True:
        try:
            # accept a new connection
            sock, addr = s.accept()
            # create new thread for the TCP connection
            t = threading.Thread(target=tcplink, args=(sock, addr))
            t.start()
        except KeyboardInterrupt:
            print('Server stopped')
            break
