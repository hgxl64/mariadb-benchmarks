#
# how cpu cores are distributed between mysqld and sysbench
#

CPU_MASK_SYSBENCH=all
CPU_MASK_MYSQLD=all
PRERUN=""
POSTRUN="./collect.pl || true"

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
DATADIR=/mnt/ssd-raid/sysbench/writes

#
# socket location
#
SOCKET=/tmp/mysqld.sock.sysbench


#
# sysbench settings
#
SYSBENCH=sysbench-trunk
ENGINE=InnoDB
TABLES=16
TOTAL_ROWS=32000000
LUA=oltp_read_write.lua
LUA_ARGS_PREPARE=""
LUA_ARGS_RUN="--rand-type=uniform"
CREATEDB=1
WARMUP=0
WORKLOADS="9010 read_write write_only"
THREADS="1 2 4 8 16 32 64 128 256"
RUNTIME=180
REPORT=2
EXTRATIME=10

#
# list of tests to run
#
RUNSPEC=$(seq 10)

