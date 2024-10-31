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
        test_postprocess $t
    fi
done

# FIXME: add more postprocessing steps


