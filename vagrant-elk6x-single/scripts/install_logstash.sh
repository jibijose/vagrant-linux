#!/bin/bash

echo "Installing logstash"
apt-get install -y -qq logstash
service logstash start
echo "Installed logstash"