#!/bin/bash

#run_enterprise_jenkins.sh --tag "ES-11.4.4-2,2NUMA" --branch 11.4-enterprise --commit 00388266725b1a89880d19ee420cc9e0a07d34e7 --force
run_enterprise_jenkins.sh --tag "ES-11.4.3-1,2NUMA" --branch 11.4.3-1 --commit 6cb50b55e6c8df05e33da2711d17235eff2e826b --force
run_enterprise_jenkins.sh --tag "ES-10.6.20-16,2NUMA" --branch 10.6.20-16 --commit 102842eee8608aebfc871f549cc3ac5659f37ee8 --force

export CPU_MASK_MYSQLD="-m 1 -N 1"
export CPU_MASK_SYSBENCH="-m 0 -N 0"
export NCPU=20

#run_enterprise_jenkins.sh --tag "ES-11.4.4-2,1NUMA" --branch 11.4-enterprise --commit 00388266725b1a89880d19ee420cc9e0a07d34e7 --force
run_enterprise_jenkins.sh --tag "ES-11.4.3-1,1NUMA" --branch 11.4.3-1 --commit 6cb50b55e6c8df05e33da2711d17235eff2e826b --force
run_enterprise_jenkins.sh --tag "ES-10.6.20-16,1NUMA" --branch 10.6.20-16 --commit 102842eee8608aebfc871f549cc3ac5659f37ee8 --force

