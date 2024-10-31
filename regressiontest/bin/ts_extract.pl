#!/usr/bin/perl -w
#
# (w) Axel XL Schwenke for MariaDB AB
#
# extract time series data from sysbench 1.x output

use strict;

while (<>) {
    if (/^\[ \d+s \]/) {
        my @f = /^\[ (\d+)s \] .* tps: ([\d\.]+) qps: ([\d\.]+)/o;
        print join("\t", @f), "\n";
    }
}

