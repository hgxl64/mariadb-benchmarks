#!/bin/bash

export TESTS="t_oltp_9010_innodb t_oltp_full_innodb t_oltp_insert_innodb t_oltp_insert_innodb_batched t_oltp_pointselect_aria t_oltp_pointselect_innodb t_oltp_writes_innodb t_oltp_writes_innodb_binlog t_sysbench_tpcc t_sysbench_tpcc_big"
export RT_LOG_HOME=${HOME}/regressiontest/log/TODO-5096
TAG="TODO-5096"
KEYFILE=${HOME}/mariadb-key.txt

#one NUMA node
export CPU_MASK_MYSQLD="-m 1 -N 1"
export CPU_MASK_SYSBENCH="-m 0 -N 0"
export NCPU=20

#full server
#export CPU_MASK_MYSQLD="--all"
#export CPU_MASK_SYSBENCH="--all"
#export NCPU=40


#10.6.20-16
BRANCH=10.6.20-16
COMMIT=102842eee8608aebfc871f549cc3ac5659f37ee8

#11.4.4-2
#BRANCH=11.4-enterprise
#COMMIT=00388266725b1a89880d19ee420cc9e0a07d34e7


#baseline
#run_enterprise_jenkins.sh --tag "${TAG}" --branch $BRANCH --commit $COMMIT --force

#full encryption, 128 bit AES key, using AES_CTR
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
openssl rand -hex 16 >> $KEYFILE

run_enterprise_jenkins.sh --tag "${TAG},AES-CTR-128" --branch $BRANCH --commit $COMMIT --force
rm ${KEYFILE}


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

run_enterprise_jenkins.sh --tag "${TAG},AES-CTR-256" --branch $BRANCH --commit $COMMIT --force
rm ${KEYFILE}


#full encryption, 128 bit AES key, using AES_CBC
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

echo -n "1;" > $KEYFILE
openssl rand -hex 16 >> $KEYFILE

run_enterprise_jenkins.sh --tag "${TAG},AES-CBC-128" --branch $BRANCH --commit $COMMIT --force
rm ${KEYFILE}


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

echo -n "1;" > $KEYFILE
openssl rand -hex 32 >> $KEYFILE

run_enterprise_jenkins.sh --tag "${TAG},AES-CBC-256" --branch $BRANCH --commit $COMMIT --force
rm ${KEYFILE}

