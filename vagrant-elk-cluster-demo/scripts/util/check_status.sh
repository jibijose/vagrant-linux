#!/bin/bash

function checkStatus() {
    name=$1
    url=$2
    method=$3
    expectedcode=$4

    statuscode=`curl -o /dev/null -s -w "%{http_code}\n" -u elastic:changeme -X $method $url`
    if test $statuscode -ne $expectedcode; then
        echo "[ERROR] $name responded $statuscode. Expected code is $expectedcode."
    else
        echo "[INFO] $name status check is successful."
    fi
}

function checkProcessPids() {
    processName=$1

    PID=$(ps -aef | grep $processName | grep -v grep | awk '{print $2}')
    echo "Process $processName PIDs " $PID

    if [ X$PID != X ];
    then
        echo "$processName is still running with PID " `ps -aef | grep -v grep | grep $processName | awk '{ print $2 }'`
    fi
}

#checkStatus "Elasticsearch" "http://localhost:9200/_cat/health?pretty" GET 200
#checkStatus "Kibana" "http://localhost:5601/status" GET 200


#checkStatus "Filebeat" "http://localhost:9200/filebeat-*/_search?pretty" GET 200

#checkStatus "Filebeat" "http://localhost:9200/_cat/indices?v" GET 200

checkProcessPids elasticsearch
checkProcessPids kibana
checkProcessPids logstash

checkProcessPids filebeat
checkProcessPids packetbeat
checkProcessPids metricbeat
checkProcessPids heartbeat
