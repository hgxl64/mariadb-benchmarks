INSERT INTO load_time_statistics (task_name, timest) VALUES ('loading database started', now(6));

SELECT 'loading table nation' AS progress;
LOAD DATA INFILE '${DATAFILEDIR}/nation.tbl' into table nation fields terminated by '|';
INSERT INTO load_time_statistics (task_name, timest) VALUES ('load nation table', now(6));

SELECT 'loading table region' AS progress;
LOAD DATA INFILE '${DATAFILEDIR}/region.tbl' into table region fields terminated by '|';
INSERT INTO load_time_statistics (task_name, timest) VALUES ('load region table', now(6));

SELECT 'loading table supplier' AS progress;
LOAD DATA INFILE '${DATAFILEDIR}/supplier.tbl' into table supplier fields terminated by '|';
INSERT INTO load_time_statistics (task_name, timest) VALUES ('load supplier table', now(6));

SELECT 'loading table part' AS progress;
LOAD DATA INFILE '${DATAFILEDIR}/part.tbl' into table part fields terminated by '|';
INSERT INTO load_time_statistics (task_name, timest) VALUES ('load part table', now(6));

SELECT 'loading table customer' AS progress;
LOAD DATA INFILE '${DATAFILEDIR}/customer.tbl' into table customer fields terminated by '|';
INSERT INTO load_time_statistics (task_name, timest) VALUES ('load customer table', now(6));

SELECT 'loading table orders' AS progress;
LOAD DATA INFILE '${DATAFILEDIR}/orders.tbl' into table orders fields terminated by '|';
INSERT INTO load_time_statistics (task_name, timest) VALUES ('load orders table', now(6));

SELECT 'loading table partsupp' AS progress;
LOAD DATA INFILE '${DATAFILEDIR}/partsupp.tbl' into table partsupp fields terminated by '|';
INSERT INTO load_time_statistics (task_name, timest) VALUES ('load partsupp table', now(6));

SELECT 'loading table lineitem' AS progress;
LOAD DATA INFILE '${DATAFILEDIR}/lineitem.tbl' into table lineitem fields terminated by '|';
INSERT INTO load_time_statistics (task_name, timest) VALUES ('load lineitem table', now(6));

