#!/bin/bash

set -e
set -u

ARGS="$@"
HERE=$(pwd)
TEST=$(find $HERE -maxdepth 1 -type d -name t_\* -printf "%P\n" | sort)

test -d /tmp/benchmark || mkdir /tmp/benchmark

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

