import socket, threading, time

def tcplink(sock, addr):
    print('Accept new connection from %s:%s...' % addr)
    sock.send(b'Welcome!')
    while True:
        data = sock.recv(1024)
        time.sleep(1)
        if not data or data.decode('utf-8') == 'exit':
            break
        sock.send(('Hello, %s!' % data.decode('utf-8')).encode('utf-8'))
    sock.close()
    print('Connection from %s:%s closed.' % addr)

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind(('127.0.0.1', 9999))     # listen to port
    s.listen(5)                     # max connection = 5
    print('Waiting for connection...')

    while True:
        # accept a new connection
        sock, addr = s.accept()
        # create new thread for the TCP connection
        t = threading.Thread(target=tcplink, args=(sock, addr))
        t.start()
