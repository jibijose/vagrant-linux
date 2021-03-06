#!/bin/bash

#http://192.168.56.111:8091
echo "Waiting 10 seconds for cluster to start"
sleep 10

couchbase-cli cluster-init --cluster-username=Administrator --cluster-password=Password123 --cluster-port=8091 --cluster-ramsize=256 --cluster-index-ramsize=256 --services=data

couchbase-cli server-add -u Administrator -p Password123 -c 192.168.56.111:8091 --server-add=192.168.56.112:8091 --server-add-username=Administrator --server-add-password=Password123 --services=data
couchbase-cli server-add -u Administrator -p Password123 -c 192.168.56.111:8091 --server-add=192.168.56.113:8091 --server-add-username=Administrator --server-add-password=Password123 --services=index
couchbase-cli server-add -u Administrator -p Password123 -c 192.168.56.111:8091 --server-add=192.168.56.114:8091 --server-add-username=Administrator --server-add-password=Password123 --services=query

couchbase-cli bucket-create -c 127.0.0.1:8091 -u Administrator -p Password123 --bucket=test_bucket --bucket-type=couchbase --bucket-ramsize=100  --bucket-replica=1 --bucket-priority=high --bucket-eviction-policy=valueOnly

couchbase-cli rebalance -u Administrator -p Password123 -c 192.168.56.111:8091