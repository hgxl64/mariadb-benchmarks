SELECT 'indexing linitem' AS progress;
ALTER TABLE lineitem
   ADD INDEX i_l_shipdate(l_shipdate),
   ADD INDEX i_l_suppkey_partkey (l_partkey, l_suppkey),
   ADD INDEX i_l_partkey (l_partkey),
   ADD INDEX i_l_suppkey (l_suppkey),
   ADD INDEX i_l_receiptdate (l_receiptdate),
   ADD INDEX i_l_orderkey (l_orderkey),
   ADD INDEX i_l_orderkey_quantity (l_orderkey, l_quantity),
   ADD INDEX i_l_commitdate (l_commitdate);
INSERT INTO load_time_statistics (task_name, timest) VALUES ('added lineitem indexes', now(6));

SELECT 'indexing customer' AS progress;
CREATE INDEX i_c_nationkey ON customer (c_nationkey);
INSERT INTO load_time_statistics (task_name, timest) VALUES ('added customer indexes', now(6));

SELECT 'indexing orders' AS progress;
ALTER TABLE orders
  ADD INDEX i_o_orderdate (o_orderdate),
  ADD INDEX i_o_custkey (o_custkey);
INSERT INTO load_time_statistics (task_name, timest) VALUES ('added orders indexes', now(6));

SELECT 'indexing supplier' AS progress;
CREATE INDEX i_s_nationkey ON supplier (s_nationkey);
INSERT INTO load_time_statistics (task_name, timest) VALUES ('added supplier indexes', now(6));

SELECT 'indexing partsupp' AS progress;
ALTER TABLE partsupp
  ADD INDEX i_ps_partkey (ps_partkey),
  ADD INDEX i_ps_suppkey (ps_suppkey);
INSERT INTO load_time_statistics (task_name, timest) VALUES ('added partsupp indexes', now(6));

SELECT 'indexing nation' AS progress;
CREATE INDEX i_n_regionkey ON nation (n_regionkey);
INSERT INTO load_time_statistics (task_name, timest) VALUES ('added nation indexes', now(6));

