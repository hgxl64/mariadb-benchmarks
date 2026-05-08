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
-- Update-Non-Index OLTP benchmark
-- ----------------------------------------------------------------------

require("oltp_common")

function prepare_statements()
   prepare_non_index_updates()
   if not sysbench.opt.skip_trx then
      prepare_begin()
      prepare_commit()
   end
end

function event()
   if not sysbench.opt.skip_trx then
      begin()
   end

   for i = 1, sysbench.opt.point_selects do
      execute_non_index_updates()
   end

   if not sysbench.opt.skip_trx then
      commit()
   end

   check_reconnect()
end
