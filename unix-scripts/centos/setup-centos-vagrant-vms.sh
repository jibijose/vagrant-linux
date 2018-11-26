#!/bin/bash

echo "setup vagrant centos"

function createSSHKey {
	echo "generating vagrant ssh key"
	yes y | ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa -N '' >/dev/null
}

createSSHKey