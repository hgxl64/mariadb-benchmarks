#!/bin/bash

DEFAULT_DATABASE="mariadb"

# -------------------
# command line processing
# -------------------

USAGE="usage: $0

run regression tests
Options:
    --branch ...
    --commit ...
    --database ... (default: $DEFAULT_DATABASE)
    --host
    --user ....... (default: $DEFAULT_USER)
    --password ... (default: $DEFAULT_PASSWORD)
    -h|--help
Example:
    $0 --database mariadb --branch 10.6 --host aa.bb.cc.dd
"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in
        --branch)       BRANCH="$1"; shift;;
        --commit)       COMMIT="$1"; shift;;
        --database)     DATABASE="$1"; shift;;
        --host)         HOST="$1"; shift;;
        --user)         USER="$1"; shift;;
        --password)     PASSWORD="$1"; shift;;
        -h|--help)      error "$USAGE"; exit 1;;
        *)  msg "Invalid input switch: $key"; msg "COMMAND_LINE = ${COMMAND_LINE}"; error "${USAGE}";;
    esac
done


# -------------------
# default options
# -------------------

[[ ${DATABASE} ]] || DATABASE=$DEFAULT_DATABASE

[[ ${HOST} ]] || error "mandatory --host option not given! cannot continue"

# setup connection variables to remote host
if [[ ! ${MYSQL_CONNECTION} ]]
then
    MYSQL_CONNECTION="-h ${HOST}"
    [[ ${USER} ]]     && MYSQL_CONNECTION="${MYSQL_CONNECTION} -u ${USER}"
    [[ ${PASSWORD} ]] && MYSQL_CONNECTION="${MYSQL_CONNECTION} -p ${PASSWORD}"
    export MYSQL_CONNECTION
fi

if [[ ! ${SYSBENCH_CONNECTION} ]]
then
    SYSBENCH_CONNECTION="--mysql-host=${HOST}"
    [[ ${USER} ]]     && SYSBENCH_CONNECTION="${SYSBENCH_CONNECTION} --mysql-user=${USER}"
    [[ ${PASSWORD} ]] && SYSBENCH_CONNECTION="${SYSBENCH_CONNECTION} --mysql-password=${PASSWORD}"
    export SYSBENCH_CONNECTION
fi

[[ ${REMOTE_SHELL} ]] || export REMOTE_SHELL="ssh ${HOST}"


# -------------------
# script starts here
# -------------------

source rt_functions.sh
source ${RT_HOME}/config/global
source ${RT_HOME}/config/${DATABASE}

JOB="test.${DATABASE}"
if [[ ${COMMIT} ]]
then
    JOB="${JOB}.${COMMIT}"
elif [[ $BRANCH ]]
then
    JOB="${JOB}.${BRANCH}"
fi

export LOGDIRECTORY=${RT_LOG_HOME}/$(date +%y%m%d.%H%M%S.${JOB})
mkdir -p $LOGDIRECTORY

{
    date --utc "+%F %T" > $LOGDIRECTORY/start
    collect_host_info

    echo "TIMESTAMP: $(date '+%s')" >  $LOGDIRECTORY/desc.yaml
    echo "DATABASE: ${DATABASE}"    >> $LOGDIRECTORY/desc.yaml
    echo "BRANCH: ${BRANCH}"        >> $LOGDIRECTORY/desc.yaml
    echo "COMMIT: ${COMMIT}"        >> $LOGDIRECTORY/desc.yaml
    echo "HOST: ${HOST}"            >> $LOGDIRECTORY/desc.yaml
    echo "USER: ${USER}"            >> $LOGDIRECTORY/desc.yaml
    echo "PASSWORD: ${PASSWORD}"    >> $LOGDIRECTORY/desc.yaml
    echo "VERSION(): $(mysql -e 'select version()' | tail -1  | cut -f 2)" >> $LOGDIRECTORY/desc.yaml

    msg $(date --utc "+%F %T running regression tests for ${DATABASE} on ${HOST}")

    ALLTESTS=$(find ${RT_HOME}/tests -maxdepth 1 -type d -name t_\* -printf "%P\n" | sort)
    for t in ${TESTS:-$ALLTESTS}
    do
        if [[ -x ${RT_HOME}/tests/$t/runme.sh ]]
        then
            info $(date --utc "+%F %T running test $t")
            pushd ${RT_HOME}/tests/$t > /dev/null
            ./runme.sh --installed
            popd > /dev/null
        fi
    done
    date --utc "+%F %T" > $LOGDIRECTORY/stop

} 2>&1 | tee $LOGDIRECTORY/${JOB}.log

