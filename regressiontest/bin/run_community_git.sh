#!/bin/bash

DATABASE="mariadb-community"

source rt_functions.sh
source ${RT_HOME}/config/global
source ${RT_HOME}/config/${DATABASE}


# -------------------
# command line processing
# -------------------

USAGE="usage: $0

run regression tests on ${DATABASE}
Options:
    --branch ...
    --commit ...
    --force
    -h|--help
Examples:
    $0 --branch 10.5
    $0 --branch 10.6 --commit 0815badc0de
    $0 --force
"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in
        --branch)       BRANCH="$1"; shift;;
        --commit)       COMMIT="$1"; shift;;
        --tag)          TAG="$1"; shift;;
        --force)        FORCE=1;;
        --keeplog)      KEEPLOG=1;;
        -h|--help)      error "$USAGE"; exit 1;;
        *)  msg "Invalid input switch: $key"; msg "COMMAND_LINE = ${COMMAND_LINE}"; error "${USAGE}";;
    esac
done


# -------------------
# script starts here
# -------------------

#handle alias names for branches, i.e. 11.8=main
if [[ $BRANCH =~ '=' ]]
then
    GITBRANCH=$(echo $BRANCH | cut -d '=' -f 2)
    BRANCH=$(echo $BRANCH | cut -d '=' -f 1)
else
    GITBRANCH=$BRANCH;
fi

JOB="regressiontest.${DATABASE}"
[[ $BRANCH ]]   && JOB="${JOB}.${BRANCH}"
[[ ${COMMIT} ]] && JOB="${JOB}.${COMMIT}"

export LOGDIRECTORY=${RT_LOG_HOME}/$(date +%y%m%d.%H%M%S.${JOB})
mkdir -p $LOGDIRECTORY
reset_rm_logdir

ALLTESTS=$(find ${RT_HOME}/tests -maxdepth 1 -type d -name t_\* -printf "%P\n" | sort)
set_branches_tested 0

{
    msg $(date --utc "+%F %T running regression tests for ${DATABASE} branch ${BRANCH}")
    date --utc "+%F %T" > $LOGDIRECTORY/start
    collect_host_info
    echo "TIMESTAMP: $(date '+%s')"        >  $LOGDIRECTORY/desc.yaml
    echo "DATABASE: ${DATABASE}"           >> $LOGDIRECTORY/desc.yaml
    echo "SOURCE: git"                     >> $LOGDIRECTORY/desc.yaml
    echo "BRANCH: ${BRANCH}"               >> $LOGDIRECTORY/desc.yaml
    echo "GITBRANCH: ${GITBRANCH}"         >> $LOGDIRECTORY/desc.yaml
    echo "COMMIT: ${COMMIT}"               >> $LOGDIRECTORY/desc.yaml
    echo "TAG: ${TAG}"                     >> $LOGDIRECTORY/desc.yaml
    echo "COMMANDLINE: $0 ${COMMAND_LINE}" >> $LOGDIRECTORY/desc.yaml

    msg $(date --utc "+%F %T installing server")
    CMD="install_server.sh --database $DATABASE --source git --branch $GITBRANCH"
    if [[ -n ${COMMIT} ]]
    then
        CMD="${CMD} --commit ${COMMIT}"
    fi
    $CMD
    status=$?

    if [[ $status -eq 0 ]]
    then
        msg $(date --utc "+%F %T install server succeeded")
    elif [[ $status -eq 1 ]]
    then
        date --utc "+%F %T" > $LOGDIRECTORY/stop
        echo "install server failed" > $LOGDIRECTORY/FAILED
        if [[ ! ${KEEPLOG} ]]
        then
            set_rm_logdir
        fi
        error "install server failed"
    elif [[ $status -eq 2 ]]
    then
        if [[ ! ${FORCE} ]]
        then
            if [[ ${KEEPLOG} ]]
            then
                date --utc "+%F %T" > $LOGDIRECTORY/stop
                echo "regression test for this commit already run" > $LOGDIRECTORY/FAILED
            else
                set_rm_logdir
            fi
            error "regression test already run, skipping"
        else
            msg $(date --utc "+%F %T reusing already installed server")
        fi
    fi

    export TARGETDIR=$(get_targetdir)
    remove_targetdir
    echo "BINARY: $(basename ${TARGETDIR})" >> $LOGDIRECTORY/desc.yaml
    msg $(date --utc "+%F %T using server binaries from ${TARGETDIR}")

    info $(date --utc "+%F %T setting power plan 'max'") >> $LOGDIRECTORY/pstate-frequency.log
    sudo pstate-frequency -S -p max >> $LOGDIRECTORY/pstate-frequency.log
    for t in ${TESTS:-$ALLTESTS}
    do
        if [[ -x ${RT_HOME}/tests/$t/runme.sh ]]
        then

            info $(date --utc "+%F %T running test $t")
            pushd ${RT_HOME}/tests/$t > /dev/null
            ./runme.sh
            popd > /dev/null

        fi
    done
    info $(date --utc "+%F %T setting power plan 'balanced'") >> $LOGDIRECTORY/pstate-frequency.log
    sudo pstate-frequency -S -p balanced >> $LOGDIRECTORY/pstate-frequency.log

    date --utc "+%F %T" > $LOGDIRECTORY/stop

    msg $(date --utc "+%F %T postprocess $(basename ${LOGDIRECTORY})")
    run_postprocess.sh > $LOGDIRECTORY/postprocess.log

    inc_branches_tested

} 2>&1 | tee $LOGDIRECTORY/${JOB}.log

if [[ $(get_rm_logdir) -eq 1 ]]
then
    rm -rf $LOGDIRECTORY
    reset_rm_logdir
fi


branches_tested=$(get_branches_tested)
reset_branches_tested

info "tested ${branches_tested} branch(es) for regressions"

[[ ${branches_tested} -eq 0 ]] && exit 1
exit 0

