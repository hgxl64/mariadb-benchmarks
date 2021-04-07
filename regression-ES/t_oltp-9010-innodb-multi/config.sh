#
# how cpu cores are distributed between mysqld and sysbench
#

CPU_MASK_SYSBENCH=8-31
CPU_MASK_MYSQLD=0-3
PRERUN=""
POSTRUN="./collect.pl"

CORES=4

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
LUA="lua/oltp.lua"
LUA_ARGS_PREPARE="--mysql-table-engine=InnoDB"
LUA_ARGS_RUN=""
ENGINE=InnoDB
TABLES=8
TOTAL_ROWS=1000000
THREADS="1 8 16 32 64 128 256"
RUNTIME=121
REPORT=3
EXTRATIME=19

