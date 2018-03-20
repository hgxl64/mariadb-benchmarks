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
LUA="aria_insert.lua"
LUA_ARGS_PREPARE="--aria-transactional=1 --aria-row-format=page --aria-indexed=0"
LUA_ARGS_RUN=""
TABLES=1
TOTAL_ROWS=100000000
THREADS="1"
RUNTIME=61
REPORT=2
EXTRATIME=0

