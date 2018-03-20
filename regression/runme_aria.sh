#!/bin/bash

set -e
set -u

ARGS="$@"
HERE=$(pwd)
TEST=$(find $HERE -maxdepth 1 -type d -name t_\* -printf "%P\n" | fgrep "aria" | sort)

for T in $TEST
do
  if [ -x $T/runme.sh ]
  then
    echo "--- $T ---"
    cd $T
    ./runme.sh $ARGS
    cd $HERE
  else
    echo "skipping test $T"
  fi
done

