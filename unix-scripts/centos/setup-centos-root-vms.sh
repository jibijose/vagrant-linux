#!/bin/bash

echo "setup root centos"

function createSSHKey {
	echo "generating root ssh key"
	yes y | ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa -N '' >/dev/null
}

function enableSSH {
	echo "enabling ssh key"
	sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
	sudo systemctl restart sshd
}

createSSHKey
enableSSH