#!/bin/bash
lynx -dump 'http://google.com.br/search?num=500&q=site:'"$1"'+ext:'"$2"'' | cut -d "=" -f2 | grep ".$2" | grep -v "site" | sed s'/...$//'g
