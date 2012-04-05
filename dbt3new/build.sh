#!/bin/bash

DBT3SRC="http://downloads.sourceforge.net/project/osdldbt/dbt3/1.9/dbt3-1.9.tar.gz"

test -d download || mkdir download
test -f download/dbt3-1.9.tar.gz || wget -P download $DBT3SRC

test -d build/dbt3-1.9 && rm -rf build/dbt3-1.9
tar xzf download/dbt3-1.9.tar.gz -C build

cd build

patch -p0 <dbt3-1.9.diff

cd dbt3-1.9
./configure --with-sapdb
make
cd src/dbgen
make

