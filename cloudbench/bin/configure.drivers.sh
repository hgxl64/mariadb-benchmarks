#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB
#
# $Id§

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0
    Configures a remote driver system with latest software.
    Options:
        [ -h|--help ]
"

COMMAND_LINE="$@"

while [[ $# > 0 ]]; do
    key="$1"
    shift
    case ${key} in
        --cluster)          CLUSTER="$1"; shift;;
        --system)           CLUSTER="$1"; shift;;

        --cloud)            DRIVER_CONFIG_OPTIONS="${DRIVER_CONFIG_OPTIONS} --cloud";;
        --aws | --gcp)      DRIVER_CONFIG_OPTIONS="${DRIVER_CONFIG_OPTIONS} --cloud";;

        --force)            OPTION_FORCE=TRUE;;

        -h | --help)        echo -e "$USAGE"; exit 1;;
        *)                  echo "Invalid input switch: $key"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done

process_connection_info

# logging
TEST_NAME=configure.drivers
if [[ ! ${TESTID} ]]; then TESTID=$(date +%y%m%d.%H%M%S).${CLUSTER}; fi
if [[ ! ${LOGDIRECTORY} ]]; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${CLUSTER}/${TESTID}.${TEST_NAME}
else
    PARENTTEST=TRUE
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}

{

    echo
    echo "    ===== Begin $0 =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo
    STARTSECONDS=$SECONDS

    echo "
        $0 $*

            CLUSTER         = ${CLUSTER}
            DRIVER_NODES    = ${DRIVER_NODES[*]}
    "

    unset PIDS
    for DRIVER in ${DRIVER_NODES[*]}; do
        echo "        ===== Configure Driver ${DRIVER}  =====  [ $(date -u +'%Y-%m-%d %H:%M:%S') ]"
        COMMAND="configure.driver.sh --cluster ${CLUSTER} --driver ${DRIVER}"
        [[ ${DRIVER_CONFIG_OPTIONS} ]] && COMMAND="${COMMAND} ${DRIVER_CONFIG_OPTIONS}"
        [[ ${OPTION_FORCE} ]] && COMMAND="${COMMAND} --force"
        echo "            COMMAND = ${COMMAND}"
        ${COMMAND} >${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S).configure.driver.${DRIVER}.log 2>&1 &
        PIDS=( ${PIDS[*]} $! )
    done
    wait ${PIDS}

    echo
    echo "    ===== End $0 ( Elapsed Seconds = $(($SECONDS - $STARTSECONDS)) ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S).${TEST_NAME}.log
