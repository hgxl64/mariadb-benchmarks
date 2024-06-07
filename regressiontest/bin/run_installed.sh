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
    -h|--help
Examples:
    $0 --database mariadb --branch 10.6 ...
    $0 --branch 10.6 --commit 0815badc0de
"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in
        --branch)       BRANCH="$1"; shift;;
        --commit)       COMMIT="$1"; shift;;
        --database)     DATABASE="$1"; shift;;
        -h|--help)      error "$USAGE"; exit 1;;
        *)  msg "Invalid input switch: $key"; msg "COMMAND_LINE = ${COMMAND_LINE}"; error "${USAGE}";;
    esac
done


# -------------------
# default options
# -------------------

[[ ${DATABASE} ]] || DATABASE=$DEFAULT_DATABASE


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
    echo "VERSION(): $($MYSQL -S $SOCKET -e 'select version()' | tail -1  | cut -f 2)" >> $LOGDIRECTORY/desc.yaml

    msg $(date --utc "+%F %T running regression tests for ${DATABASE}")

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

