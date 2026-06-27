#!/bin/bash

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0

    Set, reset or show network latency between the server nodes of a cluster.
    The latencies are stored in cluster.latency.properties

    Or check the latencies between all types of nodes. This does not require
    cluster.latency.properties

    Parameters:
        ...

        [ -h|--help ]

    Notes:
"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in

        --cluster)              CLUSTER="$1"; shift;;

        --check)                MODE="check";;
        --test)                 MODE="check";;
        --reset)                MODE="reset";;
        --set)                  MODE="set";;
        --show)                 MODE="show";;

        -h|--help) echo -e "$USAGE"; exit 1 ;;
        *) echo "Invalid input switch: $key"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1 ;;
    esac
done

[[ ${CLUSTER} ]] || error "no CLUSTER given, aborting"

[[ ${MODE} ]] || MODE="check"

# logging
TEST_NAME=cluster.latency
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
    echo "        CLUSTER        = ${CLUSTER}"
    echo

    time {

        case ${MODE} in

            check)
                echo "    ===== Checking Network Latency ===== [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
                echo

                #collect list of server systems
                unset SERVER_SYSTEMS
                case $(get_property ${CLUSTER} cluster.type) in
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
                        for SYSTEM in $(get_property ${CLUSTER} mariadb.systems) ; do
                            SERVER_SYSTEMS=( ${SERVER_SYSTEMS[*]} $(echo "${SYSTEM}" | sed 's/^mariadb\.//') )
                        done
                        ;;
                esac

                #and maxscale systems
                unset MAXSCALE_SYSTEMS
                for SYSTEM in $(get_property ${CLUSTER} maxscale.systems) ; do
                    MAXSCALE_SYSTEMS=( ${MAXSCALE_SYSTEMS[*]} $(echo "${SYSTEM}" | sed 's/^maxscale\.//') )
                done

                #and driver systems
                DRIVER_SYSTEMS=( $(get_property ${CLUSTER} driver.systems) )

                echo "        SERVER_SYSTEMS    = ${SERVER_SYSTEMS[*]}"
                echo "        MAXSCALE_SYSTEMS  = ${MAXSCALE_SYSTEMS[*]}"
                echo "        DRIVER_SYSTEMS    = ${DRIVER_SYSTEMS[*]}"
                echo

                echo "        ===== Ping Test ====="
                echo
                time {
                    unset PIDLIST
                    #each server to each other
                    for ORIGIN in ${SERVER_SYSTEMS[*]} ; do
                        for TARGET in ${SERVER_SYSTEMS[*]} ; do
                            TARGET_IP=$(get_property ${TARGET} system.internal.ip)
                            ssh $(get_ssh_connection ${CLUSTER} ${ORIGIN}) "ping -A -c 10 ${TARGET_IP}" > ${LOGDIRECTORY}/ping.${ORIGIN}.to.${TARGET}.log &
                            PIDLIST="${PIDLIST} $!"
                        done
                    done
                    #maxscales to servers
                    for ORIGIN in ${MAXSCALE_SYSTEMS[*]} ; do
                        for TARGET in ${SERVER_SYSTEMS[*]} ; do
                            TARGET_IP=$(get_property ${TARGET} system.internal.ip)
                            ssh $(get_ssh_connection ${CLUSTER} ${ORIGIN}) "ping -A -c 10 ${TARGET_IP}" > ${LOGDIRECTORY}/ping.${ORIGIN}.to.${TARGET}.log &
                            PIDLIST="${PIDLIST} $!"
                        done
                    done
                    #drivers to servers and to maxscales
                    for ORIGIN in ${DRIVER_SYSTEMS[*]} ; do
                        for TARGET in ${SERVER_SYSTEMS[*]} ${MAXSCALE_SYSTEMS[*]} ; do
                            TARGET_IP=$(get_property ${TARGET} system.internal.ip)
                            ssh $(get_ssh_connection ${CLUSTER} ${ORIGIN}) "ping -A -c 10 ${TARGET_IP}" > ${LOGDIRECTORY}/ping.${ORIGIN}.to.${TARGET}.log &
                            PIDLIST="${PIDLIST} $!"
                        done
                    done
                    #wait for everyone to finish
                    wait ${PIDLIST}
                    unset PIDLIST
                }

                [[ ${#SERVER_SYSTEMS[*]} -gt 1 ]] && {
                    echo
                    echo "----- average rtt between server nodes in ms:"
                    echo
                    {
                        echo "to-> ${SERVER_SYSTEMS[*]}"
                        for ORIGIN in ${SERVER_SYSTEMS[*]} ; do
                            echo -n "${ORIGIN}"
                            for TARGET in ${SERVER_SYSTEMS[*]} ; do
                                echo -n " $(tail -1 ${LOGDIRECTORY}/ping.${ORIGIN}.to.${TARGET}.log | cut -d= -f2 | cut -d/ -f2)"
                            done
                            echo
                        done
                    } | column -t
                }

                [[ ${MAXSCALE_SYSTEMS[*]} ]] && {
                    echo
                    echo "----- average rtt between maxscale nodes and servers in ms:"
                    echo
                    {
                        echo "to-> ${SERVER_SYSTEMS[*]}"
                        for ORIGIN in ${MAXSCALE_SYSTEMS[*]} ; do
                            echo -n "${ORIGIN}"
                            for TARGET in ${SERVER_SYSTEMS[*]} ; do
                                echo -n " $(tail -1 ${LOGDIRECTORY}/ping.${ORIGIN}.to.${TARGET}.log | cut -d= -f2 | cut -d/ -f2)"
                            done
                            echo
                        done
                    } | column -t
                }

                [[ ${DRIVER_SYSTEMS[*]} ]] && {
                    echo
                    echo "----- average rtt between driver nodes and servers in ms:"
                    echo
                    {
                        echo "to-> ${SERVER_SYSTEMS[*]}"
                        for ORIGIN in ${DRIVER_SYSTEMS[*]} ; do
                            echo -n "${ORIGIN}"
                            for TARGET in ${SERVER_SYSTEMS[*]} ; do
                                echo -n " $(tail -1 ${LOGDIRECTORY}/ping.${ORIGIN}.to.${TARGET}.log | cut -d= -f2 | cut -d/ -f2)"
                            done
                            echo
                        done
                    } | column -t
                    [[ ${MAXSCALE_SYSTEMS[*]} ]] && {
                        echo
                        echo "----- average rtt between driver nodes and maxscales in ms:"
                        echo
                        {
                            echo "to-> ${SERVER_SYSTEMS[*]} ${MAXSCALE_SYSTEMS[*]}"
                            for ORIGIN in ${DRIVER_SYSTEMS[*]} ; do
                                echo -n "${ORIGIN}"
                                for TARGET in ${SERVER_SYSTEMS[*]} ${MAXSCALE_SYSTEMS[*]} ; do
                                    echo -n " $(tail -1 ${LOGDIRECTORY}/ping.${ORIGIN}.to.${TARGET}.log | cut -d= -f2 | cut -d/ -f2)"
                                done
                                echo
                            done
                        } | column -t
                    }
                }

                ;;

            reset)
                ALL_SYSTEMS=$(get_property ${CLUSTER}.latency all.systems)
                [[ ${ALL_SYSTEMS} ]] || error "no systems found. Did you configure latency?"

                echo "    ===== Resetting Network Latency ===== [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
                echo
                echo "        ALL_SYSTEMS    = ${ALL_SYSTEMS}"
                echo

                for ORIGIN in ${ALL_SYSTEMS[*]} ; do
                    echo -n "${ORIGIN} : "
                    ssh $(get_ssh_connection ${CLUSTER} ${ORIGIN}) '
                        IP="'$(get_property ${ORIGIN} system.internal.ip)'"
                        NETDEV=$(ip -o addr show | fgrep "${IP}" | awk "{print \$2}")
                        if [[ ${NETDEV} ]] ; then
                            sudo tc qdisc del dev ${NETDEV} root &> /dev/null
                            echo "qdisc cleared for ip=${IP}, device=${NETDEV}"
                        else
                            echo "could not find net device for ip=${IP}"
                        fi
                    '
                done
                ;;

            show)
                ALL_SYSTEMS=$(get_property ${CLUSTER}.latency all.systems)
                [[ ${ALL_SYSTEMS} ]] || error "no systems found. Did you configure latency?"

                echo "    ===== Configured Network Latency ===== [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
                echo
                echo "        ALL_SYSTEMS    = ${ALL_SYSTEMS}"
                echo

                echo "configured network latency  between nodes:"
                echo
                {
                    echo "from\\to ${ALL_SYSTEMS[*]}"
                    for ORIGIN in ${ALL_SYSTEMS[*]} ; do
                        echo "${ORIGIN} $(get_property ${CLUSTER}.latency ${ORIGIN}.latency)"
                    done
                } | column -t
                ;;

            set)
                ALL_SYSTEMS=$(get_property ${CLUSTER}.latency all.systems)
                [[ ${ALL_SYSTEMS} ]] || error "no systems found. Did you configure latency?"

                echo "    ===== Setting Network Latency ===== [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
                echo
                echo "        ALL_SYSTEMS    = ${ALL_SYSTEMS}"
                echo

                for ORIGIN in ${ALL_SYSTEMS[*]} ; do

                    unset TARGET_IPS
                    unset TARGET_LATENCY
                    ORIGIN_IP=$(get_property ${ORIGIN} system.internal.ip)
                    LATENCIES=$(get_property ${CLUSTER}.lateny ${ORIGIN}.latency)
                    for ((IDX=0; IDX<${#ALL_SYSTEMS[*]}; IDX++)) ; do
                        if [[ ${ORIGIN} != ${ALL_SYSTEMS[$IDX]} ]] ; then
                            TARGET_IPS=( ${TARGET_IPS[*]} ${ALL_SYSTEMS[$IDX]} )
                            TARGET_LATENCY=( ${TARGET_LATENCY[*]} ${LATENCIES[$IDX]} )
                        fi
                    done

                    echo -n "${ORIGIN} : "
                    ssh $(get_ssh_connection ${CLUSTER} ${ORIGIN}) '
                        ORIGIN_IP="'${ORIGIN_IP}'"
                        TARGET_IPS=( "'${TARGET_IPS[*]}'" )
                        TARGET_LATENCY=( "'${TARGET_LATENCY[*]}'" )
                        BANDWIDTH="16gbit"
                        NETDEV=$(ip -o addr show | fgrep "${ORIGIN_IP}" | awk "{print \$2}")
                        if [[ ${NETDEV} ]] ; then
                            #delete any existing rules
                            sudo tc qdisc del dev ${NETDEV} root &> /dev/null
                            echo "qdisc cleared for ip=${IP}, device=${NETDEV}"
                            #setup parent HTB
                            sudo tc qdisc add dev ${NETDEV} root handle 1: htb default 999
                            sudo tc class add dev ${NETDEV} parent 1: classid 1:1 htb rate ${BANDWIDTH} ceil ${BANDWIDTH}
                            sudo tc class add dev ${NETDEV} parent 1:1 classid 1:999 htb rate ${BANDWIDTH} ceil ${BANDWIDTH}
                            sudo tc qdisc add dev ${NETDEV} parent 1:999 handle 2: fq_codel
                            echo "  parent HTB added with bandwidth ${BANDWIDTH}"
                            #setup HTB for each target
                            for (( IDX=0; IDX<${#TARGET_IPS[*]}; IDX++ )) ; do
                                LATENCY=${TARGET_LATENCY[$IDX]}
                                (( ${LATENCY} == 0 )) && continue
                                TARGET=${TARGET_IPS[$IDX]}
                                (( MINOR=10 + IDX ))
                                sudo tc class add dev ${NETDEV} parent 1:1 classid 1:${MINOR} htb rate ${BANDWIDTH} ceil ${BANDWIDTH} prio 1
                                sudo tc qdisc add dev ${NETDEV} parent 1:${MINOR} handle ${MINOR}0: netem delay ${LATENCY} limit 1000
                                sudo tc filter add dev ${NETDEV} protocol ip parent 1: prio 1 u32 match ip dst ${TARGET} flowid 1:${MINOR}
                                echo "  netem delay ${LATENCY} added for dst ${TARGET}"
                            done
                        else
                            echo "could not find net device for ip=${ORIGIN_IP}"
                        fi
                    '
                done

                ;;

            *) error "Unsupported Operation Mode: '${MODE}'"
        esac

    }

    echo
    echo "    ===== End $0 =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
