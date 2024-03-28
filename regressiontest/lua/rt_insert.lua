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
-- Insert-Only OLTP benchmark
-- ----------------------------------------------------------------------

require("oltp_common")

function prepare_statements()
   if not sysbench.opt.skip_trx then
      prepare_begin()
      prepare_commit()
   else
      sysbench.opt.batch_size = 1
   end
end

function event()
   local table_name = "sbtest" .. sysbench.rand.uniform(1, sysbench.opt.tables)

   if not sysbench.opt.skip_trx then
      begin()
   end

   for i = 1, sysbench.opt.batch_size do

      local k_val = sysbench.rand.default(1, 2147483647)
      local c_val = get_c_value()
      local pad_val = get_pad_value()
   
      if (drv:name() == "pgsql" and sysbench.opt.auto_inc) then
         con:query(string.format("INSERT INTO %s (k, c, pad) VALUES " ..
                                    "(%d, '%s', '%s')",
                                 table_name, k_val, c_val, pad_val))
      else
         if (sysbench.opt.auto_inc) then
            id = 0
         else
            -- Convert a uint32_t value to SQL INT
            id = sysbench.rand.unique() - 2147483648
         end
   
         con:query(string.format("INSERT INTO %s (id, k, c, pad) VALUES " ..
                                    "(%d, %d, '%s', '%s')",
                                 table_name, id, k_val, c_val, pad_val))
      end
   end

   if not sysbench.opt.skip_trx then
      commit()
   end

   check_reconnect()
end
