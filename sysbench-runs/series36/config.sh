#
# how cpu cores are distributed between mysqld and sysbench
#
CPU_MASK_MYSQLD="2-5,8-11,14-17,20-23"
CPU_MASK_SYSBENCH="0,1,6,7,12,13,18,19"

#
# MySQL/MariaDB top installdir
#
INST_DIR=/home/axel/mysql-builds

#
# datadir location
#
DATADIR=/mnt/fiox/sysbench/datadir

#
# socket location
#
SOCKET=/tmp/mysqld.sock.sysbench

#
# sysbench settings
#
SYSBENCH=sysbench-0.5
THREADS="1 2 4 8 16 32 64 128 256 512"
CREATEDB=1
TABLES=16
TOTAL_ROWS=400000000
RUNTIME_RO=602
RUNTIME_RW=1802
REPORT=5

#
# list of tests to run
#
RUNSPEC=`seq 4`

