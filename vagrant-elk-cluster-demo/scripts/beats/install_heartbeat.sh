#!/bin/bash

export HEARTBEAT_VERSION=$ELASTIC_VERSION

# Install Heartbeat
# https://www.elastic.co/guide/en/beats/heartbeat/5.5/heartbeat-installation.html#deb
echo "[INFO] Installing Heartbeat[$HEARTBEAT_VERSION]..."
apt-get install -y -qqq heartbeat=$HEARTBEAT_VERSION
update-rc.d heartbeat defaults 95 10
service heartbeat start 2>&1

# copy over config files, restart
mkdir -p /var/log/heartbeat
cp -R /vagrant/heartbeat/* /etc/heartbeat/
service heartbeat restart 2>&1
/bin/systemctl enable heartbeat.service