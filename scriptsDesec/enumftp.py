#!/usr/bin/python

import socket

tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
tcp.connect(("192.168.1.202", 21))

banner = tcp.recv(1024)
print (banner)

tcp.send("USER anonymous\r\n")
user = tcp.recv(1024)
print (user)

tcp.send("PASS anonymous\r\n")
pw = tcp.recv(1024)
print (pw)
