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

sleep ${PROFILEWARMUP:-30}

perf record -F 400 -p $(pidof ${MYSQLD}) -o $PROFILE -g -- sleep ${PROFILETIME:-60}

