#!/usr/bin/perl -w
#
# extract tps and response time from sysbench result file
# averaging two consecutive lines (5s intervals to 10s)
#
# (w) Axel XL Schwenke for MariaDB Services AB

my ($tps, $rt);

while (<>) {
    next unless /(\d+)s\] .* tps: ([0-9\.]+).* time: ([0-9\.]+)ms/o;
    if (($1 % 10) == 5) {
        $tps = $2;
        $rt  = $3;
    }
    if (($1 % 10) == 0) {
        printf "%d %.1f %.2f\n", $1, ($tps+$2)/2, ($rt+$3)/2;
    }
}
