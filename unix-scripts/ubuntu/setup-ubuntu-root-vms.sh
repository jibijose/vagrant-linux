#!/bin/bash

echo "setup root ubuntu bionic"

function createSSHKey {
	echo "generating root ssh key"
	yes y | ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa -N '' >/dev/null
}

function enableRootSSH {
	echo "enabling root remote login"
	sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
	sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
	sudo service ssh restart
}

createSSHKey
enableRootSSH