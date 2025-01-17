#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB Services AB
#
# relies on the following environment variables
#
# $PROFILEWARMUP ... time to sleep before profile is taken (default: 30s)
# $PROFILETIME ..... time to collect the profile for (default: 60s)
# $MYSQLD .......... the executable name of MariaDB/MySQL server

set -e
set -u

PROFILE=${1:?"missing PROFILE parameter!"}

echo "sleeping ${PROFILEWARMUP:-30} seconds"
sleep ${PROFILEWARMUP:-30}

echo "sampling perf profile ${PROFILE} for ${PROFILETIME:-60} seconds"
perf record -F 400 -p $(pidof ${MYSQLD}) -o $PROFILE -g -- sleep ${PROFILETIME:-60}

