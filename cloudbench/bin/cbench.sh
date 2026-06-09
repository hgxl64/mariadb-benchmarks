#!/bin/bash

#
# Common Functions
#


# unconditional message
msg() {
    echo "$@"
}


# message ist only displayed when $VERBOSE >= 1
info() {
    [[ ${VERBOSE:-0} -gt 0 ]] && echo "$@"
}


# message ist only displayed when $VERBOSE >= 2
debug() {
    [[ ${VERBOSE:-0} -gt 1 ]] && echo "$@"
}


# message and exit the script/block
error() {
    echo "$@"
    exit 1
}


# read properties from ~/.vault.yaml
vault() {
    local key=$1
    local value=$(fgrep "${key}:" ~/.vault.yaml | sed "s/.*: //")
    echo "${value}"
}


# config_variable name value
# create environment variable if it not exists and export it
# existing env variable will not be changed
config_variable() {
    local ref
    declare -n ref=$1
    if [[ ! ${ref} ]]
    then
        debug "exporting config variable: ${1}=${2}"
        export ref=$2
#    else
#        debug "using preset config variable: ${1}=${ref}"
    fi
}


##########
# Common Functions
############

PARENT_PID=$$

print_debug() {
    if [[ ${OPTION_DEBUG} ]] ; then echo "DEBUG : $(date -u '+%Y%m%d%H%M%S.%3N') : $@" ; fi
}

get_property() {
    [ -f "properties/${1}.properties" ] || { echo "Properties for '$1' not found" >&2 ; return 1; }
    echo $(grep "^$2 =" properties/$1.properties | awk -F= '{ print $2 }')
}

getproperty() {
    get_property "$@"
}

gethost() {
    # Print either the first node of cluster $1 or print $1 if no cluster found
    host=$({ get_property "$1" nodes 2>/dev/null || echo $1; } | awk '{print $1}')
    echo "$host"
}

print_header() {
    echo
    echo "    ===== $@ =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
}

print_subheader() {
    echo
    echo "        ===== $@ =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
}

print_variable_report() {
    # Args: <Indent chars> [var 1] [var 2] ... [var n]
    # Pass an empty string in place of a variable to print a blank line
    local indent=$1
    shift
    local longest=$(echo "$@" | awk 'BEGIN {RS=" "; m=0} (length($0)>m) {m=length($0)} END {print m+1}')
    for v in "$@"; do
        [ "$v" ] || { echo; continue; }
        local vlen=$(echo $v | awk '{print length($0)}')
        echo "$(printf "%*s   %*s\n" $((indent+vlen)) $v $((longest-vlen)) "=") $(eval echo "\${$v[@]}")"
    done
}

pquit() {
    # Exit when pid in $1 is not found
    ps $1 >/dev/null 2>&1 || exit 0
}

lock_semaphore() {
    {
        echo -n "    Acquiring Cbench Semaphore."
        while true; do
            if mkdir "${CBENCH_HOME}/semaphore_lock.d"; then
               break;
            fi
            echo -n "."
            sleep 1
        done
        echo "Done"
    } 2>/dev/null
}

unlock_semaphore() {
    echo "    Release Cbench Semaphore."
    rmdir "${CBENCH_HOME}/semaphore_lock.d"
}

select_data() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    local COMMAND="mariadb -sN"
    if [[ $(get_property ${SYSTEM} database.host) ]] ; then
        COMMAND="${COMMAND} --host=$(get_property ${SYSTEM} database.host)"
    elif [[ $(get_property ${SYSTEM} database.external.ips) ]] ; then
        local EXTERNAL_IPS=( $(get_property ${SYSTEM} database.external.ips) )
        COMMAND="${COMMAND} --host=${EXTERNAL_IPS[0]}"
    elif [[ $(get_property ${SYSTEM} cluster.node1) ]] ; then
        COMMAND="${COMMAND} --host=$(get_property ${SYSTEM} cluster.node1)"
    else
        COMMAND="${COMMAND} --host=localhost"
    fi
    [[ $(get_property ${SYSTEM} database.user) ]] && COMMAND="${COMMAND} --user=$(get_property ${SYSTEM} database.user)"
    [[ $(get_property ${SYSTEM} database.password) ]] && COMMAND="${COMMAND} --password=$(get_property ${SYSTEM} database.password)"
    [[ $(get_property ${SYSTEM} database.port) ]] && COMMAND="${COMMAND} --port=$(get_property ${SYSTEM} database.port)"
    [[ $(get_property ${SYSTEM} database.ssl) ]] && COMMAND="${COMMAND}  --ssl"
    [[ $(get_property ${SYSTEM} database.ssl-ca) ]] && COMMAND="${COMMAND} --ssl-ca $(get_property ${SYSTEM} database.ssl-ca)"
    ${COMMAND}
}

mariadbci() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    local COMMAND="mariadb -vvv"
    if [[ $(get_property ${SYSTEM} database.host) ]] ; then
        COMMAND="${COMMAND} --host=$(get_property ${SYSTEM} database.host)"
    elif [[ $(get_property ${SYSTEM} database.external.ips) ]] ; then
        local EXTERNAL_IPS=( $(get_property ${SYSTEM} database.external.ips) )
        COMMAND="${COMMAND} --host=${EXTERNAL_IPS[0]}"
    elif [[ $(get_property ${SYSTEM} cluster.node1) ]] ; then
        COMMAND="${COMMAND} --host=$(get_property ${SYSTEM} cluster.node1)"
    else
        COMMAND="${COMMAND} --host=localhost"
    fi
    [[ $(get_property ${SYSTEM} database.user) ]] && COMMAND="${COMMAND} --user=$(get_property ${SYSTEM} database.user)"
    [[ $(get_property ${SYSTEM} database.password) ]] && COMMAND="${COMMAND} --password=$(get_property ${SYSTEM} database.password)"
    [[ $(get_property ${SYSTEM} database.port) ]] && COMMAND="${COMMAND} --port=$(get_property ${SYSTEM} database.port)"
    [[ $(get_property ${SYSTEM} database.ssl) ]] && COMMAND="${COMMAND}  --ssl"
    [[ $(get_property ${SYSTEM} database.ssl-ca) ]] && COMMAND="${COMMAND} --ssl-ca $(get_property ${SYSTEM} database.ssl-ca)"

    echo ${COMMAND}
    ${COMMAND}
}

mysqlci() {
    mariadbci $1 $2
}

showproperties() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    cat properties/${SYSTEM}.properties
}

killdrivers() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    for NODE in $(get_property ${SYSTEM} drivers) ; do echo $NODE; ssh root@$NODE 'killall sysbench'; done
}

####################################
# Master/Slave Replication Synchronization
####################################

old_master_position() {
    # prints <binlog file number>-<binlog offset> for specified host and binlog
    local MASTER=$(gethost $1)
    local BINLOG=$2
    mariadb -sN $(get_database_connection ${MASTER}) -e "show master status ${BINLOG}" \
        | awk '{split($1,seq,"."); {print seq[2]+0"-"$2}}'
}

old_slave_position() {
    # prints <binlog file number>-<binlog offset> for specified host and binlog
    local MASTER=$(gethost $1)
    local SLAVE=$(gethost $2)
    local BINLOG=$3
    mariadb -sN $(get_database_connection ${SLAVE}) -e "show slave status" | \
        awk -v master=${MASTER} -v binlog=${BINLOG} '$3==master && $6==binlog {print $8"-"$9}'
}

old_binlogs_for_slave() {
    # prints the name of each binlog configured between a master and slave cluster
    local MASTER=$(gethost $1)
    local SLAVE=$(gethost $2)
    mariadb -sN $(get_database_connection ${SLAVE}) \
        -e "select master_log_file from system.mysql_repconfig where master_host='${MASTER}' and protocol=0"
}

new_master_position() {
    # prints <binlog file number>-<binlog offset> for specified host and binlog
    local MASTER=$(gethost $1)
    local BINLOG=$2
    local MASTER_POS=$(mariadb -sN $(get_database_connection ${MASTER}) -e "show master status parallel ${BINLOG}" \
        | awk -v binlog=${BINLOG} '{print $2}')
    if echo ${MASTER_POS} | grep "x" >/dev/null; then
        # Bug 34015, we found hex, convert to int
        MASTER_POS=$(echo ${MASTER_POS} | awk -Fx '{print $2}')
        MASTER_POS=$(( 16#${MASTER_POS} ))
    fi
    echo ${MASTER_POS}
}

new_slave_position() {
    local MASTER=$(gethost $1)
    local SLAVE=$(gethost $2)
    local BINLOG=$3
    mariadb -sN $(get_database_connection ${SLAVE}) -e "show slave status" | \
        awk -v master=${MASTER} -v binlog=${BINLOG} '$3==master && $6==binlog {print $8}'
}

new_binlogs_for_slave() {
    # prints the name of each binlog configured between a master and slave cluster
    local MASTER=$(gethost $1)
    local SLAVE=$(gethost $2)
    mariadb -sN $(get_database_connection ${SLAVE}) \
        -e "select master_log_file from system.mysql_repconfig where master_host='${MASTER}' and protocol=1"
}

slave_caught_up() {
    # return True when slave is at the same position as the master for all
    #   binlogs between them
    # Args: <slave host/cluster>
    local SLAVE=$1
    if [[ $(get_property ${SLAVE} database) == 'clustrix' ]] ; then
        for MASTER in $(mariadb -sN $(get_database_connection ${SLAVE}) -e "select distinct master_host from system.mysql_repconfig"); do
            echo "DEBUG: Checking binlogs between master ${MASTER} ($(gethost ${MASTER})) and slave ${slave} ($(gethost ${SLAVE}))..."
            for BINLOG in $(old_binlogs_for_slave ${MASTER} ${SLAVE}); do
                [[ $(old_slave_position ${MASTER} ${SLAVE} ${BINLOG}) == $(old_master_position ${MASTER} ${BINLOG}) ]] || return 1
            done
            echo "DEBUG: found new binlogs: '$(new_binlogs_for_slave ${MASTER} ${SLAVE})'"
            local MASTER_POS
            for BINLOG in $(new_binlogs_for_slave ${MASTER} ${SLAVE}); do
                MASTER_POS=$(new_master_position ${MASTER} ${BINLOG})
                echo "DEBUG: new slave position: $(new_slave_position ${MASTER} ${SLAVE} ${BINLOG}) new master position: ${MASTER_POS}"
                [[ $(new_slave_position ${MASTER} ${SLAVE} ${BINLOG}) == ${MASTER_POS} ]] || [[ $(new_slave_position ${MASTER} ${SLAVE} ${BINLOG}) == $(( ${MASTER_POS} + 1 )) ]] || return 1
            done
            return 0
        done
    elif [[ $(get_property ${SLAVE} database) == 'mariadb' ]] ; then
        local MASTER=$(mariadb -sN $(get_database_connection ${SLAVE}) -e "show slave status" | grep 'Master_Host:' | awk '{print $2}')
        # Is IO Thread up to date (file and position)?
        # echo "DEBUG: $(mariadb -vvv $(get_database_connection ${MASTER}) -e 'show master status\G' | grep ' File:' | awk '{print $2}') == $(mariadb -vvv $(get_database_connection ${SLAVE}) -e 'show slave status\G' | grep ' Master_Log_File:' | awk '{print $2}')"
        if [[ $(mariadb -vvv $(get_database_connection ${MASTER}) -e 'show master status\G' | grep ' File:' | awk '{print $2}') != $(mariadb -vvv $(get_database_connection ${SLAVE}) -e 'show slave status\G' | grep ' Master_Log_File:' | awk '{print $2}') ]] ; then return 1 ; fi
        # echo "DEBUG: $(mariadb -vvv $(get_database_connection ${MASTER}) -e 'show master status\G' | grep ' Position:' | awk '{print $2}') == $(mariadb -vvv $(get_database_connection ${SLAVE}) -e 'show slave status\G' | grep ' Read_Master_Log_Pos:' | awk '{print $2}')"
        if [[ $(mariadb -vvv $(get_database_connection ${MASTER}) -e 'show master status\G' | grep ' Position:' | awk '{print $2}') != $(mariadb -vvv $(get_database_connection ${SLAVE}) -e 'show slave status\G' | grep ' Read_Master_Log_Pos:' | awk '{print $2}') ]] ; then return 1 ; fi
        # Is SQL Thread up to date (file and position)?
        # echo "DEBUG: $(mariadb -vvv $(get_database_connection ${SLAVE}) -e 'show slave status\G' | grep ' Master_Log_File:' | awk '{print $2}') == $(mariadb -vvv $(get_database_connection ${SLAVE}) -e 'show slave status\G' | grep ' Relay_Master_Log_File:' | awk '{print $2}')"
        if [[ $(mariadb -vvv $(get_database_connection ${SLAVE}) -e 'show slave status\G' | grep ' Master_Log_File:' | awk '{print $2}') != $(mariadb -vvv $(get_database_connection ${SLAVE}) -e 'show slave status\G' | grep ' Relay_Master_Log_File:' | awk '{print $2}') ]] ; then return 1 ; fi
        # echo "DEBUG: $(mariadb -vvv $(get_database_connection ${SLAVE}) -e 'show slave status\G' | grep ' Read_Master_Log_Pos:' | awk '{print $2}') == $(mariadb -vvv $(get_database_connection ${SLAVE}) -e 'show slave status\G' | grep ' Exec_Master_Log_Pos:' | awk '{print $2}')"
        if [[ $(mariadb -vvv $(get_database_connection ${SLAVE}) -e 'show slave status\G' | grep ' Read_Master_Log_Pos:' | awk '{print $2}') != $(mariadb -vvv $(get_database_connection ${SLAVE}) -e 'show slave status\G' | grep ' Exec_Master_Log_Pos:' | awk '{print $2}') ]]; then return 1 ; fi
        return 0
    fi
}

wait_for_slaves() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    for SLAVE in $(get_property ${SYSTEM} slave.systems) ; do
        echo -n "        Waiting for slave ${SLAVE} to catch up..."
        while ! slave_caught_up ${SLAVE}; do echo -n .; sleep 1; done
        echo "Done"
    done
}

purge_binary_logs() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    if [[ $(get_property ${SYSTEM} database) == 'mariadb' ]] ; then
        echo "        Purge binary logs on ${SYSTEM}..."
        local CURRENT_LOG=$(echo "show master status" | sqlci ${SYSTEM} | grep mariadb-bin | cut -d' ' -f2)
        echo "purge binary logs to '${CURRENT_LOG}';" | sqlci ${SYSTEM}
    fi
}

trim_binary_logs() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    if [[ $(get_property ${SYSTEM} database) == 'mariadb' ]] ; then
        local CURRENT_SLAVE_BINLOG
        local MIN_SLAVE_BINLOG
        for SLAVE_SYSTEM in $(get_property ${CLUSTER} slave.systems) ; do
            CURRENT_SLAVE_BINLOG=$(echo 'show slave status\G' | sqlci ${SLAVE_SYSTEM} | grep ' Master_Log_File: ' | cut -d':' -f2 | sed 's| ||g')
            [[ ${MIN_SLAVE_BINLOG} ]] || MIN_SLAVE_BINLOG=${CURRENT_SLAVE_BINLOG}
            [[ ${CURRENT_SLAVE_BINLOG} < ${MIN_SLAVE_BINLOG} ]] && MIN_SLAVE_BINLOG=${CURRENT_SLAVE_BINLOG}
        done
        for MASTER_SYSTEM in $(get_property ${CLUSTER} master.systems) ; do
            echo "        Trimming binary logs on ${MASTER_SYSTEM} to ${MIN_SLAVE_BINLOG}."
            echo "purge binary logs to '${MIN_SLAVE_BINLOG}';" | sqlci ${MASTER_SYSTEM}
        done
    fi
}

####################################
# Process Connection Info ( This is becoming obsolete )
####################################
process_connection_info() {
    if [[ ${CLUSTER} ]] ; then
        # ${CLUSTER}.properties file
        print_debug "process_connection_info CLUSTER = ${CLUSTER}"
        [[ ${DATABASE} ]] || DATABASE=$(get_property ${CLUSTER} database)
        print_debug "process_connection_info DATABASE = ${DATABASE}"
        CLUSTER_NODES=( $(get_property ${CLUSTER} nodes) )
        NUMOFNODES=${#CLUSTER_NODES[@]}
        HEADNODE=${CLUSTER_NODES[0]}
        if [[ ${DRIVERS} ]] ; then
            DRIVER_NODES=( ${DRIVERS} )
        else
            DRIVER_NODES=( $(get_property ${CLUSTER} drivers) )
        fi
        NUMOFDRIVERS=${#DRIVER_NODES[@]}
        HEADDRIVER=${DRIVER_NODES[0]}
    elif [[ ${HOST} ]] ; then
        print_debug "process_connection_info HOST = ${HOST}"
        HEADNODE=${HOST}
    else
       echo "ERROR: Cluster/Host not specified"; exit 1;
    fi
    SSH_OPTIONS="-oStrictHostKeyChecking=no"
    SCP_OPTIONS="-oStrictHostKeyChecking=no"
    DB_USER_OPTION="--user=$(get_database_user)"
    if [[ $(get_ssh_port) ]] ; then
        SSH_OPTIONS="${SSH_OPTIONS} -p$(get_ssh_port)"
        SCP_OPTIONS="${SCP_OPTIONS} -P$(get_ssh_port)"
    fi
    if [[ $(get_ssh_pemfile) ]] ; then
        SSH_OPTIONS="${SSH_OPTIONS} -i $(get_ssh_pemfile)"
        SCP_OPTIONS="${SCP_OPTIONS} -i $(get_ssh_pemfile)"
    fi
    if [[ $(get_database_port) ]] ; then
        DB_USER_OPTION="${DB_USER_OPTION} --port=$(get_database_port) ";
    fi
    if [[ $(get_database_password) ]] ; then
        DB_USER_OPTION="${DB_USER_OPTION} --password=$(get_database_password)";
    fi
    if [[ ${HOST} ]] ; then
        if [[ ! ${DATABASE} ]] ; then
            VERSION=$(mariadb -sN --host ${HEADNODE} ${DB_USER_OPTION} -e "select version()")
            if [[ ${VERSION} == *MariaDB* ]] ; then
                DATABASE=mariadb
            else
                DATABASE=mysql
            fi
        fi
        CLUSTER=${HOST}
        CLUSTER_NODES=( ${HOST} )
        NUMOFNODES=1
        # If HOST specified, then driver may also be specified
        if [[ ${DRIVERS} ]] ; then
            DRIVER_NODES=( ${DRIVERS} )
            HEADDRIVER=${DRIVER_NODES[0]}
            NUMOFDRIVERS=${#DRIVER_NODES[@]}
        else
            DRIVER_NODES=( localhost )
            HEADDRIVER=localhost
            NUMOFDRIVERS=1
        fi
    fi
    DB_OPTIONS="--host=${HEADNODE} ${DB_USER_OPTION}"
}

####################################
# SSH Connections
####################################

get_ssh_user() {
    # $1 - target cluster/system
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    local USER=$(get_property ${SYSTEM} ssh.user)
    [[ ${USER} ]] || USER=$(whoami)
    echo ${USER}
}

get_ssh_port() {
    # $1 - target cluster/system
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    echo "$(get_property ${SYSTEM} ssh.port)"
}

get_ssh_pemfile() {
    # $1 - target cluster/system
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    echo "$(get_property ${SYSTEM} ssh.pem)"
}

get_ssh_connection() {
    # $1 - target cluster/system, $2 - target node
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    local NODE=$2
    [[ ${NODE} ]] || NODE=$(get_property ${SYSTEM} system.external.ip)
    [[ ${NODE} ]] || NODE=$(get_property ${SYSTEM} cluster.node1)
    echo -n "$(get_ssh_user ${SYSTEM})@${NODE} -oStrictHostKeyChecking=no"
    if [[ $(get_ssh_pemfile ${SYSTEM}) ]]; then echo -n " -i$(get_ssh_pemfile ${SYSTEM})" ; fi
    if [[ $(get_ssh_port ${SYSTEM}) ]]; then echo -n " -p$(get_ssh_port ${SYSTEM})" ; fi
    echo
}

sshci() {
    ssh $(get_ssh_connection)
}

get_scp_copy_to_connection() {
    # $1 - target cluster/system, $2 - target node, $3 - source, $4 - destination
    # Note:  There are no defaults values, all parameters must be specified
    local SYSTEM=$1
    local NODE=$2
    local SOURCE=$3
    local DESTINATION=$4
    if [[ $(get_ssh_pemfile ${SYSTEM}) ]]; then echo -n " -i$(get_ssh_pemfile ${SYSTEM})" ; fi
    if [[ $(get_ssh_port ${SYSTEM}) ]]; then echo -n " -P$(get_ssh_port ${SYSTEM})" ; fi
    echo " -oStrictHostKeyChecking=no ${SOURCE} $(get_ssh_user)@${NODE}:${DESTINATION}"
}

get_scp_copy_from_connection() {
    # $1 - target cluster/system, $2 - target node, $3 - source, $4 - destination
    # Note:  There are no defaults values, all parameters must be specified
    local SYSTEM=$1
    local NODE=$2
    local SOURCE=$3
    local DESTINATION=$4
    if [[ $(get_ssh_pemfile ${SYSTEM}) ]]; then echo -n " -i$(get_ssh_pemfile ${SYSTEM})" ; fi
    if [[ $(get_ssh_port ${SYSTEM}) ]]; then echo -n " -P$(get_ssh_port ${SYSTEM})" ; fi
    echo " -oStrictHostKeyChecking=no $(get_ssh_user)@${NODE}:${SOURCE} ${DESTINATION}"
}

####################################
# Database Connections
####################################

# There are three levels of connecting to a database
#   Level 1:  Using an external ip  ( In a properties file this is database.host or database.external.ips)
#      This is an ip reachable from anywhere on the internet.
#      A coordinator system would use an external ip.
#      If the external ip is not specified, then it is assumed to be the nodes
#   Level 2:  Using an internal ip  ( In a properties file this is database.internal.ips )
#      This is an ip reachable from a local network, including a VPC in a cloud.
#      A driver system (located in the same network) would use an internal ip to connect.
#      If internal ip is unspecified, then it will default to the external ip.
#   Level 3:  Using an backend ip  ( In a properties file this is database.backend.ips )
#      A backend network is a network connecting the nodes of a cluster, but is not
#      available beyond the cluster.  The yang nodes in the colo have a backend network.
#      Backend networks should be used to have nodes in a cluster intercommunicate with
#      each other (e.g.: Clustrix Cluster, Master/Slave Replication, Galera Cluster)
#      If backend ip is unspecified, then it will default to the internal ip.

get_database_host() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    if [[ $(get_property ${SYSTEM} database.host) ]] ; then
        echo "$(get_property ${SYSTEM} database.host)"
    elif [[ $(get_property ${SYSTEM} database.external.ips) ]] ; then
        local EXTERNAL_IPS=( $(get_property ${SYSTEM} database.external.ips) )
        echo "${EXTERNAL_IPS[0]}"
    elif [[ $(get_property ${SYSTEM} cluster.node1) ]] ; then
        echo "$(get_property ${SYSTEM} cluster.node1)"
    else
        echo "localhost"
    fi
}

get_database_internal_host() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    if [[ $(get_property ${SYSTEM} database.internal.ips) ]] ; then
        local INTERNAL_IPS=( $(get_property ${SYSTEM} database.internal.ips) )
        echo "${INTERNAL_IPS[0]}"
    else
        echo "$(get_database_host $1)"
    fi
}

get_database_user() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    if [[ $(get_property ${SYSTEM} database.user) ]] ; then
        echo "$(get_property ${SYSTEM} database.user)"
    else
        echo "$(whoami)"
    fi
}

get_database_password() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    echo "$(get_property ${SYSTEM} database.password)"
}

get_database_port() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    echo "$(get_property ${SYSTEM} database.port)"
}

get_database_ssl() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    echo "$(get_property ${SYSTEM} database.ssl)"
}

get_database_connection() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    local NODE=$2
    [[ ${NODE} ]] || NODE=$(get_database_host ${SYSTEM})
    echo -n "--host=${NODE}"
    [[ $(get_database_user ${SYSTEM}) ]] && echo -n " --user=$(get_database_user ${SYSTEM})"
    [[ $(get_database_password ${SYSTEM}) ]] && echo -n " --password=$(get_database_password ${SYSTEM})"
    [[ $(get_database_port ${SYSTEM}) ]] && echo -n " --port=$(get_database_port ${SYSTEM})"
    [[ $(get_database_ssl ${SYSTEM}) ]] && echo -n " --ssl"
    [[ $(get_property ${SYSTEM} database.ssl-ca) ]] && echo -n " --ssl-ca $(get_property ${SYSTEM} database.ssl-ca)"
    echo
}

get_local_database_connection() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    local NODE=$2
    [[ ${NODE} ]] || NODE=$(get_database_host ${SYSTEM})
    if [[ $(get_database_user ${SYSTEM}) ]] ; then echo -n " --user=$(get_database_user ${SYSTEM})" ; fi
    if [[ $(get_database_password ${SYSTEM}) ]] ; then echo -n " --password=$(get_database_password ${SYSTEM})" ; fi
    if [[ $(get_database_port ${SYSTEM}) ]] ; then echo -n " --port=$(get_database_port ${SYSTEM})" ; fi
    if [[ $(get_database_ssl ${SYSTEM}) ]] ; then echo -n " --ssl" ; fi
    echo
}

get_database_internal_port() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    local DBPORT
    [[ $(get_property ${SYSTEM} database.internal.ips) ]] && DBPORT=$(get_property ${SYSTEM} database.internal.port)
    [[ ${DBPORT} ]] || DBPORT=$(get_database_port ${SYSTEM})
    echo ${DBPORT}
}

get_database_external_ips() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    if [[ $(get_property ${SYSTEM} database.external.ips) ]] ; then
        echo "$(get_property ${SYSTEM} database.external.ips)"
    else
        echo "$(get_property ${SYSTEM} nodes)"
    fi
}

get_database_internal_ips() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    if [[ $(get_property ${SYSTEM} database.internal.ips) ]] ; then
        echo "$(get_property ${SYSTEM} database.internal.ips)"
    else
        echo "$(get_database_external_ips ${SYSTEM})"
    fi
}

get_database_backend_ips() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    if [[ $(get_property ${SYSTEM} database.backend.ips) ]] ; then
        echo "$(get_property ${SYSTEM} database.backend.ips)"
    else
        echo "$(get_database_internal_ips ${SYSTEM})"
    fi
}

get_system_external_ip() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    if [[ $(get_property ${SYSTEM} system.external.ip) ]] ; then
        echo "$(get_property ${SYSTEM} system.external.ip)"
    fi
}

get_system_internal_ip() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    if [[ $(get_property ${SYSTEM} system.internal.ip) ]] ; then
        echo "$(get_property ${SYSTEM} system.internal.ip)"
    else
        echo "$(get_system_external_ip ${SYSTEM})"
    fi
}

get_system_backend_ip() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    if [[ $(get_property ${SYSTEM} system.backend.ip) ]] ; then
        echo "$(get_property ${SYSTEM} system.backend.ip)"
    else
        echo "$(get_system_internal_ip ${SYSTEM})"
    fi
}

get_sysbench_connection() {
    # Format a sysbench connection string that optionally is executed from a remote driver
    # Parms : $1 System , $2 Driver , $3 DriverID
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    local DRIVER=$2
    local DRIVERID=$3
    [[ ${DRIVERID} ]] || DRIVERID=1
    local DATABASE=$(get_property ${SYSTEM} database)
    local DBDRIVER=""
    if [[ ${DATABASE} == 'cockroach' ||  ${DATABASE} == 'postgres' ]] ; then DBDRIVER='pgsql' ; else DBDRIVER='mysql' ; fi
    echo -n "--db-driver=${DBDRIVER}"
    # hosts are returned as a a comma separated random permutation of the nodes
    echo -n " --${DBDRIVER}-host=$( echo $(get_database_internal_ips ${SYSTEM}) | awk -v driverid=${DRIVERID} '
            {
            srand(driverid);
            for (i = 1; i < 5000; i++) {
                RANDNUM=int((NF-1) * rand())+2;
                TEMP=$RANDNUM; $RANDNUM=$(RANDNUM-1); $(RANDNUM-1)=TEMP;
            }
            print $0
        }' | sed 's/^ //g;s/ /,/g' )"
    [[ $(get_database_user ${SYSTEM}) ]] && echo -n " --${DBDRIVER}-user=$(get_database_user ${SYSTEM})"
    [[ $(get_database_password ${SYSTEM}) ]] && echo -n " --${DBDRIVER}-password=$(get_database_password ${SYSTEM})"
    [[ $(get_database_internal_port ${SYSTEM}) ]] && echo -n " --${DBDRIVER}-port=$(get_database_internal_port ${SYSTEM})"
    [[ $(get_database_ssl ${SYSTEM}) ]] && echo -n " --${DBDRIVER}-ssl=on"
    echo
}

get_database_version() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    local DATABASE=$(get_property ${SYSTEM} database)
    if [[ ${DATABASE} == 'cockroach' ]] ; then
        echo "WARNING:  get_database_version not yet implemented for ${DATABASE}."
    elif [[ ${DATABASE} == 'postgres' ]] ; then
        echo "$(psql -t $(get_psql_database_connection ${SYSTEM}) --command='select version();')"
    else
        echo "$(mariadb -sN $(get_database_connection ${SYSTEM}) -e 'select @@version')"
    fi
}

get_os_version() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    local DATABASE=$(get_property ${SYSTEM} database)
    if [[ $(get_property ${SYSTEM} cluster.node1) ]] ; then
        echo "$(ssh $(get_ssh_connection ${SYSTEM}) 'uname -a')"
    fi
}

####################################

start_timer() {
    TIMER_START=$(date +%s)
}

stop_timer() {
    echo $(( $(date +%s) - ${TIMER_START} ))
}

start_milli_timer() {
    MILLI_TIMER_START=$(date +%s%N)
}

stop_milli_timer() {
    echo "$( echo $(( $(date +%s%N) - ${MILLI_TIMER_START} )) | awk '{ printf "%.3f", $1/1000000000 }' )"
}

start_minute_timer() {
    MINUTE_TIMER_START=$(date +%s)
}

stop_minute_timer() {
    echo "$( echo $(( $(date +%s) - ${MINUTE_TIMER_START} )) | awk '{ printf "%.2f", $1/60 }' )"
}

check_and_update_remote_drivers() {
    if [[ ! ${OPTION_SKIPCHECK} ]] || [[ ${OPTION_SKIPCHECK} == FALSE ]]; then
        local SYSTEM=$1;
        [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
        echo "        Check/Update Drivers"
        COMMAND="configure.drivers.sh --cluster ${SYSTEM}"
        [[ ${OPTION_CLOUD} ]] && COMMAND="${COMMAND} ${OPTION_CLOUD}"
        echo "        COMMAND = ${COMMAND}"
        ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).check.drivers.log 2>&1
    fi
}

check_cluster() {
    if [[ ! ${OPTION_SKIPCHECK} ]] || [[ ${OPTION_SKIPCHECK} == FALSE ]]; then
        local SYSTEM=$1;
        [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
        local DATABASE=$(get_property ${SYSTEM} database)
        if [[ ${DATABASE} == 'mariadb' || ${DATABASE} == 'mysql' || ${DATABASE} == 'clustrix' ]] ; then
            print_header Check Cluster
            time {
                cat ${BENCH_HOME}/properties/${CLUSTER}.properties > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${CLUSTER}.properties
                if [[ ! ${PARENTTEST} ]] ; then
                    check.cluster.sh --cluster ${CLUSTER}
                fi
                env > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).bash.env.txt
            } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).check.cluster.log 2>&1
            echo
            if [[ $(get_property ${SYSTEM} cluster.node1) ]] ; then
                echo "            Operating System : $(get_os_version ${SYSTEM})"
            fi
            echo "            Database Version : $(get_database_version ${SYSTEM})"
        fi
    fi
}

get_cpu() {
    if [[ $(get_property ${CLUSTER} nodes) ]] ; then
        echo $(
            for NODE in $(get_property ${CLUSTER} nodes) ; do
               ssh $(get_ssh_connection ${CLUSTER} ${NODE}) "cat /proc/stat"
            done | grep '^cpu ' | awk '{ cpu = cpu + $2 + $3 + $4 + $7 + $8 }; END { print cpu }'
        )
    fi
}

gather_before_data() {
    if [[ $(get_property ${CLUSTER} nodes) ]] ; then
        echo "            Gather Before Data"
        time {
            mkdir -p ${LOGDIRECTORY}/data/before/
            local BACKGROUND_PIDS=""
            for NODE in $(get_property ${CLUSTER} nodes) ; do
                mkdir -p ${LOGDIRECTORY}/data/before/${NODE}
                {
                    for STAT in stat interrupts diskstats meminfo ; do
                        ssh $(get_ssh_connection ${CLUSTER} ${NODE}) "cat /proc/${STAT}" > ${LOGDIRECTORY}/data/before/${NODE}/proc.${STAT}.txt
                    done
                    for STAT in dev ; do
                        ssh $(get_ssh_connection ${CLUSTER} ${NODE}) "cat /proc/net/${STAT}" > ${LOGDIRECTORY}/data/before/${NODE}/proc.net.${STAT}.txt
                    done
                    for STAT in mdstat version mounts ; do
                        ssh $(get_ssh_connection ${CLUSTER} ${NODE}) "cat /proc/${STAT}" > ${LOGDIRECTORY}/data/before/${NODE}/proc.${STAT}.txt
                    done
                    ssh $(get_ssh_connection ${CLUSTER} ${NODE}) "df" > ${LOGDIRECTORY}/data/before/${NODE}/df.txt
                } &
                BACKGROUND_PIDS=( ${BACKGROUND_PIDS[*]} $! )
            done
            wait ${BACKGROUND_PIDS[*]}
        } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).gather.before.data.log 2>&1
    fi
}

gather_after_data() {
    if [[ $(get_property ${CLUSTER} nodes) ]] ; then
        echo
        echo "    ===== Gather System After Data =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        time {

            {
                mkdir -p ${LOGDIRECTORY}/data/after/
                local BACKGROUND_PIDS=""
                for NODE in $(get_property ${CLUSTER} nodes) ; do
                    mkdir -p ${LOGDIRECTORY}/data/after/${NODE}
                    {
                        for STAT in stat interrupts diskstats meminfo ; do
                            ssh $(get_ssh_connection ${CLUSTER} ${NODE}) "cat /proc/${STAT}" > ${LOGDIRECTORY}/data/after/${NODE}/proc.${STAT}.txt
                        done
                        for STAT in dev ; do
                            ssh $(get_ssh_connection ${CLUSTER} ${NODE}) "cat /proc/net/${STAT}" > ${LOGDIRECTORY}/data/after/${NODE}/proc.net.${STAT}.txt
                        done
                        for STAT in mdstat version mounts ; do
                            ssh $(get_ssh_connection ${CLUSTER} ${NODE}) "cat /proc/${STAT}" > ${LOGDIRECTORY}/data/after/${NODE}/proc.${STAT}.txt
                        done
                            ssh $(get_ssh_connection ${CLUSTER} ${NODE}) "df" > ${LOGDIRECTORY}/data/after/${NODE}/df.txt
                    } &
                    BACKGROUND_PIDS=( ${BACKGROUND_PIDS[*]} $! )
                done
                wait ${BACKGROUND_PIDS[*]}
            } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).gather.after.data.log 2>&1

            START_CPU=$(cat ${LOGDIRECTORY}/data/before/proc.stat.*.txt | grep '^cpu ' | awk '{ cpu = cpu + $2 + $3 + $4 + $7 + $8 }; END { print cpu }')
            [[ ${START_CPU} ]] || START_CPU=0
            echo "    Start CPU = ${START_CPU} "
            STOP_CPU=$(cat ${LOGDIRECTORY}/data/after/proc.stat.*.txt | grep '^cpu ' | awk '{ cpu = cpu + $2 + $3 + $4 + $7 + $8 }; END { print cpu }')
            [[ ${STOP_CPU} ]] || STOP_CPU=0
            echo "    Stop CPU = ${STOP_CPU} "
            TOTAL_CPU_PATH_LENGTH=$(( ${STOP_CPU} - ${START_CPU} ))
            echo "    Total CPU Path Length = ${TOTAL_CPU_PATH_LENGTH}"
        }
    fi
}

gather_logs_from_drivers() {
    echo
# 200506 This is not working and currently dragging Cbench.1.xxxx.tar over
# Aside from javabench, I'm not sure what other logs would be there to collection
#    echo "    ===== Gather Logs from Drivers =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
#    time {
#        LOCALDRIVER=$(uname -n | awk -F. '{print $1}')
#        for DRIVER_NODE in ${DRIVER_NODES[*]} ; do
#            if [[ ${DRIVER_NODE} != ${LOCALDRIVER} ]] ; then
#                scp $( get_scp_copy_from_connection ${CLUSTER} ${DRIVER_NODE} '~/Cbench/log/${TESTID}.*/*' ${LOGDIRECTORY}/. )
#            fi
#        done
#    } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).gather.logs.from.drivers.log 2>&1
}

transpose_table() {
    cat $1 | awk '
        {
             if (NR == 1) {
                for (f=1;f<=NF;f++) col[f] = $f
             } else {
                for (f=1;f<=NF;f++) col[f] = col[f]"\t"$f
             }
        }
        END {for (f=1;f<=NF;f++) print col[f]}
        '
}

ping_test() {
    if [[ ${OPTION_PINGTEST} ]]; then
        time {
            echo
            echo "    ===== Ping Test =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
            echo
            echo "    Ping test between drivers and server nodes"
            local localSYSTEM=""
            [[ $1 ]] && localSYSTEM=$1 || localSYSTEM=${CLUSTER}
            local localDRIVERS=( $(get_property ${localSYSTEM} drivers) )
            local localSERVERS=( $(get_property ${localSYSTEM} database.ips) )
            if (( ${#localSERVERS[@]} == 0 )) ; then localDRIVERS=( $(get_property ${localSYSTEM} nodes) ) ; fi
            for localDRIVER in ${localDRIVERS[*]} ; do
                for localSERVER in ${localSERVERS[*]} ; do
                    echo
                    echo "        Driver ${localDRIVER} -> Server ${localSERVER}"
                    ssh $(get_ssh_connection ${CLUSTER} ${localDRIVER}) "ping -c3 ${localSERVER}"
                done
            done
        }  > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).ping.test.log 2>&1
    fi
}

gather_pretest() {
    if [[ ${OPTION_SNAPSHOT} == TRUE ]] ; then
        time {
            local localSYSTEM="";
            if [[ $1 ]] ; then localSYSTEM=$1 ; else localSYSTEM=${CLUSTER} ; fi
            echo
            echo "    ===== Gather Pretest Snapshot ${localSYSTEM} =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
            if  [[ $(get_property ${localSYSTEM} database) == 'mariadb' ]] ; then
                local BACKGROUND_PIDS=""
                if [[ $(get_property ${localSYSTEM} mariadb.systems) ]] ; then
                    for SYSTEM in $(get_property ${localSYSTEM} mariadb.systems) ; do
                        mariadb.snapshot.sh --cluster ${SYSTEM} &
                        BACKGROUND_PIDS=( ${BACKGROUND_PIDS[*]} $! )
                    done
                else
                    mariadb.snapshot.sh --cluster ${localSYSTEM} &
                    BACKGROUND_PIDS=( ${BACKGROUND_PIDS[*]} $! )
                fi
                for SYSTEM in $(get_property ${localSYSTEM} master.systems) $(get_property ${localSYSTEM} slave.systems) ; do
                    mariadb.snapshot.sh --cluster ${SYSTEM} &
                    BACKGROUND_PIDS=( ${BACKGROUND_PIDS[*]} $! )
                done
                for SYSTEM in $(get_property ${localSYSTEM} maxscale.systems) ; do
                    maxscale.snapshot.sh --cluster ${SYSTEM} &
                    BACKGROUND_PIDS=( ${BACKGROUND_PIDS[*]} $! )
                done
                wait ${BACKGROUND_PIDS[*]}
                system.snapshot.sh --cluster ${localSYSTEM}
            fi
        }  > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).gather.pretest.snapshot.log 2>&1
    fi
}

gather_pretest_snapshot() {
    gather_pretest $@;
}

gather_posttest() {
    if [[ ${OPTION_SNAPSHOT} == TRUE ]] ; then
        time {
            local localSYSTEM="";
            if [[ $1 ]] ; then localSYSTEM=$1 ; else localSYSTEM=${CLUSTER} ; fi
            echo
            echo "    ===== Gather Posttest Snapshot ${localSYSTEM} =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
            if [[ $(get_property ${localSYSTEM} database) == 'mariadb' ]] ; then
                local BACKGROUND_PIDS=""
                if [[ $(get_property ${localSYSTEM} mariadb.systems) ]] ; then
                    for SYSTEM in $(get_property ${localSYSTEM} mariadb.systems) ; do
                        echo
                        echo "    ===== Gather MariaDB Snapshot ${SYSTEM} =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
                        mariadb.snapshot.sh --cluster ${SYSTEM} &
                        BACKGROUND_PIDS=( ${BACKGROUND_PIDS[*]} $! )
                    done
                else
                    echo
                    echo "    ===== Gather MariaDB Snapshot ${localSYSTEM} =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
                    mariadb.snapshot.sh --cluster ${localSYSTEM} &
                    BACKGROUND_PIDS=( ${BACKGROUND_PIDS[*]} $! )
                fi
                for SYSTEM in $(get_property ${localSYSTEM} master.systems) $(get_property ${localSYSTEM} slave.systems) ; do
                    echo
                    echo "    ===== Gather MariaDB Snapshot ${SYSTEM} =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
                    mariadb.snapshot.sh --cluster ${SYSTEM} &
                    BACKGROUND_PIDS=( ${BACKGROUND_PIDS[*]} $! )
                done
                for SYSTEM in $(get_property ${localSYSTEM} maxscale.systems) ; do
                    maxscale.snapshot.sh --cluster ${SYSTEM} &
                    BACKGROUND_PIDS=( ${BACKGROUND_PIDS[*]} $! )
                done
                wait ${BACKGROUND_PIDS[*]}
                time system.snapshot.sh --cluster ${localSYSTEM}
            elif [[ $(get_property ${localSYSTEM} database) == mysql ]] ; then
                echo
                echo "    ===== Gather Mysql Snapshot ${localSYSTEM} =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
                time mysql.snapshot.sh --cluster ${localSYSTEM}
                time system.snapshot.sh --cluster ${localSYSTEM}
            fi
        }  > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).gather.posttest.snapshot.log 2>&1
    fi
}

gather_posttest_snapshot() {
    gather_posttest $@;
}

begin_pathlength() {
    echo 0
}

calculate_pathlength() {
    echo 0
}

generate_interval_graph() {
    echo "            Generate Interval Graph"
    {
        case ${BENCHMARK} in
            sysbench)
                for FILE in ${LOGDIRECTORY}/*.driver.*.log ; do
                    grep ' tps: ' ${FILE} | awk '{ printf "%s%s%s %s %s\n",$1,$2,$3,$6,$7 }' | sed 's/,//g' > ${FILE}.interval.data
                done

                (( IDX = 1 ))
                for FILE in ${LOGDIRECTORY}/*.driver.*.interval.data ; do
                    if (( $IDX == 1 )) ; then
                        rm -f ${LOGDIRECTORY}/test.interval.data
                        cp ${FILE} ${LOGDIRECTORY}/test.interval.data
                    else
                        join ${LOGDIRECTORY}/test.interval.data ${FILE} | awk '{ printf "%s %s %.2f\n",$1,$2,$3 + $5 }' > ${LOGDIRECTORY}/test.interval.data.new
                        rm -f ${LOGDIRECTORY}/test.interval.data
                        mv ${LOGDIRECTORY}/test.interval.data.new ${LOGDIRECTORY}/test.interval.data
                    fi
                    (( IDX = $IDX + 1 ))
                done
                INTERVAL_FIELD=3
                FIELD_SEPERATOR=" "

                ;;

            sysbench-tpcc)
                cat ${LOGDIRECTORY}/*.sysbench-tpcc.run.log | grep ' tps: ' | awk '{ printf "%s%s%s %s %s\n",$1,$2,$3,$6,$7 }' > ${LOGDIRECTORY}/test.interval.data
                INTERVAL_FIELD=3
                FIELD_SEPERATOR=" "
                ;;

            tproc-c)
                cat ${LOGDIRECTORY}/hdbtcount.log | fgrep 'tpm @' | awk '{ print $1/60 }'  > ${LOGDIRECTORY}/test.interval.data
                INTERVAL_FIELD=1
                FIELD_SEPERATOR=" "
                ;;

            *)
                cat ${LOGDIRECTORY}/*.run.log | grep '^XXX' > ${LOGDIRECTORY}/test.interval.data
                for FILE in ${LOGDIRECTORY}/*.driver.*.*.log ; do
                    grep '^XXX' ${FILE} | awk '{ printf "%3d throughput %s\n",$3,$15 }' | sed 's/,//g' > ${FILE}.interval.data
                done

                (( IDX = 1 ))
                for FILE in ${LOGDIRECTORY}/*.driver.*.*.log.interval.data ; do
                    if (( $IDX == 1 )) ; then
                        rm -f ${LOGDIRECTORY}/test.interval.data
                        cp ${FILE} ${LOGDIRECTORY}/test.interval.data
                    else
                        join ${LOGDIRECTORY}/test.interval.data ${FILE} | awk '{ printf "%s %s %.2f\n",$1,$2,$3 + $5 }' > ${LOGDIRECTORY}/test.interval.data.new
                        rm -f ${LOGDIRECTORY}/test.interval.data
                        mv ${LOGDIRECTORY}/test.interval.data.new ${LOGDIRECTORY}/test.interval.data
                    fi
                    (( IDX = $IDX + 1 ))
                done

                INTERVAL_FIELD=3
                FIELD_SEPERATOR=" "
                ;;
            esac

        echo "
            set datafile separator '${FIELD_SEPERATOR}'
            set terminal png size 960,480 enhanced font '/usr/share/fonts/liberation/LiberationSans-Regular.ttf' 11 linewidth 2
            set yrange [0:]
            set xrange [0:]
            set grid ytics lc rgb '#bbbbbb' lw 1 lt 0
            set grid xtics lc rgb '#bbbbbb' lw 1 lt 0
            set ylabel 'Throughput'
            set xlabel 'Time(Intervals)'
            set output '${LOGDIRECTORY}/throughput.interval.png'
            set title 'Throughput Over Time'
            plot '${LOGDIRECTORY}/test.interval.data' using ${INTERVAL_FIELD} title '${TESTID}' with lines
            exit
        " | gnuplot
    }
}

generate_performance_curve_graph() {
    echo "            Generate Performance Curve Graph"
    {
        if [[ ${BENCHMARK} == 'orderentry' ]] ; then
             {
                echo "
                    set terminal png size 960,480 enhanced font '/usr/share/fonts/liberation/LiberationSans-Regular.ttf' 11 linewidth 2
                    set yrange [0:${TARGET_LATENCY}]
                    set xrange [0:]
                    set grid ytics lc rgb '#bbbbbb' lw 1 lt 0
                    set grid xtics lc rgb '#bbbbbb' lw 1 lt 0
                    set ylabel 'Avg Latency (ms)'
                    set xlabel 'Throughput (tpm)'
                    set output '${LOGDIRECTORY}/performance.curve.png'
                    set title '${TESTID} - ${BENCHMARK} - Performance Curve'
                    plot  '${LOGDIRECTORY}/test.data' using 2:3 title '${TESTID}' with linespoint pointtype 7
                    exit
                "
            } | gnuplot
        else
            {
                echo "
                    set terminal png size 960,480 enhanced font '/usr/share/fonts/liberation/LiberationSans-Regular.ttf' 11 linewidth 2
                    set yrange [0:${TARGET_LATENCY}]
                    set xrange [0:]
                    set grid ytics lc rgb '#bbbbbb' lw 1 lt 0
                    set grid xtics lc rgb '#bbbbbb' lw 1 lt 0
                    set ylabel 'Avg Latency (ms)'
                    set xlabel 'Throughput (tps)'
                    set output '${LOGDIRECTORY}/performance.curve.png'
                    set title '${TESTID} - ${BENCHMARK}.${WORKLOAD} - Performance Curve'
                    plot  '${LOGDIRECTORY}/test.data' using 2:3 title '${TESTID}' with linespoint pointtype 7
                    exit
                "
            } | gnuplot
        fi

        if [[ ${BENCHMARK} == 'sysbench' ]] ; then
            {
                echo "
                    set terminal png size 960,480 enhanced font '/usr/share/fonts/liberation/LiberationSans-Regular.ttf' 11 linewidth 2
                    set yrange [0:]
                    set xrange [0:]
                    set grid ytics lc rgb '#bbbbbb' lw 1 lt 0
                    set grid xtics lc rgb '#bbbbbb' lw 1 lt 0
                    set ylabel 'Throughput (tps)'
                    set xlabel 'Scale'
                    set output '${LOGDIRECTORY}/throughput.curve.png'
                    set title '${TESTID} - ${BENCHMARK}.${WORKLOAD} - Throughput Curve'
                    plot  '${LOGDIRECTORY}/test.data' using 1:2 title '${TESTID}' with linespoint pointtype 7
                    exit
                "
            } | gnuplot
        fi
    }
}

generate_curve_interval_graph() {
    echo "            Generate Interval Graph"
    {
        case ${BENCHMARK} in

            connections|debitcredit|orderentry|sysbench|magento)

                for FILE in $(ls -tr ${LOGDIRECTORY}/*.run/test.interval.data) ; do
                    cat ${FILE} >> ${LOGDIRECTORY}/test.interval.data
                done

                INTERVAL_FIELD=3
                FIELD_SEPERATOR=" "

                ;;

            ycsb)
                cat ${LOGDIRECTORY}/*.curve.log | grep 'READ AverageLatency(us)=' > ${LOGDIRECTORY}/test.interval.data
                INTERVAL_FIELD=7
                FIELD_SEPERATOR=" "
                ;;
        esac

        echo "
            set datafile separator '${FIELD_SEPERATOR}'
            set terminal png size 960,480 enhanced font '/usr/share/fonts/liberation/LiberationSans-Regular.ttf' 11 linewidth 2
            set yrange [0:]
            set xrange [0:]
            set grid ytics lc rgb '#bbbbbb' lw 1 lt 0
            set grid xtics lc rgb '#bbbbbb' lw 1 lt 0
            set ylabel 'Throughput'
            set xlabel 'Time(Intervals)'
            set output '${LOGDIRECTORY}/throughput.interval.png'
            set title 'Throughput Over Time'
            plot '${LOGDIRECTORY}/test.interval.data' using ${INTERVAL_FIELD} title '${TESTID}' with lines
            exit
        " | gnuplot
    }
}

set_max_prepared_stmt_count() {
    # set max_prepared_stmt_count - Required for sysbench - This is a MariaDB/Mysql thing
    # $1 - Database System (properties file)
    # $2 - Requested max_prepared_stmt_count
    echo
    echo "    ===== Set global max_prepared_stmt_count $1 $2 =====    [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    local SYSTEMS=( $(get_property $1 mariadb.systems) )
    SYSTEMS=( ${SYSTEMS[*]} $(get_property $1 galera.systems) )
    [[ ${SYSTEMS} ]] || SYSTEMS=( $1 )
    echo "            Systems : ( ${SYSTEMS[*]} )"
    local DATABASE=""
    local CURRENT=""
    for SYSTEM in ${SYSTEMS[*]} ; do
        DATABASE=$(get_property $1 database)
        echo "            System : ${SYSTEM} , Database : ${DATABASE}"
        if [[ ${DATABASE} == 'mysql' || ${DATABASE} == 'mariadb' || ${DATABASE} == 'aurora' ]] ; then
            CURRENT=$(mariadb -sN $(get_database_connection ${SYSTEM}) -e "select @@max_prepared_stmt_count")
            echo "            System : ${SYSTEM} , Current max_prepared_stmt_count :  ${CURRENT} , Required max_prepared_stmt_count : $2"
            if (( $2 > ${CURRENT} )) ; then
                mariadb -vvv $(get_database_connection ${SYSTEM}) -e "set global max_prepared_stmt_count=$2"
                mariadb -vvv $(get_database_connection ${SYSTEM}) -e "select @@max_prepared_stmt_count"
            fi
        fi
    done
}

set_max_connections() {
    # set max_connections - Required for sysbench
    # $1 - Database System (properties file)
    # $2 - Requested max_connections
    echo
    echo "    ===== Set global max_connections $1 $2 =====    [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    local DATABASE=$(get_property $1 database)
    if [[ ${DATABASE} == 'mariadb' || ${DATABASE} == 'mysql' || ${DATABASE} == 'clustrix' ]] ; then
        local SYSTEMS=( $(get_property $1 mariadb.systems) )
        [[ ${SYSTEMS} ]] || SYSTEMS=( $1 )
        for SYSTEM in ${SYSTEMS[*]} ; do
            local CURRENT=$(mariadb -sN $(get_database_connection ${SYSTEM}) -e "select @@max_connections")
            echo "            System : ${SYSTEM} , Current max_connections :  ${CURRENT} , Required max_connections : $2"
            if (( $2 > ${CURRENT} )) ; then
                mariadb -vvv $(get_database_connection ${SYSTEM}) -e "set global max_connections=$2"
                mariadb -vvv $(get_database_connection ${SYSTEM}) -e "select @@max_connections"
            fi
        done
    fi
}

force_innodb_checkpoint() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    [[ ${DATABASE} ]] || DATABASE=$(get_property ${CLUSTER} database)
    if [[ ${DATABASE} == 'mariadb' || ${DATABASE} == 'mysql' ]] ; then
        # 200930 This logic comes from Axel's run.sysbench script
        echo
        echo "        Forcing InnoDB Checkpoint"
        local MAX_DIRTY_PAGES_PCT_SAVE=$(mariadb -sN $(get_database_connection ${SYSTEM}) -e 'select @@innodb_max_dirty_pages_pct;')
        local MAX_DIRTY_PAGES_PCT_LWM_SAVE=$(mariadb -sN $(get_database_connection ${SYSTEM}) -e 'select @@innodb_max_dirty_pages_pct_lwm;')
        mariadb -vvv $(get_database_connection ${SYSTEM}) -e "set global innodb_max_dirty_pages_pct=0;"
        echo
        echo "        Waiting for buffer_pool to clear"
        local PAGES_DIRTY_OLD=0
        local REPEAT=5
        local BUFFER_POOL_PAGES_DIRTY=$(mariadb -sN $(get_database_connection ${SYSTEM}) -e "show global status like 'innodb_buffer_pool_pages_dirty';" | awk '{print $2}')
        while (( ${BUFFER_POOL_PAGES_DIRTY} >= 100 && ${REPEAT} >= 0 )) ; do
            sleep 5
            BUFFER_POOL_PAGES_DIRTY=$(mariadb -sN $(get_database_connection ${SYSTEM}) -e "show global status like 'innodb_buffer_pool_pages_dirty';" | awk '{print $2}')
            echo -n ".${BUFFER_POOL_PAGES_DIRTY}"
            if (( ${BUFFER_POOL_PAGES_DIRTY} == ${PAGES_DIRTY_OLD} )) ; then (( REPEAT = ${REPEAT} - 1 )) ; fi
            PAGES_DIRTY_OLD=${BUFFER_POOL_PAGES_DIRTY}
        done
        echo ".${BUFFER_POOL_PAGES_DIRTY}.done"
        mariadb -vvv $(get_database_connection ${SYSTEM}) -e "set global innodb_max_dirty_pages_pct=${MAX_DIRTY_PAGES_PCT_SAVE};"
        mariadb -vvv $(get_database_connection ${SYSTEM}) -e "set global innodb_max_dirty_pages_pct_lwm=${MAX_DIRTY_PAGES_PCT_LWM_SAVE};"
        #finally unblock any blocked hosts
        mariadb -vvv $(get_database_connection ${SYSTEM}) -e "FLUSH HOSTS"
    fi
}

start_profiling() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    local HOST=$(get_database_host ${SYSTEM})
    local DATABASE=$(get_property ${SYSTEM} database)
    if [[ ${DATABASE} == 'mariadb' || ${DATABASE} == 'mysql' ]] ; then
        local PROFILEDIR="/data/cbench/profiles"
        #check if the tools exist, we use ${PROFILEDIR} as marker
        ssh $(get_ssh_connection ${CLUSTER} ${HOST}) "
            if [[ ! -d ${PROFILEDIR} ]] ; then
                sudo yum -y install perl-open git perf bcc-tools kernel-devel
                git clone https://github.com/brendangregg/FlameGraph
                sudo mkdir -p ${PROFILEDIR}
                sudo chmod 777 ${PROFILEDIR}
            fi
        "

        #some defaults
        [[ ${PROFILE_WARMUP} ]] || PROFILE_WARMUP=90
        [[ ${PROFILE_TIME} ]] || PROFILE_TIME=60
        [[ ${PROFILE_EVENT} ]] || PROFILE_EVENT="-F 199"
        [[ ${PROFILE_TYPE} ]] || PROFILE_TYPE="cpuflamegraph"

        #file name
        local PROFILENAME="${PROFILE_TYPE}"
        [[ ${WORKLOAD} ]] && PROFILENAME="${PROFILENAME}-${WORKLOAD}" || PROFILENAME="${PROFILENAME}-unknown"
        [[ ${TOTAL_STREAMS} ]] && PROFILENAME="${PROFILENAME}-${TOTAL_STREAMS}" || PROFILENAME="${PROFILENAME}-unknown"

        local COMMAND=""
        case ${PROFILE_TYPE} in
        cpuflamegraph)  COMMAND="sleep ${PROFILE_WARMUP}; sudo perf record ${PROFILE_EVENT}"
                        COMMAND="${COMMAND} -p \$(pidof -s ${DATABASE}d)"
                        COMMAND="${COMMAND} -o ${PROFILEDIR}/${PROFILENAME}"
                        COMMAND="${COMMAND} -g -- sleep ${PROFILE_TIME}"
                        COMMAND="${COMMAND}; sudo chown \$(whoami) ${PROFILEDIR}/${PROFILENAME}"
                        ;;

        cpuofftime)     COMMAND="sleep ${PROFILE_WARMUP}; sudo /usr/share/bcc/tools/offcputime"
                        COMMAND="${COMMAND} --stack-storage-size=1048576 -df -p \$(pidof -s ${DATABASE}d)"
                        COMMAND="${COMMAND}  ${PROFILE_TIME} > ${PROFILEDIR}/${PROFILENAME}"
                        COMMAND="${COMMAND}; sudo chown \$(whoami) ${PROFILEDIR}/${PROFILENAME}"
                        ;;

        *)              echo "unsupported PROFILE_TYPE = ${PROFILE_TYPE}"
                        ;;
        esac

        if [[ ${COMMAND} ]] ; then
            echo
            echo "    COMMAND = ${COMMAND}"
            ssh $(get_ssh_connection ${CLUSTER} ${HOST}) ${COMMAND} &
        fi

    else
        echo "profiling not supported for ${DATABASE}"
    fi
}


stop_profiling() {
    local SYSTEM=$1
    [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}
    local HOST=$(get_database_host ${SYSTEM})
    local DATABASE=$(get_property ${SYSTEM} database)

    if [[ ${DATABASE} == 'mariadb' || ${DATABASE} == 'mysql' ]] ; then
        [[ ${PROFILE_TYPE} ]] || PROFILE_TYPE="cpuflamegraph"
        local PROFILEDIR="/data/clustrix/profiles"
        local PROFILENAME="${PROFILE_TYPE}"
        [[ ${WORKLOAD} ]] && PROFILENAME="${PROFILENAME}-${WORKLOAD}" || PROFILENAME="${PROFILENAME}-unknown"
        [[ ${TOTAL_STREAMS} ]] && PROFILENAME="${PROFILENAME}-${TOTAL_STREAMS}" || PROFILENAME="${PROFILENAME}-unknown"

        local COMMAND=""
        local RESULTFILE=""
        case ${PROFILE_TYPE} in
        cpuflamegraph)  COMMAND="cd FlameGraph; perf script -i ${PROFILEDIR}/${PROFILENAME}"
                        COMMAND="${COMMAND} | ./stackcollapse-perf.pl > /tmp/folded"
                        COMMAND="${COMMAND}; ./flamegraph.pl /tmp/folded > ../${PROFILENAME}.svg && rm /tmp/folded"
                        RESULTFILE="${PROFILENAME}.svg"
                        ;;

        cpuofftime)     COMMAND="cd FlameGraph; ./flamegraph.pl --title='Off-CPU Time Flame Graph'"
                        COMMAND="${COMMAND} --color=io --countname=us < ${PROFILEDIR}/${PROFILENAME}"
                        COMMAND="${COMMAND} > ../${PROFILENAME}.svg"
                        RESULTFILE="${PROFILENAME}.svg"
                        ;;

        *)              echo "unsupported PROFILE_TYPE = ${PROFILE_TYPE}"
                        ;;
        esac

        if [[ ${COMMAND} ]] ; then
            echo
            echo "    COMMAND = ${COMMAND}"
            ssh $(get_ssh_connection ${CLUSTER} ${HOST}) ${COMMAND}
        fi

        if [[ ${RESULTFILE} ]] ; then
            scp $(get_scp_copy_from_connection ${CLUSTER} ${HOST} ${RESULTFILE} ${LOGDIRECTORY}/. )
        fi

    fi
}

