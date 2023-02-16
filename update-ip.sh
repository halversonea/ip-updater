#!/bin/bash

source auth.sh
HOST="YOUR_HOSTNAME"

date

CUR_IP=$(curl -s "https://domains.google.com/checkip")
REG_IP=$(nslookup $HOST | grep -A 1 $HOST | grep Address: | cut -d' ' -f2)

if [ "$CUR_IP" != "$REG_IP" ]; then
    echo "Mismatch. Updating DNS record from $REG_IP to $CUR_IP"
    curl "https://${USER}:${PASS}@domains.google.com/nic/update?hostname=${HOST}&myip=${CUR_IP}"
else
    echo "Match. Record has $REG_IP and current IP is $CUR_IP"
fi
