pathtest = string.match(test, "(.*/)") or ""

dofile(pathtest .. "common.lua")

function create_insert(table_id)

   local index_name
   local i
   local j
   local query

   if (oltp_secondary) then
     index_name = "KEY xid"
   else
     index_name = "PRIMARY KEY"
   end

   i = table_id

   print("Creating table 'sbtest" .. i .. "'...")
   if (db_driver == "mysql") then
      query = [[
CREATE TABLE sbtest]] .. i .. [[ (
  `begin_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `call_count` int(11) NOT NULL,
  `total_call_time` float NOT NULL,
  `sum_of_squares` float NOT NULL,
  `min_call_time` float NOT NULL,
  `max_call_time` float NOT NULL,
  `agent_id` int(11) NOT NULL,
  `metric_id` int(11) NOT NULL,
  `total_exclusive_time` float NOT NULL,
  PRIMARY KEY (`begin_time`,`agent_id`,`metric_id`),
  KEY `secondary_index` (`agent_id`,`metric_id`,`begin_time`)
) /*! ENGINE = ]] .. mysql_table_engine .. " */"


  -- `id` int(11) NOT NULL AUTO_INCREMENT,
  -- PRIMARY KEY (`id`),
  -- PRIMARY KEY (`begin_time`,`agent_id`,`metric_id`),

   else
      print("Unknown database driver: " .. db_driver)
      return 1
   end

   db_query(query)

   print("Inserting " .. oltp_table_size .. " records into 'sbtest" .. i .. "'")

end

function prepare()
   local query
   local i
   local j

   set_vars()

   db_connect()

   for i = 1,oltp_tables_count do
     create_insert(i)
   end

   return 0
end

reqs_id = {}
agents_id = {}

function thread_init(thread_id)
   set_vars()

   if (db_driver == "mysql" and mysql_table_engine == "myisam") then
      begin_query = "LOCK TABLES sbtest WRITE"
      commit_query = "UNLOCK TABLES"
   else
      begin_query = "BEGIN"
      commit_query = "COMMIT"
   end

   reqs_id[thread_id]=0
   agents_id[thread_id]=0

end

function set_vars()
   oltp_agents = oltp_agents or 1000
   oltp_metrics = oltp_metrics or 100
   oltp_tables_count = oltp_tables_count or 1
   oltp_time_slots = oltp_time_slots or 60
end


function event(thread_id)
   local rs
   local i
   local table_name
   local range_start
   local c_val
   local pad_val
   local query

   table_name = "sbtest".. (thread_id+1)

   db_bulk_insert_init("INSERT INTO " .. table_name .. "(metric_id,agent_id,begin_time,end_time,call_count,total_call_time,total_exclusive_time,sum_of_squares,min_call_time,max_call_time) VALUES")
   
--   for time_slot = 0, oltp_time_slots-1 do
   for metric = 0, oltp_metrics-1 do

   db_bulk_insert_next("("  .. reqs_id[thread_id] .. 
                             ", " .. agents_id[thread_id] ..
                             ", " .. metric  ..
                             ", 1321662245 " ..
                             ", 533003 "  ..
                             ", 17.3012 " ..
                             ", 17.3012 "  ..
                             ", 173.172 "  .. 
                             ", 0.001742 " .. 
                             ", 0.000012 " .. 
                             ")")
   end
   
   agents_id[thread_id]  = agents_id[thread_id] + 1 
   if (agents_id[thread_id] >= oltp_agents) then
     reqs_id[thread_id] = reqs_id[thread_id] + 1
     agents_id[thread_id]=0
   end
--   end

   db_bulk_insert_done()

end

