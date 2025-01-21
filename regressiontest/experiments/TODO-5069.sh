#!/bin/bash

export TESTS="t_oltp_insert_innodb t_oltp_insert_innodb_batched t_oltp_writes_innodb t_oltp_writes_innodb_binlog t_sysbench_tpcc_big"
export CPU_MASK_MYSQLD="-m 1 -N 1"
export CPU_MASK_SYSBENCH="-m 0 -N 0"
export NCPU=20
TAG="TODO-5069,1NUMA"

for r in 1 2 3
do 
	#ES 10.6.20-16
	run_enterprise_jenkins.sh --tag ${TAG} --branch 10.6.20-16 --commit 102842eee8608aebfc871f549cc3ac5659f37ee8 --force 
	#CS 10.11.10
	run_community_git.sh  --tag ${TAG} --branch CS10.11.10 --commit mariadb-10.11.10 --force
	#CS 11.2.6
	run_community_git.sh  --tag ${TAG} --branch CS11.2.6   --commit mariadb-11.2.6   --force
	#CS 11.4.4
	run_community_git.sh  --tag ${TAG} --branch CS11.4.4   --commit mariadb-11.4.4   --force
	#ES 11.4.3-1
	run_enterprise_jenkins.sh --tag ${TAG} --branch 11.4.3-1 --commit 6cb50b55e6c8df05e33da2711d17235eff2e826b --force
	#ES 11.4 last commit
	run_enterprise_jenkins.sh --tag ${TAG} --branch 11.4-enterprise --commit 80a49e1a61b6d00513b151aebed56bf837879531 --force
done


