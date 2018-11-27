#!/bin/bash

echo "Installing metricbeat"
apt-get install -y -qq metricbeat
service metricbeat start
echo "Installed metricbeat"