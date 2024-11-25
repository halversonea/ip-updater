#!/bin/bash

PASS="PASS"
DOMAIN="DOMAINNAME"
HOST="@"

date

CUR_IP=$(curl -s ifconfig.io -4)
REG_IP=$(nslookup $HOST | grep -A 1 $HOST | grep Address: | cut -d' ' -f2)

if [ "$CUR_IP" != "$REG_IP" ]; then
    echo "Mismatch. Updating DNS record from $REG_IP to $CUR_IP"
    curl "https://dynamicdns.park-your-domain.com/update?host=${HOST}&domain=${DOMAIN}&password=${PASS}&ip=${CUR_IP}"
else
    echo "Match. Record has $REG_IP and current IP is $CUR_IP"
fi
