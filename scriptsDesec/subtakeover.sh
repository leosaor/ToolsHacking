#!/bin/bash
for palavra in $(cat exemploSubdomain.txt); do
  host -t cname $palavra.$1 | grep "alias for"
done