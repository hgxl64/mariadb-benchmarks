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
-- ----------------------------------------------------------------------

require("oltp_common")


sysbench.cmdline.options.ins1 =
   {"Number of INSERT thds, using serialization mode READ COMMITTED", 1}
sysbench.cmdline.options.ins2 =
   {"Number of INSERT thds, using serialization mode SERIALIZABLE", 1}


function thread_init()
   drv = sysbench.sql.driver()
   con = drv:connect()
   thread_id = sysbench.tid % sysbench.opt.threads
end


function thread_done()
   con:disconnect()
end

range_start=0

function event()
   -- local s = sysbench.rand.default(0,500)

   if thread_id < sysbench.opt.ins1 
   then 
      -- print("READ_COMMITTED inserter tid=" .. thread_id)
      -- os.execute("sleep " .. tonumber((500+s)/1000))
      con:query("SET TRANSACTION ISOLATION LEVEL READ COMMITTED")
      con:query("BEGIN")

      for i = 1, sysbench.opt.batch_size do
         local k_val = sysbench.rand.default(1, 2147483647)
         local c_val = get_c_value()
         local pad_val = get_pad_value()
         con:query(string.format("INSERT INTO sbtest1 (k, c, pad) VALUES " ..
                                    "(%d, '%s', '%s')", k_val, c_val, pad_val))
      end
      con:query("COMMIT")

   elseif thread_id < sysbench.opt.ins1+sysbench.opt.ins2 
   then 
      -- print("SERIALIZABLE inserter tid=" .. thread_id)
      -- os.execute("sleep " .. tonumber((500+s)/1000))
      con:query("SET TRANSACTION ISOLATION LEVEL SERIALIZABLE")
      con:query("BEGIN")

      for i = 1, sysbench.opt.batch_size do
         local k_val = sysbench.rand.default(1, 2147483647)
         local c_val = get_c_value()
         local pad_val = get_pad_value()
         con:query(string.format("INSERT INTO sbtest1 (k, c, pad) VALUES " ..
                                    "(%d, '%s', '%s')", k_val, c_val, pad_val))
      end
      con:query("COMMIT")

   else
      -- print("reader tid=" .. thread_id)
      -- os.execute("sleep " .. tonumber((500+s)/1000))
      rs=con:query(string.format("SELECT * FROM sbtest1 ORDER BY k LIMIT 5000 OFFSET %d", range_start))
      if rs.nrows < 5000 then
         range_start=0
      else
	 range_start=range_start+5000
      end
   end

end
