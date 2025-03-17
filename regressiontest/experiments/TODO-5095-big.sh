#!/bin/bash

export TESTS="x_audit_oltp_read_only_big x_audit_oltp_read_write_big"
export RT_LOG_HOME=${HOME}/regressiontest/log/TODO-5095-big
export TAG="TODO-5095"

#full server
export CPU_MASK_MYSQLD="--all"
export CPU_MASK_SYSBENCH="--all"
export NCPU=40

#10.6.20-16
BRANCH=10.6.20-16
COMMIT=102842eee8608aebfc871f549cc3ac5659f37ee8

#11.4.4-2
#BRANCH=11.4-enterprise
#COMMIT=00388266725b1a89880d19ee420cc9e0a07d34e7

#Holyfoots branch
#BRANCH=10.6-todo-5095-hf
#COMMIT=8f36b71c062e2025a1f08dd07acf2057e8fdb89a


#baseline
#run_enterprise_jenkins.sh --branch $BRANCH --commit $COMMIT --force

#audit log for DDL/DCL/DML, to file
#export EXTRAMYCNF="--plugin-load-add=server_audit2"
#export AUDIT_SQL=$(pwd)/audit.sql
#cat > ${AUDIT_SQL} << EOT
#INSERT INTO mysql.server_audit_filters VALUES ('default', '{"logging": "OFF"}');
#INSERT INTO mysql.server_audit_filters VALUES ('log_dml', '{"connect_event":"ALL","query_event":["DML_NO_SELECT","DDL","DCL"],"table_event":["WRITE","CREATE","DROP","RENAME","ALTER"]}');
#INSERT INTO mysql.server_audit_users (host, user, filtername) VALUES ('%', 'sysbench', 'log_dml');
#SET GLOBAL server_audit_reload_filters = ON;
#SET GLOBAL server_audit_output_type = FILE;
#SET GLOBAL server_audit_file_rotate_size = 100 * (1024 * 1024 * 1024);
#SET GLOBAL server_audit_logging = ON;
#EOT
#run_enterprise_jenkins.sh --branch $BRANCH --commit $COMMIT --force
#rm ${AUDIT_SQL}

#audit log for everything, to file
#export EXTRAMYCNF="--plugin-load-add=server_audit2"
#export AUDIT_SQL=$(pwd)/audit.sql
#cat > ${AUDIT_SQL} << EOT
#INSERT INTO mysql.server_audit_filters VALUES ('default', '{"logging": "OFF"}');
#INSERT INTO mysql.server_audit_filters VALUES ('log_all', '{"connect_event":"ALL","query_event":"ALL","table_event":"ALL"}');
#INSERT INTO mysql.server_audit_users (host, user, filtername) VALUES ('%', 'sysbench', 'log_all');
#SET GLOBAL server_audit_reload_filters = ON;
#SET GLOBAL server_audit_output_type = FILE;
#SET GLOBAL server_audit_file_rotate_size = 100 * (1024 * 1024 * 1024);
#SET GLOBAL server_audit_logging = ON;
#EOT
#run_enterprise_jenkins.sh --branch $BRANCH --commit $COMMIT --force
#rm ${AUDIT_SQL}

#export DATADISK="nvme0n1 nvme1n1"

#audit log for DDL/DCL/DML, to file on second disk
#export EXTRAMYCNF="--plugin-load-add=server_audit2"
#export AUDIT_SQL=$(pwd)/audit.sql
#cat > ${AUDIT_SQL} << EOT
#INSERT INTO mysql.server_audit_filters VALUES ('default', '{"logging": "OFF"}');
#INSERT INTO mysql.server_audit_filters VALUES ('log_dml', '{"connect_event":"ALL","query_event":["DML_NO_SELECT","DDL","DCL"],"table_event":["WRITE","CREATE","DROP","RENAME","ALTER"]}');
#INSERT INTO mysql.server_audit_users (host, user, filtername) VALUES ('%', 'sysbench', 'log_dml');
#SET GLOBAL server_audit_reload_filters = ON;
#SET GLOBAL server_audit_output_type = FILE;
#SET GLOBAL server_audit_file_rotate_size = 100 * (1024 * 1024 * 1024);
#SET GLOBAL server_audit_file_path = '/mnt/ssd2-xfs/datadir/server_audit.log';
#SET GLOBAL server_audit_logging = ON;
#EOT
#run_enterprise_jenkins.sh --branch $BRANCH --commit $COMMIT --force
#rm ${AUDIT_SQL}
#rm /mnt/ssd2-xfs/datadir/server_audit.log

#audit log for everything, to file on second disk
#export EXTRAMYCNF="--plugin-load-add=server_audit2"
#export AUDIT_SQL=$(pwd)/audit.sql
#cat > ${AUDIT_SQL} << EOT
#INSERT INTO mysql.server_audit_filters VALUES ('default', '{"logging": "OFF"}');
#INSERT INTO mysql.server_audit_filters VALUES ('log_all', '{"connect_event":"ALL","query_event":"ALL","table_event":"ALL"}');
#INSERT INTO mysql.server_audit_users (host, user, filtername) VALUES ('%', 'sysbench', 'log_all');
#SET GLOBAL server_audit_reload_filters = ON;
#SET GLOBAL server_audit_output_type = FILE;
#SET GLOBAL server_audit_file_rotate_size = 100 * (1024 * 1024 * 1024);
#SET GLOBAL server_audit_file_path = '/mnt/ssd2-xfs/datadir/server_audit.log';
#SET GLOBAL server_audit_logging = ON;
#EOT
#run_enterprise_jenkins.sh --branch $BRANCH --commit $COMMIT --force
#rm ${AUDIT_SQL}
#rm /mnt/ssd2-xfs/datadir/server_audit.log


#Holyfoots 2nd branch
BRANCH=10.6-todo-5095-buffer-hf
COMMIT=6d4b2b19ec6ea77d9a144e35bd5dbaae7044d242

#audit log for DDL/DCL/DML, to file
export EXTRAMYCNF="--plugin-load-add=server_audit2"
export AUDIT_SQL=$(pwd)/audit.sql
cat > ${AUDIT_SQL} << EOT
INSERT INTO mysql.server_audit_filters VALUES ('default', '{"logging": "OFF"}');
INSERT INTO mysql.server_audit_filters VALUES ('log_dml', '{"connect_event":"ALL","query_event":["DML_NO_SELECT","DDL","DCL"],"table_event":["WRITE","CREATE","DROP","RENAME","ALTER"]}');
INSERT INTO mysql.server_audit_users (host, user, filtername) VALUES ('%', 'sysbench', 'log_dml');
SET GLOBAL server_audit_reload_filters = ON;
SET GLOBAL server_audit_output_type = FILE;
SET GLOBAL server_audit_file_rotate_size = 100 * (1024 * 1024 * 1024);
SET GLOBAL server_audit_logging = ON;
EOT
run_enterprise_jenkins.sh --branch $BRANCH --commit $COMMIT --force
rm ${AUDIT_SQL}

#audit log for everything, to file
export EXTRAMYCNF="--plugin-load-add=server_audit2"
export AUDIT_SQL=$(pwd)/audit.sql
cat > ${AUDIT_SQL} << EOT
INSERT INTO mysql.server_audit_filters VALUES ('default', '{"logging": "OFF"}');
INSERT INTO mysql.server_audit_filters VALUES ('log_all', '{"connect_event":"ALL","query_event":"ALL","table_event":"ALL"}');
INSERT INTO mysql.server_audit_users (host, user, filtername) VALUES ('%', 'sysbench', 'log_all');
SET GLOBAL server_audit_reload_filters = ON;
SET GLOBAL server_audit_output_type = FILE;
SET GLOBAL server_audit_file_rotate_size = 100 * (1024 * 1024 * 1024);
SET GLOBAL server_audit_logging = ON;
EOT
run_enterprise_jenkins.sh --branch $BRANCH --commit $COMMIT --force
rm ${AUDIT_SQL}


unset EXTRAMYCNF AUDIT_SQL DATADISK

