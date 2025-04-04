#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB Services AB
#
# relies on the following environment variables
#
# $WAITTIME .... time to wait before the backup
# $BACKUPDIR ... where to store the backup
# $SOCKET .... MariaDB/MySQL socket

# configuration

USER="root"
DEFAULT_WAITTIME=180

# no servicable parts behind this line

echo "sleeping ${WAITTIME:-${DEFAULT_WAITTIME}} seconds ..."
sleep ${WAITTIME:-${DEFAULT_WAITTIME}}

echo "backing up database to ${BACKUPDIR} ..."
echo "----------" 
t1=$(date +%s)
mariadb-backup --backup --target-dir=${BACKUPDIR} --socket=${SOCKET} --user=${USER} 2>&1
t2=$(date +%s)
echo "----------"
echo "backup time [sec]: $(($t2-$t1))"

