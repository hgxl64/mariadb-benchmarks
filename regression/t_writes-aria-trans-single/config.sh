#
# how cpu cores are distributed between mysqld and sysbench
#

CPU_MASK_SYSBENCH=all
CPU_MASK_MYSQLD=all
PRERUN=""
POSTRUN="./collect.pl"

CORES=64

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
DATADIR=/mnt/ssd-raid0/sysbench/writes

#
# socket location
#
SOCKET=/tmp/mysqld.sock.sysbench


#
# sysbench settings
#
SYSBENCH=sysbench-0.5
ENGINE=Aria
LUA="lua/oltp_aria.lua"
LUA_ARGS_PREPARE="--mysql-table-engine=$ENGINE --mysql-table-option=TRANSACTIONAL=1"
LUA_ARGS_RUN=" --oltp_simple_ranges=0 --oltp-distinct-ranges=0 --oltp-sum-ranges=0 --oltp-order-ranges=0 --oltp-point-selects=0 --oltp_non_index_updates=9 --oltp_index_updates=9"
TABLES=1
TOTAL_ROWS=100000
THREADS="1"
RUNTIME=61
REPORT=2
EXTRATIME=0

