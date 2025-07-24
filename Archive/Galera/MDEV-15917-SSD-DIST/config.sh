#
# housekeeping jobs
#

PRERUN=""
POSTRUN="./collect.pl || true"

#
# MySQL/MariaDB top installdir
#
INST_DIR=/home/galera/mariadb-install
DOWNLOADS=/home/galera/download

#
# datadir location
#
DATADIR=/home/galera/var/galera
#DATADIR=/mnt/bigdisk/datadir/galera

#
# socket location
#
SOCKET=/tmp/mysqld.sock.sysbench

#
# sysbench settings
#
SYSBENCH=sysbench
ENGINE=InnoDB
TABLES=16
TOTAL_ROWS=32000000
LUA=oltp_read_write_split.lua
LUA_ARGS_PREPARE="--auto-inc=off"
LUA_ARGS_RUN="--rand-type=uniform"
REPORT=2

#
# galera settings
#
NODES="g1 g2 g3"
CREATEDB=1
MYSQL_LOAD="--mysql-host=10.10.0.164 --mysql-user=sbtest --mysql-password=sbtest"

#
# MaxScale settings
#
MAXNODE="g4"

#
# workload settings
#
WORKLOADS="read_only@node1 read_only@node2 read_only@node3 read_only@ro1 read_only@ro2 read_only@ro3 90_10@rwsplit1 90_10@rwsplit2 read_write@rwsplit1 read_write@rwsplit2"
THREADS="1 2 4 8 16 32 64 128 256 512"

declare -A RUNTIME=([read_only]=120 [read_write]=300 [90_10]=300 [50_50]=300)
declare -A WORKLOAD=(

  [read_only]="--write-percentage=0" 
  [90_10]="--write-percentage=10"
  [read_write]="--write-percentage=25" 
  [50_50]="--write-percentage=50" 
)

declare -A CONNECTION=(
  #nodes direct
  [node1]="--mysql-host=10.10.0.164" 
  [node2]="--mysql-host=10.10.0.164,10.10.0.165" 
  [node3]="--mysql-host=10.10.0.164,10.10.0.165,10.10.0.166"
  #readonly via maxscale
  [ro1]="--mysql-host=10.10.0.167 --mysql-port=6603" 
  [ro2]="--mysql-host=10.10.0.167 --mysql-port=6604" 
  [ro3]="--mysql-host=10.10.0.167 --mysql-port=6605" 
  #read/write split
  [rwsplit1]="--mysql-host=10.10.0.167 --mysql-port=6610" #master takes only writes
  [rwsplit2]="--mysql-host=10.10.0.167 --mysql-port=6611" #master takes also reads
)

#
# list of tests to run
#
RUNSPEC=$(seq 10)

