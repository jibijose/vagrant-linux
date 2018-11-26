#!/bin/bash

service logstash start
service kibana start
service elasticsearch start
service filebeat start
service packetbeat start
service metricbeat start
service heartbeat start