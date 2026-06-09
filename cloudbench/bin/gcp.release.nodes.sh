#!/bin/bash

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="$0

    Usage:
        Release the nodes associated with an GCP cluster.

    Optional Arguments:
        --cluster           Cluster Name
        -h | --help         Show usage message and exit
"


COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in
        --cluster)          CLUSTER="$1"; shift;;
        -h|--help)          echo -e "$USAGE"; exit 1;;
        *) echo "Invalid input switch: $key"; echo -e "COMMAND_LINE = ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done

[[ ${CLUSTER} ]] || { echo "Required CLUSTER not specified: CLUSTER = ${CLUSTER} "; exit 1; }

# defaults
source ${CBENCH_HOME}/config/gcp.conf

# logging
TEST_NAME=gcp.release.nodes
if [[ ! ${TESTID} ]] ; then TESTID=$(date +%y%m%d.%H%M%S).${CLUSTER}; fi
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${CLUSTER}/${TESTID}.${TEST_NAME}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}

{

    echo
    echo "===== Begin $0 =====  [ $(date -u  '+%Y-%m-%d %H:%M:%S.%3N') ]"
    STARTSECONDS=${SECONDS}

    echo "$0 ${COMMAND_LINE}

            CLUSTER                     = ${CLUSTER}

            TESTID                      = ${TESTID}
            LOGDIRECTORY                = ${LOGDIRECTORY}
    "

    ID_PREFIX=$(echo ${CLUSTER} | sed 's/\./-/g' | sed 's/_/-/g')

    gcloud config set project ${GCP_PROJECT}

    echo "    ===== Release Nodes =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo
    NODES=( $(gcloud compute instances list | grep ${ID_PREFIX} | awk '{print $1}') )
    echo "        Nodes to be Released: ( ${NODES[*]} )"
    for NODE in ${NODES[*]} ; do
        echo
        # need the zone of the instance
        ZONE=$(gcloud compute instances list | grep ${NODE} | awk '{print $2}')
        COMMAND="gcloud compute instances delete ${NODE} --zone=${ZONE} --quiet"
        echo "        COMMAND = ${COMMAND}"
        ${COMMAND}
    done

    echo "    ===== Release Disks =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo
    DISKS=( $(gcloud compute disks list | grep ${ID_PREFIX} | awk '{print $1}') )
    echo "        Disks to be Released: ( ${DISKS[*]} }"
    for DISK in ${DISKS[*]} ; do
        echo
        # need the zone of the disk
        ZONE=$(gcloud compute disks list | grep ${DISK} | awk '{print $2}')
        COMMAND="gcloud compute disks delete ${DISK} --zone=${ZONE}  --quiet"
        echo "        COMMAND = ${COMMAND}"
        ${COMMAND}
    done

    echo
    echo "        Nodes still active:"
    gcloud compute instances list | grep ${ID_PREFIX}
    echo "        Disks still active:"
    gcloud compute disks list | grep ${ID_PREFIX}

    echo
    echo "    ===== End $0  ( Elapsed Seconds = $(( ${SECONDS} - ${STARTSECONDS} )) ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/${TESTID}.${TEST_NAME}.log

