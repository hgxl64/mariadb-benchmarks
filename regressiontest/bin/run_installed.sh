#!/bin/bash

DATABASE="mariadb"
BRANCHES="10.6"

source rt_functions.sh
source ${RT_HOME}/config/global
source ${RT_HOME}/config/${DATABASE}


# -------------------
# script starts here
# -------------------

JOB="test.${DATABASE}"
ALLTESTS=$(find ${RT_HOME}/tests -maxdepth 1 -type d -name t_\* -printf "%P\n" | sort)

for branch in ${BRANCHES}
do
    export LOGDIRECTORY=${RT_LOG_HOME}/$(date +%y%m%d.%H%M%S.${JOB}.${branch})
    mkdir -p $LOGDIRECTORY
    {
        date --utc "+%F %T" > $LOGDIRECTORY/start

        echo "TIMESTAMP: $(date '+%s')" >  $LOGDIRECTORY/desc.yaml
        echo "DATABASE: ${DATABASE}"    >> $LOGDIRECTORY/desc.yaml
        echo "BRANCH: ${branch}"        >> $LOGDIRECTORY/desc.yaml
        echo "VERSION: $(mysql -e 'select version()' | tail -1  | cut -f 2)" >> $LOGDIRECTORY/desc.yaml

        msg $(date --utc "+%F %T running regression tests for ${DATABASE} branch ${branch}")

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

    } 2>&1 | tee $LOGDIRECTORY/${JOB}.log

done

