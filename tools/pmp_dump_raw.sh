#!/bin/bash
pid=$(pidof mysqld)

sudo gdb -ex "set print frame-arguments all" -ex "set pagination 0" -ex "thread apply all bt" -batch -p $pid 

