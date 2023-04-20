#!/bin/bash
# File: desktop-shark-neighbors-hosts.sh
# Description: List IPs in the local network
# Combined with Etherape can be used to identify a host by interpreting
# the ICMP packages sent and received from/to the current computer
# An useful option when we are unable to set up static ip hosts in the 
# local router

# nmap is also useful when it shows hostnames or other machine info, but
# I assume that the hosts file is not set up in the local network hosts
#nmap -sP 192.168.100.0/24

# Run as root or with sudo
seq 254 | xargs -iIP -P255 ping -c1 192.168.100.IP |grep time=
arp -a
