#!/bin/bash

# Beats
# https://github.com/elastic/beats/releases

/vagrant/scripts/beats/install_filebeat.sh
/vagrant/scripts/beats/install_packetbeat.sh
/vagrant/scripts/beats/install_metricbeat.sh
/vagrant/scripts/beats/install_heartbeat.sh