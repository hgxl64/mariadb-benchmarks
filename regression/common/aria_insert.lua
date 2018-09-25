function set_vars()
   aria_transactional = aria_transactional or 0;
   aria_indexed = aria_indexed or 1;
   aria_batchsize = aria_batchsize or 100;
   aria_row_format = aria_row_format or 'page';
   oltp_table_size = oltp_table_size or 10000;
end


function prepare()
   local query

   set_vars()

   if (aria_indexed == 1)
   then
     query = [[
CREATE TABLE sbtest (
id INTEGER UNSIGNED AUTO_INCREMENT,
k INTEGER UNSIGNED DEFAULT 0 NOT NULL,
c CHAR(120) DEFAULT '' NOT NULL,
PRIMARY KEY (id)
) ENGINE=ARIA TRANSACTIONAL=]] .. aria_transactional .. 
[[ ROW_FORMAT=]] .. aria_row_format ..
[[ MAX_ROWS=1000000000 ]] 
   else
     query = [[
CREATE TABLE sbtest (
k INTEGER UNSIGNED DEFAULT 0 NOT NULL,
c CHAR(120) DEFAULT '' NOT NULL
) ENGINE=ARIA TRANSACTIONAL=]] .. aria_transactional .. 
[[ ROW_FORMAT=]] .. aria_row_format ..
[[ MAX_ROWS=1000000000 ]]
   end

   db_connect()
   db_query(query)
   db_disconnect()

   return 0
end


function thread_init(thread_id)
   set_vars()
end


function thread_end(thread_id)
   db_disconnect()
end


function event(thread_id)
   local k_val
   local c_val
   local i

   db_bulk_insert_init("INSERT INTO sbtest (k, c) VALUES")
   for i=1, aria_batchsize do
      k_val = sb_rand(1, oltp_table_size)
      c_val = sb_rand_str([[
###########-###########-###########-###########-###########-###########-###########-###########-###########-###########]])
      db_bulk_insert_next(string.format("(%d, '%s')", k_val, c_val))
   end
   db_bulk_insert_done()

end

