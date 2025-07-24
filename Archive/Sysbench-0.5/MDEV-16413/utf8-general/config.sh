#
# how cpu cores are distributed between mysqld and sysbench
#

CPU_MASK_SYSBENCH=all
CPU_MASK_MYSQLD=all
PRERUN=""
POSTRUN="./collect.pl"

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
DATADIR=/mnt/ssd-raid0/sysbench/datadir

#
# socket location
#
SOCKET=/tmp/mysqld.sock.sysbench


#
# sysbench settings
#
SYSBENCH=sysbench-mariadb
LUA="oltp.lua"
RANDSPEC="uniform"
CREATEDB=1
WARMUP=0
ENGINE=InnoDB
TABLES=1
TOTAL_ROWS=100000
THREADS="1 2 4 8 16 32 64 128 256"
RUNTIME_RO=51
RUNTIME_RW=0
REPORT=2
EXTRATIME=0

#
# list of tests to run
#
RUNSPEC=`seq 6`

