#!/bin/bash

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0
    Configures a remote driver system with latest software.

    Options:
        [ --driver <<systemname>> ]
        [ --user <<systemusername>> ]
        [ -h|--help ]
    Notes:
    1.  driver is the system name of the driver.
    2.  user is the system user name.  Default root.
"

COMMAND_LINE="$@"

while [[ $# > 0 ]]; do
    key="$1"
    shift
    case ${key} in
        --driver)           DRIVER="$1"; shift;;
        --cluster)          CLUSTER="$1"; shift;;
        --drivers)          DRIVERS="$1"; shift;;
        --cloud)            OPTION_CLOUD=TRUE;;
        --aws | --gcp)      OPTION_CLOUD=TRUE;;
        --extended_scripts) OPTION_EXTENDED_SCRIPTS=TRUE;;

        --force) OPTION_FORCE=TRUE;;

        -h | --help)        echo -e "$USAGE"; exit 1;;
        *)                  echo "Invalid input switch: $key"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done

[[ ${DRIVER} ]] || {
    echo "Required Driver Name Not Specified."
    echo -e "$USAGE"
    exit 1
}

process_connection_info


# logging
TEST_NAME=configure.driver.${DRIVER}
[[ ${TESTID} ]] || TESTID=$(date +%y%m%d.%H%M%S).${CLUSTER}
if [[ ! ${LOGDIRECTORY} ]]; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${CLUSTER}/${TESTID}.${TEST_NAME}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}

{

    echo
    echo "    ===== Begin $0 =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    STARTSECONDS=$SECONDS

    echo
    echo "        $0 $*"
    echo
    echo "            DRIVER           = ${DRIVER}"
    echo
    echo "            SSH_USER         = ${SSH_USER}"
    echo "            SSH_PORT         = ${SSH_PORT}"
    echo "            SSH_PEM          = ${SSH_PEM}"
    echo
    echo "            OPTION_CLOUD     = ${OPTION_CLOUD}"
    echo

    if [[ ${DRIVER} == localhost || ${DRIVER} == $(hostname) ]]; then
        echo "        Localhost Driver.  Nothing to do."
    else

        echo "    ===== Configure Driver ${DRIVER}  =====  [ $(date -u +'%Y-%m-%d %H:%M:%S') ]"

        echo
        echo "            $(ssh $(get_ssh_connection ${CLUSTER} ${DRIVER}) 'uname -n')"

        if [[ ! ${OPTION_CLOUD} ]]; then
            # resync the system clock
            ssh $(get_ssh_connection ${CLUSTER} ${DRIVER}) "ntpdate -u pool.ntp.org"
        fi

        if $(ssh $(get_ssh_connection ${CLUSTER} ${DRIVER}) "[[ -d /data/cbench/driver ]] && echo 1"); then
            echo "            Driver exists"
        else
            UPDATE_DRIVER=TRUE
        fi

        [[ ${OPTION_FORCE} ]] && UPDATE_DRIVER=TRUE

        if [[ ${UPDATE_DRIVER} == TRUE ]]; then

            echo
            echo "    ===== Updating Remote Driver =====  [ $(date -u +'%Y-%m-%d %H:%M:%S') ]"
            echo
            echo "    ===== Erase Current Driver Pack (if it exists) =====  [ $(date -u +'%Y-%m-%d %H:%M:%S') ]"
            time {
                ssh $(get_ssh_connection ${CLUSTER} ${DRIVER}) '
                    [[ -d /data/cbench/driver ]] && rm -rf /data/cbench/driver'
            }

            echo
            echo "    ===== Install Driver Pack =====  [ $(date -u +'%Y-%m-%d %H:%M:%S') ]"
            time {
                ssh $(get_ssh_connection ${CLUSTER} ${DRIVER}) '
                    [[ -d /data/cbench ]] || mkdir -p /data/cbench/driver'
                scp -r $(get_scp_copy_to_connection ${CLUSTER} ${DRIVER} ${CBENCH_HOME}/driver /data/cbench/)
                [[ $? -ne 0 ]] && { echo "scp command failed"; exit 1; }
            }

            echo
            echo "        ===== set ulimit -n =====  [ $(date -u +'%Y-%m-%d %H:%M:%S') ]"
            ULIMIT_N=$(ssh $(get_ssh_connection ${CLUSTER} ${DRIVER}) 'ulimit -n')
            if ((${ULIMIT_N} < 20000)); then
                ssh $(get_ssh_connection ${CLUSTER} ${DRIVER}) "echo '* soft nofile 20000' | sudo tee -a /etc/security/limits.conf"
                ssh $(get_ssh_connection ${CLUSTER} ${DRIVER}) "echo '* hard nofile 20000' | sudo tee -a /etc/security/limits.conf"
            fi
            ssh $(get_ssh_connection ${CLUSTER} ${DRIVER}) 'ulimit -n'

        fi

        echo "    ===== Sync Clocks =====  [ $(date -u +'%Y-%m-%d %H:%M:%S') ]"
        echo
        echo "            Before : $(date) , $(ssh $(get_ssh_connection ${CLUSTER} ${DRIVER}) 'date')"
        ssh $(get_ssh_connection ${CLUSTER} ${DRIVER}) "sudo date --set '$(date)'" >/null
        echo "            After  : $(date) , $(ssh $(get_ssh_connection ${CLUSTER} ${DRIVER}) 'date')"

        echo ""
        echo "    ===== Check Software =====  [ $(date -u +'%Y-%m-%d %H:%M:%S') ]"
        echo ""
        ssh $(get_ssh_connection ${CLUSTER} ${DRIVER}) "sysbench --version"
    fi

    echo
    echo "        ssh connection : ssh $(get_ssh_connection ${CLUSTER} ${DRIVER})"
    echo
    echo "    ===== End $0 ( Elapsed Seconds = $(($SECONDS - $STARTSECONDS)) ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S).${TEST_NAME}.log
