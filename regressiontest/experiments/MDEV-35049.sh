#!/bin/bash

export TESTS="t_oltp_9010_innodb t_oltp_full_innodb t_oltp_insert_innodb t_oltp_insert_innodb_batched t_oltp_pointselect_innodb t_oltp_writes_innodb t_oltp_writes_innodb_binlog t_sysbench_tpcc"
TAG="MDEV-35049"

export RT_LOG_HOME=${HOME}/regressiontest/log/MDEV-35049_2NUMA

#baseline 10.11
EXTRAMYCNF="--innodb_adaptive_hash_index=OFF" run_community_git.sh --tag ${TAG} --branch 10.11 --commit a54d151fc16 --force
EXTRAMYCNF="--innodb_adaptive_hash_index=ON"  run_community_git.sh --tag ${TAG} --branch 10.11 --commit a54d151fc16 --force
#final
EXTRAMYCNF="--innodb_adaptive_hash_index=OFF" run_community_git.sh --tag ${TAG} --branch 10.11 --commit 5e070c4efea --force
EXTRAMYCNF="--innodb_adaptive_hash_index=ON"  run_community_git.sh --tag ${TAG} --branch 10.11 --commit 5e070c4efea --force
#wrong merge
EXTRAMYCNF="--innodb_adaptive_hash_index=OFF" run_community_git.sh --tag ${TAG} --branch 10.11 --commit af68d76234a --force
EXTRAMYCNF="--innodb_adaptive_hash_index=ON"  run_community_git.sh --tag ${TAG} --branch 10.11 --commit af68d76234a --force

#baseline 10.6
EXTRAMYCNF="--innodb_adaptive_hash_index=OFF" run_community_git.sh --tag ${TAG} --branch 10.6 --commit c982a143fcc --force
EXTRAMYCNF="--innodb_adaptive_hash_index=ON"  run_community_git.sh --tag ${TAG} --branch 10.6 --commit c982a143fcc --force
#final
EXTRAMYCNF="--innodb_adaptive_hash_index=OFF" run_community_git.sh --tag ${TAG} --branch 10.6 --commit d287b4dae13 --force
EXTRAMYCNF="--innodb_adaptive_hash_index=ON"  run_community_git.sh --tag ${TAG} --branch 10.6 --commit d287b4dae13 --force

export RT_LOG_HOME=${HOME}/regressiontest/log/MDEV-35049_1NUMA
export CPU_MASK_MYSQLD="-m 1 -N 1"
export CPU_MASK_SYSBENCH="-m 0 -N 0"
export NCPU=20

#baseline 10.11
EXTRAMYCNF="--innodb_adaptive_hash_index=OFF" run_community_git.sh --tag ${TAG} --branch 10.11 --commit a54d151fc16 --force
EXTRAMYCNF="--innodb_adaptive_hash_index=ON"  run_community_git.sh --tag ${TAG} --branch 10.11 --commit a54d151fc16 --force
#final
EXTRAMYCNF="--innodb_adaptive_hash_index=OFF" run_community_git.sh --tag ${TAG} --branch 10.11 --commit 5e070c4efea --force
EXTRAMYCNF="--innodb_adaptive_hash_index=ON"  run_community_git.sh --tag ${TAG} --branch 10.11 --commit 5e070c4efea --force
#wrong merge
EXTRAMYCNF="--innodb_adaptive_hash_index=OFF" run_community_git.sh --tag ${TAG} --branch 10.11 --commit af68d76234a --force
EXTRAMYCNF="--innodb_adaptive_hash_index=ON"  run_community_git.sh --tag ${TAG} --branch 10.11 --commit af68d76234a --force

#baseline 10.6
EXTRAMYCNF="--innodb_adaptive_hash_index=OFF" run_community_git.sh --tag ${TAG} --branch 10.6 --commit c982a143fcc --force
EXTRAMYCNF="--innodb_adaptive_hash_index=ON"  run_community_git.sh --tag ${TAG} --branch 10.6 --commit c982a143fcc --force
#final
EXTRAMYCNF="--innodb_adaptive_hash_index=OFF" run_community_git.sh --tag ${TAG} --branch 10.6 --commit d287b4dae13 --force
EXTRAMYCNF="--innodb_adaptive_hash_index=ON"  run_community_git.sh --tag ${TAG} --branch 10.6 --commit d287b4dae13 --force

