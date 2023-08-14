#!/bin/bash -e
wget https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml
#CIDR=$(ip -family inet -brief -json address | jq -r '.[] | select(.operstate == "UP") | .addr_info[] | "\(.local)\\/\(.prefixlen)"')
CIDR='192.168.51.0\/16'
sed -i 's/"Network":.*/"Network": "'"$CIDR"'",/g' kube-flannel.yml
kubectl apply -f kube-flannel.yml