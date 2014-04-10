#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB Services AB

set -e
set -u

. config.sh

QUERY="truncate events_waits_summary_global_by_event_name; select sleep(100/$CORES); select event_name, count_star, sum_timer_wait from events_waits_summary_global_by_event_name where count_star>0 order by SUM_TIMER_WAIT desc, count_star desc limit 10;"
USER="root"
NRUN=$(($RUNTIME_RO*$CORES/100))

while [[ $NRUN -ge 0 ]]
do
  mysql -A -n -v -v -v -S $SOCKET -u $USER -e "$QUERY" performance_schema
  NRUN=$(($NRUN - 1))
done

