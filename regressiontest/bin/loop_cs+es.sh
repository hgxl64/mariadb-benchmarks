#!/bin/bash
#
# run MariaDB regression tests in an endless loop
#
#

CSBRANCHES="10.5 10.6 10.11 11.4 11.7 11.8 12.0 12.1 12.2 12.3=main"
ESBRANCHES="10.5-enterprise 10.6-enterprise 11.4-enterprise 11.8-enterprise"

STOPFILE="${HOME}/stop"
IDLE=3600

while true
do
    branches_tested=0

    echo -e "running MariaDB CS regression tests for ${CSBRANCHES}\n\n'touch ${STOPFILE}' to stop gracefully\n"
    for branch in ${CSBRANCHES}
    do
        [[ -f ${STOPFILE} ]] && break
        run_community_git.sh --branch ${branch} && branches_tested=$(($branches_tested + 1))
    done

    echo -e "running MariaDB ES regression tests for ${ESBRANCHES}\n\n'touch ${STOPFILE}' to stop gracefully\n"
    for branch in ${ESBRANCHES}
    do
        [[ -f ${STOPFILE} ]] && break
        run_enterprise_jenkins.sh --branch ${branch} && branches_tested=$(($branches_tested + 1))
    done

    if [[ -f ${STOPFILE} ]]
    then
        echo "found ${STOPFILE} - exiting"
        break
    fi

    #if no branch had a new commit, sleep a while
    if [[ $branches_tested -eq 0 ]]
    then
        date --utc "+%F %T no new commits"
        echo "sleeping for ${IDLE} seconds"
        sleep ${IDLE}
    fi

done

