function set_vars()
   oltp_tables_count = oltp_tables_count or 1
   oltp_table_size = oldt_table_size or 10000
   sequence_engine = sequence_engine or mysql_table_engine
   trx_size = (trx_size and trx_size+0) or 1
end


function prepare()
   local i

   set_vars()

   print("oltp_tables_count = " .. oltp_tables_count)
   print("sequence_engine = " .. sequence_engine)
   print("trx_size = " .. trx_size)

   db_connect()
   create_sequence()

   print("creating tables ...");

   for i = 1,oltp_tables_count do
     create_table(i)
   end

   db_disconnect()
   print()

   return 0
end


function create_table(table_id)
   local query

   query = [[
CREATE TABLE sbtest]] .. table_id .. [[ (
id INTEGER UNSIGNED NOT NULL, 
k INTEGER UNSIGNED DEFAULT '0' NOT NULL,
c CHAR(120) DEFAULT '' NOT NULL,
pad CHAR(60) DEFAULT '' NOT NULL,
PRIMARY KEY (id)
) ENGINE=]] .. mysql_table_engine

   db_query(query)
end


function create_sequence()
   local query

   print("creating sequence ...");

   query = [[
CREATE TABLE sbseq (
  id INTEGER UNSIGNED NOT NULL,
  val BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (id)
) ENGINE=]] .. sequence_engine

   db_query(query)
   rs = db_query("INSERT INTO sbseq VALUES (1, 0)")
end


function cleanup()
   local i
   set_vars()

   for i = 1,oltp_tables_count do
      db_query("TRUNCATE TABLE sbtest".. i )
   end
end


function thread_init(thread_id)
   set_vars()
end


function thread_end(thread_id)
   db_disconnect()
end


function event(thread_id)
   local table_name
   local i
   local c_val
   local k_val
   local pad_val
   local n

   table_name = "sbtest".. (thread_id % oltp_tables_count + 1)

   if (trx_size>1) then
      db_query("BEGIN")

      for i = 1,trx_size do
         k_val = sb_rand(1, oltp_table_size)
         c_val = sb_rand_str([[
###########-###########-###########-###########-###########-###########-###########-###########-###########-###########]])
         pad_val = sb_rand_str([[
###########-###########-###########-###########-###########]])
         rs = db_query("UPDATE sbseq SET val=LAST_INSERT_ID(val+1) WHERE id=1") 
         rs = db_query("INSERT INTO " .. table_name ..  " (id, k, c, pad) VALUES " .. string.format("(LAST_INSERT_ID(), %d, '%s', '%s')", k_val, c_val, pad_val))
      end

      db_query("COMMIT")

   else
      k_val = sb_rand(1, oltp_table_size)
      c_val = sb_rand_str([[
###########-###########-###########-###########-###########-###########-###########-###########-###########-###########]])
      pad_val = sb_rand_str([[
###########-###########-###########-###########-###########]])
  
      rs = db_query("UPDATE sbseq SET val=LAST_INSERT_ID(val+1) WHERE id=1") 
      rs = db_query("INSERT INTO " .. table_name ..  " (id, k, c, pad) VALUES " .. string.format("(LAST_INSERT_ID(), %d, '%s', '%s')", k_val, c_val, pad_val))

   end

end

