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
SYSBENCH=sysbench-0.5
LUA="lua/oltp.lua"
LUA_ARGS_PREPARE="--mysql-table-engine=InnoDB"
LUA_ARGS_RUN="--oltp-read-only=on --oltp-range-size=1000 --oltp-dist-type=uniform"
ENGINE=InnoDB
TABLES=1
TOTAL_ROWS=800000
THREADS="1 16 32 64"
RUNTIME=31
REPORT=2
EXTRATIME=0

