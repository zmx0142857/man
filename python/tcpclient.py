import socket, threading, time
from sys import argv

addr = (argv[1],int(argv[2])) if len(argv) == 3 else ('127.0.0.1',9999)
running = True

def recv(sock, addr):
    while running:
        data = sock.recv(1024)
        if data:
            print('\n' + data.decode('utf-8'))
        time.sleep(0.1)

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
    sock.connect(addr)
    t = threading.Thread(target=recv, args=(sock, addr))
    t.start()
    while True:
        try:
            msg = input()
            sock.send(msg.encode('utf-8'))
        except EOFError:
            sock.send(b'\255')
            running = False
            break
