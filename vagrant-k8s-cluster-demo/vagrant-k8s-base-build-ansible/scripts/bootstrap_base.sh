#!/bin/bash

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo sh -c 'sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -'
sudo sh -c 'echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list'
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
sudo apt-get install -y docker.io kubernetes-cni
sudo systemctl enable kubelet
sudo systemctl start kubelet

sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
sudo apt-cache policy docker-ce
sudo apt install -y docker-ce

sudo usermod -aG docker ubuntu
sudo usermod -aG docker vagrant

sudo systemctl daemon-reload
sudo systemctl restart kubelet

sudo apt-get clean
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
sudo sh -c 'cat /dev/null > ~/.bash_history && history -c && exit