#!/bin/bash

export METRICBEAT_VERSION=$ELASTIC_VERSION

# Install Metricbeat
# https://www.elastic.co/guide/en/beats/metricbeat/5.5/metricbeat-installation.html#deb
echo "[INFO] Installing Metricbeat[$METRICBEAT_VERSION]..."
apt-get install -y -qqq metricbeat=$METRICBEAT_VERSION
update-rc.d metricbeat defaults 95 10
service metricbeat start 2>&1

# copy over config files, restart
mkdir -p /var/log/metricbeat
cp -R /vagrant/metricbeat/* /etc/metricbeat/
service metricbeat restart 2>&1
/bin/systemctl enable metricbeat.service