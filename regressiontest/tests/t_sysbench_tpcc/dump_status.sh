#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB Services AB

set -e
set -u

trap exit 0

NRUN=$(($RUNTIME/$REPORT))

QUERY="DO SLEEP($REPORT); SHOW GLOBAL STATUS;"
USER="root"

while [[ $RUNTIME -eq 0 || $NRUN -ge 0 ]]
do
  $MYSQL -A -n -S $SOCKET -u $USER -e "$QUERY"
  NRUN=$(($NRUN - 1))
done

