import socket, sys

ip = '127.0.0.1'
port = 9999
argv = sys.argv
if len(argv) == 3:
    ip = argv[1]
    port = int(argv[2])

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    # connection
    s.connect((ip, port))
    print('Connected to %s:%s' % (ip, port))
    msg = ''
    while msg != 'exit':
        try:
            print(s.recv(1024).decode('utf-8'))
            msg = input('> ')
            s.send(msg.encode('utf-8'))
        except EOFError:
            print()
            s.send(b'exit')
            break
