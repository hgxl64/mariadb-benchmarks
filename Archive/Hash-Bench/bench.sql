use test;

-- need big heap tables
set max_heap_table_size=4*1024*1024*1024;

-- table to hold test results
create table if not exists results (
  id serial,
  operation char(32),
  opsize bigint unsigned,
  started datetime,
  ended datetime,
  instance char(20)
);

-- dummy run with second data file
drop table if exists t1;
create table t1 (c1 char(20), index (c1)) engine memory;
load data infile "/tmp/hash2.txt" into table t1;
drop table t1;

-- do total of 5 runs for each table

-- run #1
create table t1 (c1 int, index (c1)) engine memory;
select @t1:=now();
load data infile "/tmp/hash1.txt" into table t1;
select @t2:=now();
select @rows:=count(*) from t1;
insert into results (operation, opsize, started, ended, instance)
values ("load into INT table", @rows, @t1, @t2, @instance);
drop table t1;

create table t1 (c1 char(20), index (c1)) engine memory;
select @t1:=now();
load data infile "/tmp/hash2.txt" into table t1;
select @t2:=now();
select @rows:=count(*) from t1;
insert into results (operation, opsize, started, ended, instance)
values ("load into CHAR(20) table", @rows, @t1, @t2, @instance);
drop table t1;

-- run #2
create table t1 (c1 int, index (c1)) engine memory;
select @t1:=now();
load data infile "/tmp/hash1.txt" into table t1;
select @t2:=now();
select @rows:=count(*) from t1;
insert into results (operation, opsize, started, ended, instance)
values ("load into INT table", @rows, @t1, @t2, @instance);
drop table t1;

create table t1 (c1 char(20), index (c1)) engine memory;
select @t1:=now();
load data infile "/tmp/hash2.txt" into table t1;
select @t2:=now();
select @rows:=count(*) from t1;
insert into results (operation, opsize, started, ended, instance)
values ("load into CHAR(20) table", @rows, @t1, @t2, @instance);
drop table t1;

-- run #3
create table t1 (c1 int, index (c1)) engine memory;
select @t1:=now();
load data infile "/tmp/hash1.txt" into table t1;
select @t2:=now();
select @rows:=count(*) from t1;
insert into results (operation, opsize, started, ended, instance)
values ("load into INT table", @rows, @t1, @t2, @instance);
drop table t1;

create table t1 (c1 char(20), index (c1)) engine memory;
select @t1:=now();
load data infile "/tmp/hash2.txt" into table t1;
select @t2:=now();
select @rows:=count(*) from t1;
insert into results (operation, opsize, started, ended, instance)
values ("load into CHAR(20) table", @rows, @t1, @t2, @instance);
drop table t1;

-- run #4
create table t1 (c1 int, index (c1)) engine memory;
select @t1:=now();
load data infile "/tmp/hash1.txt" into table t1;
select @t2:=now();
select @rows:=count(*) from t1;
insert into results (operation, opsize, started, ended, instance)
values ("load into INT table", @rows, @t1, @t2, @instance);
drop table t1;

create table t1 (c1 char(20), index (c1)) engine memory;
select @t1:=now();
load data infile "/tmp/hash2.txt" into table t1;
select @t2:=now();
select @rows:=count(*) from t1;
insert into results (operation, opsize, started, ended, instance)
values ("load into CHAR(20) table", @rows, @t1, @t2, @instance);
drop table t1;

-- run #5
create table t1 (c1 int, index (c1)) engine memory;
select @t1:=now();
load data infile "/tmp/hash1.txt" into table t1;
select @t2:=now();
select @rows:=count(*) from t1;
insert into results (operation, opsize, started, ended, instance)
values ("load into INT table", @rows, @t1, @t2, @instance);
show table status like 't1';
drop table t1;

create table t1 (c1 char(20), index (c1)) engine memory;
select @t1:=now();
load data infile "/tmp/hash2.txt" into table t1;
select @t2:=now();
select @rows:=count(*) from t1;
insert into results (operation, opsize, started, ended, instance)
values ("load into CHAR(20) table", @rows, @t1, @t2, @instance);
show table status like 't1';
drop table t1;


-- list all results
select operation, instance, unix_timestamp(ended)-unix_timestamp(started) as duration,
 opsize/(unix_timestamp(ended)-unix_timestamp(started)) as ops_per_sec 
from results order by operation, instance, started;

-- list average results
select operation, instance, avg(opsize/(unix_timestamp(ended)-unix_timestamp(started))) as avg_ops_per_sec 
from results group by operation, instance;

