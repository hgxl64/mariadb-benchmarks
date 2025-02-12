#!/bin/bash

export RT_LOG_HOME=${HOME}/regressiontest/log/TODO-5098
TAG="TODO-5098"

#10.6.20-16
BRANCH=10.6.20-16
COMMIT=102842eee86

#11.4.4-2
#BRANCH=11.4-enterprise
#COMMIT=00388266725


#one NUMA node
export CPU_MASK_MYSQLD="-m 1 -N 1"
export CPU_MASK_SYSBENCH="-m 0 -N 0"
export NCPU=20

#baseline
#run_enterprise_git.sh --tag "${TAG},baseline" --branch $BRANCH --commit $COMMIT --force

#PFS compiled in but turned off
EXTRAMYCNF="--performance-schema=OFF" \
run_enterprise_git.sh --tag "${TAG},PFS=off" --branch $BRANCH --commit $COMMIT --force

#PFS compiled in and turned on
EXTRAMYCNF="--performance-schema=ON" \
run_enterprise_git.sh --tag "${TAG},PFS=on" --branch $BRANCH --commit $COMMIT --force

#PFS compiled in and everything enabled
EXTRAMYCNF="--performance-schema=ON --performance-schema-instrument=stage/%=ON --performance-schema-consumer-events-stages-current=ON --performance-schema-consumer-events-stages-history=ON --performance-schema-consumer-events-stages-history-long=ON" \
run_enterprise_git.sh --tag "${TAG},PFS=all" --branch $BRANCH --commit $COMMIT --force

#PFS compiled in and mutex activity enabled
EXTRAMYCNF="--performance-schema=ON --performance-schema-consumer-events_waits_current=on --performance-schema-consumer-events_statements_current=off --performance-schema-consumer-statements_digest=off --performance-schema-instrument=%=off --performance-schema-instrument=wait/synch/mutex/%=on --performance-schema-instrument=wait/synch/rwlock/%=on" \
run_enterprise_git.sh --tag "${TAG},PFS=mutexes" --branch $BRANCH --commit $COMMIT --force



#full server
export CPU_MASK_MYSQLD="--all"
export CPU_MASK_SYSBENCH="--all"
export NCPU=40

#baseline
#run_enterprise_git.sh --tag "${TAG},baseline" --branch $BRANCH --commit $COMMIT --force

#PFS compiled in but turned off
EXTRAMYCNF="--performance-schema=OFF" \
run_enterprise_git.sh --tag "${TAG},PFS=off" --branch $BRANCH --commit $COMMIT --force

#PFS compiled in and turned on
EXTRAMYCNF="--performance-schema=ON" \
run_enterprise_git.sh --tag "${TAG},PFS=on" --branch $BRANCH --commit $COMMIT --force

#PFS compiled in and everything enabled
EXTRAMYCNF="--performance-schema=ON --performance-schema-instrument=stage/%=ON --performance-schema-consumer-events-stages-current=ON --performance-schema-consumer-events-stages-history=ON --performance-schema-consumer-events-stages-history-long=ON" \
run_enterprise_git.sh --tag "${TAG},PFS=all" --branch $BRANCH --commit $COMMIT --force

#PFS compiled in and mutex activity enabled
EXTRAMYCNF="--performance-schema=ON --performance-schema-consumer-events_waits_current=on --performance-schema-consumer-events_statements_current=off --performance-schema-consumer-statements_digest=off --performance-schema-instrument=%=off --performance-schema-instrument=wait/synch/mutex/%=on --performance-schema-instrument=wait/synch/rwlock/%=on" \
run_enterprise_git.sh --tag "${TAG},PFS=mutexes" --branch $BRANCH --commit $COMMIT --force


