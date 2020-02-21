#!/bin/bash

set -ve

GOROOT=/usr/local/go
PATH=$GOROOT/bin:$PATH

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

LOGSTASH_VERIFIER=/usr/local/logstash-filter-verifier/logstash-filter-verifier

TESTS_PATH=${SCRIPTPATH}/logstash/
FILTERS_PATH=/etc/logstash/conf.d/10-filters.conf
LOGSTASH_BIN=/usr/share/logstash/bin/logstash


function conftest() {
  # Test logstash config V7.5
  echo "Testing logstash config"
  $LOGSTASH_BIN --path.settings /etc/logstash -t
}

function unittest() {
  echo "Running test cases"
  $LOGSTASH_VERIFIER ${TESTS_PATH} ${FILTERS_PATH} --logstash-path ${LOGSTASH_BIN}/logstash --sockets
}

if [ $# -eq 0 ]; then
  conftest
  unittest
else
  $1
fi