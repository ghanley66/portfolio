#!/bin/bash
#Copyright 2021 Gary Hanley - Scripting Languages Week 4.5
#Created - 30/07/2021
#IpAddressesOnly - reads in IFConfig information and Prints only the IP Addresses

#get info about networking from the ifconfig command
net_info="$(ifconfig)"

#parse out the ip address lines using sed
addresses=$(echo "$net_info" | sed -n '/inet / {
    s/inet/IP Address:/
    s/netmask/\n\t\tSubnet Mask:/
    s/broadcast/\n\t\tBroadcast Address:/
    p
    }')

#format output
#echo -e "The IP addresses on this computer are:\n$addresses"

#show ony the IP Addresses
echo -e "The IP addresses on this computer are:"
echo "$addresses" | sed -n '/IP Address:/ p'
exit 0