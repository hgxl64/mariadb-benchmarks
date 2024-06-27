#!/bin/bash
#
# run MariaDB CS regression tests in an endless loop
#
#

BRANCHES="10.5 10.6 10.11 11.1 11.2 11.4 11.5 11.6"
STOPFILE="${HOME}/stop"


echo -e "running MariaDB CS regression tests\n\ndo touch ${STOPFILE} to stop gracefully\n"

while true
do
  for branch in ${BRANCHES}
  do
    [[ -f ${STOPFILE} ]] && break
    run_community_git.sh --branch ${branch}
    rmdir $(find ${RT_LOG_HOME}/ -type d -empty) >/dev/null 2>&1
  done

  if [[ -f ${STOPFILE} ]]
  then
    echo "found ${STOPFILE} - exiting"
    break
  fi

done

