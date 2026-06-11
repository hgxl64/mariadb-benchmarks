#!/bin/bash

source ${CBENCH_HOME}/bin/cbench.sh
source ${CBENCH_HOME}/config/gcp.conf

export CLUSTER='test'

TEST_NAME="gcp.test.simple4"
[[ ${TESTID} ]] || TESTID=$(date +%y%m%d.%H%M%S).${TEST_NAME}
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${TESTID}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}

{
    gcp.allocate.nodes.sh --cluster ${CLUSTER} \
     --server-nodes 3 --server-type n2-standard-4 \
     --driver-nodes 1 --driver-type n2-standard-2

    SYSTEMS=( $(get_property ${CLUSTER} systems) )
    echo
    echo "        SYSTEMS = ${SYSTEMS[*]}"
    [[ ${SYSTEMS} ]] || { echo "ERROR Unable to allocate nodes."; exit 1; }

    configure.cluster.sh --cluster ${CLUSTER} --cluster-type galera_mastermaster \
     --master-system ${CLUSTER}-server-1 --slave-system ${CLUSTER}-server-2 \
     --slave-system ${CLUSTER}-server-3 --driver-system ${CLUSTER}-driver-1

    echo "Properties File:"
    showproperties

    build.cluster.sh --cluster ${CLUSTER}

    echo "Version : $(get_database_version ${CLUSTER})"

    sysbench.load.sh --cluster ${CLUSTER} --skipcheck --load
    sysbench.curve.sh --cluster ${CLUSTER} --skipcheck --workload oltp_read_write --start_streams 4

    gcp.release.nodes.sh --cluster ${CLUSTER}

} | tee ${LOGDIRECTORY}/${TESTNAME}.log

