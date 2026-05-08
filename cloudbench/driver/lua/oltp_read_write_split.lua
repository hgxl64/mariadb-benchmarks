#!/usr/bin/env sysbench
-- Copyright (C) 2006-2017 Alexey Kopytov <akopytov@gmail.com>

-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA

-- ----------------------------------------------------------------------
-- Read/Write OLTP benchmark
-- splittable workload
-- ----------------------------------------------------------------------

require("oltp_common")

sysbench.cmdline.options.write_percentage =
   {"Percentage of read/write transactions", 0}


-- Template strings of random digits with 11-digit groups separated by dashes
-- 10 groups, 119 characters
local c_value_template = "###########-###########-###########-" ..
   "###########-###########-###########-" ..
   "###########-###########-###########-" ..
   "###########"
-- 5 groups, 59 characters
local pad_value_template = "###########-###########-###########-" ..
   "###########-###########"

function get_c_value()
   return sysbench.rand.string(c_value_template)
end

function get_pad_value()
   return sysbench.rand.string(pad_value_template)
end

function get_id()
   return sysbench.rand.default(1, sysbench.opt.table_size)
end

function prepare_statements()
   -- empty
end

function do_ro_workload()
   local tnum = sysbench.rand.uniform(1, sysbench.opt.tables) 
   local i, query

   for i = 1, sysbench.opt.point_selects do
      query = string.format("SELECT LEFT(c, 16) FROM sbtest%d WHERE id=%d", tnum, get_id())
      con:query(query)
   end

   if sysbench.opt.range_selects then
      for i = 1, sysbench.opt.simple_ranges do
         local id = get_id()
         query = string.format("SELECT LEFT(c, 16) FROM sbtest%d WHERE id BETWEEN %d AND %d", 
                                tnum, id, id + sysbench.opt.range_size - 1)
         con:query(query)
      end
      for i = 1, sysbench.opt.sum_ranges do
         local id = get_id()
         query = string.format("SELECT SUM(k) FROM sbtest%d WHERE id BETWEEN %d AND %d",
                                tnum, id, id + sysbench.opt.range_size - 1)
         con:query(query)
      end
      for i = 1, sysbench.opt.order_ranges do
         local id = get_id()
         query = string.format("SELECT LEFT(c, 16) FROM sbtest%d WHERE id BETWEEN %d AND %d ORDER BY LEFT(c, 16)",
                                tnum, id, id + sysbench.opt.range_size - 1)
         con:query(query)
      end
      for i = 1, sysbench.opt.distinct_ranges do
         local id = get_id()
         query = string.format("SELECT DISTINCT LEFT(c, 16) FROM sbtest%d WHERE id BETWEEN %d AND %d ORDER BY LEFT(c, 16)",
                                tnum, id, id + sysbench.opt.range_size - 1)
         con:query(query)
      end
   end

   return tnum
end

function read_only_transaction()
   if not sysbench.opt.skip_trx then
      con:query("START TRANSACTION READ ONLY")
   end

   do_ro_workload()

   if not sysbench.opt.skip_trx then
      con:query("COMMIT")
   end
end

function read_write_transaction()
   if not sysbench.opt.skip_trx then
      con:query("START TRANSACTION READ WRITE")
   end

   local tnum = do_ro_workload()
   local i, query

   for i = 1, sysbench.opt.index_updates do
      query = string.format("UPDATE sbtest%d SET k=k+1 WHERE id=%d", tnum, get_id())
      con:query(query)
   end

   for i = 1, sysbench.opt.non_index_updates do
      query = string.format("UPDATE sbtest%d SET c='%s' WHERE id=%d", tnum, get_c_value(), get_id())
      con:query(query)
   end

   for i = 1, sysbench.opt.delete_inserts do
      local id = get_id()
      query = string.format("DELETE FROM sbtest%d WHERE id=%d", tnum, id)
      con:query(query)
      query = string.format("INSERT INTO sbtest%d (id, k, c, pad) VALUES (%d, %d, '%s', '%s')",
                            tnum, id, get_id(), get_c_value(), get_pad_value())
      con:query(query)
   end

   if not sysbench.opt.skip_trx then
      con:query("COMMIT")
   end
end


function event()
   local trx_type = sysbench.rand.uniform(0, 99)
   if (trx_type < sysbench.opt.write_percentage) then
      read_write_transaction()
   else
      read_only_transaction()
   end

   check_reconnect()
end

