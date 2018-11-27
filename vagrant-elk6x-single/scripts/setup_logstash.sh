#!/bin/bash

echo "Setting up logstash"
wget -q -O /tmp/apache-daily-access.log - https://logz.io/sample-data
cp /vagrant/scripts/apache-01.conf /etc/logstash/conf.d/apache-01.conf
service logstash restart
echo "Setting up logstash"