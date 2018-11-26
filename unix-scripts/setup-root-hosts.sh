#!/bin/bash

echo "setup hosts"

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

function setupHosts {
	if [ $TOTAL_NODES == 1 ]
	then
		echo "Skipping hosts setup for single node"
		return 0
	fi
	echo "modifying /etc/hosts file"
	for i in $(seq 1 $TOTAL_NODES)
	do
	    IFS='.'; blockip=( $NODE_START_IP )
		blockip4new=$(expr "${blockip[3]}" + "$i")
		IFS=';'; ip=${blockip[0]}"."${blockip[1]}"."${blockip[2]}"."${blockip4new}

		entry="${ip} $NODE_NAME${i}"
		echo "adding ${entry}"
		echo "${entry}" >> /etc/hosts
	done
}

setupHosts