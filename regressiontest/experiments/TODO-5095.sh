#!/bin/bash

export TESTS="x_audit_oltp_read_only x_audit_oltp_read_write"
export RT_LOG_HOME=${HOME}/regressiontest/log/TODO-5095
export TAG="TODO-5095"
#write sda report to cover sysbench
export DATADISK="nvme0n1 sda"

#one NUMA node
#export CPU_MASK_MYSQLD="-m 1 -N 1"
#export CPU_MASK_SYSBENCH="-m 0 -N 0"
#export NCPU=20

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


#baseline
run_enterprise_jenkins.sh --branch $BRANCH --commit $COMMIT --force

#audit log for DDL/DCL, to file
export EXTRAMYCNF="--plugin-load-add=server_audit2"
export AUDIT_SQL=$(pwd)/audit.sql
cat > $AUDIT_SQL <<EOT
INSERT INTO mysql.server_audit_filters VALUES ('default', '{"logging": "OFF"}');
INSERT INTO mysql.server_audit_filters VALUES ('log_ddl', '{"connect_event":"ALL","query_event":["DDL","DCL"],"table_event":["CREATE","DROP","RENAME","ALTER"]}');
INSERT INTO mysql.server_audit_users (host, user, filtername) VALUES ('%', 'sysbench', 'log_ddl');
SET GLOBAL server_audit_reload_filters = ON;
SET GLOBAL server_audit_output_type = FILE;
SET GLOBAL server_audit_file_rotate_size = 10 * (1024 * 1024 * 1024);
SET GLOBAL server_audit_logging = ON;
EOT
run_enterprise_jenkins.sh --branch $BRANCH --commit $COMMIT --force

#audit log for DDL/DCL/DML, to file
export EXTRAMYCNF="--plugin-load-add=server_audit2"
export AUDIT_SQL=$(pwd)/audit.sql
cat > audit.sql << EOT
INSERT INTO mysql.server_audit_filters VALUES ('default', '{"logging": "OFF"}');
INSERT INTO mysql.server_audit_filters VALUES ('log_dml', '{"connect_event":"ALL","query_event":["DML_NO_SELECT","DDL","DCL"],"table_event":["WRITE","CREATE","DROP","RENAME","ALTER"]}');
INSERT INTO mysql.server_audit_users (host, user, filtername) VALUES ('%', 'sysbench', 'log_dml');
SET GLOBAL server_audit_reload_filters = ON;
SET GLOBAL server_audit_output_type = FILE;
SET GLOBAL server_audit_file_rotate_size = 10 * (1024 * 1024 * 1024);
SET GLOBAL server_audit_logging = ON;
EOT
run_enterprise_jenkins.sh --branch $BRANCH --commit $COMMIT --force
rm audit.sql

#audit log for nearly everything, to file
export EXTRAMYCNF="--plugin-load-add=server_audit2"
export AUDIT_SQL=$(pwd)/audit.sql
cat > audit.sql << EOT
INSERT INTO mysql.server_audit_filters VALUES ('default', '{"logging": "OFF"}');
INSERT INTO mysql.server_audit_filters VALUES ('log_all2', '{"connect_event":"ALL","query_event":"ALL"}');
INSERT INTO mysql.server_audit_users (host, user, filtername) VALUES ('%', 'sysbench', 'log_all2');
SET GLOBAL server_audit_reload_filters = ON;
SET GLOBAL server_audit_output_type = FILE;
SET GLOBAL server_audit_file_rotate_size = 10 * (1024 * 1024 * 1024);
SET GLOBAL server_audit_logging = ON;
EOT
run_enterprise_jenkins.sh --branch $BRANCH --commit $COMMIT --force
#audit log for everything, to file
export EXTRAMYCNF="--plugin-load-add=server_audit2"
export AUDIT_SQL=$(pwd)/audit.sql
cat > audit.sql << EOT
INSERT INTO mysql.server_audit_filters VALUES ('default', '{"logging": "OFF"}');
INSERT INTO mysql.server_audit_filters VALUES ('log_all', '{"connect_event":"ALL","query_event":"ALL","table_event":"ALL"}');
INSERT INTO mysql.server_audit_users (host, user, filtername) VALUES ('%', 'sysbench', 'log_all');
SET GLOBAL server_audit_reload_filters = ON;
SET GLOBAL server_audit_output_type = FILE;
SET GLOBAL server_audit_file_rotate_size = 10 * (1024 * 1024 * 1024);
SET GLOBAL server_audit_logging = ON;
EOT
run_enterprise_jenkins.sh --branch $BRANCH --commit $COMMIT --force

#audit log for DDL/DCL, to syslog
export EXTRAMYCNF="--plugin-load-add=server_audit2"
export AUDIT_SQL=$(pwd)/audit.sql
cat > ${AUDIT_SQL} <<EOT
INSERT INTO mysql.server_audit_filters VALUES ('default', '{"logging": "OFF"}');
INSERT INTO mysql.server_audit_filters VALUES ('log_ddl', '{"connect_event":"ALL","query_event":["DDL","DCL"],"table_event":["CREATE","DROP","RENAME","ALTER"]}');
INSERT INTO mysql.server_audit_users (host, user, filtername) VALUES ('%', 'sysbench', 'log_ddl');
SET GLOBAL server_audit_reload_filters = ON;
SET GLOBAL server_audit_output_type = SYSLOG;
SET GLOBAL server_audit_logging = ON;
EOT
run_enterprise_jenkins.sh --branch $BRANCH --commit $COMMIT --force

#audit log for DDL/DCL/DML, to syslog
export EXTRAMYCNF="--plugin-load-add=server_audit2"
export AUDIT_SQL=$(pwd)/audit.sql
cat > ${AUDIT_SQL} <<EOT
INSERT INTO mysql.server_audit_filters VALUES ('default', '{"logging": "OFF"}');
INSERT INTO mysql.server_audit_filters VALUES ('log_dml', '{"connect_event":"ALL","query_event":["DDL","DCL","DML_NO_SELECT"],"table_event":["WRITE","CREATE","DROP","RENAME","ALTER"]}');
INSERT INTO mysql.server_audit_users (host, user, filtername) VALUES ('%', 'sysbench', 'log_dml');
SET GLOBAL server_audit_reload_filters = ON;
SET GLOBAL server_audit_output_type = SYSLOG;
SET GLOBAL server_audit_logging = ON;
EOT
run_enterprise_jenkins.sh --branch $BRANCH --commit $COMMIT --force

#audit log for nearly everything, to syslog
export EXTRAMYCNF="--plugin-load-add=server_audit2"
export AUDIT_SQL=$(pwd)/audit.sql
cat > ${AUDIT_SQL} <<EOT
INSERT INTO mysql.server_audit_filters VALUES ('default', '{"logging": "OFF"}');
INSERT INTO mysql.server_audit_filters VALUES ('log_all2', '{"connect_event":"ALL","query_event":"ALL"}');
INSERT INTO mysql.server_audit_users (host, user, filtername) VALUES ('%', 'sysbench', 'log_all2');
SET GLOBAL server_audit_reload_filters = ON;
SET GLOBAL server_audit_output_type = SYSLOG;
SET GLOBAL server_audit_logging = ON;
EOT
run_enterprise_jenkins.sh --branch $BRANCH --commit $COMMIT --force

#audit log for everything, to syslog
export EXTRAMYCNF="--plugin-load-add=server_audit2"
export AUDIT_SQL=$(pwd)/audit.sql
cat > ${AUDIT_SQL} <<EOT
INSERT INTO mysql.server_audit_filters VALUES ('default', '{"logging": "OFF"}');
INSERT INTO mysql.server_audit_filters VALUES ('log_all', '{"connect_event":"ALL","query_event":"ALL","table_event":"ALL"}');
INSERT INTO mysql.server_audit_users (host, user, filtername) VALUES ('%', 'sysbench', 'log_all');
SET GLOBAL server_audit_reload_filters = ON;
SET GLOBAL server_audit_output_type = SYSLOG;
SET GLOBAL server_audit_logging = ON;
EOT
run_enterprise_jenkins.sh --branch $BRANCH --commit $COMMIT --force

rm ${AUDIT_SQL}
unset EXTRAMYCNF AUDIT_SQL DATADISK

