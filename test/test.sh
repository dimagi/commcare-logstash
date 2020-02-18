#!/bin/bash

set -ve

GOROOT=/usr/local/go
PATH=$GOROOT/bin:$PATH

LOGSTASH_VERIFIER=/usr/local/logstash-filter-verifier/logstash-filter-verifier

TESTS_PATH=${PWD}/test/logstash/
FILTERS_PATH=/etc/logstash/conf.d/10-filters.conf
LOGSTASH_BIN=/usr/share/logstash/bin/logstash

# Test logstash config V7.5
$LOGSTASH_BIN --path.settings /etc/logstash -t
# Test logstash filters output
$LOGSTASH_VERIFIER ${TESTS_PATH} ${FILTERS_PATH} --logstash-path ${LOGSTASH_BIN}/logstash --sockets

