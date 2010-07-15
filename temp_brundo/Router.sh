#! /bin/bash

##IP-FORWARDING
#interface da condividere(quella connessa a internet)
iptables -t nat -A POSTROUTING -o ath0 -j MASQUERADE
echo "1" > /proc/sys/net/ipv4/ip_forward

echo "Ip-Forwarding attivato!!!"
	
