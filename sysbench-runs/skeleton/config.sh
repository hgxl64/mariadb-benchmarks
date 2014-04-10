#
# how cpu cores are distributed between mysqld and sysbench
#

CPU_MASK_SYSBENCH=all
CPU_MASK_MYSQLD=all

#
# total number of mysqld cores, used in dump_pfs.sh
#
CORES=64

#
# MySQL/MariaDB top installdir
#
INST_DIR=$HOME/mysql-install

#
# malloc lib to use for mysqld (leave empty if unused)
#
MALLOC_LIB="/usr/local/lib/libtcmalloc_minimal.so"

#
# datadir location
#
DATADIR=/mnt/raid/benchmark/sysbench/datadir

#
# socket location
#
SOCKET=/tmp/mysqld.sock.sysbench

#
# sysbench settings
#
SYSBENCH=sysbench-0.5
CREATEDB=1
ENGINE=InnoDB
DATABASES=1
TABLES=64
TOTAL_ROWS=6400000
THREADS="1 2 4 8 16 32 64 128 256 512"
RUNTIME_RO=0
RUNTIME_RW=50
REPORT=2


#
# list of tests to run
#
RUNSPEC=`seq 10`

