#!/bin/bash

DATABASE="mariadb-enterprise"
DEFAULT_BRANCHES="10.4-enterprise 10.5-enterprise 10.6-enterprise"

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
    --release ...
    --commit ...
    --force
    -h|--help
Examples:
    $0 --branch 10.6-enterprise --release 10.6.17-12
    $0 --branch 10.6-enterprise --commit 0815badc0de
    $0 --branch 10.5-enterprise --branch 10.6-enterprise ...
    $0 --force
"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in
        --branch)       BRANCHES="${BRANCHES} $1"; shift;;
        --release)      RELEASE="$1"; shift;;
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

for branch in ${BRANCHES:-$DEFAULT_BRANCHES}
do
    if [[ ${RELEASE} ]]
    then
        LOGDIRECTORY=${RT_LOG_HOME}/$(date +%y%m%d.%H%M%S.${JOB}.${RELEASE})
    elif [[ ${COMMIT} ]]
    then
        LOGDIRECTORY=${RT_LOG_HOME}/$(date +%y%m%d.%H%M%S.${JOB}.${COMMIT})
    else
        LOGDIRECTORY=${RT_LOG_HOME}/$(date +%y%m%d.%H%M%S.${JOB}.${branch})
    fi
    export LOGDIRECTORY
    mkdir -p $LOGDIRECTORY

    {
        date --utc "+%F %T" > $LOGDIRECTORY/start
        collect_host_info
        echo "TIMESTAMP: $(date '+%s')" >  $LOGDIRECTORY/desc.yaml
        echo "DATABASE: ${DATABASE}"    >> $LOGDIRECTORY/desc.yaml
        echo "BRANCH: ${branch}"        >> $LOGDIRECTORY/desc.yaml
        echo "SOURCE: jenkins"          >> $LOGDIRECTORY/desc.yaml

        msg $(date --utc "+%F %T running regression tests for ${DATABASE} branch ${branch}")
        CMD="install_server.sh --database $DATABASE --branch $branch --source jenkins"
        if [[ -n ${RELEASE} ]]
        then
            CMD="${CMD} --buildtype release --release ${RELEASE}"
            echo "BUILD: release"      >> $LOGDIRECTORY/desc.yaml
            echo "RELEASE: ${RELEASE}" >> $LOGDIRECTORY/desc.yaml
        else
            CMD="${CMD} --buildtype snapshot"
            echo "BUILD: snapshot"     >> $LOGDIRECTORY/desc.yaml
            if [[ -n ${COMMIT} ]]
            then
                CMD="${CMD} --commit ${COMMIT}"
                echo "COMMIT: ${COMMIT}" >> $LOGDIRECTORY/desc.yaml
            fi
        fi
        $CMD
        status=$?

        if [[ $status -eq 1 ]]
        then
            error "installing server failed"
        elif [[ $status -eq 2 && ! ${FORCE} ]]
        then
            if [[ ! ${KEEPLOG} ]]
            then
                rm -rf $LOGDIRECTORY
            fi
            error "regression test already run, skipping"
        fi

        export TARGETDIR=$(get_targetdir)
        remove_targetdir
        echo "BINARY: $(basename ${TARGETDIR})" >> $LOGDIRECTORY/desc.yaml
        cp ${TARGETDIR}/build.properties $LOGDIRECTORY/

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

    } 2>&1 | tee $LOGDIRECTORY/${JOB}.log

done

