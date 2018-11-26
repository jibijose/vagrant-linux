#!/bin/bash

export FILEBEAT_VERSION=$ELASTIC_VERSION

# Install Filebeat
# https://github.com/elastic/beats
# @see https://www.elastic.co/guide/en/beats/libbeat/5.5/setup-repositories.html
echo "[INFO] Installing Filbeat[$FILEBEAT_VERSION]..."
apt-get install -y -qqq filebeat=$FILEBEAT_VERSION
update-rc.d filebeat defaults 95 10
service filebeat start 2>&1

# copy over config files, restart
mkdir -p /var/log/filebeat
cp -R /vagrant/filebeat/* /etc/filebeat/
service filebeat restart 2>&1
/bin/systemctl enable filebeat.service

# curl -XGET 'http://localhost:9200/filebeat-*/_search?pretty'