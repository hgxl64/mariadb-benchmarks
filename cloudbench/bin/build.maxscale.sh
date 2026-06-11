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
        --maxscale-source)  MAXSCALE_SOURCE="$1"; shift;;
        --maxscale-version) MAXSCALE_VERSION="$1"; shift;;
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

        if [[ ${MAXSCALE_SOURCE} == 'jenkins' ]] ; then
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
                          --quiet ${BASE_URL}/${DISTFILE} -O ${TARGET})
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
                    if [[ ! -d /data/cbench/install ]] ; then
                        sudo mkdir -p /data/cbench
                        sudo chmod -R a+rwx /data
                    fi
                    mkdir /data/cbench/install
                '
                if ( time scp $(get_scp_copy_to_connection ${SYSTEM} ${NODE} ${TARGET} /data/cbench/) ) ; then
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
    CONFIG_FILE="/data/cbench/install/etc/maxscale.cnf"

    if [[ ${CLUSTER_TYPE} == 'mariadb_replication' ]] ; then

        unset SERVER_NODES
        for SYSTEM in $(get_property ${CLUSTER} master.systems) $(get_property ${CLUSTER} slave.systems) ; do
            SERVER_NODES=( ${SERVER_NODES[*]} $(get_database_backend_ips ${SYSTEM}) )
        done

        for SYSTEM in ${MAXSCALE_SYSTEMS[*]} ; do
            for NODE in $(getproperty ${SYSTEM} nodes) ; do
                echo
                echo "        Cluster-Type = ${CLUSTER_TYPE}, Node = ${NODE}"
                echo
                ssh $(get_ssh_connection ${SYSTEM} ${NODE}) '
                    SERVER_NODES=( "'${SERVER_NODES[*]}'" )
                    DBUSER="'$(get_database_user)'"
                    DBPASSWORD="'$(get_database_password)'"
                    DBPORT="'$(get_database_port)'"
                    OPTION_SSL="'${OPTION_SSL}'"
                    MAX_SLAVE_LAG="'${MAX_SLAVE_LAG}'"
                    SLAVE_SELECTION="'${SLAVE_SELECTION}'"
                    MASTER_READS="'${MASTER_READS}'"
                    CONFIG_FILE="'${CONFIG_FILE}'"

                    [[ -f ${CONFIG_FILE} ]] && rm ${CONFIG_FILE}

                    echo "[maxscale]"                                       >> ${CONFIG_FILE}
                    echo "threads=auto"                                     >> ${CONFIG_FILE}
                    echo "syslog=0"                                         >> ${CONFIG_FILE}
                    echo "maxlog=1"                                         >> ${CONFIG_FILE}
                    echo                                                    >> ${CONFIG_FILE}

                    if [[ ${OPTION_SSL} == TRUE ]] ; then
                        echo "ssl_cert = /data/cbench/install/etc/certificates/server-cert.pem" >> ${CONFIG_FILE}
                        echo "ssl_key = /data/cbench/install/etc/certificates/server-key.pem"   >> ${CONFIG_FILE}
                        echo "ssl_ca_cert = /data/cbench/install/etc/certificates/ca.pem"       >> ${CONFIG_FILE}
                        echo "ssl = true"                                                       >> ${CONFIG_FILE}
                        echo                                                                    >> ${CONFIG_FILE}
                    fi

                    IDX=1
                    for SERVER in ${SERVER_NODES[*]} ; do
                        echo "[MariaDBServer${IDX}]"                        >> ${CONFIG_FILE}
                        echo "type=server"                                  >> ${CONFIG_FILE}
                        echo "address=${SERVER}"                            >> ${CONFIG_FILE}
                        echo "port=${DBPORT}"                               >> ${CONFIG_FILE}
                        echo "priority=${IDX}"                              >> ${CONFIG_FILE}
                        echo                                                >> ${CONFIG_FILE}
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

                    echo "[MariaDBMonitor]"                                 >> ${CONFIG_FILE}
                    echo "type=monitor"                                     >> ${CONFIG_FILE}
                    echo "module=mariadbmon"                                >> ${CONFIG_FILE}
                    echo "servers=${SERVERS}"                               >> ${CONFIG_FILE}
                    echo "user=${DBUSER}"                                   >> ${CONFIG_FILE}
                    echo "password=${DBPASSWORD}"                           >> ${CONFIG_FILE}
                    echo                                                    >> ${CONFIG_FILE}
                    echo "[ReadWriteService]"                               >> ${CONFIG_FILE}
                    echo "type=service"                                     >> ${CONFIG_FILE}
                    echo "router=readwritesplit"                            >> ${CONFIG_FILE}
                    echo "servers=${SERVERS}"                               >> ${CONFIG_FILE}
                    echo "user=${DBUSER}"                                   >> ${CONFIG_FILE}
                    echo "password=${DBPASSWORD}"                           >> ${CONFIG_FILE}
                    echo "max_slave_replication_lag=${MAX_SLAVE_LAG}"       >> ${CONFIG_FILE}
                    echo "slave_selection_criteria=${SLAVE_SELECTION}"      >> ${CONFIG_FILE}
                    echo "master_accept_reads=${MASTER_READS}"              >> ${CONFIG_FILE}
                    echo                                                    >> ${CONFIG_FILE}
                    echo "[ReadWriteListener]"                              >> ${CONFIG_FILE}
                    echo "type=listener"                                    >> ${CONFIG_FILE}
                    echo "service=ReadWriteService"                         >> ${CONFIG_FILE}
                    echo "address=0.0.0.0"                                  >> ${CONFIG_FILE}
                    echo "port=${DBPORT}"                                   >> ${CONFIG_FILE}
                    echo                                                    >> ${CONFIG_FILE}
                '
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
                echo "        Cluster-Type = ${CLUSTER_TYPE}, Node = ${NODE}"
                echo
                ssh $(get_ssh_connection ${SYSTEM} ${NODE}) '
                    SERVER_NODES=( "'${SERVER_NODES[*]}'" )
                    DBUSER="'$(get_database_user)'"
                    DBPASSWORD="'$(get_database_password)'"
                    DBPORT="'$(get_database_port)'"
                    OPTION_SSL="'${OPTION_SSL}'"
                    CONFIG_FILE="'${CONFIG_FILE}'"

                    [[ -f ${CONFIG_FILE} ]] && rm ${CONFIG_FILE}

                    echo "[maxscale]"                                       >> ${CONFIG_FILE}
                    echo "threads=auto"                                     >> ${CONFIG_FILE}
                    echo "syslog=0"                                         >> ${CONFIG_FILE}
                    echo "maxlog=1"                                         >> ${CONFIG_FILE}
                    echo                                                    >> ${CONFIG_FILE}

                    if [[ ${OPTION_SSL} == TRUE ]] ; then
                        echo "ssl_cert = /data/cbench/install/etc/certificates/server-cert.pem" >> ${CONFIG_FILE}
                        echo "ssl_key = /data/cbench/install/etc/certificates/server-key.pem"   >> ${CONFIG_FILE}
                        echo "ssl_ca_cert = /data/cbench/install/etc/certificates/ca.pem"       >> ${CONFIG_FILE}
                        echo "ssl = true"                                                       >> ${CONFIG_FILE}
                        echo                                                                    >> ${CONFIG_FILE}
                    fi

                    IDX=1
                    for SERVER in ${SERVER_NODES[*]} ; do
                        echo "[MariaDBServer${IDX}]"                        >> ${CONFIG_FILE}
                        echo "type=server"                                  >> ${CONFIG_FILE}
                        echo "address=${SERVER}"                            >> ${CONFIG_FILE}
                        echo "port=${DBPORT}"                               >> ${CONFIG_FILE}
                        echo "priority=${IDX}"                              >> ${CONFIG_FILE}
                        echo                                                >> ${CONFIG_FILE}
                        if (( ${IDX} == 1 )) ; then
                            SERVERS="MariaDBServer${IDX}"
                        else
                            SERVERS="${SERVERS},MariaDBServer${IDX}"
                        fi
                        (( IDX = ${IDX} + 1 ))
                    done

                    echo "[MariaDBMonitor]"                                 >> ${CONFIG_FILE}
                    echo "type=monitor"                                     >> ${CONFIG_FILE}
                    echo "module=mariadbmon"                                >> ${CONFIG_FILE}
                    echo "servers=${SERVERS}"                               >> ${CONFIG_FILE}
                    echo "user=${DBUSER}"                                   >> ${CONFIG_FILE}
                    echo "password=${DBPASSWORD}"                           >> ${CONFIG_FILE}
                    echo                                                    >> ${CONFIG_FILE}
                    echo "[RoundRobinService]"                              >> ${CONFIG_FILE}
                    echo "type=service"                                     >> ${CONFIG_FILE}
                    echo "router=readconnroute"                             >> ${CONFIG_FILE}
                    echo "servers=${SERVERS}"                               >> ${CONFIG_FILE}
                    echo "user=${DBUSER}"                                   >> ${CONFIG_FILE}
                    echo "password=${DBPASSWORD}"                           >> ${CONFIG_FILE}
                    echo                                                    >> ${CONFIG_FILE}
                    echo "[RoundRobinListener]"                             >> ${CONFIG_FILE}
                    echo "type=listener"                                    >> ${CONFIG_FILE}
                    echo "service=RoundRobinService"                        >> ${CONFIG_FILE}
                    echo "address=0.0.0.0"                                  >> ${CONFIG_FILE}
                    echo "port=${DBPORT}"                                   >> ${CONFIG_FILE}
                    echo                                                    >> ${CONFIG_FILE}
                '
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
                echo "        Cluster-Type = ${CLUSTER_TYPE}, Node = ${NODE}"
                echo
                ssh $(get_ssh_connection ${SYSTEM} ${NODE}) '
                    SERVER_NODES=( "'${SERVER_NODES[*]}'" )
                    DBUSER="'$(get_database_user)'"
                    DBPASSWORD="'$(get_database_password)'"
                    DBPORT="'$(get_database_port)'"
                    OPTION_SSL="'${OPTION_SSL}'"
                    MAX_SLAVE_LAG="'${MAX_SLAVE_LAG}'"
                    SLAVE_SELECTION="'${SLAVE_SELECTION}'"
                    MULTIMASTER="'${MULTIMASTER}'"
                    CONFIG_FILE="'${CONFIG_FILE}'"

                    [[ -f ${CONFIG_FILE} ]] && rm ${CONFIG_FILE}

                    echo "[maxscale]"                                       >> ${CONFIG_FILE}
                    echo "threads=auto"                                     >> ${CONFIG_FILE}
                    echo "syslog=0"                                         >> ${CONFIG_FILE}
                    echo "maxlog=1"                                         >> ${CONFIG_FILE}
                    echo                                                    >> ${CONFIG_FILE}

                    if [[ ${OPTION_SSL} == TRUE ]] ; then
                        echo "ssl_cert = /data/cbench/install/etc/certificates/server-cert.pem" >> ${CONFIG_FILE}
                        echo "ssl_key = /data/cbench/install/etc/certificates/server-key.pem"   >> ${CONFIG_FILE}
                        echo "ssl_ca_cert = /data/cbench/install/etc/certificates/ca.pem"       >> ${CONFIG_FILE}
                        echo "ssl = true"                                                       >> ${CONFIG_FILE}
                        echo                                                                    >> ${CONFIG_FILE}
                    fi

                    IDX=1
                    for SERVER in ${SERVER_NODES[*]} ; do
                        echo "[Galera${IDX}]"                               >> ${CONFIG_FILE}
                        echo "type=server"                                  >> ${CONFIG_FILE}
                        echo "address=${SERVER}"                            >> ${CONFIG_FILE}
                        echo "port=${DBPORT}"                               >> ${CONFIG_FILE}
                        echo "priority=${IDX}"                              >> ${CONFIG_FILE}
                        echo                                                >> ${CONFIG_FILE}
                        if (( ${IDX} == 1 )) ; then
                            SERVERS="Galera${IDX}"
                        else
                            SERVERS="${SERVERS},Galera${IDX}"
                        fi
                        (( IDX = ${IDX} + 1 ))
                    done

                    echo "[GaleraMonitor]"                                  >> ${CONFIG_FILE}
                    echo "type=monitor"                                     >> ${CONFIG_FILE}
                    echo "module=galeramon"                                 >> ${CONFIG_FILE}
                    echo "servers=${SERVERS}"                               >> ${CONFIG_FILE}
                    echo "use_priority=true"                                >> ${CONFIG_FILE}
                    echo "user=${DBUSER}"                                   >> ${CONFIG_FILE}
                    echo "password=${DBPASSWORD}"                           >> ${CONFIG_FILE}
                    echo                                                    >> ${CONFIG_FILE}
                    echo "[GaleraService]"                                  >> ${CONFIG_FILE}
                    echo "type=service"                                     >> ${CONFIG_FILE}
                    if [[ ${MULTIMASTER} == TRUE ]] ; then
                        echo "router=readconnroute"                         >> ${CONFIG_FILE}
                        echo "router_options=running"                       >> ${CONFIG_FILE}
                    else
                        echo "router=readwritesplit"                        >> ${CONFIG_FILE}
                        echo "router_options=synced"                        >> ${CONFIG_FILE}
                        echo "slave_selection_criteria=${SLAVE_SELECTION}"  >> ${CONFIG_FILE}
                        echo "master_accept_reads=${MASTER_READS}"          >> ${CONFIG_FILE}
                    fi
                    echo "servers=${SERVERS}"                               >> ${CONFIG_FILE}
                    echo "user=${DBUSER}"                                   >> ${CONFIG_FILE}
                    echo "password=${DBPASSWORD}"                           >> ${CONFIG_FILE}
                    echo "slave_selection_criteria=${SLAVE_SELECTION}"      >> ${CONFIG_FILE}
                    echo "master_accept_reads=${MASTER_READS}"              >> ${CONFIG_FILE}
                    echo                                                    >> ${CONFIG_FILE}
                    echo "[GaleraListener]"                                 >> ${CONFIG_FILE}
                    echo "type=listener"                                    >> ${CONFIG_FILE}
                    echo "service=GaleraService"                            >> ${CONFIG_FILE}
                    echo "address=0.0.0.0"                                  >> ${CONFIG_FILE}
                    echo "port=${DBPORT}"                                   >> ${CONFIG_FILE}
                    echo                                                    >> ${CONFIG_FILE}
                '
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
            ssh $(get_ssh_connection ${SYSTEM} ${NODE}) "cat ${CONFIG_FILE}" | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${NODE}.maxscale.cnf 2>&1
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
                    maxscale --nodaemon --basedir=/data/cbench/install --config='${CONFIG_FILE}' &> maxstart.log &
                    sleep 10
                    echo "----- maxscale startup messages -----"
                    cat maxstart.log
                    echo "----- maxscale log -----"
                    cat /data/cbench/install/var/log/maxscale/maxscale.log
                    echo "----- maxscale servers -----"
                    maxctrl --tsv list servers
                    echo "----- maxscale services -----"
                    maxctrl --tsv list services
                    exit
                '
            done
        done
    }

    echo
    echo "    Cluster = ${CLUSTER}"
    echo "        Database Connection: mariadb $(get_database_connection ${CLUSTER})"
    if [[ ${OPTION_SSL} == TRUE ]] ; then
        echo "        Version: $(mariadb -sN $(get_database_connection ${CLUSTER}) --ssl -e 'select version();')"
    else
        echo "        Version: $(mariadb -sN $(get_database_connection ${CLUSTER}) -e 'select version();')"
    fi
    echo
    echo "    ===== End $0 ( Elapsed Seconds = $(( $SECONDS - $STARTSECONDS )) ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
