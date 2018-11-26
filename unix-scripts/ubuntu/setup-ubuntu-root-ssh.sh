#!/bin/bash

echo "setup ssh"

TOTAL_NODES=2
NODE_NAME="node"
NODE_START_IP="192.168.56.10"

while getopts t:n:i: option
do
	case "${option}"
	in
		t) TOTAL_NODES=${OPTARG};;
		n) NODE_NAME=${OPTARG};;
		i) NODE_START_IP=${OPTARG};;
	esac
done

function setupSSH {
	echo "modifying root ssh authorized key files"
	for i in $(seq 1 $TOTAL_NODES)
	do
	    sshpass -p ubuntu  ssh-copy-id -o StrictHostKeyChecking=no root@$NODE_NAME${i}
	done
	
	for i in $(seq 1 $TOTAL_NODES)
	do
		if [ $i -gt 1 ]
		then
			 echo "#!/bin/bash" >> /tmp/sshbypass.sh
			 for j in $(seq 1 $TOTAL_NODES)
			 do
				 echo sshpass -p ubuntu  ssh-copy-id -o StrictHostKeyChecking=no root@${NODE_NAME}${j} >> /tmp/sshbypass.sh
			 done
			 scp /tmp/sshbypass.sh root@${NODE_NAME}${i}:~/sshbypass.sh
			 ssh root@${NODE_NAME}${i} chmod 755 ~/sshbypass.sh
			 ssh root@${NODE_NAME}${i} ~/sshbypass.sh
			 rm -rf /tmp/sshbypass.sh
			 ssh root@${NODE_NAME}${i} rm -rf ~/sshbypass.sh
		fi
	done
}

setupSSH