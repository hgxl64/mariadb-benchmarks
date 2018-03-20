#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB Services AB

set -e
set -u

. config.sh

RUNTIME=${1:?"missing RUNTIME parameter!"}
NRUN=$(($RUNTIME/$REPORT))

QUERY="DO SLEEP($REPORT); SHOW GLOBAL STATUS LIKE 'innodb_buffer_pool_pages_%';"
USER="root"

while [[ $NRUN -ge 0 ]]
do
  mysql -A -n -S $SOCKET -u $USER -e "$QUERY"
  NRUN=$(($NRUN - 1))
done

