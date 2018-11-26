#!/bin/bash

export ELASTICSEARCH_VERSION=$ELASTIC_VERSION

# Install Elasticsearch
# @see https://github.com/elastic/elasticsearch/releases
# @see https://www.elastic.co/downloads/elasticsearch
# @see https://www.elastic.co/guide/en/elasticsearch/reference/current/es-release-notes.html
# @see https://www.elastic.co/guide/en/elasticsearch/reference/5.5/es-release-notes.html
# @see https://www.elastic.co/guide/en/elasticsearch/reference/5.5/deb.html
echo "[INFO] Installing Elasticsearch[$ELASTICSEARCH_VERSION]..."
apt-get install -y -qqq elasticsearch=$ELASTICSEARCH_VERSION
update-rc.d elasticsearch defaults 95 10
service elasticsearch start

# copy over config, restart, enable auto-start
cp -R /vagrant/elasticsearch/* /etc/elasticsearch/
service elasticsearch restart
/bin/systemctl enable elasticsearch.service