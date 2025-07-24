
drop table if exists exec_time;
create table exec_time (
  run_number int unsigned,
  query_number int unsigned,
  exec_usec bigint unsigned,
  primary key (run_number, query_number),
  index (query_number)
);

drop table if exists queries;
create table queries (
  number int unsigned primary key,
  statement varchar(4000)
);

insert into queries (number, statement) values
(1,  "select count(*) from cmdb"),
(2,  "select count(*) from task"),
(3,  "select count(*) from task inner join cmdb on task.cmdb_ci = cmdb.sys_id"),
(4,  "select sys_id from cmdb order by discovery_source limit 10"),
(5,  "select task.sys_id from task inner join cmdb on task.cmdb_ci = cmdb.sys_id where task.sys_class_name = 'incident' order by task.number limit 10"),
(6,  "select task.sys_id from task inner join cmdb on task.cmdb_ci = cmdb.sys_id where task.sys_class_name = 'incident' order by cmdb.name limit 10"),
(7,  "select count(*), cmdb_ci from task group by cmdb_ci having count(*) > 100 limit 10"),
(8,  "select count(*), cmdb.manufacturer from task inner join cmdb on task.cmdb_ci = cmdb.sys_id group by cmdb.manufacturer having count(*) > 100 limit 10"),
(9,  "select count(*) from task where short_description like '%X%'"),
(10, "select sys_id from task order by short_description limit 10"),
(11, "select task.sys_id from task left join cmdb on task.cmdb_ci = cmdb.sys_id where cmdb.manufacturer is not null order by task.number limit 10"),
(12, "select count(*), assignment_group from task group by assignment_group order by count(*) desc limit 10"),
(13, "select count(*), assignment_group from task where task.sys_class_name = 'incident' group by assignment_group limit 10"),
(14, "select task.sys_id from task inner join cmdb on task.cmdb_ci = cmdb.sys_id where task.sys_class_name='incident' and cmdb.manufacturer is not null order by task.number limit 10"),
(15, "select task.sys_id from task inner join cmdb on task.cmdb_ci = cmdb.sys_id where task.sys_class_name='incident' and cmdb.manufacturer is not null order by task.short_description limit 10"),
(16, "select task.sys_id from task inner join cmdb on task.cmdb_ci = cmdb.sys_id where task.sys_class_name='incident' and cmdb.manufacturer is not null order by cmdb.manufacturer limit 10"),
(17, "select task.sys_id from task inner join cmdb on task.cmdb_ci = cmdb.sys_id where task.sys_class_name='incident' and cmdb.manufacturer is not null order by cmdb.discovery_source limit 10"),
(18, "select avg(length(discovery_source)) from cmdb"),
(19, "select * from task inner join cmdb on task.cmdb_ci = cmdb.sys_id order by task.short_description limit 1"),
(20, "select task.sys_id from task inner join cmdb on task.cmdb_ci = cmdb.sys_id order by task.short_description limit 1"),
(21, "select cmdb1.sys_class_name AS parent_sys_class_name, cmdb2.sys_class_name AS child_sys_class_name, cmdb_rel_type3.sys_id AS type_sys_id, count(*) AS recordcount FROM (((cmdb_rel_ci cmdb_rel_ci0 LEFT JOIN cmdb cmdb1 ON cmdb_rel_ci0.parent = cmdb1.sys_id) LEFT JOIN cmdb cmdb2 ON cmdb_rel_ci0.`child` = cmdb2.sys_id) LEFT JOIN cmdb_rel_type cmdb_rel_type3 ON cmdb_rel_ci0.type = cmdb_rel_type3.sys_id) WHERE cmdb_rel_ci0.parent IS NOT NULL AND cmdb_rel_ci0.child IS NOT NULL AND cmdb_rel_type3.sys_id IS NOT NULL GROUP BY cmdb1.sys_class_name, cmdb2.sys_class_name, cmdb_rel_type3.sys_id ORDER BY recordcount DESC, cmdb1.sys_class_name, cmdb2.sys_class_name, cmdb_rel_type3.sys_id")
;

drop procedure if exists run_query;
drop procedure if exists run_all_queries;
drop procedure if exists do_warmup;
drop procedure if exists do_benchmark;
drop procedure if exists show_results;
drop procedure if exists short_results;

delimiter //

CREATE PROCEDURE run_query
(IN nquery INT UNSIGNED, IN nrun INT UNSIGNED, IN do_log INT UNSIGNED)
MODIFIES SQL DATA
BEGIN
  DECLARE stmt1 VARCHAR(4000) DEFAULT "SELECT 'query not found!'";
  DECLARE ts1, ts2 BIGINT UNSIGNED;
  SELECT statement INTO stmt1 FROM queries WHERE number=nquery;
  PREPARE prep1 FROM stmt1;

  SELECT 1000000*UNIX_TIMESTAMP(NOW(6)) INTO ts1;
  EXECUTE prep1;
  SELECT 1000000*UNIX_TIMESTAMP(NOW(6)) INTO ts2;

  IF do_log THEN
    INSERT INTO exec_time
      (run_number, query_number, exec_usec)
    VALUES
      (nrun, nquery, ts2-ts1);
  END IF;
END //

CREATE PROCEDURE run_all_queries
(IN nrun INT UNSIGNED, IN do_log INT UNSIGNED)
MODIFIES SQL DATA
BEGIN
  DECLARE i INT UNSIGNED;
  DECLARE done INT DEFAULT FALSE;
  DECLARE q CURSOR FOR SELECT number FROM queries;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN q;

  q_loop: LOOP
    FETCH q INTO i;
    IF done THEN
      LEAVE q_loop;
    END IF;
    CALL run_query(i, nrun, do_log);
  END LOOP;

  CLOSE q;
END //

CREATE PROCEDURE do_warmup
(IN rounds INT UNSIGNED)
MODIFIES SQL DATA
BEGIN
  FOR i IN 1..rounds
  DO
    CALL run_all_queries(0, 0);
  END FOR;
END //

CREATE PROCEDURE do_benchmark
(IN rounds INT UNSIGNED)
MODIFIES SQL DATA
BEGIN
  DELETE FROM exec_time;
  FOR i IN 1..rounds
  DO
    CALL run_all_queries(i, 1);
  END FOR;
END //

CREATE PROCEDURE show_results
()
MODIFIES SQL DATA
BEGIN
  SELECT
    query_number AS query,
    min(exec_usec)/1000000 AS min,
    avg(exec_usec)/1000000 AS avg,
    max(exec_usec)/1000000 AS max,
    stddev(exec_usec)/avg(exec_usec)*100 AS `STDDEV%`
  FROM exec_time
  GROUP BY query_number
  ORDER BY query_number;
END //

CREATE PROCEDURE short_results
()
MODIFIES SQL DATA
BEGIN
  SELECT
    query_number AS query,
    avg(exec_usec)/1000000 AS avg
  FROM exec_time
  GROUP BY query_number
  ORDER BY query_number;
END //

delimiter ;

