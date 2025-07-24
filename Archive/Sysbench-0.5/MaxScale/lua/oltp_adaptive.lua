pathtest = string.match(test, "(.*/)") or ""

dofile(pathtest .. "common.lua")


function thread_init(thread_id)
  local rs; 

  set_vars()

  rs = db_query("SELECT * FROM INFORMATION_SCHEMA.GLOBAL_VARIABLES WHERE VARIABLE_NAME='READ_ONLY' AND VARIABLE_VALUE='ON'")
  if (rs == 1) then
    print("forcing thread ".. thread_id .." to read-only\n")
    oltp_read_only=true;
  end

  if (db_driver == "mysql" and mysql_table_engine == "myisam") then
    begin_query = "LOCK TABLES sbtest WRITE"
    commit_query = "UNLOCK TABLES"
  else
    begin_query = "START TRANSACTION READ WRITE"
    commit_query = "COMMIT"

    if oltp_read_only
    then
      begin_query = "START TRANSACTION READ ONLY"
    end
  end
end


function thread_done(thread_id)                                                                               
  db_disconnect()                                                                                           
end                                                                                                           


function event(thread_id)
  local rs
  local i
  local table_name
  local range_start
  local c_val
  local pad_val
  local query

  table_name = "sbtest".. sb_rand_uniform(1, oltp_tables_count)
  db_query(begin_query)

  for i=1, oltp_point_selects do
    rs = db_query("SELECT LENGTH(c) FROM ".. table_name .." WHERE id=" .. sb_rand(1, oltp_table_size))
  end

  for i=1, oltp_simple_ranges do
    range_start = sb_rand(1, oltp_table_size)
    rs = db_query("SELECT LENGTH(c) FROM ".. table_name .." WHERE id BETWEEN " .. range_start .. " AND " .. range_start .. "+" .. oltp_range_size - 1)
  end
  
  for i=1, oltp_sum_ranges do
    range_start = sb_rand(1, oltp_table_size)
    rs = db_query("SELECT SUM(K) FROM ".. table_name .." WHERE id BETWEEN " .. range_start .. " AND " .. range_start .. "+" .. oltp_range_size - 1)
  end
   
  for i=1, oltp_order_ranges do
    range_start = sb_rand(1, oltp_table_size)
    rs = db_query("SELECT LENGTH(c) FROM ".. table_name .." WHERE id BETWEEN " .. range_start .. " AND " .. range_start .. "+" .. oltp_range_size - 1 .. " ORDER BY c")
  end

  for i=1, oltp_distinct_ranges do
    range_start = sb_rand(1, oltp_table_size)
    rs = db_query("SELECT DISTINCT LENGTH(c) FROM ".. table_name .." WHERE id BETWEEN " .. range_start .. " AND " .. range_start .. "+" .. oltp_range_size - 1 .. " ORDER BY c")
  end

  if not oltp_read_only then

    for i=1, oltp_index_updates do
      rs = db_query("UPDATE " .. table_name .. " SET k=k+1 WHERE id=" .. sb_rand(1, oltp_table_size))
    end

    for i=1, oltp_non_index_updates do
      c_val = sb_rand_str("###########-###########-###########-###########-###########-###########-###########-###########-###########-###########")
      query = "UPDATE " .. table_name .. " SET c='" .. c_val .. "' WHERE id=" .. sb_rand(1, oltp_table_size)
      rs = db_query(query)
    end

    i = sb_rand(1, oltp_table_size)
    rs = db_query("DELETE FROM " .. table_name .. " WHERE id=" .. i)
    c_val = sb_rand_str([[
###########-###########-###########-###########-###########-###########-###########-###########-###########-###########]])
    pad_val = sb_rand_str([[
###########-###########-###########-###########-###########]])

    rs = db_query("INSERT INTO " .. table_name ..  " (id, k, c, pad) VALUES " .. string.format("(%d, %d, '%s', '%s')",i, sb_rand(1, oltp_table_size) , c_val, pad_val))

  end -- oltp_read_only

  db_query(commit_query)

end

