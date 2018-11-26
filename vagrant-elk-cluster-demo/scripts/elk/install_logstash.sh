#!/bin/bash

export LOGSTASH_VERSION=$ELASTIC_VERSION

# install Logstash
# @see https://github.com/elastic/logstash/releases
# @see https://www.elastic.co/guide/en/logstash/current/releasenotes.html
# @see https://www.elastic.co/guide/en/logstash/5.5/installing-logstash.html
echo "[INFO] Installing Logstash[$LOGSTASH_VERSION]..."
apt-get install -y -qqq logstash=1:$LOGSTASH_VERSION-1
service logstash start

# copy over config files, restart
cp -R /vagrant/logstash/* /etc/logstash/conf.d/
service logstash restart 2>&1
/bin/systemctl enable logstash.service