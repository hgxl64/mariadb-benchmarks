#!/bin/bash
pid=$(pidof mysqld)

sudo gdb -ex "set print frame-arguments all" -ex "set pagination 0" \
 -ex "thread apply all bt" -batch -p $pid | \
awk '
 BEGIN { s = ""; }
 /^Thread/ { print s; s = ""; } 
 /^\#/ { if (s != "" ) { s = s "," $4} else { s = $4 } } 
 END { print s }' | \
sort | uniq -c | sort -r -n -k 1,1
