#!/bin/bash
for palavra in $(cat exemploSubdomain.txt); do
  host $palavra.$1 | grep -v "NXDOMAIN"
done