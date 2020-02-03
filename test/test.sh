#!/bin/bash

GOROOT=~/go
PATH=$GOROOT/bin:$PATH

wget https://dl.google.com/go/go1.12.4.linux-amd64.tar.gz
tar -xf go1.12.4.linux-amd64.tar.gz

wget https://github.com/magnusbaeck/logstash-filter-verifier/releases/download/1.6.0/logstash-filter-verifier_1.6.0_linux_386.tar.gz
tar -xf logstash-filter-verifier_1.6.0_linux_386.tar.gz

TESTS_PATH=${PWD}/test/logstash/
FILTERS_PATH=/etc/logstash/conf.d/10-filters.conf
LOGSTASH_BIN=/usr/share/logstash/bin/logstash

./logstash-filter-verifier ${TESTS_PATH} ${FILTERS_PATH} --logstash-path ${LOGSTASH_BIN}/logstash --sockets

