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
    sysbench.load.sh --cluster ${CLUSTER} --bulkload
    sysbench.curves.sh --cluster ${CLUSTER} --repeats 3 --workload oltp_point_select
    sysbench.curves.sh --cluster ${CLUSTER} --repeats 3 --workload oltp_read_write
    stop.grafana.sh --cluster ${CLUSTER}

    start_grafana
    load.data.sh --cluster ${CLUSTER} --benchmark sysbench-tpcc --load
    performance.curve.sh --cluster ${CLUSTER} --benchmark sysbench-tpcc
    performance.curve.sh --cluster ${CLUSTER} --benchmark sysbench-tpcc
    performance.curve.sh --cluster ${CLUSTER} --benchmark sysbench-tpcc
    stop.grafana.sh --cluster ${CLUSTER}

    start_grafana
    load.data.sh --cluster ${CLUSTER} --benchmark tproc-c --load
    performance.curve.sh --cluster ${CLUSTER} --benchmark tproc-c
    performance.curve.sh --cluster ${CLUSTER} --benchmark tproc-c
    performance.curve.sh --cluster ${CLUSTER} --benchmark tproc-c
    stop.grafana.sh --cluster ${CLUSTER}

} | tee ${LOGDIRECTORY}/${TESTNAME}.log
