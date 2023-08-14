#!/bin/bash -e
ip -family inet -brief address
kubectl get nodes -o json | jq -r '.items[].spec.podCIDR'
kubectl get nodes
kubectl get pods --all-namespaces