#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB
#
# $Id$

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0

    Snapshot the Nodes of a System (all types)

    Options:
        [ --cluster  <<clustername>> ]

        [ --version <<mysqlxx>> ]
        [ -h|--help ]
    Notes:
        1.
"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in
         # Connection Info
        --cluster)      CLUSTER="$1"; shift;;

        # for which point in time we were called
        --beforecurve)  BEFORE_CURVE=TRUE; BEFORE=TRUE;;
        --aftercurve)   AFTER_CURVE=TRUE;;
        --beforetest)   BEFORE_TEST=TRUE;;
        --aftertest)    AFTER_TEST=TRUE;;
        --beforeload)   BEFORE_LOAD=TRUE;;
        --afterload)    AFTER_LOAD=TRUE;;
        --beforerun)    BEFORE_RUN=TRUE;;
        --afterrun)     AFTER_RUN=TRUE;;

        -h|--help)      echo -e "$USAGE"; exit 1;;
        *)  echo "Invalid input switch: $key"; echo -e "COMMAND_LINE = ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done

[[ ${CLUSTER} ]] || { echo "Required CLUSTER paramater not provided."; echo -e "$0 ${COMMAND_LINE}"; exit 1; }

process_connection_info;

TEST_NAME=system.snapshot
[[ ${TESTID} ]] || TESTID=$(date +%y%m%d.%H%M%S).${CLUSTER}
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${CLUSTER}/${TESTID}.${TEST_NAME}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}

time {

    echo
    echo "===== Begin $0 =====  [ $(date -u  +"%Y-%m-%d %H:%M:%S.%3N") ]"
    STARTSECONDS=${SECONDS}

    echo
    echo "        $0 $COMMAND_LINE"
    echo
    echo "            CLUSTER         = ${CLUSTER}"
    echo
    echo "            LOGDIRECTORY    = ${LOGDIRECTORY}"
    echo


    echo "    ===== Get set of systems =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo
    unset SYSTEMS
    for SYSTEM in $(get_property ${CLUSTER} maxscale.systems) $(get_property ${CLUSTER} mariadb.systems) \
                  $(get_property ${CLUSTER} master.systems) $(get_property ${CLUSTER} slave.systems) \
                  $(get_property ${CLUSTER} galera.systems) $(get_property ${CLUSTER} raft.systems) \
                  $(get_property ${CLUSTER} driver.systems) ; do
        [[ " ${SYSTEMS[@]} " =~ " ${SYSTEM} " ]] || SYSTEMS+=( ${SYSTEM} )
    done

    echo
    echo "            SYSTEMS         = ( ${SYSTEMS[*]} )"
    echo

    time {
        for SYSTEM in ${SYSTEMS[*]} ; do
            echo "    ===== Snapshot System = ${SYSTEM} =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
            {
                echo "    System = ${SYSTEM}"
                echo
                echo "        OS Conf"
                mkdir -p ${LOGDIRECTORY}/${SYSTEM}/config

                #only once
                if [[ ${BEFORE_RUN} == TRUE || ${BEFORE_LOAD} == TRUE ]] ; then
                    ssh $(get_ssh_connection ${SYSTEM}) 'sudo uname --all' > ${LOGDIRECTORY}/${SYSTEM}/config/uname.txt
                    ssh $(get_ssh_connection ${SYSTEM}) 'ulimit -a' > ${LOGDIRECTORY}/${SYSTEM}/config/ulimit.txt
                    ssh $(get_ssh_connection ${SYSTEM}) 'sudo cat /etc/security/limits.conf' > ${LOGDIRECTORY}/${SYSTEM}/config/limits.conf.txt
                    ssh $(get_ssh_connection ${SYSTEM}) 'sudo lscpu' > ${LOGDIRECTORY}/${SYSTEM}/config/lscpu.txt
                    ssh $(get_ssh_connection ${SYSTEM}) 'sudo dmesg' > ${LOGDIRECTORY}/${SYSTEM}/config/dmesg.txt
                    ssh $(get_ssh_connection ${SYSTEM}) 'sudo ifconfig' > ${LOGDIRECTORY}/${SYSTEM}/config/ifconfig.txt
                    ssh $(get_ssh_connection ${SYSTEM}) 'sudo lsblk' > ${LOGDIRECTORY}/${SYSTEM}/config/lsblk.txt
                    ssh $(get_ssh_connection ${SYSTEM}) 'echo "Interrupt Configuration"; (( TRIM_COUNT = $(head -1 /proc/interrupts | wc -c) - 5 )); for INTERRUPT in $(tail -n +2 /proc/interrupts | cut -d: -f1 ); do for FILE in $(ls /proc/irq/${INTERRUPT}/smp_affinity) ; do printf "    %-26s | %s | %-16s %-20s\n" ${FILE} $(sudo cat ${FILE}) $(cat  /proc/interrupts | grep " ${INTERRUPT}:\|^${INTERRUPT}:" | cut -b ${TRIM_COUNT}- ); done; done 2>/dev/null' > ${LOGDIRECTORY}/${SYSTEM}/config/irq-config.txt
                    ssh $(get_ssh_connection ${SYSTEM}) '[[ -d /dev/md ]] && sudo mdadm --detail /dev/md/*' > ${LOGDIRECTORY}/${SYSTEM}/config/mdadm.txt
                    ssh $(get_ssh_connection ${SYSTEM}) 'sudo sysctl -a' > ${LOGDIRECTORY}/${SYSTEM}/config/sysctl.txt
                    ssh $(get_ssh_connection ${SYSTEM}) 'sudo cat /etc/sysctl.conf' > ${LOGDIRECTORY}/${SYSTEM}/config/sysctl.conf
                fi

                #before / after each test
                ssh $(get_ssh_connection ${SYSTEM}) 'df -h' > ${LOGDIRECTORY}/${SYSTEM}/config/df.txt
                ssh $(get_ssh_connection ${SYSTEM}) 'ps -ef' > ${LOGDIRECTORY}/${SYSTEM}/config/ps.txt
                ssh $(get_ssh_connection ${SYSTEM}) 'sudo netstat -suna' > ${LOGDIRECTORY}/${SYSTEM}/config/netstat-suna.txt


                echo
                echo "        Proc Files"
                mkdir -p ${LOGDIRECTORY}/${SYSTEM}/proc/net
                PROC_FILES=(
                    cpuinfo
                    diskstats
                    interrupts
                    meminfo
                    net/dev
                    partitions
                    softirqs
                    stat
                    swaps
                    version
                    mdstat
                    mounts
                )
                for FILE in ${PROC_FILES[*]} ; do
                    ssh $(get_ssh_connection ${SYSTEM}) "cat /proc/${FILE}" > ${LOGDIRECTORY}/${SYSTEM}/proc/${FILE}
                done


                echo
                echo "        Log Files"
                mkdir -p ${LOGDIRECTORY}/${SYSTEM}/logs

                LOG_FILES=(
                    /var/log/syslog
                    /var/log/kern.log
                )
                for FILE in ${LOG_FILES[*]} ; do
                    D=${LOGDIRECTORY}/${SYSTEM}/logs/$(echo ${FILE} | rev | cut -d'/' -f 1 | rev)
                    ssh $(get_ssh_connection ${SYSTEM}) "[[ -e ${FILE} ]] && sudo tail -1000 ${FILE}" > ${D}
                    [[ -s ${D} ]] || rm -f ${D}
                done

                ssh $(get_ssh_connection ${SYSTEM}) 'ls -1l /data/cbench/*' > ${LOGDIRECTORY}/${SYSTEM}/ls.txt
            } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).snapshot.${SYSTEM}.log 2>&1 &
        done
        wait
    }

    echo
    echo "    ===== End $0 ( Elapsed Seconds = $(( $SECONDS - $STARTSECONDS )) ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
