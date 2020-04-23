import socket, threading, time
from sys import argv

addr = (argv[1],int(argv[2])) if len(argv) == 3 else ('127.0.0.1',9999)
socks = set()

def broadcast(msg, sock):
    for s in socks:
        if s != sock:
            s.send(msg.encode('utf-8'))

def tcplink(sock, addr):
    socks.add(sock)
    print('[connected] %s:%s' % addr)
    sock.send(('[connected to %s:%s]' % addr).encode('utf-8'))
    broadcast('[%s:%s joined group chat]' % addr, sock)
    while True:
        data = sock.recv(1024)
        time.sleep(0.1)
        if not data or data == b'\255':
            break
        broadcast('%s:%s: %s' % (*addr, data.decode('utf-8')), sock)
    broadcast('[%s:%s leaved group chat]' % addr, sock)
    print('[closed] %s:%s' % addr)
    sock.close()
    socks.remove(sock)

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind(addr)
    s.listen(5) # max connection = 5
    print('[listening] %s:%s' % addr)

    while True:
        try:
            # accept a new connection
            sock, addr = s.accept()
            # create new thread for the TCP connection
            t = threading.Thread(target=tcplink, args=(sock, addr))
            t.start()
        except KeyboardInterrupt:
            print('\rserver stopped')
            break
