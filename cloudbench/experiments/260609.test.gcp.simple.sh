#!/bin/bash

source ${CBENCH_HOME}/bin/cbench.sh

set -e
set -u

export CLUSTER='test'

# gcp defaults
source ${CBENCH_HOME}/config/gcp.conf

gcp.allocate.nodes.sh --cluster ${CLUSTER} \
 --server-nodes 1 --server-type n2-standard-2 \
 --driver-nodes 1 --driver-type n2-standard-1

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


