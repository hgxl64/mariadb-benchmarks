#!/bin/bash

set -e

LOG="log.txt"
DONE="done.txt"
TODO="revlist.txt"

cat $TODO | while read r
do
  fgrep -q $r $DONE && continue
  
  NOW=$(date "+%Y-%m-%d %H:%M:%S")
  echo "[$NOW] start $r" >>$LOG
  
  echo "running $r"
  ./runme.sh mariadb-10.5-ES-$r
  
  NOW=$(date "+%Y-%m-%d %H:%M:%S")
  echo "[$NOW] finish $r" >>$LOG
  ./digest.pl -ta 5 > "10.5-ES $NOW".txt
  ./gdigest.pl -ta 5 -ba "10.5-ES $NOW" 
  rm "10.5-ES $NOW.data"
  rm "10.5-ES $NOW.gnuplot"

  echo $r >>$DONE
  break
done

