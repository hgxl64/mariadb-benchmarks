function set_vars()
   oltp_tables_count = oltp_tables_count or 1
   oltp_table_size = oltp_table_size or 10000
   sequence_cache = sequence_cache or 1000
   sequence_engine = sequence_engine or mysql_table_engine
   trx_size = (trx_size and trx_size+0) or 1
end


function prepare()
   local i

   set_vars()

   print("oltp_tables_count = " .. oltp_tables_count)
   print("sequence_engine = " .. sequence_engine)
   print("sequence_cache = " .. sequence_cache)
   print("trx_size = " .. trx_size)

   db_connect()
   create_sequence()

   for i = 1,oltp_tables_count do
     create_table(i)
   end

   db_disconnect()
   return 0
end


function create_sequence()
   db_query("CREATE SEQUENCE sbseq CACHE=" .. sequence_cache .. " ENGINE=" .. sequence_engine)
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
) /*! ENGINE = ]] .. mysql_table_engine .. " */"

   db_query(query)
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

   table_name = "sbtest".. (thread_id % oltp_tables_count + 1)

   if (trx_size>1) then
      db_query("BEGIN")

      for i = 1,trx_size do
         k_val = sb_rand(1, oltp_table_size)
         c_val = sb_rand_str([[
###########-###########-###########-###########-###########-###########-###########-###########-###########-###########]])
         pad_val = sb_rand_str([[
###########-###########-###########-###########-###########]])
         rs = db_query("INSERT INTO " .. table_name ..  " (id, k, c, pad) VALUES " .. string.format("(NEXTVAL(sbseq), %d, '%s', '%s')", k_val, c_val, pad_val))
      end

      db_query("COMMIT")

   else
      k_val = sb_rand(1, oltp_table_size)
      c_val = sb_rand_str([[
###########-###########-###########-###########-###########-###########-###########-###########-###########-###########]])
      pad_val = sb_rand_str([[
###########-###########-###########-###########-###########]])

      rs = db_query("INSERT INTO " .. table_name ..  " (id, k, c, pad) VALUES " .. string.format("(NEXTVAL(sbseq), %d, '%s', '%s')", k_val, c_val, pad_val))

   end

end

