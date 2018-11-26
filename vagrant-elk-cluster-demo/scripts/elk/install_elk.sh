#!/bin/bash

# install the Elastic PGP Key and repo
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
echo 'deb https://artifacts.elastic.co/packages/5.x/apt stable main' | \
	tee -a /etc/apt/sources.list.d/elastic-5.x.list
apt-get update -qq


/vagrant/scripts/elk/install_elasticsearch.sh
/vagrant/scripts/elk/install_logstash.sh
/vagrant/scripts/elk/install_kibana.sh