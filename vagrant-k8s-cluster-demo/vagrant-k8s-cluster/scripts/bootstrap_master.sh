#!/bin/bash

kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=192.168.56.101

sudo kubeadm token list | head -n 2 | tail -n 1 | cut -d' ' -f1 > /vagrant/mastertoken.txt
sudo openssl x509 -in /etc/kubernetes/pki/ca.crt -noout -pubkey | openssl rsa -pubin -outform DER 2>/dev/null | sha256sum | cut -d' ' -f1 > /vagrant/masterhash.txt

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

sudo sysctl net.bridge.bridge-nf-call-iptables=1
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/bc79dd1505b0c8681ece4de4c0d86c5cd2643275/Documentation/kube-flannel.yml

kubectl taint nodes --all node-role.kubernetes.io/master-

### https://kubernetes.io/docs/reference/kubectl/docker-cli-to-kubectl/
### https://stackoverflow.com/questions/34198392/docker-official-registry-docker-hub-url
### https://hackernoon.com/deploying-java-applications-with-kubernetes-and-an-api-gateway-fc471644bea7
### https://scotch.io/tutorials/how-to-create-a-vagrant-base-box-from-an-existing-one