#!/bin/bash

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0
    Snapshot preconfigured Grafana dashboards

    Parameters:
        --cluster
        [ -h|--help ]

    Notes:
"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in
        --cluster)              CLUSTER="$1"; shift;;
        -h|--help) echo -e "$USAGE"; exit 1 ;;
        *) echo "Invalid input switch: $key"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1 ;;
    esac
done

[[ ${CLUSTER} ]] || error "no CLUSTER given, aborting"

# logging
TEST_NAME=stop.grafana
if [[ ! ${TESTID} ]] ; then TESTID=$(date +%y%m%d.%H%M%S).${CLUSTER}; fi
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${CLUSTER}/${TESTID}.${TEST_NAME}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}

{
    [[ ${GRAFANA_STOP} ]] || GRAFANA_STOP=$(date --utc --iso-8601=seconds)

    echo "    ===== Begin $0 =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo
    echo "        CLUSTER             = ${CLUSTER}"
    echo
    echo "        START TIME          = ${GRAFANA_START}"
    echo "        STOP TIME           = ${GRAFANA_STOP}"
    echo
    echo "        TESTID              = ${TESTID}"
    echo "        LOGDIRECTORY        = ${LOGDIRECTORY}"
    echo

    stop_grafana

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log

unset GRAFANA_START
unset GRAFANA_STOP

