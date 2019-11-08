#!/usr/bin/bash

for i in $(seq 3 250); do
    MINER_IP="192.168.100.$i"
    echo "Rebooting $MINER_IP"
    curl --digest -sL --user root:admin http://${MINER_IP}/cgi-bin/reboot.cgi
    sleep 1
done
