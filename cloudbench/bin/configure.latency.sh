#!/bin/bash

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0

    Configure network latency between the server nodes of a cluster.
    The latencies are stored in cluster.latency.properties

    Cluster Types:  mariadb_replication, galera_masterslave, galera_mastermaster

    Parameters:
        ...

        [ -h|--help ]

    Notes:
"

COMMAND_LINE="$@"

unset SLOW_SYSTEMS

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in

        --cluster)              CLUSTER="$1"; shift;;

        --latency)              LATENCY="$1"; shift;;

        --slow)                 SLOW_SYSTEMS=( ${SLOW_SYSTEMS[*]} "$1" ); shift;;
        --slow-node)            SLOW_SYSTEMS=( ${SLOW_SYSTEMS[*]} "$1" ); shift;;

        -h|--help) echo -e "$USAGE"; exit 1 ;;
        *) echo "Invalid input switch: $key"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1 ;;
    esac
done

[[ ${CLUSTER} ]] || error "no CLUSTER given, aborting"
[[ ${LATENCY} ]] || error "no LATENCY given, nothing to do"

# logging
TEST_NAME=configure.latency
if [[ ! ${TESTID} ]] ; then TESTID=$(date +%y%m%d.%H%M%S).${CLUSTER}; fi
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${CLUSTER}/${TESTID}.${TEST_NAME}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}

{
    echo
    echo "    ===== Begin $0 =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo
    echo "        $0 ${COMMAND_LINE}"
    echo

    time {

        CLUSTER_TYPE=$(get_property ${CLUSTER} cluster.type)

        unset SERVER_SYSTEMS
        case ${CLUSTER_TYPE} in
            mariadb_replication)
                for SYSTEM in $(get_property ${CLUSTER} master.systems) $(get_property ${CLUSTER} slave.systems) ; do
                    SERVER_SYSTEMS=( ${SERVER_SYSTEMS[*]} $(echo "${SYSTEM}" | sed 's/^mariadb\.//') )
                done
                ;;
            galera_*)
                for SYSTEM in $(get_property ${CLUSTER} galera.systems) ; do
                    SERVER_SYSTEMS=( ${SERVER_SYSTEMS[*]} $(echo "${SYSTEM}" | sed 's/^mariadb\.//') )
                done
                ;;
            raft_*)
                for SYSTEM in $(get_property ${CLUSTER} raft.systems) ; do
                    SERVER_SYSTEMS=( ${SERVER_SYSTEMS[*]} $(echo "${SYSTEM}" | sed 's/^mariadb\.//') )
                done
                ;;
            *)
                error "Unsupported Cluster Type: CLUSTER_TYPE = ${CLUSTER_TYPE}"
                ;;
        esac

        IFS=$'\n'
        SERVER_SYSTEMS=( $(sort <<< "${SERVER_SYSTEMS[*]}") )
        SLOW_SYSTEMS=( $(sort <<< "${SLOW_SYSTEMS[*]}") )
        unset IFS

        echo "    ===== Generating Latency Matrix ===== [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        echo
        echo "        CLUSTER        = ${CLUSTER}"
        echo "        CLUSTER_TYPE   = ${CLUSTER_TYPE}"
        echo
        echo "        SERVER_SYSTEMS = ( ${SERVER_SYSTEMS[*]} )"
        echo "        SLOW_SYSTEMS   = ( ${SLOW_SYSTEMS[*]} )"
        echo "        LATENCY        = ${LATENCY}"
        echo

        {
            echo
            echo "cluster.name = ${CLUSTER}"
            echo "cluster.type = ${CLUSTER_TYPE}"
            echo
            echo "server.systems = ${SERVER_SYSTEMS[*]}"
            echo "slow.systems = ${SLOW_SYSTEMS[*]}"
            echo

            NUM_SYSTEMS=${#SERVER_SYSTEMS[*]}
            for (( IDX1=0; IDX1<$NUM_SYSTEMS; IDX1++ )) ; do
                SYSTEM=${SERVER_SYSTEMS[$IDX1]}
                echo -n "${SYSTEM}.latency ="
                if [[ " ${SLOW_SYSTEMS[*]} " =~ " ${SYSTEM} " ]]; then
                    #this is a slow system, set latency exept for self
                    for (( IDX2=0; IDX2<$NUM_SYSTEMS; IDX2++ )) ; do
                        if (( ${IDX1} == ${IDX2} )) ; then
                            echo -n " 0"
                        else
                            echo -n " ${LATENCY}"
                        fi
                    done
                else
                    #this is a fast system, set latency only when other system is slow
                    for (( IDX2=0 ; IDX2<${#SERVER_SYSTEMS[@]} ; IDX2++ )) ; do
                        if [[ " ${SLOW_SYSTEMS[*]} " =~ " ${SERVER_SYSTEMS[$IDX2]} " ]] ; then
                            echo -n " ${LATENCY}"
                        else
                            echo -n " 0"
                        fi
                    done
                fi
                echo
            done
            echo
        } | tee properties/${CLUSTER}.latency.properties
    }

    echo
    echo "    ===== End $0 =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
