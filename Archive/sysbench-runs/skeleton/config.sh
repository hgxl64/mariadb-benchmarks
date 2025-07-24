#
# how cpu cores are distributed between mysqld and sysbench
#

CPU_MASK_SYSBENCH=all
CPU_MASK_MYSQLD=all

#
# total number of mysqld cores, used in dump_pfs.sh
#
CORES=8

#
# MySQL/MariaDB top installdir
#
INST_DIR=/usr/local/mysql

#
# malloc lib to use for mysqld (leave empty if unused)
#
MALLOC_LIB=""

#
# datadir location
#
DATADIR=/mnt/local/space/sysbench/datadir

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
TABLES=8
TOTAL_ROWS=6400000
THREADS="1 2 4 8 16 32 64 128 256"
RUNTIME_RO=61
RUNTIME_RW=301
REPORT=5


#
# list of tests to run
#
RUNSPEC=`seq 10`

