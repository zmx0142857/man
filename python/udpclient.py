import socket

with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as s:
    # no need to connect()
    for data in [b'Michael', b'Tracy', b'Sarah']:
        s.sendto(data, ('127.0.0.1', 9999))
        print(s.recv(1024).decode('utf-8'))
