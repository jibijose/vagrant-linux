#!/bin/bash

echo "Installing kibana"
apt-get install -y -qq kibana
sed -i 's/#server.host: "localhost"/server.host: 0.0.0.0/' /etc/kibana/kibana.yml
sed -i 's/#server.port: 5601/server.port: 5601/' /etc/kibana/kibana.yml
service kibana start
echo "Installed kibana"