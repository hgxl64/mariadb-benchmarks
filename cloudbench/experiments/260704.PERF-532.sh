#!/bin/bash

source ${CBENCH_HOME}/bin/cbench.sh
source ${CBENCH_HOME}/config/gcp.conf

export CLUSTER='PERF-532'

TEST_NAME="PERF-532"
[[ ${TESTID} ]] || TESTID=$(date +%y%m%d.%H%M%S).${TEST_NAME}
export LOGDIRECTORY=${CBENCH_LOG_HOME}/${TESTID}
mkdir -p ${LOGDIRECTORY}

{
    gcp.allocate.nodes.sh --cluster ${CLUSTER} \
     --server-nodes 1 --server-type n2-highcpu-16  \
     --driver-nodes 1 --driver-type n2-highcpu-8

    configure.cluster.sh --cluster ${CLUSTER} --cluster-type mariadb \
     --mariadb-system ${CLUSTER}-server-1 --driver-system ${CLUSTER}-driver-1

    build.cluster.sh --cluster ${CLUSTER}

    export OPTION_SKIPCHECK=TRUE

    start_grafana
    load.data.sh --cluster ${CLUSTER} --benchmark sysbench --bulkload
    export DURATION=120 #point select needs only 120s runtime
    performance.curves.sh --cluster ${CLUSTER} --repeats 3 -- --benchmark sysbench --workload oltp_point_select
    unset DURATION
    performance.curves.sh --cluster ${CLUSTER} --repeats 3 -- --benchmark sysbench --workload oltp_read_write
    stop.grafana.sh --cluster ${CLUSTER}
    load.data.sh --cluster ${CLUSTER} --benchmark sysbench --clean

    start_grafana
    load.data.sh --cluster ${CLUSTER} --benchmark sysbench-tpcc --load
    performance.curves.sh --cluster ${CLUSTER} --repeats 3 -- --benchmark sysbench-tpcc
    stop.grafana.sh --cluster ${CLUSTER}
    load.data.sh --cluster ${CLUSTER} --benchmark sysbench-tpcc --clean

    start_grafana
    load.data.sh --cluster ${CLUSTER} --benchmark tproc-c --load
    performance.curves.sh --cluster ${CLUSTER} --repeats 3 -- --benchmark tproc-c
    stop.grafana.sh --cluster ${CLUSTER}

} | tee ${LOGDIRECTORY}/${TESTNAME}.log
