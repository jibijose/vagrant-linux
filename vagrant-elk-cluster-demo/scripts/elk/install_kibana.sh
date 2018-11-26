#!/bin/bash

export KIBANA_VERSION=$ELASTIC_VERSION

# Install Kibana
# @see https://github.com/elastic/kibana/releases
# @see https://www.elastic.co/guide/en/kibana/current/release-notes.html
# @see https://www.elastic.co/guide/en/kibana/5.5/deb.html
echo "[INFO] Installing Kibana[$KIBANA_VERSION]..."
apt-get install -y -qqq kibana=$KIBANA_VERSION
update-rc.d kibana defaults 96 9
service kibana start

# copy over config, restart
cp -R /vagrant/kibana/* /etc/kibana/
service kibana restart 2>&1
/bin/systemctl enable kibana.service