#!/bin/bash

source ${CBENCH_HOME}/bin/cbench.sh
source ${CBENCH_HOME}/config/gcp.conf

export CLUSTER='test'

TEST_NAME="gcp.test.simple2"
[[ ${TESTID} ]] || TESTID=$(date +%y%m%d.%H%M%S).${TEST_NAME}
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${TESTID}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}

{
    gcp.allocate.nodes.sh --cluster ${CLUSTER} \
     --server-nodes 1 --server-type n2-standard-8 \
     --driver-nodes 2 --driver-type n2-standard-2 \
     --maxscale-nodes 1 --maxscale-type n2-standard-2

    SYSTEMS=( $(get_property ${CLUSTER} systems) )
    echo
    echo "        SYSTEMS = ${SYSTEMS[*]}"
    [[ ${SYSTEMS} ]] || { echo "ERROR Unable to allocate nodes."; exit 1; }

    configure.cluster.sh --cluster ${CLUSTER} --cluster-type mariadb \
     --mariadb-system ${CLUSTER}-server-1 --maxscale-system ${CLUSTER}-maxscale-1 \
     --driver-system ${CLUSTER}-driver-1 --driver-system ${CLUSTER}-driver-2

    echo "Properties File:"
    showproperties

    build.cluster.sh --cluster ${CLUSTER}
    check.cluster.sh --cluster ${CLUSTER}

    echo "Version (direct) :          $(get_database_version ${CLUSTER})"
    echo "Version (through MaxScale): $(get_database_version ${CLUSTER}.maxscale)"

    sysbench.load.sh --cluster ${CLUSTER} --skipcheck --load
    sysbench.curve.sh --cluster ${CLUSTER} --skipcheck --workload oltp_read_write --start_streams 4
    sysbench.curve.sh --cluster ${CLUSTER}.maxscale --skipcheck --workload oltp_read_write --start_streams 4

    gcp.release.nodes.sh --cluster ${CLUSTER}

} | tee ${LOGDIRECTORY}/${TESTNAME}.log

