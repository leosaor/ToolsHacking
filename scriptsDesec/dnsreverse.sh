#!/bin/bash
for ip in $(seq 200 250);do
host -t ptr 0.0.0.$ip | grep -v "0-0-0"
done