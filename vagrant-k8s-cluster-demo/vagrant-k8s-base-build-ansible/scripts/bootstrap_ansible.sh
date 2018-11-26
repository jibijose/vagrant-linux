#!/bin/bash

set -e

echo "Installing Ansible..."
sudo apt-get update -y
sudo apt-get install -y software-properties-common
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update -y
sudo apt-get install -y ansible apt-transport-https
echo "Installed Ansible..."