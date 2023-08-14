#!/bin/bash -e
CONTAINERD_VERSION='1.7.3'
wget https://github.com/containerd/containerd/releases/download/v$CONTAINERD_VERSION/containerd-$CONTAINERD_VERSION-linux-arm64.tar.gz
tar Cxzvf /usr/local containerd-$CONTAINERD_VERSION-linux-arm64.tar.gz

RUNC_VERSION='1.1.9'
wget https://github.com/opencontainers/runc/releases/download/v$RUNC_VERSION/runc.arm64
install -m 755 runc.arm64 /usr/local/sbin/runc

CNI_VERSION='1.3.0'
wget https://github.com/containernetworking/plugins/releases/download/v$CNI_VERSION/cni-plugins-linux-arm64-v$CNI_VERSION.tgz
mkdir -p /opt/cni/bin
tar Cxzvf /opt/cni/bin cni-plugins-linux-arm64-v$CNI_VERSION.tgz

# Configure containerd
mkdir -p /etc/containerd
containerd config default | tee /etc/containerd/config.toml
sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml
curl -L https://raw.githubusercontent.com/containerd/containerd/main/containerd.service -o /etc/systemd/system/containerd.service
systemctl daemon-reload
systemctl enable --now containerd
systemctl status containerd