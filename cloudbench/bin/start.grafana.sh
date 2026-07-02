#!/bin/bash

source ${CBENCH_HOME}/bin/cbench.sh

start_grafana
export GRAFANA_START

echo "set starting time of Grafana snapshot to ${GRAFANA_START}"

