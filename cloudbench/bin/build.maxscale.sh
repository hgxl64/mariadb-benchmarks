#!/bin/bash

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0
    Build MaxScale nodes of the given cluster

    Parameters:
        --cluster
        --initdb
        --source        where to get MaxScale packages
        --version       version of MaxScale
        --arm           use ARM binaries (default: x86_64)
        --ssl
        -h|--help

    Notes:

    1.  xxx
"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in
        --cluster)          CLUSTER="$1"; shift;;
        --source)           MAXSCALE_SOURCE="$1"; shift;;
        --version)          MAXSCALE_VERSION="$1"; shift;;
        --arm)              OPTION_MAXSCALE_ARM=TRUE;;
        --initdb)           OPTION_INITDB=TRUE;;
        --ssl)              OPTION_SSL=TRUE;;
        -h|--help) echo -e "$USAGE"; exit 1;;
        *) echo "Invalid input switch: $key"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done

process_connection_info;

[[ ${CLUSTER} ]] || { echo "Required CLUSTER not specified." ; exit 1 ; }
MAXSCALE_SYSTEMS=( $(get_property ${CLUSTER} maxscale.systems) )
[[ ${MAXSCALE_SYSTEMS} ]] || { echo "WARNING: Cluster not configured with maxscale.systems.  No action taken." ; exit 1 ; }

# https://mdbe-ci-repo.mariadb.net/MaxscaleEnterprise/maxscale-25.10.2-release/bintar/ubuntu/noble/x86_64/
[[ ${MAXSCALE_SOURCE} ]]  || MAXSCALE_SOURCE="jenkins"
[[ ${MAXSCALE_RELEASE} ]] || MAXSCALE_RELEASE="maxscale-25.10.2-release"
[[ ${OPTION_SSL} ]]       || OPTION_SSL=FALSE
[[ ${MAX_SLAVE_LAG} ]]    || MAX_SLAVE_LAG='10s'
[[ ${SLAVE_SELECTION} ]]  || SLAVE_SELECTION='LEAST_CURRENT_OPERATIONS'
[[ ${MASTER_READS} ]]     || MASTER_READS='false'
[[ ${GALERA_ALL_WRITE} ]] || GALERA_ALL_WRITE=FALSE

# target architecture
if [[ ! ${MAXSCALE_ARCH} ]] ; then
    MAXSCALE_ARCH="x86_64"
    [[ ${OPTION_MAXSCALE_ARM} = TRUE ]] && MAXSCALE_ARCH="aarch64"
fi


TEST_NAME=build.maxscale
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
    STARTSECONDS=$SECONDS

    echo "        CLUSTER               = ${CLUSTER}"
    echo "        COMMAND_LINE          = ${COMMAND_LINE}"
    echo "        LOGDIRECTORY          = ${LOGDIRECTORY}"

    echo
    echo "            Properties File:"
    showproperties
    echo

    if [[ ${OPTION_INITDB} ]] ; then
        echo
        echo "    ===== Cleanup Any Previous Database Systems =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        for SYSTEM in ${MAXSCALE_SYSTEMS[*]} ; do
            cleandb.sh --system ${SYSTEM} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).cleandb.${SYSTEM}.log 2>&1
        done
    fi

    echo
    echo "    ===== Step 1:  Install Maxscale  =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    time {

        if [[ ${MAXSCALE_SOURCE} = 'jenkins' ]] ; then
            BASE_URL="https://mdbe-ci-repo.mariadb.net/MaxscaleEnterprise/${MAXSCALE_RELEASE}/bintar/ubuntu/noble/${MAXSCALE_ARCH}"
            if ( ! wget --user=$(vault 'maxscale_packages_user') \
                        --password=$(vault 'maxscale_packages_pass') \
                        ${BASE_URL}/ -O dirlist)
            then
                error "        failed to download '${BASE_URL}'"
            fi
            DISTFILE=$(cat dirlist | perl -ne 'print "$1\n" if (/<a href="(.*?\.tar\.gz)"/)' | head -1)
            TARGET="${DOWNLOAD_DIR}/${DISTFILE%.tar.gz}-${MAXSCALE_ARCH}.tar.gz"
            if [[ -f ${TARGET} ]] ; then
                echo "        ${TARGET} already exists, not downloading"
            else
                if ( wget --user=$(vault 'maxscale_packages_user') \
                          --password=$(vault 'maxscale_packages_pass') \
                          ${BASE_URL}/${DISTFILE} -O ${TARGET})
                then
                    echo "        downloaded '${TARGET}'"
                    echo "        from '${BASE_URL}/${DISTFILE}'"
                else
                    error "        failed to download '${BASE_URL}/${DISTFILE}'"
                fi
            fi
            rm dirlist
        else
            echo "Invalid MaxScale source specified: $MAXSCALE_SOURCE"; exit 1;
        fi

        for SYSTEM in ${MAXSCALE_SYSTEMS[*]} ; do
            for NODE in $(getproperty ${SYSTEM} nodes) ; do
                echo
                echo "        Cluster = ${CLUSTER}, System = ${SYSTEM}, Node = ${NODE}"
                echo
                ssh $(get_ssh_connection ${SYSTEM} ${NODE}) '
                    if [[ ! -d /data/cbench/install ]]; then
                        sudo mkdir -p /data/cbench/install
                        sudo chown -R /data $(whoami)
                    fi
                '
                if ( scp $(get_scp_copy_to_connection ${SYSTEM} ${NODE} ${TARGET} /data/cbench/) ) ; then
                    echo "        copied ${TARGET} to ${SYSTEM}"
                else
                    error "        scp to ${SYSTEM} failed"
                fi
                ssh $(get_ssh_connection ${SYSTEM} ${NODE}) '
                    cd /data/cbench
                    tar xfz '$(basename ${TARGET})' -C install --strip-components=1
                '
            done
        done
    }

    echo
    echo "    ===== Step 2:  Configure MaxScale =====  [ $(date -u '+%Y-%m-%d %H:%M:%S') ]"

    CLUSTER_TYPE=$(get_property ${CLUSTER} cluster.type)

    if [[ ${CLUSTER_TYPE} == 'mariadb_replication' ]] ; then

        unset SERVER_NODES
        for SYSTEM in $(get_property ${CLUSTER} master.systems) $(get_property ${CLUSTER} slave.systems) ; do
            SERVER_NODES=( ${SERVER_NODES[*]} $(get_database_backend_ips ${SYSTEM}) )
        done

        for SYSTEM in ${MAXSCALE_SYSTEMS[*]} ; do
            for NODE in $(getproperty ${SYSTEM} nodes) ; do
                echo
                echo "        Cluster = ${CLUSTER}, System = ${SYSTEM}, Node = ${NODE}"
                echo
                {
                    echo "[maxscale]"
                    echo "threads=auto"
                    echo "syslog=0"
                    echo "maxlog=1"
                    echo
                    if [[ ${OPTION_SSL} == TRUE ]] ; then
                        echo "ssl_cert = /data/cbench/install/etc/certificates/server-cert.pem"
                        echo "ssl_key = /data/cbench/install/etc/certificates/server-key.pem"
                        echo "ssl_ca_cert = /data/cbench/install/etc/certificates/ca.pem"
                        echo "ssl = true"
                    fi
                    echo
                    IDX=1
                    for SERVER in ${SERVER_NODES[*]} ; do
                        echo "[MariaDBServer${IDX}]"
                        echo "type=server"
                        echo "address=${SERVER}"
                        echo "port=${DBPORT}"
                        echo
                        if (( ${IDX} == 1 )) ; then
                            SERVERS="MariaDBServer${IDX}"
                        else
                            SERVERS="${SERVERS},MariaDBServer${IDX}"
                            if (( ${IDX} == 2 )) ; then
                                REPLICAS="MariaDBServer${IDX}"
                            else
                                REPLICAS="${REPLICAS},MariaDBServer${IDX}"
                            fi
                        fi
                        (( IDX = ${IDX} + 1 ))
                    done

                    echo "[MariaDBMonitor]"
                    echo "type=monitor"
                    echo "module=mariadbmon"
                    echo "servers=${SERVERS}"
                    echo "user=${DBUSER}"
                    echo "password=${DBPASSWORD}"
                    echo
                    echo "[ReadWriteService]"
                    echo "type=service"
                    echo "router=readwritesplit"
                    echo "servers=${SERVERS}"
                    echo "user=${DBUSER}"
                    echo "password=${DBPASSWORD}"
                    echo "max_slave_replication_lag=${MAX_SLAVE_LAG}"
                    echo "slave_selection_criteria=${SLAVE_SELECTION}"
                    echo "master_accept_reads=${MASTER_READS}"
                    echo
                    echo "[ReadWriteListener]"
                    echo "type=listener"
                    echo "service=ReadWriteService"
                    echo "address=0.0.0.0"
                    echo "port=${DBPORT}"
                    echo

                } | ssh $(get_ssh_connection ${SYSTEM} ${NODE}) "cat > /data/cbench/install/etc/maxscale.cnf"
            done
        done

    elif [[ ${CLUSTER_TYPE} == 'mariadb_standalone'
            || ${CLUSTER_TYPE} == 'mariadb'
            || ${CLUSTER_TYPE} == 'mysql' ]] ; then

        unset SERVER_NODES
        for SYSTEM in $(get_property ${CLUSTER} mariadb.systems) ; do
            SERVER_NODES=( ${SERVER_NODES[*]} $(get_database_backend_ips ${SYSTEM}) )
        done

        for SYSTEM in ${MAXSCALE_SYSTEMS[*]} ; do
            for NODE in $(getproperty ${SYSTEM} nodes) ; do
                echo
                echo "        Cluster = ${CLUSTER}, System = ${SYSTEM}, Node = ${NODE}"
                echo
                {
                    echo "[maxscale]"
                    echo "threads=auto"
                    echo "syslog=0"
                    echo "maxlog=1"
                    echo
                    if [[ ${OPTION_SSL} == TRUE ]] ; then
                        echo "ssl_cert = /data/cbench/install/etc/certificates/server-cert.pem"
                        echo "ssl_key = /data/cbench/install/etc/certificates/server-key.pem"
                        echo "ssl_ca_cert = /data/cbench/install/etc/certificates/ca.pem"
                        echo "ssl = true"
                    fi
                    echo
                    IDX=1
                    for SERVER in ${SERVER_NODES[*]} ; do
                        echo "[MariaDBServer${IDX}]"
                        echo "type=server"
                        echo "address=${SERVER}"
                        echo "port=${DBPORT}"
                        echo
                        if (( ${IDX} == 1 )) ; then
                            SERVERS="MariaDBServer${IDX}"
                        else
                            SERVERS="${SERVERS},MariaDBServer${IDX}"
                        fi
                        (( IDX = ${IDX} + 1 ))
                    done

                    echo "[MariaDBMonitor]"
                    echo "type=monitor"
                    echo "module=mariadbmon"
                    echo "servers=${SERVERS}"
                    echo "user=${DBUSER}"
                    echo "password=${DBPASSWORD}"
                    echo
                    echo "[RoundRobinService]"
                    echo "type=service"
                    echo "router=readconnroute"
                    echo "servers=${SERVERS}"
                    echo "user=${DBUSER}"
                    echo "password=${DBPASSWORD}"
                    echo
                    echo "[RoundRobinListener]"
                    echo "type=listener"
                    echo "service=RoundRobinService"
                    echo "address=0.0.0.0"
                    echo "port=${DBPORT}"
                    echo

                } | ssh $(get_ssh_connection ${SYSTEM} ${NODE}) "cat > /data/cbench/install/etc/maxscale.cnf"
            done
        done

    elif [[ ${CLUSTER_TYPE} == 'galera_*' ]] ; then

        if [[ ${CLUSTER_TYPE} == 'galera_mastermaster' ]] ; then
            MULTIMASTER=TRUE
        else
            MULTIMASTER=FALSE
        fi

        unset SERVER_NODES
        for SYSTEM in $(get_property ${CLUSTER} galera.systems) ; do
            SERVER_NODES=( ${SERVER_NODES[*]} $(get_database_backend_ips ${SYSTEM}) )
        done

        for SYSTEM in ${MAXSCALE_SYSTEMS[*]} ; do
            for NODE in $(getproperty ${SYSTEM} nodes) ; do
                echo
                echo "        Cluster = ${CLUSTER}, System = ${SYSTEM}, Node = ${NODE}"
                echo
                {
                    echo "[maxscale]"
                    echo "threads=auto"
                    echo "syslog=0"
                    echo "maxlog=1"
                    echo
                    if [[ ${OPTION_SSL} == TRUE ]] ; then
                        echo "ssl_cert = /data/cbench/install/etc/certificates/server-cert.pem"
                        echo "ssl_key = /data/cbench/install/etc/certificates/server-key.pem"
                        echo "ssl_ca_cert = /data/cbench/install/etc/certificates/ca.pem"
                        echo "ssl = true"
                    fi
                    echo
                    IDX=1
                    for SERVER in ${SERVER_NODES[*]} ; do
                        echo "[Galera${IDX}]"
                        echo "type=server"
                        echo "address=${SERVER}"
                        echo "port=${DBPORT}"
                        echo "priority=${IDX}"
                        echo
                        if (( ${IDX} == 1 )) ; then
                            SERVERS="Galera${IDX}"
                        else
                            SERVERS="${SERVERS},Galera${IDX}"
                        fi
                        (( IDX = ${IDX} + 1 ))
                    done

                    echo "[GaleraMonitor]"
                    echo "type=monitor"
                    echo "module=galeramon"
                    echo "servers=${SERVERS}"
                    echo "use_priority=true"
                    echo "user=${DBUSER}"
                    echo "password=${DBPASSWORD}"
                    echo
                    echo "[GaleraService]"
                    echo "type=service"
                    if [[ ${MULTIMASTER} == TRUE ]] ; then
                        echo "router=readconnroute"
                        echo "router_options=running"
                    else
                        echo "router=readwritesplit"
                        echo "router_options=synced"
                        echo "slave_selection_criteria=${SLAVE_SELECTION}"
                        echo "master_accept_reads=${MASTER_READS}"
                    fi
                    echo "servers=${SERVERS}"
                    echo "user=${DBUSER}"
                    echo "password=${DBPASSWORD}"
                    echo "max_slave_replication_lag=${MAX_SLAVE_LAG}"
                    echo "slave_selection_criteria=${SLAVE_SELECTION}"
                    echo "master_accept_reads=${MASTER_READS}"
                    echo
                    echo "[GaleraListener]"
                    echo "type=listener"
                    echo "service=GaleraService"
                    echo "address=0.0.0.0"
                    echo "port=${DBPORT}"
                    echo

                } | ssh $(get_ssh_connection ${SYSTEM} ${NODE}) "cat > /data/cbench/install/etc/maxscale.cnf"
            done
        done
    fi

    if [[ ${OPTION_SSL} == TRUE ]] ; then
        echo
        echo "    Copying over SSL certificates"
        echo
        for SYSTEM in ${MAXSCALE_SYSTEMS[*]} ; do
           for NODE in $(getproperty ${SYSTEM} nodes) ; do
               echo
               echo "        Cluster = ${CLUSTER}, System = ${SYSTEM}, Node = ${NODE}"
               echo
               ssh $(get_ssh_connection ${SYSTEM} ${NODE}) "mkdir -p /data/cbench/install/etc/certificates"
               for f in server-cert.pem server-key.pem ca.pem; do
                   [[ -e ~/openssl/${f}] ]] && echo "${f} :"
                   cat ~/openssl/${f} | ssh $(get_ssh_connection ${SYSTEM} ${NODE}) "cat > /data/cbench/install/etc/certificates/${f}"
               done
           done
        done
    fi

    echo
    echo "    MaxScale Config"
    echo
    for SYSTEM in ${MAXSCALE_SYSTEMS[*]} ; do
        for NODE in $(getproperty ${SYSTEM} nodes) ; do
            echo
            echo "        Cluster = ${CLUSTER}, System = ${SYSTEM}, Node = ${NODE}"
            echo
            ssh $(get_ssh_connection ${SYSTEM} ${NODE}) "cat > /data/cbench/install/etc/maxscale.cnf" \
                | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${NODE}.maxscale.conf 2>&1
        done
    done

    echo
    echo "    ===== Step 3:  Start Maxscale  =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    time {
        for SYSTEM in ${MAXSCALE_SYSTEMS[*]} ; do
            for NODE in $(getproperty ${SYSTEM} nodes) ; do
                echo
                echo "        Cluster = ${CLUSTER}, System = ${SYSTEM}, Node = ${NODE}"
                echo
                ssh $(get_ssh_connection ${SYSTEM} ${NODE}) '
                    uname -n
                    export PATH=/data/cbench/install/bin:${PATH}
                    maxscale --nodaemon --basedir=/data/cbench/install --config=/data/cbench/install/etc/maxscale.cnf &
                    sleep 5
                    ps fax
               '
                ssh $(get_ssh_connection ${SYSTEM} ${NODE}) 'cat /data/cbench/install/var/log/maxscale/maxscale.log' \
                | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${NODE}.maxscale.log 2>&1
            done
        done
    }

    echo
    echo "    ===== Step 5:  Check Cluster =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    time {
        check.cluster.sh --cluster ${CLUSTER}
    }

    echo
    echo "    Cluster = ${CLUSTER}"
    echo "        Database Connection: mysql $(get_database_connection ${CLUSTER})"
    if [[ ${OPTION_SSL} == TRUE ]] ; then
        echo "        Version: $(mysql -sN $(get_database_connection ${CLUSTER}) --ssl -e 'select version();')"
    else
        echo "        Version: $(mysql -sN $(get_database_connection ${CLUSTER}) -e 'select version();')"
    fi
    echo
    echo "    ===== End $0 ( Elapsed Seconds = $(( $SECONDS - $STARTSECONDS )) ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
