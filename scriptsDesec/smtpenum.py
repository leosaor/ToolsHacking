#!/usr/bin/python
import re
import socket
import sys

if len(sys.argv) != 3:
  print ("Usage: vrfy.py <ip> <username>")
  sys.exit(0)

file = open("users.txt")
for user in file:
  tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
  tcp.connect((sys.argv[1], 25))
  tcp.send("VRFY "+sys.argv[2]+"\r\n")
  user = tcp.recv(1024)
  if re.search("252", user):
    print ("User Found: "+user.strip("252 2.0.0"))
  else:
    print ("User Not Found")
  tcp.close()
