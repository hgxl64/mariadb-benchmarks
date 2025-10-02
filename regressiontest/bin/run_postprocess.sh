#!/bin/bash

source rt_functions.sh
source ${RT_HOME}/config/global


info $(date --utc "+%F %T local postprocessing start")

# Step 1: postprocess results for individal tests

ALLTESTS=$(find ${RT_HOME}/tests -maxdepth 1 -type d -name t_\* -printf "%P\n" | sort)

for t in ${TESTS:-$ALLTESTS}
do
    if [[ -d ${LOGDIRECTORY}/$t ]]
    then
        info $(date --utc "+%F %T postprocessing test $t")
        create_plots_for_test $t 2>&1
    fi
done


info $(date --utc "+%F %T local postprocessing end")


if [[ ${POST_PROC_HOST} ]]
then
    info $(date --utc "+%F %T remote postprocessig @ ${POST_PROC_HOST} start")

    ssh ${POST_PROC_HOST} "./post_process.sh ${HOSTNAME} $(basename ${LOGDIRECTORY})" 2>&1

    info $(date --utc "+%F %T remote postprocessig @ ${POST_PROCESSING_HOST} end")
fi

