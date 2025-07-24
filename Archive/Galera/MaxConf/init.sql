-- sysbench database and user
DROP DATABASE IF EXISTS sbtest;
CREATE DATABASE sbtest;
CREATE USER 'sbtest'@'%' IDENTIFIED BY 'sbtest';
GRANT ALL ON sbtest.* TO 'sbtest'@'%';

-- maxscale user
CREATE USER 'monitor'@'%' IDENTIFIED BY 'maxscale';
GRANT SELECT ON mysql.user TO 'monitor'@'%';
GRANT SELECT ON mysql.db TO 'monitor'@'%';
GRANT SELECT ON mysql.tables_priv TO 'monitor'@'%';
GRANT SELECT ON mysql.columns_priv TO 'monitor'@'%';
GRANT SELECT ON mysql.procs_priv TO 'monitor'@'%';
GRANT SELECT ON mysql.proxies_priv TO 'monitor'@'%';
GRANT SELECT ON mysql.roles_mapping TO 'monitor'@'%';
GRANT SHOW DATABASES ON *.*  TO 'monitor'@'%';
GRANT REPLICATION CLIENT ON *.* TO 'monitor'@'%';

