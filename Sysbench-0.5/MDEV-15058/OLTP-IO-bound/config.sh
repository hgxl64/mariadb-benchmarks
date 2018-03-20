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
DATADIR=/run/shm/datadir

#
# socket location
#
SOCKET=/tmp/mysqld.sock.sysbench


#
# sysbench settings
#
SYSBENCH=sysbench-0.5
LUA="oltp.lua"
RANDSPEC="uniform"
CREATEDB=1
WARMUP=0
ENGINE=InnoDB
TABLES=32
TOTAL_ROWS=40000000
THREADS="1 2 4 8 16 32 64 128 256"
RUNTIME_RO=0
RUNTIME_RW=121
REPORT=2
EXTRATIME=20

#select write percentages to be tested
RW_CONFIG="50 80 100"
RW_ARG=(
	[10]='--oltp-point-selects=28 --oltp-simple-ranges=2 --oltp-distinct-ranges=2 --oltp-sum-ranges=2 --oltp-order-ranges=2 --oltp-non-index-updates=1  --oltp-index-updates=1'
	[20]='--oltp-point-selects=12 --oltp-simple-ranges=1 --oltp-distinct-ranges=1 --oltp-sum-ranges=1 --oltp-order-ranges=1 --oltp-non-index-updates=1  --oltp-index-updates=1'
	[22]='--oltp-point-selects=10 --oltp-simple-ranges=1 --oltp-distinct-ranges=1 --oltp-sum-ranges=1 --oltp-order-ranges=1 --oltp-non-index-updates=1  --oltp-index-updates=1'
	[50]='--oltp-point-selects=10 --oltp-simple-ranges=1 --oltp-distinct-ranges=1 --oltp-sum-ranges=1 --oltp-order-ranges=1 --oltp-non-index-updates=6  --oltp-index-updates=6'
	[80]='--oltp-point-selects=10 --oltp-simple-ranges=1 --oltp-distinct-ranges=1 --oltp-sum-ranges=1 --oltp-order-ranges=1 --oltp-non-index-updates=27 --oltp-index-updates=27'
	[100]='--oltp-point-selects=0 --oltp-simple-ranges=0 --oltp-distinct-ranges=0 --oltp-sum-ranges=0 --oltp-order-ranges=0 --oltp-non-index-updates=8  --oltp-index-updates=8'
        )

#
# list of tests to run
#
RUNSPEC=`seq 18`

