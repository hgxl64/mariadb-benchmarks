#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB Services AB

set -e
set -u

PROFILE=${1:?"missing PROFILE parameter!"}

sleep ${PROFILEWARMUP:-30}

perf record -F 400 -p $(pidof mariadbd) -o $PROFILE -g -- sleep ${PROFILETIME:-60}

