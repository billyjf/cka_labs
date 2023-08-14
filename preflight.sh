#!/bin/bash -e
echo 1 > /proc/sys/net/ipv4/ip_forward
modprobe br_netfilter