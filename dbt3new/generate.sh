#!/bin/bash
#
# callme: ./generate.sh scale_factor engine repeats
#
# (w) XL for Monty Program AB

SCALE=${1:-1}
ENGINE=${2:-"InnoDB"}
RUNS=${3:-3}

HERE=`pwd`

export DSS_CONFIG=$HERE/build/dbt3-1.9/src/dbgen
export DSS_QUERY=$HERE/build/dbt3-1.9/queries/mysql
export DSS_PATH=$HERE/work

test -d work || mkdir work

echo "generating data"
build/dbt3-1.9/src/dbgen/dbgen -vfF -s $SCALE

echo "generating queries"
for d in `seq 22`
do
  build/dbt3-1.9/src/dbgen/qgen -s $SCALE $d    > `printf 'work/query_%02d.sql' $d`
  build/dbt3-1.9/src/dbgen/qgen -s $SCALE -x $d > `printf 'work/explain_%02d.sql' $d`
done

echo "creating loader SQL"
cat sql/load_dbt3_PK_first.sql.in |
 sed "s|TABLE_OPTIONS|Engine $ENGINE|" |
 sed "s|DATA_GEN_DIR|$DSS_PATH|" > $DSS_PATH/dbt3_load.sql

echo "creating runner SQL"
(
cat sql/run_dbt3.sql.in
for query in `seq 22`
do
  for pass in `seq $RUNS`
  do
    printf 'SET @start:=NOW();\n'
    printf 'source query_%02d.sql\n' $query
    printf 'INSERT INTO dbt3_runs (batch, query, pass, start_ts, end_ts)\n'
    printf ' VALUES (@batch, %d, %d, @start, NOW());\n\n' $query $pass
  done
done
) > $DSS_PATH/dbt3_run.sql

