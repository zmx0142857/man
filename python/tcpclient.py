import socket

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    # connection
    s.connect(('127.0.0.1', 9999))
    # receive welcoming
    print(s.recv(1024).decode('utf-8'))
    for data in [b'Michael', b'Tracy', b'Sarah']:
        # send data
        s.send(data)
        print(s.recv(1024).decode('utf-8'))
    s.send(b'exit')
