#!/bin/bash

export TESTS="x_backup_tpcc"
export BACKUPDIR=${HOME}/var-hdd/backup
export DATADISK="sda sdb"
export WAITTIME=100
export TAG="MDEV-36159"
export RT_LOG_HOME=${HOME}/regressiontest/log/MDEV-36159

run_community_git.sh  --branch 10.11 --commit mariadb-10.11.8 --force
run_community_git.sh  --branch 10.11 --commit mariadb-10.11.9 --force
run_community_git.sh  --branch 10.11 --commit mariadb-10.11.10 --force

export BACKUPDIR=${HOME}/var/backup
export DATADISK="sda"

run_community_git.sh  --branch 10.11 --commit mariadb-10.11.8 --force
run_community_git.sh  --branch 10.11 --commit mariadb-10.11.9 --force
run_community_git.sh  --branch 10.11 --commit mariadb-10.11.10 --force

