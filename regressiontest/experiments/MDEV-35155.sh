#!/bin/bash

export TESTS="x_oltp_writes_innodb"

#run_community_git.sh  --branch 10.6 --commit mariadb-10.6.20 --force

#export DUMP_PFS=1
#run_community_git.sh  --branch 10.6 --commit mariadb-10.6.20 --force

export DUMP_PERF=1
export PROFILEWARMUP=70
export PROFILETIME=60
run_community_git.sh  --branch 10.6 --commit mariadb-10.6.20 --force

