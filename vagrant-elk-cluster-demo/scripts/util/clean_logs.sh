#!/bin/bash

function deleteLogs() {
    name=$1

    rm -rf /var/log/$name/*
}

deleteLogs elasticsearch
deleteLogs kibana
deleteLogs logstash

deleteLogs filebeat
deleteLogs packetbeat
deleteLogs packbeat
deleteLogs metricbeat
deleteLogs heartbeat