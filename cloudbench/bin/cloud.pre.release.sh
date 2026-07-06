#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB
#
# $Id$

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0
    maintenance jobs before releasing cloud nodes
    Options:
         [ --cluster  <<clustername>> ]
         [ -h|--help ]
    Notes:
        1.  the cluster name is required.
"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in
         # Connection Info
        --cluster)                      CLUSTER="$1"; shift;;
        --system)                       CLUSTER="$1"; shift;;
        -h|--help)                      echo -e "$USAGE"; exit 1;;
        *)  echo "Invalid input switch: $key"; echo -e "COMMAND_LINE = ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done

if [[ ! ${CLUSTER} ]] ; then echo "Required System/Cluster not specified"; echo -e "$0 ${COMMAND_LINE}"; exit 1; fi

#process_connection_info

TEST_NAME=cloud.pre.release
if [[ ! ${TESTID} ]] ; then TESTID=$(date +%y%m%d.%H%M%S).${CLUSTER}; fi
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${CLUSTER}/${TESTID}.${TEST_NAME}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}

time {

    echo "
    ===== Begin $0 =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]
    "

    echo "
        $0 $COMMAND_LINE

            CLUSTER         = ${CLUSTER}
    "

    echo
    echo "    ===== Deregister nodes from Prometheus =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo
    if [[ ${PROMETHEUS_EXT_IP} ]] ; then
        time {
            #collect all systems
            unset SYSTEMS
            for SYSTEM in $(get_property ${CLUSTER} mariadb.systems) $(get_property ${CLUSTER} maxscale.systems) \
                          $(get_property ${CLUSTER} master.systems) $(get_property ${CLUSTER} slave.systems) \
                          $(get_property ${CLUSTER} galera.systems) $(get_property ${CLUSTER} driver.systems) \
                          $(get_property ${CLUSTER} systems); do
                #strip role from system name
                SYSTEM=$(echo ${SYSTEM} | sed 's/^maxscale\.//')
                SYSTEM=$(echo ${SYSTEM} | sed 's/^mariadb\.//')
                #add to systems if not already there
                if [[ ! " ${SYSTEMS[@]} " =~ " ${SYSTEM} " ]]; then
                    SYSTEMS+=( ${SYSTEM} )
                fi
            done
            echo "        SYSTEMS    = ${SYSTEMS[*]}"
            echo "        PROMETHEUS = ${PROMETHEUS_EXT_IP}"

            ssh ${PROMETHEUS_USER}@${PROMETHEUS_EXT_IP} -oStrictHostKeyChecking=no -i${PROMETHEUS_PEM} '
            SYSTEMS=( '${SYSTEMS[*]}' )
            for SYSTEM in ${SYSTEMS[*]} ; do
                if [[ -f /etc/prometheus/targets/${SYSTEM}.json ]] ; then
                    sudo rm /etc/prometheus/targets/${SYSTEM}.json
                    sudo rm -f /etc/prometheus/targets/${SYSTEM}-*.json
                    echo "        deregistered ${SYSTEM}"
                else
                    echo "        /etc/prometheus/targets/${SYSTEM}.json not found"
                fi
            done'
            echo "    ===== all nodes deregistered ====="
        }
    else
        echo "    ===== PROMETHEUS_EXT_IP is not set, skipping ====="
    fi


    echo
    echo "    ===== End $0 =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
