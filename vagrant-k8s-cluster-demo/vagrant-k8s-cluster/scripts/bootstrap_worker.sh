#!/bin/bash

MASTERTOKEN=`cat /vagrant/mastertoken.txt`
MASTERHASH=`cat /vagrant/masterhash.txt`

sudo kubeadm join 192.168.56.101:6443 --token ${MASTERTOKEN} --discovery-token-ca-cert-hash sha256:${MASTERHASH}