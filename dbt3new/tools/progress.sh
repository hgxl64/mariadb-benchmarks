#!/bin/bash

mysql dbt3 -e "select query, pass, UNIX_TIMESTAMP(end_ts)-UNIX_TIMESTAMP(start_ts) AS duration from dbt3_runs"

mysql dbt3 -e "select query, min(duration) as min, max(duration) as max, avg(duration) as avg, std(duration) as sigma, std(duration)/avg(duration)*100 as 'sigma/avg %' from (select query, pass, UNIX_TIMESTAMP(end_ts)-UNIX_TIMESTAMP(start_ts) AS duration from dbt3_runs) xxx group by query"

