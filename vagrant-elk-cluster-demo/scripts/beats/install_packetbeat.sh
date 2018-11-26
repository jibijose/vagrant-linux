#!/bin/bash

export PACKETBEAT_VERSION=$ELASTIC_VERSION

# Install Packetbeat
# https://www.elastic.co/guide/en/beats/packetbeat/current/packetbeat-installation.html#deb
echo "[INFO] Installing Packetbeat[$PACKETBEAT_VERSION]..."
apt-get install -y -qqq ibpcap0.8
apt-get install -y -qq packetbeat=$PACKETBEAT_VERSION
update-rc.d packetbeat defaults 95 10
service packetbeat start 2>&1

# copy over config files, restart
mkdir -p /var/log/packetbeat
cp -R /vagrant/packetbeat/* /etc/packetbeat/
service packetbeat restart 2>&1
/bin/systemctl enable packetbeat.service