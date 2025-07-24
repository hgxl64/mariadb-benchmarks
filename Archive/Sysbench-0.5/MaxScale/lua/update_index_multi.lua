pathtest = string.match(test, "(.*/)") or ""

dofile(pathtest .. "common.lua")

function thread_init(thread_id)
   set_vars()
   db_connect()
   db_query("use sbtest" .. (thread_id % oltp_databases) + 1)

end

function thread_done(thread_id)                                                                               
   db_disconnect()                                                                                           
end                                                                                                           

function event(thread_id)
   local table_name
   table_name = "sbtest".. sb_rand_uniform(1, oltp_tables_count)
   rs = db_query("UPDATE ".. table_name .." SET k=k+1 WHERE id=" .. sb_rand(1, oltp_table_size))
end
