#!/bin/bash

# set the ELK package versions
export ELASTIC_VERSION=5.6.8

# set the installation to be non-interactive
#export DEBIAN_FRONTEND="noninteractive"

echo "*********************************** Linux updates **************************************"
# update aptitude
echo "Linux Updating..."
apt-get update -qq
echo "Linux Upgrading..."
apt-get upgrade -y -qqq
#echo "Install unzip jq."
#apt-get install -y -qq unzip git jq

echo "************************************ JDK8 Installation *****************************************"
/vagrant/scripts/install_jdk8.sh
echo "************************************ ELK Installation *****************************************"
/vagrant/scripts/elk/install_elk.sh
#echo "************************************ Beats Installation *****************************************"
#/vagrant/scripts/beats/install_beats.sh

echo "************************************ Cleanup Installation *****************************************"
# clear out unneeded packages
apt-get autoremove -y -qq

echo "************************************ Search Cache *****************************************"
# update file search cache
updatedb

#echo "************************************ XPack Installation *****************************************"
#/vagrant/scripts/install_xpack.sh

echo "************************************ Health checks *****************************************"
/vagrant/scripts/util/check_status.sh