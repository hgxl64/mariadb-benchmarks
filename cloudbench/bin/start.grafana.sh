#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB
#
# $Id$

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0
    set snapshot start time

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
TEST_NAME=start.grafana
if [[ ! ${TESTID} ]] ; then TESTID=$(date +%y%m%d.%H%M%S).${CLUSTER}; fi
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${CLUSTER}/${TESTID}.${TEST_NAME}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}

{
    start_grafana
    TMPFILE=/tmp/grafana_start.$$
    echo ${GRAFANA_START} > ${TMPFILE}

    echo "    ===== Begin $0 =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo
    echo "        CLUSTER             = ${CLUSTER}"
    echo
    echo "        GRAFANA_START       = ${GRAFANA_START}"
    echo "        TMPFILE             = ${TMPFILE}"
    echo
    echo "        TESTID              = ${TESTID}"
    echo "        LOGDIRECTORY        = ${LOGDIRECTORY}"
    echo


} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log

