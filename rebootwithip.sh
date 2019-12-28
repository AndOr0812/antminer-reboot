#!/bin/bash

trap c INT

c(){
    echo "\nAborted!"
    exit 1
}

turnoff(){
    MINER_IP="$1"
    echo "Rebooting $MINER_IP"
    curl --digest -sL --user user:password http://${MINER_IP}/cgi-bin/reboot.cgi
    sleep 1
}

for ip in $(echo $1 | tr ',' '\n'); do
    #echo $ip
    turnoff $(grep "lpg$ip" "ip.txt" | cut -d' ' -f1)
done
