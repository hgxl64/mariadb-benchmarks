#!/bin/bash

export TESTS="x_oltp_insert_innodb_batched"
export RT_LOG_HOME=${HOME}/regressiontest/log/MDEV-36024
KEYFILE=${HOME}/mariadb-key.txt

#one NUMA node
export CPU_MASK_MYSQLD="-m 1 -N 1"
export CPU_MASK_SYSBENCH="-m 0 -N 0"
export NCPU=20

#full server
#export CPU_MASK_MYSQLD="--all"
#export CPU_MASK_SYSBENCH="--all"
#export NCPU=40


BRANCH=10.11-MDEV-36024
COMMIT=0749476e1ea

#baseline
#run_community_git.sh --tag baseline --branch $BRANCH --commit $COMMIT --force

#full encryption, 256 bit AES key, using AES_CTR
#configure key management plugin
EXTRAMYCNF="--plugin-load-add=file_key_management"
EXTRAMYCNF="${EXTRAMYCNF} --file-key-management=FORCE"
EXTRAMYCNF="${EXTRAMYCNF} --file-key-management-filename=${KEYFILE}"
EXTRAMYCNF="${EXTRAMYCNF} --file-key-management-encryption-algorithm=AES_CTR"
#configure full ARIA/InnoDB encryption
EXTRAMYCNF="${EXTRAMYCNF} --innodb-encryption-threads=1" #just in case, we do not expect any background work
EXTRAMYCNF="${EXTRAMYCNF} --innodb-encrypt-tables=ON"
EXTRAMYCNF="${EXTRAMYCNF} --innodb-encrypt-log=ON"
EXTRAMYCNF="${EXTRAMYCNF} --innodb-encrypt-temporary-tables=ON"
EXTRAMYCNF="${EXTRAMYCNF} --aria-encrypt-tables=ON"
EXTRAMYCNF="${EXTRAMYCNF} --encrypt-tmp-disk-tables=ON"
EXTRAMYCNF="${EXTRAMYCNF} --encrypt-tmp-files=ON"
EXTRAMYCNF="${EXTRAMYCNF} --encrypt-binlog=ON"
export EXTRAMYCNF

echo -n "1;" > $KEYFILE
openssl rand -hex 32 >> $KEYFILE

#run_community_git.sh --tag aes-ctr-256 --branch $BRANCH --commit $COMMIT --force


#full encryption, 256 bit AES key, using AES_CBC
#configure key management plugin
EXTRAMYCNF="--plugin-load-add=file_key_management"
EXTRAMYCNF="${EXTRAMYCNF} --file-key-management=FORCE"
EXTRAMYCNF="${EXTRAMYCNF} --file-key-management-filename=${KEYFILE}"
EXTRAMYCNF="${EXTRAMYCNF} --file-key-management-encryption-algorithm=AES_CBC"
#configure full ARIA/InnoDB encryption
EXTRAMYCNF="${EXTRAMYCNF} --innodb-encryption-threads=1" #just in case, we do not expect any background work
EXTRAMYCNF="${EXTRAMYCNF} --innodb-encrypt-tables=ON"
EXTRAMYCNF="${EXTRAMYCNF} --innodb-encrypt-log=ON"
EXTRAMYCNF="${EXTRAMYCNF} --innodb-encrypt-temporary-tables=ON"
EXTRAMYCNF="${EXTRAMYCNF} --aria-encrypt-tables=ON"
EXTRAMYCNF="${EXTRAMYCNF} --encrypt-tmp-disk-tables=ON"
EXTRAMYCNF="${EXTRAMYCNF} --encrypt-tmp-files=ON"
EXTRAMYCNF="${EXTRAMYCNF} --encrypt-binlog=ON"
export EXTRAMYCNF

run_community_git.sh --tag aes-cbc-256 --branch $BRANCH --commit $COMMIT --force

rm ${KEYFILE}

