#!/bin/bash
for server in $(host -t ns $1 | cut -d " " -f 4); do
  host -t ns $1 $server
done
