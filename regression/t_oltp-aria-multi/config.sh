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
LUA="lua/oltp_locked.lua"
LUA_ARGS_PREPARE="--mysql-table-engine=ARIA"
LUA_ARGS_RUN=""
ENGINE=ARIA
TABLES=32
TOTAL_ROWS=3200000
THREADS="1 8 16 32 64 128 256"
RUNTIME=61
REPORT=2
EXTRATIME=0

