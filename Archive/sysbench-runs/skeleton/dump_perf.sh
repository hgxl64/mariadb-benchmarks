#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB Services AB

set -e
set -u

. config.sh

PROFILE=${1:?"missing PROFILE parameter!"}

if [ $PROFILETIME == 0 ]
then
	exit 0
fi

PID=$(cat /tmp/mysqld.pid.sysbench)

sleep $PROFILEWARMUP

#sudo perf record -F 400 -p $(pidof mariadbd) -o $PROFILE -g -- sleep $PROFILETIME
sudo perf record -F 400 -p $PID -o $PROFILE -g -- sleep $PROFILETIME
sudo chown $USER $PROFILE

