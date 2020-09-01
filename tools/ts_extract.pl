#!/usr/bin/perl -w
#
# (w) Axel XL Schwenke for MariaDB AB
#
# extract time series data from sysbench output

use strict;

while (<>) {
    if (/^\[ \d+s \]/) { #sysbench 1.x format
        my @f = /^\[ (\d+)s \] .* tps: ([\d\.]+) qps: ([\d\.]+) .* err\/s ([\d\.]+) reconn\/s: ([\d\.]+)/o;
        print join("\t", @f), "\n";
    }
}

