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
LUA="lua/oltp_memory.lua"
LUA_ARGS_PREPARE="--mysql-table-engine=$ENGINE"
LUA_ARGS_RUN="--oltp_simple_ranges=0 --oltp-distinct-ranges=0 --oltp-sum-ranges=0 --oltp-order-ranges=0 --oltp-point-selects=0 --oltp_non_index_updates=10 --oltp_index_updates=10"
TABLES=1
TOTAL_ROWS=1000000
THREADS="1 8 16 32 64 128 256"
RUNTIME=51
REPORT=2
EXTRATIME=0

