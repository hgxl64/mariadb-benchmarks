pathtest = string.match(test, "(.*/)") or ""

dofile(pathtest .. "common.lua")


function xl_create(table_id)
   local index_name
   local i
   local query

   if (oltp_secondary) then
     index_name = "KEY xid"
   else
     index_name = "PRIMARY KEY"
   end

   i = table_id

   print("Creating table 'sbtest" .. i .. "'...")
   if (oltp_db_driver == "mysql") then
      query = [[
CREATE TABLE sbtest]] .. i .. [[ (
id INTEGER UNSIGNED NOT NULL ]] ..
((oltp_auto_inc and "AUTO_INCREMENT") or "") .. [[,
k INTEGER UNSIGNED DEFAULT '0' NOT NULL,
c CHAR(120) DEFAULT '' NOT NULL,
pad CHAR(60) DEFAULT '' NOT NULL,
]] .. index_name .. [[ (id)
) /*! ENGINE = ]] .. mysql_table_engine ..
" MAX_ROWS = " .. myisam_max_rows .. " */"

   elseif (oltp_db_driver == "drizzle") then
      query = [[
CREATE TABLE sbtest]] .. i .. [[ (
id INTEGER NOT NULL ]] .. ((oltp_auto_inc and "AUTO_INCREMENT") or "") .. [[,
k INTEGER DEFAULT '0' NOT NULL,
c CHAR(120) DEFAULT '' NOT NULL,
pad CHAR(60) DEFAULT '' NOT NULL,
]] .. index_name .. [[ (id)
) ]]
   else
      print("Unknown database driver: " .. db_driver)
      return 1
   end

   db_query(query)

   db_query("CREATE INDEX k on sbtest" .. i .. "(k)")
end


function xl_insert(table_id)
   local i
   local j

   i = table_id
   print("Inserting " .. oltp_table_size .. " records into 'sbtest" .. i .. "'")

   if (oltp_auto_inc) then
      db_bulk_insert_init("INSERT INTO sbtest" .. i .. "(k, c, pad) VALUES")
   else
      db_bulk_insert_init("INSERT INTO sbtest" .. i .. "(id, k, c, pad) VALUES")
   end

   local c_val
   local pad_val


   for j = 1,oltp_table_size do

   c_val = sb_rand_str([[
###########-###########-###########-###########-###########-###########-###########-###########-###########-###########]])
   pad_val = sb_rand_str([[
###########-###########-###########-###########-###########]])

      if (oltp_auto_inc) then
         db_bulk_insert_next("(" .. sb_rand(1, oltp_table_size) .. ", '".. c_val .."', '" .. pad_val .. "')")
      else
         db_bulk_insert_next("("..j.."," .. sb_rand(1, oltp_table_size) .. ",'".. c_val .."', '" .. pad_val .. "'  )")
      end
   end

   db_bulk_insert_done()
end


function prepare()
   local query
   local i
   local j

   set_vars()
   db_connect()

   for i = 1,oltp_tables_count do
     xl_create(i)
   end

   return 0
end


function thread_init(thread_id)
   local index_name
   local i
   set_vars()
   
   print("thread prepare"..thread_id)

   for i=thread_id+1, oltp_tables_count, num_threads  do
     xl_insert(i)
   end

end

function event(thread_id)

end


