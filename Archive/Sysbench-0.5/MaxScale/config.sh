#
# how cpu cores are distributed between mysqld and sysbench
#

CPU_MASK_SYSBENCH=all
PRERUN=""
POSTRUN="./collect.pl || true"

#
# MySQL/MariaDB top installdir
#
INST_DIR=/home/axel/mariadb-install

#
# malloc lib to use for mysqld (leave empty if unused)
#
MALLOC_LIB="/usr/lib/x86_64-linux-gnu/libjemalloc.so.1"

DDPREFIX=/mnt/ssd-raid0/maxscale

#
# sysbench settings
#
SYSBENCH=sysbench-mariadb
PS_MODE=disable
LUA=oltp.lua
POINTSEL=1000
CREATEDB=1
WARMUP=1
ENGINE=InnoDB
TABLES=10
TOTAL_ROWS=100000
THREADS="4 8 16 32 64 128 256 512 1024"
RUNTIME=121
REPORT=2
EXTRATIME=0

#default, overridden by workload
RW=0

#
# list of instances to run
#
INSTANCES=`seq 4`

