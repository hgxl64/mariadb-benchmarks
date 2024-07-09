#!/bin/bash

DATABASE="mariadb-community"
DEFAULT_BRANCHES="10.5 10.6 10.11 11.1 11.2 11.4 11.5 11.6"

unset BRANCHES
unset COMMIT

source rt_functions.sh
source ${RT_HOME}/config/global
source ${RT_HOME}/config/${DATABASE}


# -------------------
# command line processing
# -------------------

USAGE="usage: $0

run regression tests on ${DATABASE}, default branches: '${DEFAULT_BRANCHES}'
Options:
    --branch ... [ --branch ... ]
    --commit ...
    --force
    -h|--help
Examples:
    $0 --branch 10.5 --branch 10.6 ...
    $0 --branch 10.6 --commit 0815badc0de
    $0 --force
"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in
        --branch)       BRANCHES="${BRANCHES} $1"; shift;;
        --commit)       COMMIT="$1"; shift;;
        --force)        FORCE=1;;
        --keeplog)      KEEPLOG=1;;
        -h|--help)      error "$USAGE"; exit 1;;
        *)  msg "Invalid input switch: $key"; msg "COMMAND_LINE = ${COMMAND_LINE}"; error "${USAGE}";;
    esac
done


# -------------------
# script starts here
# -------------------

JOB="regressiontest.${DATABASE}"
ALLTESTS=$(find ${RT_HOME}/tests -maxdepth 1 -type d -name t_\* -printf "%P\n" | sort)

set_branches_tested 0

for branch in ${BRANCHES:-$DEFAULT_BRANCHES}
do
    if [[ ${COMMIT} ]]
    then
        LOGDIRECTORY=${RT_LOG_HOME}/$(date +%y%m%d.%H%M%S.${JOB}.${COMMIT})
    else
        LOGDIRECTORY=${RT_LOG_HOME}/$(date +%y%m%d.%H%M%S.${JOB}.${branch})
    fi
    mkdir -p $LOGDIRECTORY
    export LOGDIRECTORY
    reset_rm_logdir

    {
        msg $(date --utc "+%F %T running regression tests for ${DATABASE} branch ${branch}")
        date --utc "+%F %T" > $LOGDIRECTORY/start
        collect_host_info
        echo "TIMESTAMP: $(date '+%s')" >  $LOGDIRECTORY/desc.yaml
        echo "DATABASE: ${DATABASE}"    >> $LOGDIRECTORY/desc.yaml
        echo "BRANCH: ${branch}"        >> $LOGDIRECTORY/desc.yaml
        echo "SOURCE: git"              >> $LOGDIRECTORY/desc.yaml

        msg $(date --utc "+%F %T trying to install server")
        CMD="install_server.sh --database $DATABASE --source git --branch $branch"
        if [[ -n ${COMMIT} ]]
        then
            CMD="${CMD} --commit ${COMMIT}"
            echo "COMMIT: ${COMMIT}" >> $LOGDIRECTORY/desc.yaml
        fi
        $CMD
        status=$?

        if [[ $status -eq 1 ]]
        then
            date --utc "+%F %T" > $LOGDIRECTORY/stop
            echo "install server failed" > $LOGDIRECTORY/FAILED
            error "install server failed"
        elif [[ $status -eq 2 && ! ${FORCE} ]]
        then
            if [[ ${KEEPLOG} ]]
            then
                date --utc "+%F %T" > $LOGDIRECTORY/stop
                echo "regression test for this commit already run" > $LOGDIRECTORY/FAILED
            else
                set_rm_logdir
            fi
            error "regression test already run, skipping"
        fi

        export TARGETDIR=$(get_targetdir)
        remove_targetdir
        echo "BINARY: $(basename ${TARGETDIR})" >> $LOGDIRECTORY/desc.yaml
        msg $(date --utc "+%F %T install server succeeded (into ${TARGETDIR})")

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

done


branches_tested=$(get_branches_tested)
reset_branches_tested

info "tested ${branches_tested} branch(es) for regressions"

[[ ${branches_tested} -eq 0 ]] && exit 1
exit 0

