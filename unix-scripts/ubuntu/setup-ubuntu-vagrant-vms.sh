#!/bin/bash

echo "setup ubuntu bionic"

function createSSHKey {
	echo "generating ubuntu ssh key"
	yes y | ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa -N '' >/dev/null
}

createSSHKey