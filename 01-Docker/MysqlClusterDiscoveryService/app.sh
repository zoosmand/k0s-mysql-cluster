#!/bin/sh

if [ $1 ]; then DNS=$1; else DNS=8.8.8.8; fi

dnsmasq --server=${DNS} --clear-on-reload
while true; do nc -l 5333 >> /etc/hosts; kill -1 $(ps xau | grep "[d]nsmasq" | awk '{print $1}'); done

# pkill -f dnsmasq

exit 0