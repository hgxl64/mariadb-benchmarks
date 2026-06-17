#!/bin/bash

source ${CBENCH_HOME}/bin/cbench.sh
source ${CBENCH_HOME}/config/gcp.conf

#---- settings ----
export OPTION_SKIPCHECK=TRUE
export SYSBENCH_TABLESIZE=$((10*1000*1000)) #gives total 100M rows ~= 25GB
export ZONE_ID=us-central1-c
export CLUSTER=galera-mm3
#---- end settings ----


TEST_NAME="gcp.test.simple6"
[[ ${TESTID} ]] || TESTID=$(date +%y%m%d.%H%M%S).${TEST_NAME}
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${TESTID}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}

{
    gcp.allocate.nodes.sh --cluster ${CLUSTER} \
     --server-nodes 3 --server-type n2-standard-16 \
     --driver-nodes 2 --driver-type n2-standard-8 \
     --maxscale-nodes 1 --maxscale-type n2-standard-16

    SYSTEMS=( $(get_property ${CLUSTER} systems) )
    echo
    echo "        SYSTEMS = ${SYSTEMS[*]}"
    [[ ${SYSTEMS} ]] || { echo "ERROR Unable to allocate nodes."; exit 1; }

    configure.cluster.sh --cluster ${CLUSTER} --cluster-type galera_mastermaster \
     --master-system ${CLUSTER}-server-1 --master-system ${CLUSTER}-server-2 \
     --master-system ${CLUSTER}-server-3 --maxscale-system ${CLUSTER}-maxscale-1 \
     --driver-system ${CLUSTER}-driver-1 --driver-system ${CLUSTER}-driver-2

    build.cluster.sh --cluster ${CLUSTER} \
    --mariadb-source tarball --mariadb-tarball mariadb-enterprise-90f707057d4-x86_64.tar.gz \
    --galera-source tarball --galera-tarball galera-enterprise-ff030cfa348-x86_64.tar.gz \
    --maxscale-source tarball --maxscale-tarball maxscale-25.10.2.ubuntu.noble-x86_64.tar.gz

    echo "Version : $(get_database_version ${CLUSTER})"

    sysbench.load.sh --cluster ${CLUSTER} --noautoinc --load

    sysbench.curves.sh --cluster ${CLUSTER} --workload 9010_splittable --repeats 3
    sysbench.curves.sh --cluster ${CLUSTER} --workload 7525_splittable --repeats 3
    sysbench.curves.sh --cluster ${CLUSTER} --workload 5050_splittable --repeats 3

    sysbench.curves.sh --cluster ${CLUSTER}.maxscale --workload 9010_splittable --repeats 3
    sysbench.curves.sh --cluster ${CLUSTER}.maxscale --workload 7525_splittable --repeats 3
    sysbench.curves.sh --cluster ${CLUSTER}.maxscale --workload 5050_splittable --repeats 3

    check.cluster.sh --cluster ${CLUSTER}

    gcp.release.nodes.sh --cluster ${CLUSTER}

} | tee ${LOGDIRECTORY}/${TEST_NAME}.log

