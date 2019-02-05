#
# how cpu cores are distributed between mysqld and sysbench
#

CPU_MASK_SYSBENCH=all
CPU_MASK_MYSQLD=all
PRERUN=""
POSTRUN=""

CORES=32

IS_MYSQL=0

#
# MySQL/MariaDB top installdir
#
INST_DIR=/home/axel/mariadb-install

#
# malloc lib to use for mysqld (leave empty if unused)
#
MALLOC_LIB=""

#
# datadir location
#
DATADIR=/mnt/ssd-raid0/sysbench/MDEV-18367

#
# socket location
#
SOCKET=/tmp/mysqld.sock.sysbench


#
# benchmark options
#
RUNSPEC=`seq 10`
CREATEDB=0
WARMUP=3
BENCHMARK=10
