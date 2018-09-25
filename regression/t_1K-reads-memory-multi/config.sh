#
# how cpu cores are distributed between mysqld and sysbench
#

CPU_MASK_SYSBENCH=all
CPU_MASK_MYSQLD=all
PRERUN=""
POSTRUN="./collect.pl"

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
DATADIR=/tmp/benchmark/million

#
# socket location
#
SOCKET=/tmp/mysqld.sock.sysbench


#
# sysbench settings
#
ENGINE=MEMORY
SYSBENCH=sysbench-0.5
LUA="lua/oltp_no_trx.lua"
LUA_ARGS_PREPARE="--mysql-table-engine=$ENGINE"
LUA_ARGS_RUN="--oltp-read-only=on --oltp_point_selects=1000 --oltp_simple_ranges=0 --oltp_sum_ranges=0 --oltp_order_ranges=0 --oltp_distinct_ranges=0"
TABLES=20
TOTAL_ROWS=1000000
THREADS="1 8 16 32 64 128 256"
RUNTIME=100
REPORT=3
EXTRATIME=0

