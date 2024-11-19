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

QUERY="truncate events_waits_summary_global_by_event_name; do sleep($REPORT); select event_name, count_star, sum_timer_wait from events_waits_summary_global_by_event_name where count_star>0 order by SUM_TIMER_WAIT desc, count_star desc limit 10;"
USER="root"

# no servicable parts behind this line

NRUN=$(($RUNTIME/$REPORT + 1))
while [[ $RUNTIME -eq 0 || $NRUN -ge 0 ]]
do
  $MYSQL -A -n -v -v -v -S $SOCKET -u $USER -e "$QUERY" performance_schema
  NRUN=$(($NRUN - 1))
done

