#!/bin/bash

ip=$1
ports=$2
packetCount=${3:-1}

version=1.0

red='\033[31;1m'
green='\033[32;1m'
yellow='\033[33;1m'
redBlink='\033[31;5;1m'
noColor='\033[m'

banner(){
echo -e "${yellow} _                                 "
echo "| |                                "
echo "| | ___  ___  ___  __ _  ___  _ __ "
echo "| |/ _ \/ _ \/ __|/ _\` |/ _ \| '__|"
echo "| |  __/ (_) \__ \ (_| | (_) | |   "
echo "|_|\___|\___/|___/\__,_|\___/|_|   "
echo -e "${noColor}"
echo -e "   PortKnocking - Version: $version\n"
}

help(){
    banner
    echo -e "\nUsage Mode: $0 <ip> <ports> <packetCount>"

}

port_knocking() {
    banner

    local IFS=','

    for port in $ports; do
        echo -e "${green}Knocking on port $port${noColor}"
        hping3 -S -c $packetCount -p $port $ip > /dev/null 2>&1
        sleep 0.5
    done
    echo -e "${green}===> Port Knocking finished! <=== ${noColor}"
}

port_knocking