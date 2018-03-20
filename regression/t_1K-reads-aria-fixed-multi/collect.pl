#!/usr/bin/perl -w
#
# collect data from sysbench run
#
# (w) Axel XL Schwenke for MariaDB Services AB

use lib "../common";
use sysbench;

$BENCHMARK="sysbench read/only, 1000 point-selects per iteration, 20 tables";

my @v = get_run_info();
my @threads = get_thread_info();

open TPS, ">QPS.dat" or die;
open RT1, ">RT_avg.dat" or die;
open RT2, ">RT_95.dat" or die;

print TPS "#$BENCHMARK\n#QPS\n#\n";
print RT1 "#$BENCHMARK\n#average execution time for 1000 selects [ms]\n#\n";
print RT2 "#$BENCHMARK\n#95%ile of execution time per 1000 selects [ms]\n#\n";

print TPS "#thread count       \t", join("\t", @threads), "\n";
print RT1 "#thread count       \t", join("\t", @threads), "\n";
print RT2 "#thread count       \t", join("\t", @threads), "\n";

for my $i (@v) {

    printf TPS "%-20s", $i;
    printf RT1 "%-20s", $i;
    printf RT2 "%-20s", $i;

    for my $k (@threads) {
        my $tps=-1, $rt_avg=-1, $rt_95=-1;
        if (open F, "<$i/sysbench.ro.$k.res") {
            while (<F>) {
                $tps = $1    if /read\/write requests:.*\((.*) per sec/o;
                $rt_avg = $1 if /avg:.*?(.*)ms/o;
                $rt_95 = $1  if /approx.  95 percentile:.*?(.*)ms/o;
            }
            close F;
        }
        printf TPS "\t%s", pp($tps);
        printf RT1 "\t%s", pp($rt_avg);
        printf RT2 "\t%s", pp($rt_95);
    }

    print TPS "\n";
    print RT1 "\n";
    print RT2 "\n";

}

close RT2;
close RT1;
close TPS;

exit 0;

