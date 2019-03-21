#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from socket import socket, AF_INET, SOCK_STREAM

# create socket
# AF_INET = IPv4, AF_INET6 = IPv6
# SOCK_STREAM is stream-orientied TCP protocal
s = socket(AF_INET, SOCK_STREAM)

url = 'www.lzu.edu.cn'

# webpage server always set port to 80
# note that the argument is a tuple
s.connect((url, 80))

# send request
s.send(bytes('GET / HTTP/1.1\r\nHost: %s\r\nConnection: close\r\n\r\n' % url, 'utf-8'))

# receive data
buf = []
while True:
    # receive at most 1k bytes each time
    package = s.recv(1024)
    if package:
        buf.append(package)
    else:
        break
data = b''.join(buf)

# close connection
s.close()

header, html = data.split(b'\r\n\r\n', 1)
# print response header
print(header.decode('utf-8'))
# save html page
with open('%s.html' % url, 'wb') as fout:
    fout.write(html)
