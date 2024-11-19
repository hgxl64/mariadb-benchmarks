#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB Services AB
#
# relies on the following environment variables
#
# $RUNTIME ... execution time of the benchmark in seconds, 0 = endless
# $REPORT .... interval between status reports in seconds
# $SOCKET .... MariaDB/MySQL socket
# $MYSQL ..... the executable name of MariaDB/MySQL command line client

# configuration

QUERY="DO SLEEP($REPORT); SHOW GLOBAL STATUS;"
USER="root"

# no servicable parts behind this line

NRUN=$(($RUNTIME/$REPORT))
while [[ $RUNTIME -eq 0 || $NRUN -ge 0 ]]
do
  $MYSQL -A -n -S $SOCKET -u $USER -e "$QUERY"
  NRUN=$(($NRUN - 1))
done

