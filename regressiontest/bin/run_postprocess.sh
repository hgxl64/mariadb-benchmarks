#!/bin/bash

source rt_functions.sh
source ${RT_HOME}/config/global


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

# FIXME: add more postprocessing steps


# finally run postprocessing script defined in host config

if [[ -s ${POST_PROCESSING_SCRIPT:-""} ]]
then
    info $(date --utc "+%F %T running ${POST_PROCESSING_SCRIPT}")
    $POST_PROCESSING_SCRIPT 2>&1
fi
