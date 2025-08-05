#!/bin/bash
#
# run MariaDB CS regression tests in an endless loop
#
#

BRANCHES="10.5 10.6 10.11 11.4 11.7 11.8 12.0 12.1 12.2=main"
STOPFILE="${HOME}/stop"
IDLE=3600

while true
do
    echo -e "running MariaDB CS regression tests\n\n'touch ${STOPFILE}' to stop gracefully\n"
    branches_tested=0

    for branch in ${BRANCHES}
    do
        [[ -f ${STOPFILE} ]] && break
        run_community_git.sh --branch ${branch} && branches_tested=$(($branches_tested + 1))
    done

    if [[ -f ${STOPFILE} ]]
    then
        echo "found ${STOPFILE} - exiting"
        break
    fi

    #if no branch had a new commit, sleep a while
    if [[ $branches_tested -eq 0 ]]
    then
        date --utc "+%F %T no new commits in (${BRANCHES})"
        echo "sleeping for ${IDLE} seconds"
        sleep ${IDLE}
    fi

done

