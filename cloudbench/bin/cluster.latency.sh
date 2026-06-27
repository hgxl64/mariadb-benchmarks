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
                            echo "to-> ${MAXSCALE_SYSTEMS[*]}"
                            for ORIGIN in ${DRIVER_SYSTEMS[*]} ; do
                                echo -n "${ORIGIN}"
                                for TARGET in ${MAXSCALE_SYSTEMS[*]} ; do
                                    echo -n " $(tail -1 ${LOGDIRECTORY}/ping.${ORIGIN}.to.${TARGET}.log | cut -d= -f2 | cut -d/ -f2)"
                                done
                                echo
                            done
                        } | column -t
                    }
                }

                ;;

            reset)
                SERVER_SYSTEMS=$(get_property ${CLUSTER}.latency server.systems)
                [[ ${SERVER_SYSTEMS} ]] || error "no systems found. Did you run configure.latency.sh ?"

                echo "    ===== Resetting Network Latency ===== [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
                echo
                echo "        SERVER_SYSTEMS = ${SERVER_SYSTEMS}"
                echo

                for ORIGIN in ${SERVER_SYSTEMS[*]} ; do
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
                SERVER_SYSTEMS=$(get_property ${CLUSTER}.latency server.systems)
                [[ ${SERVER_SYSTEMS} ]] || error "no systems found. Did you run configure.latency.sh ?"

                echo "    ===== Configured Network Latency ===== [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
                echo
                echo "        SERVER_SYSTEMS = ${SERVER_SYSTEMS}"
                echo

                echo "configured network latency between nodes:"
                echo
                {
                    echo "to-> ${SERVER_SYSTEMS[*]}"
                    for ORIGIN in ${SERVER_SYSTEMS[*]} ; do
                        echo "${ORIGIN} $(get_property ${CLUSTER}.latency ${ORIGIN}.latency)"
                    done
                } | column -t
                ;;

            set)
                SERVER_SYSTEMS=$(get_property ${CLUSTER}.latency server.systems)
                [[ ${SERVER_SYSTEMS} ]] || error "no systems found. Did you run configure.latency.sh ?"

                echo "    ===== Setting Network Latency ===== [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
                echo
                echo "        SERVER_SYSTEMS = ${SERVER_SYSTEMS}"
                echo

                for ORIGIN in ${SERVER_SYSTEMS[*]} ; do

                    ORIGIN_IP=$(get_property ${ORIGIN} system.internal.ip)
                    LATENCIES=( $(get_property ${CLUSTER}.latency ${ORIGIN}.latency) )
                    #echo "ORIGIN    = ${ORIGIN}"
                    #echo "ORIGIN_IP = ${ORIGIN_IP}"
                    #echo "LATENCIES = ( ${LATENCIES[*]} )"

                    unset TARGET_IPS
                    unset TARGET_LATENCY
                    IDX=0
                    for TARGET in ${SERVER_SYSTEMS[*]} ; do
                        LATENCY=${LATENCIES[$IDX]}
                        if [[ ${ORIGIN} != ${TARGET} ]] && [[ ${LATENCY} != 0 ]]; then
                            TARGET_IPS+=( $(get_property ${TARGET} system.internal.ip) )
                            TARGET_LATENCY+=( ${LATENCY} )
                        fi
                        IDX=$((IDX+1))
                    done

                    #echo "TARGET_IPS     = ( ${TARGET_IPS[*]} )"
                    #echo "TARGET_LATENCY = ( ${TARGET_LATENCY[*]} )"

                    echo "${ORIGIN}"
                    ssh $(get_ssh_connection ${CLUSTER} ${ORIGIN}) '
                        ORIGIN_IP="'${ORIGIN_IP}'"
                        TARGET_IPS=( '${TARGET_IPS[*]}' )
                        TARGET_LATENCY=( '${TARGET_LATENCY[*]}' )
                        declare -p TARGET_LATENCY
                        BANDWIDTH="16gbit"
                        NETDEV=$(ip -o addr show | fgrep "${ORIGIN_IP}" | awk "{print \$2}")
                        if [[ ${NETDEV} ]] ; then
                            #delete any existing rules
                            sudo tc qdisc del dev ${NETDEV} root &> /dev/null
                            echo "  qdisc cleared for ip=${ORIGIN_IP}, device=${NETDEV}"
                            #setup parent HTB
                            sudo tc qdisc add dev ${NETDEV} root handle 1: htb default 999
                            sudo tc class add dev ${NETDEV} parent 1: classid 1:1 htb rate ${BANDWIDTH} ceil ${BANDWIDTH} &> /dev/null
                            sudo tc class add dev ${NETDEV} parent 1:1 classid 1:999 htb rate ${BANDWIDTH} ceil ${BANDWIDTH} &> /dev/null
                            sudo tc qdisc add dev ${NETDEV} parent 1:999 handle 2: fq_codel
                            echo "  parent HTB added with bandwidth ${BANDWIDTH}"
                            #setup HTB for each target
                            IDX=0
                            for TARGET in ${TARGET_IPS[*]} ; do
                                LATENCY=${TARGET_LATENCY[$IDX]}
                                #echo "IDX     = ${IDX}"
                                #echo "TARGET  = >${TARGET}<"
                                #echo "LATENCY = >${LATENCY}<"
                                MINOR=$(( 10 + IDX ))
                                sudo tc class add dev ${NETDEV} parent 1:1 classid 1:${MINOR} htb rate ${BANDWIDTH} ceil ${BANDWIDTH} prio 1 &> /dev/null
                                sudo tc qdisc add dev ${NETDEV} parent 1:${MINOR} handle ${MINOR}0: netem delay ${LATENCY} limit 1000
                                sudo tc filter add dev ${NETDEV} protocol ip parent 1: prio 1 u32 match ip dst ${TARGET} flowid 1:${MINOR}
                                echo "  netem delay ${LATENCY} added for dst ${TARGET}"
                                IDX=$((IDX+1))
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
