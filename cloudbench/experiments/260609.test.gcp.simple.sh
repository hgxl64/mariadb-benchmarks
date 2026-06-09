#!/bin/bash

source ${CBENCH_HOME}/bin/cbench.sh
source ${CBENCH_HOME}/config/gcp.conf

export CLUSTER='test'

TEST_NAME="gcp.test.simple"
[[ ${TESTID} ]] || TESTID=$(date +%y%m%d.%H%M%S).${TEST_NAME}
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${CLUSTER}/${TESTID}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}

gcp.allocate.nodes.sh --cluster ${CLUSTER} \
 --server-nodes 1 --server-type n2-standard-4 \
 --driver-nodes 1 --driver-type n2-standard-2

SYSTEMS=( $(get_property ${CLUSTER} systems) )
echo
echo "        SYSTEMS = ${SYSTEMS[*]}"
[[ ${SYSTEMS} ]] || { echo "ERROR Unable to allocate nodes."; exit 1; }

configure.cluster.sh --cluster ${CLUSTER} --cluster-type mariadb \
 --mariadb-system ${SYSTEMS[0]} --driver-system ${SYSTEMS[1]}

echo "Properties File:"
showproperties

build.cluster.sh --cluster ${CLUSTER}

echo "Version : $(get_database_version ${CLUSTER})"

echo "sysbench"
sysbench.load.sh --cluster ${CLUSTER} --skipcheck --load
sysbench.curve.sh --cluster ${CLUSTER} --skipcheck --workload oltp_read_write --start_streams 1

echo "HammerDB"
load.data.sh --cluster ${CLUSTER} --benchmark tproc-c --skipcheck --dbscale 16 --load
hammerdb.run.sh --cluster ${CLUSTER} --skipcheck --dbscale 32 --streams 4
hammerdb.run.sh --cluster ${CLUSTER} --skipcheck --dbscale 32 --streams 8
hammerdb.run.sh --cluster ${CLUSTER} --skipcheck --dbscale 32 --streams 16

gcp.release.nodes.sh --cluster ${CLUSTER}
