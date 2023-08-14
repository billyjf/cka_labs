hostnamectl set-hostname worker1
kubeadm join 192.168.50.203:6443 --token qmbp7a.3a5r05n900znvd3d \
	--discovery-token-ca-cert-hash sha256:f14e288d3b20a6a07f13f0011b6cd730d6e6302ea010097a67f9218d2107b82c