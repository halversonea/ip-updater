#!/bin/bash

# https://support.google.com/domains/answer/6147083?hl=en

source auth.sh
HOST="hostname.network"

CUR_IP=$(curl -s "https://domains.google.com/checkip")
#CUR_IP="0.0.0.0"
REG_IP=$(nslookup hostname.network | grep Address: | grep -v 192.168 | cut -d' ' -f2)

if [ "$CUR_IP" != "$REG_IP" ]; then
    echo "Mismatch. Updating DNS record from $REG_IP to $CUR_IP"
else
    echo "Match. Record has $REG_IP and current IP is $CUR_IP"
fi

# Update DNS Record
#curl -v "https://${USER}:${PASS}@domains.google.com/nic/update?hostname=${HOST}&myip=${CUR_IP}"