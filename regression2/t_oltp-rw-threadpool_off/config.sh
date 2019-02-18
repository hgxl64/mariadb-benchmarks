#
# how cpu cores are distributed between mysqld and sysbench
#

CPU_MASK_SYSBENCH=0-15
CPU_MASK_MYSQLD=16-31
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
TABLES=32
TOTAL_ROWS=1000000
THREADS="1 8 16 32 64 128 256 512 1024 2048 4096"
RUNTIME=100
REPORT=3
EXTRATIME=0

