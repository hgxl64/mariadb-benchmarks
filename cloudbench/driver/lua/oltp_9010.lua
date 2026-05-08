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
-- Read/Write OLTP benchmark, 90:10 mix
-- ----------------------------------------------------------------------

require("oltp_common")

function prepare_statements()
   -- set query mix to 9 selects + 1 update
   sysbench.opt.point_selects=9
   sysbench.opt.non_index_updates=1

   if not sysbench.opt.skip_trx then
      prepare_begin()
      prepare_commit()
   end

   prepare_point_selects()
   prepare_non_index_updates()
end

function event()
   if not sysbench.opt.skip_trx then
      begin()
   end

   execute_point_selects()
   execute_non_index_updates()

   if not sysbench.opt.skip_trx then
      commit()
   end

   check_reconnect()
end
