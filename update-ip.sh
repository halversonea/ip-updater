#!/bin/bash

# https://support.google.com/domains/answer/6147083?hl=en

source auth.sh
HOST="hostname.network"

# Get IP
#IP=$( dig +short myip.opendns.com @resolver1.opendns.com )
CUR_IP=$(curl -s "https://domains.google.com/checkip")
CUR_IP="0.0.0.0"
REG_IP=$(nslookup hostname.network | grep Address: | grep -v 192.168 | cut -d' ' -f2)

if [ "$CUR_IP" != "$REG_IP" ]; then
    echo "mismatch"
else
    echo "match"
fi

# Update DNS Record
#curl -v "https://${USER}:${PASS}@domains.google.com/nic/update?hostname=${HOST}&myip=${CUR_IP}"