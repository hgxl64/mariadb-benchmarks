#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB
#
# $Id$

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0 [options]

    Set, reset or show network latency between the server nodes of a cluster.
    The latencies are stored in \${CLUSTER}.latency.properties

    Or check the latencies between all types of nodes. This does not require
    \${CLUSTER}.latency.properties

    Parameters:
        --cluster  the cluster to operate on (mandatory)
        --check    check latencies (using ping)
        --reset    reset latencies to the minimum
        --set      set latencies specified in \${CLUSTER}.latency.properties
        --show     show latencies specified in \${CLUSTER}.latency.properties

        --number-pings   how many pings to use for --check, default are 40
                         pings in 200ms intervals

    Notes:

    Multiple operations are possible and will be executed in the order on the
    command line. I.e.

    $0 --show --set --check

    will show the configured latencies, then set them and finally check them.
    When called with no command option the default is to run 'check'.
"

COMMAND_LINE="$@"

unset OPS_PIPELINE

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in

        --cluster)              CLUSTER="$1"; shift;;

        --check)                OPS_PIPELINE+=("check");;
        --test)                 OPS_PIPELINE+=("check");;
        --reset)                OPS_PIPELINE+=("reset");;
        --set)                  OPS_PIPELINE+=("set");;
        --show)                 OPS_PIPELINE+=("show");;

        --number-pings)         NUM_PINGS="$1"; shift;;

        -h|--help) echo -e "$USAGE"; exit 1 ;;
        *) echo "Invalid input switch: $key"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1 ;;
    esac
done

[[ ${CLUSTER} ]] || error "no CLUSTER given, aborting"

#default operation: check
[[ ${OPS_PIPELINE[*]} ]] || OPS_PIPELINE+=("check")

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

    time {

        for OP in ${OPS_PIPELINE[*]}; do

            case ${OP} in

                check)
                    echo
                    echo "    ===== Checking Network Latency ===== [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
                    echo

                    #collect list of server systems
                    unset SERVER_SYSTEMS
                    case $(get_property ${CLUSTER} cluster.type) in
                        mariadb_replication)
                            for SYSTEM in $(get_property ${CLUSTER} master.systems) $(get_property ${CLUSTER} slave.systems) ; do
                                SERVER_SYSTEMS+=( $(echo "${SYSTEM}" | sed 's/^mariadb\.//') )
                            done
                            ;;
                        galera_*)
                            for SYSTEM in $(get_property ${CLUSTER} galera.systems) ; do
                                SERVER_SYSTEMS+=( $(echo "${SYSTEM}" | sed 's/^mariadb\.//') )
                            done
                            ;;
                        raft_*)
                            for SYSTEM in $(get_property ${CLUSTER} raft.systems) ; do
                                SERVER_SYSTEMS+=( $(echo "${SYSTEM}" | sed 's/^mariadb\.//') )
                            done
                            ;;
                        *)
                            for SYSTEM in $(get_property ${CLUSTER} mariadb.systems) ; do
                                SERVER_SYSTEMS+=( $(echo "${SYSTEM}" | sed 's/^mariadb\.//') )
                            done
                            ;;
                    esac

                    #and maxscale systems
                    unset MAXSCALE_SYSTEMS
                    for SYSTEM in $(get_property ${CLUSTER} maxscale.systems) ; do
                        MAXSCALE_SYSTEMS+=( $(echo "${SYSTEM}" | sed 's/^maxscale\.//') )
                    done

                    #and driver systems
                    DRIVER_SYSTEMS=( $(get_property ${CLUSTER} driver.systems) )

                    [[ ${NUM_PINGS} ]] || NUM_PINGS=40

                    echo "    SERVER_SYSTEMS    = ${SERVER_SYSTEMS[*]}"
                    echo "    MAXSCALE_SYSTEMS  = ${MAXSCALE_SYSTEMS[*]}"
                    echo "    DRIVER_SYSTEMS    = ${DRIVER_SYSTEMS[*]}"
                    echo

                    echo "    ===== Ping Test ====="
                    echo
                    time {
                        unset PIDLIST
                        #each server to each other
                        for ORIGIN in ${SERVER_SYSTEMS[*]} ; do
                            for TARGET in ${SERVER_SYSTEMS[*]} ; do
                                TARGET_IP=$(get_property ${TARGET} system.internal.ip)
                                ssh $(get_ssh_connection ${ORIGIN}) "ping -i 0.2 -c ${NUM_PINGS} ${TARGET_IP}" > ${LOGDIRECTORY}/ping.${ORIGIN}.to.${TARGET}.log &
                                PIDLIST="${PIDLIST} $!"
                            done
                        done
                        #maxscales to servers
                        for ORIGIN in ${MAXSCALE_SYSTEMS[*]} ; do
                            for TARGET in ${SERVER_SYSTEMS[*]} ; do
                                TARGET_IP=$(get_property ${TARGET} system.internal.ip)
                                ssh $(get_ssh_connection ${ORIGIN}) "ping -i 0.2 -c ${NUM_PINGS} ${TARGET_IP}" > ${LOGDIRECTORY}/ping.${ORIGIN}.to.${TARGET}.log &
                                PIDLIST="${PIDLIST} $!"
                            done
                        done
                        #drivers to servers and to maxscales
                        for ORIGIN in ${DRIVER_SYSTEMS[*]} ; do
                            for TARGET in ${SERVER_SYSTEMS[*]} ${MAXSCALE_SYSTEMS[*]} ; do
                                TARGET_IP=$(get_property ${TARGET} system.internal.ip)
                                ssh $(get_ssh_connection ${ORIGIN}) "ping -i 0.2 -c ${NUM_PINGS} ${TARGET_IP}" > ${LOGDIRECTORY}/ping.${ORIGIN}.to.${TARGET}.log &
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
                    }

                    ;;

                reset)
                    SERVER_SYSTEMS=$(get_property ${CLUSTER}.latency server.systems)
                    [[ ${SERVER_SYSTEMS} ]] || error "no systems found. Did you run configure.latency.sh ?"

                    echo
                    echo "    ===== Resetting Network Latency ===== [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
                    echo
                    echo "    SERVER_SYSTEMS = ${SERVER_SYSTEMS}"
                    echo

                    for ORIGIN in ${SERVER_SYSTEMS[*]} ; do
                        echo -n "${ORIGIN} : "
                        ssh $(get_ssh_connection ${ORIGIN}) '
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

                    echo
                    echo "    ===== Configured Network Latency ===== [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
                    echo
                    echo "    SERVER_SYSTEMS = ${SERVER_SYSTEMS}"
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

                    echo
                    echo "    ===== Setting Network Latency ===== [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
                    echo
                    echo "    SERVER_SYSTEMS = ${SERVER_SYSTEMS}"
                    echo

                    for ORIGIN in ${SERVER_SYSTEMS[*]} ; do

                        ORIGIN_IP=$(get_property ${ORIGIN} system.internal.ip)
                        LATENCIES=( $(get_property ${CLUSTER}.latency ${ORIGIN}.latency) )

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

                        echo "${ORIGIN}:"
                        ssh $(get_ssh_connection ${ORIGIN}) '
                            ORIGIN_IP="'${ORIGIN_IP}'"
                            TARGET_IPS=( '${TARGET_IPS[*]}' )
                            TARGET_LATENCY=( '${TARGET_LATENCY[*]}' )
                            BANDWIDTH="16gbit"
                            NETDEV=$(ip -o addr show | fgrep "${ORIGIN_IP}" | awk "{print \$2}")
                            if [[ ${NETDEV} ]] ; then
                                sudo tc qdisc del dev ${NETDEV} root &> /dev/null
                                echo "-> qdisc cleared for ip=${ORIGIN_IP}, device=${NETDEV}"
                                sudo tc qdisc add dev ${NETDEV} root handle 1: htb default 999
                                sudo tc class add dev ${NETDEV} parent 1: classid 1:1 htb rate ${BANDWIDTH} ceil ${BANDWIDTH} &> /dev/null
                                sudo tc class add dev ${NETDEV} parent 1:1 classid 1:999 htb rate ${BANDWIDTH} ceil ${BANDWIDTH} &> /dev/null
                                sudo tc qdisc add dev ${NETDEV} parent 1:999 handle 2: fq_codel
                                echo "-> parent HTB added with bandwidth ${BANDWIDTH}"
                                IDX=0
                                for TARGET in ${TARGET_IPS[*]} ; do
                                    LATENCY=${TARGET_LATENCY[$IDX]}
                                    MINOR=$(( 10 + IDX ))
                                    sudo tc class add dev ${NETDEV} parent 1:1 classid 1:${MINOR} htb rate ${BANDWIDTH} ceil ${BANDWIDTH} prio 1 &> /dev/null
                                    sudo tc qdisc add dev ${NETDEV} parent 1:${MINOR} handle ${MINOR}0: netem delay ${LATENCY} limit 1000
                                    sudo tc filter add dev ${NETDEV} protocol ip parent 1: prio 1 u32 match ip dst ${TARGET} flowid 1:${MINOR}
                                    echo "-> netem delay ${LATENCY} added for dst ${TARGET}"
                                    IDX=$((IDX+1))
                                done
                            else
                                echo "could not find net device for ip=${ORIGIN_IP}"
                            fi
                        '
                    done
            esac
        done
    }

    echo
    echo "    ===== End $0 =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
