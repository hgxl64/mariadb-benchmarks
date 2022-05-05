DELETE FROM load_time_statistics;
INSERT INTO load_time_statistics (task_name, timest) VALUES ('analyze tables started', now(6));
ANALYZE TABLE supplier PERSISTENT FOR ALL;
INSERT INTO load_time_statistics (task_name, timest) VALUES ('analyzed supplier table', now(6));
ANALYZE TABLE part PERSISTENT FOR ALL;
INSERT INTO load_time_statistics (task_name, timest) VALUES ('analyzed part table', now(6));
ANALYZE TABLE partsupp PERSISTENT FOR ALL;
INSERT INTO load_time_statistics (task_name, timest) VALUES ('analyzed partsupp table', now(6));
ANALYZE TABLE customer PERSISTENT FOR ALL;
INSERT INTO load_time_statistics (task_name, timest) VALUES ('analyzed customer table', now(6));
ANALYZE TABLE orders PERSISTENT FOR ALL;
INSERT INTO load_time_statistics (task_name, timest) VALUES ('analyzed orders table', now(6));
ANALYZE TABLE lineitem PERSISTENT FOR ALL;
INSERT INTO load_time_statistics (task_name, timest) VALUES ('analyzed lineitem table', now(6));
ANALYZE TABLE nation PERSISTENT FOR ALL;
INSERT INTO load_time_statistics (task_name, timest) VALUES ('analyzed nation table', now(6));
ANALYZE TABLE region PERSISTENT FOR ALL;
INSERT INTO load_time_statistics (task_name, timest) VALUES ('analyzed region table', now(6));

