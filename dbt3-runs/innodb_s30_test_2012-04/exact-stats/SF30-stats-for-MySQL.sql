UPDATE mysql.innodb_table_stats SET n_rows=4500000, last_update=NOW()
                WHERE database_name='dbt3' AND table_name='customer';
UPDATE mysql.innodb_index_stats SET stat_value=4500000, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='customer'
                        AND index_name='PRIMARY' AND stat_name='n_diff_pfx01';
UPDATE mysql.innodb_index_stats SET stat_value=25, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='customer'
                        AND index_name='i_c_nationkey' AND stat_name='n_diff_pfx01';
UPDATE mysql.innodb_table_stats SET n_rows=179998372, last_update=NOW()
                WHERE database_name='dbt3' AND table_name='lineitem';
UPDATE mysql.innodb_index_stats SET stat_value=45000000, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='lineitem'
                        AND index_name='PRIMARY' AND stat_name='n_diff_pfx01';
UPDATE mysql.innodb_index_stats SET stat_value=179998372, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='lineitem'
                        AND index_name='PRIMARY' AND stat_name='n_diff_pfx02';
UPDATE mysql.innodb_index_stats SET stat_value=2466, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='lineitem'
                        AND index_name='i_l_commitdate' AND stat_name='n_diff_pfx01';
UPDATE mysql.innodb_index_stats SET stat_value=45000000, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='lineitem'
                        AND index_name='i_l_orderkey' AND stat_name='n_diff_pfx01';
UPDATE mysql.innodb_index_stats SET stat_value=45000000, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='lineitem'
                        AND index_name='i_l_orderkey_quantity' AND stat_name='n_diff_pfx01';
UPDATE mysql.innodb_index_stats SET stat_value=172975329, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='lineitem'
                        AND index_name='i_l_orderkey_quantity' AND stat_name='n_diff_pfx02';
UPDATE mysql.innodb_index_stats SET stat_value=6000000, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='lineitem'
                        AND index_name='i_l_partkey' AND stat_name='n_diff_pfx01';
UPDATE mysql.innodb_index_stats SET stat_value=2555, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='lineitem'
                        AND index_name='i_l_receiptdate' AND stat_name='n_diff_pfx01';
UPDATE mysql.innodb_index_stats SET stat_value=2526, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='lineitem'
                        AND index_name='i_l_shipdate' AND stat_name='n_diff_pfx01';
UPDATE mysql.innodb_index_stats SET stat_value=300000, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='lineitem'
                        AND index_name='i_l_suppkey' AND stat_name='n_diff_pfx01';
UPDATE mysql.innodb_index_stats SET stat_value=6000000, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='lineitem'
                        AND index_name='i_l_suppkey_partkey' AND stat_name='n_diff_pfx01';
UPDATE mysql.innodb_index_stats SET stat_value=23990189, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='lineitem'
                        AND index_name='i_l_suppkey_partkey' AND stat_name='n_diff_pfx02';
UPDATE mysql.innodb_table_stats SET n_rows=25, last_update=NOW()
                WHERE database_name='dbt3' AND table_name='nation';
UPDATE mysql.innodb_index_stats SET stat_value=25, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='nation'
                        AND index_name='PRIMARY' AND stat_name='n_diff_pfx01';
UPDATE mysql.innodb_index_stats SET stat_value=5, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='nation'
                        AND index_name='i_n_regionkey' AND stat_name='n_diff_pfx01';
UPDATE mysql.innodb_table_stats SET n_rows=45000000, last_update=NOW()
                WHERE database_name='dbt3' AND table_name='orders';
UPDATE mysql.innodb_index_stats SET stat_value=45000000, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='orders'
                        AND index_name='PRIMARY' AND stat_name='n_diff_pfx01';
UPDATE mysql.innodb_index_stats SET stat_value=2999930, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='orders'
                        AND index_name='i_o_custkey' AND stat_name='n_diff_pfx01';
UPDATE mysql.innodb_index_stats SET stat_value=2406, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='orders'
                        AND index_name='i_o_orderdate' AND stat_name='n_diff_pfx01';
UPDATE mysql.innodb_table_stats SET n_rows=6000000, last_update=NOW()
                WHERE database_name='dbt3' AND table_name='part';
UPDATE mysql.innodb_index_stats SET stat_value=6000000, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='part'
                        AND index_name='PRIMARY' AND stat_name='n_diff_pfx01';
UPDATE mysql.innodb_table_stats SET n_rows=24000000, last_update=NOW()
                WHERE database_name='dbt3' AND table_name='partsupp';
UPDATE mysql.innodb_index_stats SET stat_value=6000000, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='partsupp'
                        AND index_name='PRIMARY' AND stat_name='n_diff_pfx01';
UPDATE mysql.innodb_index_stats SET stat_value=24000000, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='partsupp'
                        AND index_name='PRIMARY' AND stat_name='n_diff_pfx02';
UPDATE mysql.innodb_index_stats SET stat_value=6000000, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='partsupp'
                        AND index_name='i_ps_partkey' AND stat_name='n_diff_pfx01';
UPDATE mysql.innodb_index_stats SET stat_value=300000, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='partsupp'
                        AND index_name='i_ps_suppkey' AND stat_name='n_diff_pfx01';
UPDATE mysql.innodb_table_stats SET n_rows=5, last_update=NOW()
                WHERE database_name='dbt3' AND table_name='region';
UPDATE mysql.innodb_index_stats SET stat_value=5, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='region'
                        AND index_name='PRIMARY' AND stat_name='n_diff_pfx01';
UPDATE mysql.innodb_table_stats SET n_rows=300000, last_update=NOW()
                WHERE database_name='dbt3' AND table_name='supplier';
UPDATE mysql.innodb_index_stats SET stat_value=300000, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='supplier'
                        AND index_name='PRIMARY' AND stat_name='n_diff_pfx01';
UPDATE mysql.innodb_index_stats SET stat_value=25, last_update=NOW()
                        WHERE database_name='dbt3' AND table_name='supplier'
                        AND index_name='i_s_nationkey' AND stat_name='n_diff_pfx01';
