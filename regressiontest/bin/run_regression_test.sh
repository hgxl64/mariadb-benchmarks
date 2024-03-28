#!/bin/bash

DATABASE="mariadb-community"
BRANCH="10.6"

export LOGDIRECTORY=${RT_LOG_HOME}/$(date +%y%m%d.%H%M%S%3N.regressiontest)
mkdir -p $LOGDIRECTORY

source rt_functions.sh
source ${RT_HOME}/config/global
source ${RT_HOME}/config/${DATABASE}

install_server.sh --database $DATABASE --source git --branch $BRANCH

case ${?} in
1)  echo "install server script failed!"; exit 1;;
2)  echo "regression test have been run before"; exit 2;;
esac

ALL_TESTS=$(find ${RT_HOME}/tests -maxdepth 1 -type d -name t_\* -printf "%P\n" | sort)

for t in ${TESTS:-$ALLTESTS}
do
    if [[ -x $t/runme.sh ]]
    then
        echo "running test $t"
        pushd $t
        ./runme.sh
        popd
    fi
done

exit 0
