#!/bin/bash

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0

    Given a list of nodes ( master and slave systems ), configure a cluster

    Cluster Types:  mariadb_replication, galera_masterslave, galera_mastermaster

    Parameters:
        ...

        [ -h|--help ]

    Notes:
"

COMMAND_LINE="$@"

unset MARIADB_SYSTEMS
unset MASTER_SYSTEMS
unset REPLICA_SYSTEMS
unset MAXSCALE_SYSTEMS
unset DRIVER_SYSTEMS

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in

        --cluster)              CLUSTER="$1"; shift;;
        --system)               CLUSTER="$1"; shift;;
        --cluster-type)         CLUSTER_TYPE="$1"; shift;;
        --system-type)          CLUSTER_TYPE="$1"; shift;;
        --testid)               TESTID="$1"; shift;;

        --mariadb-system)       MARIADB_SYSTEMS=( ${MARIADB_SYSTEMS[*]} "$1" ); shift;;
        --primary-system)       MASTER_SYSTEMS=( ${MASTER_SYSTEMS[*]} "$1" ); shift;;
        --master-system)        MASTER_SYSTEMS=( ${MASTER_SYSTEMS[*]} "$1" ); shift;;
        --replica-system)       REPLICA_SYSTEMS=( ${REPLICA_SYSTEMS[*]} "$1" ); shift;;
        --slave-system)         REPLICA_SYSTEMS=( ${REPLICA_SYSTEMS[*]} "$1" ); shift;;
        --maxscale-system)      MAXSCALE_SYSTEMS=( ${MAXSCALE_SYSTEMS[*]} "$1" ); shift;;
        --driver-system)        DRIVER_SYSTEMS=( ${DRIVER_SYSTEMS[*]} "$1" ); shift;;
        --drivers)              DRIVER_SYSTEMS=( ${DRIVER_SYSTEMS[*]} $1 ); shift;;

        --ssl)                  OPTION_SSL=TRUE;;

        -h|--help) echo -e "$USAGE"; exit 1 ;;
        *) echo "Invalid input switch: $key"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1 ;;
    esac
done

[[ ${CLUSTER_TYPE} ]] || CLUSTER_TYPE='mariadb'
[[ ${CLUSTER} ]]      || CLUSTER=$(date +%y%m%d.%H%M%S).${CLUSTER_TYPE}

[[ ${OPTION_PASSWORD} ]] || OPTION_PASSWORD='Ma49DB4F#+Pa13w0rd'
[[ ${OPTION_SSL} ]]      || OPTION_SSL=FALSE


# logging
TEST_NAME=configure.cluster
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
    STARTSECONDS=$SECONDS

    echo
    echo "        TESTID            = ${TESTID}"
    echo
    echo "        CLUSTER           = ${CLUSTER}"
    echo "        CLUSTER_TYPE      = ${CLUSTER_TYPE}"
    echo
    echo "        COMMAND_LINE      = ${COMMAND_LINE}"
    echo
    echo "        MARIADB_SYSTEMS    = ( ${MARIADB_SYSTEMS[*]} )"
    echo "        MASTER_SYSTEMS     = ( ${MASTER_SYSTEMS[*]} )"
    echo "        REPLICA_SYSTEMS    = ( ${REPLICA_SYSTEMS[*]} )"
    echo "        MAXSCALE_SYSTEMS   = ( ${MAXSCALE_SYSTEMS[*]} )"
    echo "        DRIVER_SYSTEMS     = ( ${DRIVER_SYSTEMS[*]} )"
    echo "        OPTION_SSL         = ${OPTION_SSL}"
    echo
    echo "        LOGDIRECTORY      = ${LOGDIRECTORY}"

    time {
        echo
        echo "    ===== System property file : CLUSTER_TYPE = ${CLUSTER_TYPE}  =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"

        if [[ ${MARIADB_SYSTEMS} ]] ; then
            echo
            echo "        MariaDB Systems"
            for SYSTEM in ${MARIADB_SYSTEMS[*]} ; do
                echo
                echo "            MariaDB System = ${SYSTEM}"
                echo
                echo "            MariaDB System properties:"
                cat properties/${SYSTEM}.properties
                echo
            done
        fi

        if [[ ${MASTER_SYSTEMS} ]] ; then
            echo
            echo "        Master Systems"
            for SYSTEM in ${MASTER_SYSTEMS[*]} ; do
                echo
                echo "            Master System = ${SYSTEM}"
                echo
                echo "            Master System properties:"
                cat properties/${SYSTEM}.properties
                echo
            done
        fi

        if [[ ${REPLICA_SYSTEMS} ]] ; then
            echo
            echo "        Slave Systems"
            for SYSTEM in ${REPLICA_SYSTEMS[*]} ; do
                echo
                echo "            Slave System = ${SYSTEM}"
                echo
                echo "            Slave System properties:"
                cat properties/${SYSTEM}.properties
                echo
            done
        fi

        if [[ ${MAXSCALE_SYSTEMS} ]] ; then
            echo
            echo "        Maxscale Systems"
            for SYSTEM in ${MAXSCALE_SYSTEMS[*]} ; do
                echo
                echo "            Maxscale System = ${SYSTEM}"
                echo
                echo "            Maxscale System properties:"
                cat properties/${SYSTEM}.properties
                echo
            done
        fi

        if [[ ${DRIVER_SYSTEMS} ]] ; then
            echo
            echo "        Driver Systems"
            for DRIVER in ${DRIVER_SYSTEMS[*]} ; do
                echo
                echo "            Driver System = ${DRIVER}"
                echo
                echo "            Driver System properties:"
                cat properties/${DRIVER}.properties
                echo
            done
        fi

        echo
        echo "    ===== MariaDB Node Property Files : CLUSTER_TYPE = ${CLUSTER_TYPE}  =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        # MariaDB Systems
        for SYSTEM in ${MARIADB_SYSTEMS[*]} ${MASTER_SYSTEMS[*]} ${REPLICA_SYSTEMS[*]} ; do
            echo
            echo "            MariaDB System  = mariadb.${SYSTEM}"
            {

                echo
                echo "system.name = mariadb.${SYSTEM}"
                echo
                echo "database = mariadb"
                echo "database.user = cbench"
                echo "database.password = ${OPTION_PASSWORD}"
                [[ $(get_property ${SYSTEM} system.external.ip) ]] && echo "database.external.ips = $(get_property ${SYSTEM} system.external.ip)"
                if [[ ${OPTION_10G_NETWORK} ]] ; then
                    [[ $(get_property ${SYSTEM} system.backend.ip) ]] && echo "database.internal.ips = $(get_property ${SYSTEM} system.backend.ip)"
                else
                    [[ $(get_property ${SYSTEM} system.internal.ip) ]] && echo "database.internal.ips = $(get_property ${SYSTEM} system.internal.ip)"
                fi
                [[ $(get_property ${SYSTEM} system.backend.ip) ]] && echo "database.backend.ips = $(get_property ${SYSTEM} system.backend.ip)"
                echo "database.port = 3306"
                echo
                echo "cluster.nodes = 1"
                echo "cluster.node1 = $(get_property ${SYSTEM} system.external.ip)"
                echo "nodes = $(get_property ${SYSTEM} system.external.ip)"
                [[ $(get_property ${SYSTEM} ssh.user) ]] && echo "ssh.user = $(get_property ${SYSTEM} ssh.user)"
                [[ $(get_property ${SYSTEM} ssh.pem) ]] && echo "ssh.pem = $(get_property ${SYSTEM} ssh.pem)"
                echo
                if [[ ${DRIVER_SYSTEMS} ]] ; then
                    echo "driver.systems = ${DRIVER_SYSTEMS[*]}"
                    echo "driver.nodes = ${#DRIVER_SYSTEMS[@]}"
                    echo "driver.node1 = $(get_property ${DRIVER_SYSTEMS[0]} system.external.ip)"
                    echo -n "drivers ="
                    for DRIVER in ${DRIVER_SYSTEMS[*]} ; do
                        echo -n " $(get_property ${DRIVER} system.external.ip)"
                    done
                    echo
                else
                    echo "driver.nodes = 0"
                fi
                for PROPERTY in server.cloud aws.region aws.zone aws.instance_type gcp.region gcp.zone gpc.driver.zone gcp.instance_type ; do
                    [[ $(get_property ${SYSTEM} ${PROPERTY}) ]] && echo "${PROPERTY} = $(get_property ${SYSTEM} ${PROPERTY})"
                done
            } > properties/mariadb.${SYSTEM}.properties

            echo
            echo "        MariaDB System properties:"
            cat properties/mariadb.${SYSTEM}.properties
            echo

        done


        echo
        echo "    ===== Maxscale Node Property Files : CLUSTER_TYPE = ${CLUSTER_TYPE}  =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        for SYSTEM in ${MAXSCALE_SYSTEMS[*]} ; do
            echo
            echo "            MaxScale System  = maxscale.${SYSTEM}"
            {

                echo
                echo "system.name = maxscale.${SYSTEM}"
                echo
                echo "database = mariadb"
                echo "database.user = cbench"
                echo "database.password = ${OPTION_PASSWORD}"
                [[ $(get_property ${SYSTEM} system.external.ip) ]] && echo "database.external.ips = $(get_property ${SYSTEM} system.external.ip)"
                if [[ ${OPTION_10G_NETWORK} ]] ; then
                    [[ $(get_property ${SYSTEM} system.backend.ip) ]] && echo "database.internal.ips = $(get_property ${SYSTEM} system.backend.ip)"
                else
                    [[ $(get_property ${SYSTEM} system.internal.ip) ]] && echo "database.internal.ips = $(get_property ${SYSTEM} system.internal.ip)"
                fi
                [[ $(get_property ${SYSTEM} system.backend.ip) ]] && echo "database.backend.ips = $(get_property ${SYSTEM} system.backend.ip)"
                echo "database.port = 3306"
                echo
                echo "cluster.nodes = 1"
                echo "cluster.node1 = $(get_property ${SYSTEM} system.external.ip)"
                echo "nodes = $(get_property ${SYSTEM} system.external.ip)"
                [[ $(get_property ${SYSTEM} ssh.user) ]] && echo "ssh.user = $(get_property ${SYSTEM} ssh.user)"
                [[ $(get_property ${SYSTEM} ssh.pem) ]] && echo "ssh.pem = $(get_property ${SYSTEM} ssh.pem)"
                echo
                if [[ ${DRIVER_SYSTEMS} ]] ; then
                    echo "driver.systems = ${DRIVER_SYSTEMS[*]}"
                    echo "driver.nodes = ${#DRIVER_SYSTEMS[@]}"
                    echo "driver.node1 = $(get_property ${DRIVER_SYSTEMS[0]} system.external.ip)"
                    echo -n "drivers ="
                    for DRIVER in ${DRIVER_SYSTEMS[*]} ; do
                        echo -n " $(get_property ${DRIVER} system.external.ip)"
                    done
                    echo
                else
                    echo "driver.nodes = 0"
                fi
                for PROPERTY in server.cloud aws.region aws.zone aws.instance_type gcp.region gcp.zone gpc.driver.zone gcp.instance_type ; do
                    [[ $(get_property ${SYSTEM} ${PROPERTY}) ]] && echo "${PROPERTY} = $(get_property ${SYSTEM} ${PROPERTY})"
                done
            } > properties/maxscale.${SYSTEM}.properties

            echo
            echo "        MaxScale System properties:"
            cat properties/maxscale.${SYSTEM}.properties
            echo
        done


        echo
        echo "    ===== Cluster property file : CLUSTER_TYPE = ${CLUSTER_TYPE}  =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        case ${CLUSTER_TYPE} in

            mariadb_replication)

                echo
                echo "        MariaDB Replication Cluster = ${CLUSTER}"
                {
                    echo
                    echo "cluster.name = ${CLUSTER}"
                    echo "cluster.type = mariadb_replication"
                    echo
                    if [[ ${MAXSCALE_SYSTEMS} ]] ; then
                        echo -n "maxscale.systems ="
                        for SYSTEM in ${MAXSCALE_SYSTEMS[*]} ; do
                            echo -n " maxscale.${SYSTEM}"
                        done
                        echo
                    fi
                    echo "master.systems = mariadb.${MASTER_SYSTEMS[0]}"
                    echo -n "slave.systems ="
                    for SYSTEM in ${REPLICA_SYSTEMS[*]} ; do
                        echo -n " mariadb.${SYSTEM}"
                    done
                    echo

                    echo
                    echo "database = mariadb"
                    [[ $(get_property mariadb.${MASTER_SYSTEMS[0]} database.user) ]] && echo "database.user = $(get_property mariadb.${MASTER_SYSTEMS[0]} database.user)"
                    [[ $(get_property mariadb.${MASTER_SYSTEMS[0]} database.password) ]] && echo "database.password = $(get_property mariadb.${MASTER_SYSTEMS[0]} database.password)"
                    [[ $(get_property mariadb.${MASTER_SYSTEMS[0]} database.external.ips) ]] && echo "database.external.ips = $(get_property mariadb.${MASTER_SYSTEMS[0]} database.external.ips)"
                    [[ $(get_property mariadb.${MASTER_SYSTEMS[0]} database.internal.ips) ]] && echo "database.internal.ips = $(get_property mariadb.${MASTER_SYSTEMS[0]} database.internal.ips)"
                    [[ $(get_property mariadb.${MASTER_SYSTEMS[0]} database.backend.ips) ]] && echo "database.backend.ips = $(get_property mariadb.${MASTER_SYSTEMS[0]} database.backend.ips)"
                    [[ $(get_property mariadb.${MASTER_SYSTEMS[0]} database.port) ]] && echo "database.port = $(get_property mariadb.${MASTER_SYSTEMS[0]} database.port)"

                    echo
                    [[ $(get_property mariadb.${MASTER_SYSTEMS[0]} cluster.nodes) ]] && echo "cluster.nodes = $(get_property mariadb.${MASTER_SYSTEMS[0]} cluster.nodes)"
                    [[ $(get_property mariadb.${MASTER_SYSTEMS[0]} cluster.node1) ]] && echo "cluster.node1 = $(get_property mariadb.${MASTER_SYSTEMS[0]} cluster.node1)"
                    [[ $(get_property mariadb.${MASTER_SYSTEMS[0]} nodes) ]] && echo "nodes = $(get_property mariadb.${MASTER_SYSTEMS[0]} nodes)"
                    echo
                    if [[ ${DRIVER_SYSTEMS} ]] ; then
                        echo "driver.systems = ${DRIVER_SYSTEMS[*]}"
                        echo "driver.nodes = ${#DRIVER_SYSTEMS[@]}"
                        echo "driver.node1 = $(get_property ${DRIVER_SYSTEMS[0]} system.external.ip)"
                        echo -n "drivers ="
                        for DRIVER in ${DRIVER_SYSTEMS[*]} ; do
                            echo -n " $(get_property ${DRIVER} system.external.ip)"
                        done
                        echo
                    fi
                    [[ $(get_property ${MASTER_SYSTEMS[0]} ssh.user) ]] && echo "ssh.user = $(get_property ${MASTER_SYSTEMS[0]} ssh.user)"
                    [[ $(get_property ${MASTER_SYSTEMS[0]} ssh.pem) ]] && echo "ssh.pem = $(get_property ${MASTER_SYSTEMS[0]} ssh.pem)"

                    for PROPERTY in server.cloud aws.region aws.zone aws.instance_type gcp.region gcp.zone gpc.driver.zone gcp.instance_type ; do
                        [[ $(get_property ${MASTER_SYSTEMS[0]} ${PROPERTY}) ]] && echo "${PROPERTY} = $(get_property ${MASTER_SYSTEMS[0]} ${PROPERTY})"
                    done
                } > properties/${CLUSTER}.properties

                echo
                echo "        MariaDB Replication Cluster properties:"
                cat properties/${CLUSTER}.properties
                echo

                ;;

            galera_*|raft_*)

                if [[ ${CLUSTER_TYPE} == 'galera_masterslave' ]] ; then
                    SYSTEMS=( ${MASTER_SYSTEMS[0]} )
                elif [[ ${CLUSTER_TYPE} == 'galera_mastermaster' ]] ; then
                    SYSTEMS=( ${MASTER_SYSTEMS[*]} )
                elif [[ ${CLUSTER_TYPE} == 'raft_masterslave' ]] ; then
                    SYSTEMS=( ${MASTER_SYSTEMS[0]} )
                elif [[ ${CLUSTER_TYPE} == 'raft_mastermaster' ]] ; then
                    SYSTEMS=( ${MASTER_SYSTEMS[*]} )
                else
                    echo "Invalid Cluster Type: CLUSTER_TYPE = ${CLUSTER_TYPE}"; echo -e "$0 ${COMMAND_LINE}"; exit 1;
                fi

                echo
                echo "        Galera Cluster = ${CLUSTER}"
                {
                    echo
                    echo "cluster.name = ${CLUSTER}"
                    echo "cluster.type = ${CLUSTER_TYPE}"
                    echo
                    if [[ ${MAXSCALE_SYSTEMS} ]] ; then
                        echo -n "maxscale.systems ="
                        for SYSTEM in ${MAXSCALE_SYSTEMS[*]} ; do
                            echo -n " maxscale.${SYSTEM}"
                        done
                        echo
                    fi
                    echo -n "galera.systems ="
                    for SYSTEM in ${MASTER_SYSTEMS[*]} ${REPLICA_SYSTEMS[*]} ; do
                        echo -n " mariadb.${SYSTEM}"
                    done
                    echo

                    echo
                    echo "database = mariadb"
                    echo "database.user = cbench"
                    echo "database.password = ${OPTION_PASSWORD}"
                    echo -n "database.external.ips ="
                    for SYSTEM in ${SYSTEMS[*]} ; do
                        echo -n " $(get_property ${SYSTEM} system.external.ip)"
                    done
                    echo

                    if [[ $(get_property ${SYSTEMS[0]} system.internal.ip) ]] ; then
                        echo -n "database.internal.ips ="
                        for SYSTEM in ${SYSTEMS[*]} ; do
                            echo -n " $(get_property ${SYSTEM} system.internal.ip)"
                        done
                        echo
                    fi

                    if [[ $(get_property ${SYSTEMS[0]} system.backend.ip) ]] ; then
                        echo -n "database.backend.ips ="
                        for SYSTEM in ${SYSTEMS[*]} ; do
                            echo -n " $(get_property ${SYSTEM} system.backend.ip)"
                        done
                        echo
                    fi
                    echo "database.port = 3306"
                    echo
                    echo "cluster.nodes = ${#MASTER_SYSTEMS[@]}"
                    echo "cluster.node1 = $(get_property ${SYSTEMS[0]} system.external.ip)"
                    echo -n "nodes ="
                    for SYSTEM in ${SYSTEMS[*]} ; do
                        echo -n " $(get_property ${SYSTEM} system.external.ip)"
                    done
                    echo
                    [[ $(get_property ${SYSTEMS[0]} ssh.user) ]] && echo "ssh.user = $(get_property ${SYSTEMS[0]} ssh.user)"
                    [[ $(get_property ${SYSTEMS[0]} ssh.pem) ]] && echo "ssh.pem = $(get_property ${SYSTEMS[0]} ssh.pem)"
                    echo
                    if [[ ${DRIVER_SYSTEMS} ]] ; then
                        echo "driver.systems = ${DRIVER_SYSTEMS[*]}"
                        echo "driver.nodes = ${#DRIVER_SYSTEMS[@]}"
                        echo "driver.node1 = $(get_property ${DRIVER_SYSTEMS[0]} system.external.ip)"
                        echo -n "drivers ="
                        for DRIVER in ${DRIVER_SYSTEMS[*]} ; do
                            echo -n " $(get_property ${DRIVER} system.external.ip)"
                        done
                        echo
                    else
                        echo "driver.nodes = 0"
                    fi
                    echo
                    echo

                    for PROPERTY in server.cloud aws.region aws.zone aws.instance_type gcp.region gcp.zone gpc.driver.zone gcp.instance_type ; do
                        [[ $(get_property ${SYSTEMS[0]} ${PROPERTY}) ]] && echo "${PROPERTY} = $(get_property ${SYSTEMS[0]} ${PROPERTY})"
                    done
                } > properties/${CLUSTER}.properties

                echo
                echo "        Galera Cluster properties:"
                cat properties/${CLUSTER}.properties
                echo
                ;;

            mariadb)

                echo
                echo "        MariaDB System = ${CLUSTER}"
                {
                    echo
                    echo "cluster.name = ${CLUSTER}"
                    echo "cluster.type = mariadb"
                    echo "system.name = ${CLUSTER}"
                    if [[ ${MAXSCALE_SYSTEMS} ]] ; then
                        echo -n "maxscale.systems ="
                        for SYSTEM in ${MAXSCALE_SYSTEMS[*]} ; do
                            echo -n " maxscale.${SYSTEM}"
                        done
                        echo
                    fi
                    echo -n "mariadb.systems ="
                    for SYSTEM in ${MARIADB_SYSTEMS[*]} ; do
                        echo -n " mariadb.${SYSTEM}"
                    done
                    echo
                    echo "database = mariadb"
                    echo "database.user = cbench"
                    echo "database.password = ${OPTION_PASSWORD}"
                    [[ $(get_property ${MARIADB_SYSTEMS[0]} system.external.ip) ]] && echo "database.external.ips = $(get_property ${MARIADB_SYSTEMS[0]} system.external.ip)"

                    if [[ ${DRIVER_IS_SERVER} ]]; then
                        echo "database.internal.ips = 127.0.0.1"
                    else
                        if [[ ${OPTION_10G_NETWORK} ]] ; then
                            [[ $(get_property ${MARIADB_SYSTEMS[0]} system.backend.ip) ]] && echo "database.internal.ips = $(get_property ${MARIADB_SYSTEMS[0]} system.backend.ip)"
                        else
                            [[ $(get_property ${MARIADB_SYSTEMS[0]} system.internal.ip) ]] && echo "database.internal.ips = $(get_property ${MARIADB_SYSTEMS[0]} system.internal.ip)"
                        fi
                    fi

                    [[ $(get_property ${MARIADB_SYSTEMS[0]} system.backend.ip) ]] && echo "database.backend.ips = $(get_property ${MARIADB_SYSTEMS[0]} system.backend.ip)"
                    echo "database.port = 3306"
                    echo
                    echo "cluster.nodes = 1"
                    echo "cluster.node1 = $(get_property ${MARIADB_SYSTEMS[0]} system.external.ip)"
                    echo "nodes = $(get_property ${MARIADB_SYSTEMS[0]} system.external.ip)"
                    [[ $(get_property ${MARIADB_SYSTEMS[0]} ssh.user) ]] && echo "ssh.user = $(get_property ${MARIADB_SYSTEMS[0]} ssh.user)"
                    [[ $(get_property ${MARIADB_SYSTEMS[0]} ssh.pem) ]] && echo "ssh.pem = $(get_property ${MARIADB_SYSTEMS[0]} ssh.pem)"
                    echo

                    if [[ ${DRIVER_IS_SERVER} ]]; then
                        echo "driver.systems = ${MARIADB_SYSTEMS[*]}"
                        echo "driver.nodes = ${#MARIADB_SYSTEMS[@]}"
                        echo "driver.node1 = $(get_property ${MARIADB_SYSTEMS[0]} system.external.ip)"
                        echo -n "drivers ="
                        for DRIVER in ${MARIADB_SYSTEMS[*]} ; do
                            echo -n " $(get_property ${DRIVER} system.external.ip)"
                        done
                    else
                        if [[ ${DRIVER_SYSTEMS} ]] ; then
                            echo "driver.systems = ${DRIVER_SYSTEMS[*]}"
                            echo "driver.nodes = ${#DRIVER_SYSTEMS[@]}"
                            echo "driver.node1 = $(get_property ${DRIVER_SYSTEMS[0]} system.external.ip)"
                            echo -n "drivers ="
                            for DRIVER in ${DRIVER_SYSTEMS[*]} ; do
                                echo -n " $(get_property ${DRIVER} system.external.ip)"
                            done
                            echo
                        else
                            echo "driver.nodes = 0"
                        fi
                    fi
                    echo
                    for PROPERTY in server.cloud aws.region aws.zone aws.instance_type gcp.region gcp.zone gpc.driver.zone gcp.instance_type ; do
                        [[ $(get_property ${MARIADB_SYSTEMS[0]} ${PROPERTY}) ]] && echo "${PROPERTY} = $(get_property ${MARIADB_SYSTEMS[0]} ${PROPERTY})"
                    done
                } > properties/${CLUSTER}.properties

                echo
                echo "        MariaDB System properties:"
                cat properties/${CLUSTER}.properties
                echo

                ;;

            *) echo "Invalid Cluster Type: CLUSTER_TYPE = ${CLUSTER_TYPE}"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1 ;;

        esac

        if [[ ${MAXSCALE_SYSTEMS} ]] ; then
            echo
            echo "        Maxscale Cluster = ${CLUSTER}.maxscale"
            {

                echo
                echo "cluster.name = ${CLUSTER}.maxscale"
                echo "cluster.type = $(get_property ${CLUSTER} cluster.type)"
                echo
                for PROPERTY in maxscale.systems mariadb.systems master.systems slave.systems galera.systems; do
                    [[ $(get_property ${CLUSTER} ${PROPERTY}) ]] && echo "${PROPERTY} = $(get_property ${CLUSTER} ${PROPERTY})"
                done
                echo
                for PROPERTY in database database.user database.password database.port; do
                    [[ $(get_property ${CLUSTER} ${PROPERTY}) ]] && echo "${PROPERTY} = $(get_property ${CLUSTER} ${PROPERTY})"
                done

                echo -n "database.external.ips ="
                for SYSTEM in ${MAXSCALE_SYSTEMS[*]} ; do
                    echo -n " $(get_property ${SYSTEM} system.external.ip)"
                done
                echo

                if [[ ${OPTION_10G_NETWORK} ]] ; then
                    if [[ $(get_property ${MAXSCALE_SYSTEMS[0]} system.backend.ip) ]] ; then
                        echo -n "database.internal.ips ="
                        for SYSTEM in ${MAXSCALE_SYSTEMS[*]} ; do
                            echo -n " $(get_property ${SYSTEM} system.backend.ip)"
                        done
                        echo
                    fi
                else
                    if [[ $(get_property ${MAXSCALE_SYSTEMS[0]} system.internal.ip) ]] ; then
                        echo -n "database.internal.ips ="
                        for SYSTEM in ${MAXSCALE_SYSTEMS[*]} ; do
                            echo -n " $(get_property ${SYSTEM} system.internal.ip)"
                        done
                        echo
                    fi
                fi

                if [[ $(get_property ${MAXSCALE_SYSTEMS[0]} system.backend.ip) ]] ; then
                    echo -n "database.backend.ips ="
                    for SYSTEM in ${MAXSCALE_SYSTEMS[*]} ; do
                        echo -n " $(get_property ${SYSTEM} system.backend.ip)"
                    done
                    echo
                fi

                if [[ ${OPTION_SSL} ]] ; then
                   echo "database.ssl = true"
                fi

                echo
                echo "cluster.nodes = ${#MAXSCALE_SYSTEMS[@]}"
                echo "cluster.node1 = $(get_property ${MAXSCALE_SYSTEMS[0]} system.external.ip)"
                echo -n "nodes ="
                for SYSTEM in ${MAXSCALE_SYSTEMS[*]} ; do
                    echo -n " $(get_property ${SYSTEM} system.external.ip)"
                done
                echo

                for PROPERTY in ssh.user ssh.pem; do
                    [[ $(get_property ${CLUSTER} ${PROPERTY}) ]] && echo "${PROPERTY} = $(get_property ${CLUSTER} ${PROPERTY})"
                done
                echo
                for PROPERTY in driver.systems driver.nodes driver.node1 drivers; do
                    [[ $(get_property ${CLUSTER} ${PROPERTY}) ]] && echo "${PROPERTY} = $(get_property ${CLUSTER} ${PROPERTY})"
                done
                echo
                for PROPERTY in server.cloud aws.region aws.zone aws.instance_type gcp.region gcp.zone gpc.driver.zone gcp.instance_type; do
                    [[ $(get_property ${CLUSTER} ${PROPERTY}) ]] && echo "${PROPERTY} = $(get_property ${CLUSTER} ${PROPERTY})"
                done

            } > properties/${CLUSTER}.maxscale.properties

            echo
            echo "        Maxscale Cluster properties:"
            cat properties/${CLUSTER}.maxscale.properties
        fi

    }

    echo
    echo "    ===== End $0 ( Elapsed Seconds = $(( ${SECONDS} - ${STARTSECONDS} )) ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
