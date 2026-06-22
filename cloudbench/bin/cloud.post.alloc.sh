#!/bin/bash

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0
    maintenance jobs on freshly allocated cloud nodes
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

TEST_NAME=cloud.post.alloc
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
    STARTSECONDS=$SECONDS

    echo "
        $0 $COMMAND_LINE

            CLUSTER         = ${CLUSTER}
    "

    echo
    echo "    ===== Install additional packages =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

    #this can take a bit, so parallelize it
    time {
        unset BACKGROUND_PIDS
        for SYSTEM in $(get_property ${CLUSTER} systems) ; do
            for NODE in $(get_property ${SYSTEM} system.external.ip) ; do
                time {
                    ssh $(get_ssh_connection ${CLUSTER} ${NODE}) '
                        DISTRIBUTION=$(cat /etc/lsb-release | grep DESCRIPTION | cut -d= -f2 | sed s/\"//g)
                        case ${DISTRIBUTION} in
                            "Ubuntu 24."*)
                                echo "Ubuntu 24 detected, installing packages"
                                sudo apt-get update
                                sudo apt-get -y install ntpdate liburing2 \
                                  libodbc2 libprotobuf32t64 libmicrohttpd12 nodejs libarchive13t64 \
                                  prometheus-node-exporter
                                ;;
                            *)
                                echo "unknown target OS: \"${DISTRIBUTION}\", doing nothing"
                                ;;
                        esac
                    '
                } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).install.packages.${NODE}.log 2>&1 &
                BACKGROUND_PIDS=( ${BACKGROUND_PIDS[*]} $! )
            done
        done
        wait ${BACKGROUND_PIDS[*]}
    }


    echo
    echo "    ===== Register Node Exporter =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo
    if [[ ${PROMETHEUS_EXT_IP} ]] ; then
        time {
            for SYSTEM in $(get_property ${CLUSTER} systems) ; do
                for NODE in $(get_property ${SYSTEM} system.internal.ip) ; do
                    echo "        register ${SYSTEM}=${NODE} at ${PROMETHEUS_EXT_IP}"
                    {
                        echo "["
                        echo "  { \"labels\":  { \"cluster_name\":\"${CLUSTER}\", \"name\":\"${SYSTEM}\" },"
                        echo "    \"targets\": [ \"${NODE}:9100\" ]"
                        echo "  }"
                        echo "]"
                    } | ssh ${PROMETHEUS_USER}@${PROMETHEUS_EXT_IP} -oStrictHostKeyChecking=no \
                            -i${PROMETHEUS_PEM} "cat | sudo tee /etc/prometheus/targets/${SYSTEM}.json"
                done
            done
            echo "    ===== all nodes registered ====="
        }
    else
        echo "    ===== PROMETHEUS_EXT_IP is not set, skipping ====="
    fi


    echo
    echo "    ===== SSH connectivity =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo
    #
    # each host should be able to SSH into each other
    #
    IDX=1
    TMPFILE=$(mktemp -t ssh-key.XXXXXXXX)
    for SYSTEM in $(get_property ${CLUSTER} systems) ; do
        for NODE in $(get_property ${SYSTEM} system.external.ip) ; do
            echo "        Node: ${NODE}"
            if (( ${IDX} == 1 )) ; then
                echo "        generate key ..."
                ssh $(get_ssh_connection ${CLUSTER} ${NODE}) '[[ -f .ssh/id_ecdsa ]] || ssh-keygen -t ecdsa -f .ssh/id_ecdsa -N ""'
                scp $(get_scp_copy_from_connection ${CLUSTER} ${NODE} '.ssh/id_ecdsa' ${TMPFILE})
                scp $(get_scp_copy_from_connection ${CLUSTER} ${NODE} '.ssh/id_ecdsa.pub' ${TMPFILE}.pub)
            else
                echo "        copy key ..."
                scp $(get_scp_copy_to_connection ${CLUSTER} ${NODE} ${TMPFILE} '.ssh/id_ecdsa')
                scp $(get_scp_copy_to_connection ${CLUSTER} ${NODE} ${TMPFILE}.pub '.ssh/id_ecdsa.pub')
            fi
            echo "        authorize key"
            ssh $(get_ssh_connection ${CLUSTER} ${NODE}) '
                cd .ssh
                cat id_ecdsa.pub >> authorized_keys
                echo "StrictHostKeyChecking = no" > config
            '
            ((IDX = ${IDX} + 1))
        done
    done
    rm -f ${TMPFILE} ${TMPFILE}.pub


    echo
    echo "    ===== End $0 ( Elapsed Seconds = $(( $SECONDS - $STARTSECONDS )) ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
