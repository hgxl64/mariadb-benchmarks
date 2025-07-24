#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB Services AB

set -e
set -u
#set -x

. config.sh

#copy workdir to nodes
for n in $NODES $MAXNODE
do
	ssh $n "test -d $(pwd) | mkdir -p $(pwd)"
	rsync --links $(pwd)/* $n:$(pwd)
done

for i in ${1:-$RUNSPEC}
do
  ii=`printf "%02d" $i`

  if [ -d "res$ii" ]
  then
    echo "skipping run $i"
    continue
  fi

  if [ ! -f "my.cnf.$ii" ]
  then
    echo "missing my.cnf.$ii - skip"
    continue
  fi

  if [ ! -e "server.$ii" ]
  then
    echo "missing server.$ii - skip"
    continue
  fi
  read SERVER <server.$ii

  test -e config.${ii} && . config.${ii}
  test -n "${PRERUN:-''}" && eval ${PRERUN}

  echo "starting MySQL server ($SERVER) for run $i ..."
  args="--wsrep-new-cluster"
  for n in $NODES
  do
    ssh $n "cd $(pwd); ./start.mysqld $ii $args"
    args=""
  done	

  #load accounts etc.
  for n in $NODES
  do
    ssh $n "cd $(pwd); ${INST_DIR}/${SERVER}/bin/mysql -S ${SOCKET} -u root <init.sql"
    break
  done

  echo "starting MaxScale"
  ssh $MAXNODE "cd $(pwd); ./start.maxscale $i" &
  sleep 1

  echo "starting sysbench"
  ./run.sysbench $i
  sleep 10

  echo "stopping MaxScale"
  ssh $MAXNODE "cd $(pwd); ./stop.maxscale"

  echo "stopping cluster"
  for n in $NODES
  do
    ssh $n "${INST_DIR}/${SERVER}/bin/mysqladmin -S ${SOCKET} -u root shutdown" 
  done	

  echo "copying error logs"
  for n in $NODES
  do
    scp $n:${DATADIR}/$n.err res$ii 
  done

  test -n "${POSTRUN:-''}" && eval ${POSTRUN}

done
