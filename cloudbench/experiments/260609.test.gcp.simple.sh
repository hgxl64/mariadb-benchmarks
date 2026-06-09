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
 --server-nodes 1 --server-type n1-standard-2 \
 --driver-nodes 1 --driver-type n1-standard-1

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

sysbench.load.sh --cluster ${CLUSTER} --load

sysbench.run.sh --cluster ${CLUSTER} --workload 9010


