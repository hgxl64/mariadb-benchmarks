#!/bin/bash

export TESTS="x_audit_oltp_read_only x_audit_oltp_read_write"
export RT_LOG_HOME=${HOME}/regressiontest/log/TODO-5095
export TAG="TODO-5095"

#we test only on one NUMA node
export CPU_MASK_MYSQLD="-m 1 -N 1"
export CPU_MASK_SYSBENCH="-m 0 -N 0"
export NCPU=20

#10.6

#baseline
run_enterprise_jenkins.sh --branch 10.6.20-16 --commit 102842eee8608aebfc871f549cc3ac5659f37ee8 --force

#audit log for DDL/DCL, to file
export EXTRAMYCNF="--plugin-load-add=server_audit2"
export AUDIT_SQL=$(pwd)/audit.sql
echo > ${AUDIT_SQL << EOT
INSERT INTO server_audit_filters VALUES ('default', '{"logging": "OFF"}');
INSERT INTO server_audit_filters VALUES ('log_ddl', '{"connect_event":"ALL","query_event":["DDL","DCL"],"table_event":["CREATE","DROP","RENAME","ALTER"]}');
INSERT INTO server_audit_users (host, user, filtername) VALUES ('%', 'sysbench', 'log_ddl');
SET GLOBAL server_audit_reload_filters = ON;
SET GLOBAL server_audit_output_type = FILE
SET GLOBAL server_audit_logging = ON;
EOT
run_enterprise_jenkins.sh --branch 10.6.20-16 --commit 102842eee8608aebfc871f549cc3ac5659f37ee8 --force

#audit log for DDL/DCL/DML, to file
export EXTRAMYCNF="--plugin-load-add=server_audit2"
export AUDIT_SQL=$(pwd)/audit.sql
echo > ${AUDIT_SQL << EOT
INSERT INTO server_audit_filters VALUES ('default', '{"logging": "OFF"}');
INSERT INTO server_audit_filters VALUES ('log_dml', '{"connect_event":"ALL","query_event":["DML","DDL","DCL","QUERY_DML_NO_SELECT"],"table_event":["WRITE","CREATE","DROP","RENAME","ALTER"]}');
INSERT INTO server_audit_users (host, user, filtername) VALUES ('%', 'sysbench', 'log_dml');
SET GLOBAL server_audit_reload_filters = ON;
SET GLOBAL server_audit_output_type = FILE
SET GLOBAL server_audit_logging = ON;
EOT
run_enterprise_jenkins.sh --branch 10.6.20-16 --commit 102842eee8608aebfc871f549cc3ac5659f37ee8 --force

#audit log for everything, to file
export EXTRAMYCNF="--plugin-load-add=server_audit2"
export AUDIT_SQL=$(pwd)/audit.sql
echo > ${AUDIT_SQL << EOT
INSERT INTO server_audit_filters VALUES ('default', '{"logging": "OFF"}');
INSERT INTO server_audit_filters VALUES ('log_all', '{"connect_event":"ALL","query_event":"ALL","table_event":"ALL"}');
INSERT INTO server_audit_users (host, user, filtername) VALUES ('%', 'sysbench', 'log_all');
SET GLOBAL server_audit_reload_filters = ON;
SET GLOBAL server_audit_output_type = FILE
SET GLOBAL server_audit_logging = ON;
EOT
run_enterprise_jenkins.sh --branch 10.6.20-16 --commit 102842eee8608aebfc871f549cc3ac5659f37ee8 --force

#audit log for DDL/DCL, to syslog
export EXTRAMYCNF="--plugin-load-add=server_audit2"
export AUDIT_SQL=$(pwd)/audit.sql
echo > ${AUDIT_SQL << EOT
INSERT INTO server_audit_filters VALUES ('default', '{"logging": "OFF"}');
INSERT INTO server_audit_filters VALUES ('log_ddl', '{"connect_event":"ALL","query_event":["DDL","DCL"],"table_event":["CREATE","DROP","RENAME","ALTER"]}');
INSERT INTO server_audit_users (host, user, filtername) VALUES ('%', 'sysbench', 'log_ddl');
SET GLOBAL server_audit_reload_filters = ON;
SET GLOBAL server_audit_output_type = SYSLOG
SET GLOBAL server_audit_logging = ON;
EOT
run_enterprise_jenkins.sh --branch 10.6.20-16 --commit 102842eee8608aebfc871f549cc3ac5659f37ee8 --force

#audit log for DDL/DCL/DML, to syslog
export EXTRAMYCNF="--plugin-load-add=server_audit2"
export AUDIT_SQL=$(pwd)/audit.sql
echo > ${AUDIT_SQL << EOT
INSERT INTO server_audit_filters VALUES ('default', '{"logging": "OFF"}');
INSERT INTO server_audit_filters VALUES ('log_dml', '{"connect_event":"ALL","query_event":["DML","DDL","DCL","QUERY_DML_NO_SELECT"],"table_event":["WRITE","CREATE","DROP","RENAME","ALTER"]}');
INSERT INTO server_audit_users (host, user, filtername) VALUES ('%', 'sysbench', 'log_dml');
SET GLOBAL server_audit_reload_filters = ON;
SET GLOBAL server_audit_output_type = SYSLOG
SET GLOBAL server_audit_logging = ON;
EOT
run_enterprise_jenkins.sh --branch 10.6.20-16 --commit 102842eee8608aebfc871f549cc3ac5659f37ee8 --force

#audit log for everything, to syslog
export EXTRAMYCNF="--plugin-load-add=server_audit2"
export AUDIT_SQL=$(pwd)/audit.sql
echo > ${AUDIT_SQL << EOT
INSERT INTO server_audit_filters VALUES ('default', '{"logging": "OFF"}');
INSERT INTO server_audit_filters VALUES ('log_all', '{"connect_event":"ALL","query_event":"ALL","table_event":"ALL"}');
INSERT INTO server_audit_users (host, user, filtername) VALUES ('%', 'sysbench', 'log_all');
SET GLOBAL server_audit_reload_filters = ON;
SET GLOBAL server_audit_output_type = SYSLOG
SET GLOBAL server_audit_logging = ON;
EOT
run_enterprise_jenkins.sh --branch 10.6.20-16 --commit 102842eee8608aebfc871f549cc3ac5659f37ee8 --force

unset EXTRAMYCNF AUDIT_SQL

