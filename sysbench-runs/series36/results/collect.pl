#!/usr/bin/perl -w
#
# collect data from sysbench run
#
# (w) Axel XL Schwenke for MariaDB Services AB

#DBMS type and version
my %v = (
         "01" => "double write",
         "02" => "atomic write",
         "03" => "fast checksum",
         "04" => "no checksum",
         );

my @threads = (1, 2, 4, 8, 16, 32, 64, 128, 256);

open TPS, ">tps.dat" or die;
open RT1, ">rt_avg.dat" or die;
open RT2, ">rt_99.dat" or die;

for my $i (sort keys %v) {
    print TPS "# data set ", $i, " -> ", $v{$i}, "\n";
    print RT1 "# data set ", $i, " -> ", $v{$i}, "\n";
    print RT2 "# data set ", $i, " -> ", $v{$i}, "\n";
}

print TPS "\n\n# read only\n#thd\t", join("\t", sort keys %v), "\n";
print RT1 "\n\n# read only\n#thd\t", join("\t", sort keys %v), "\n";
print RT2 "\n\n# read only\n#thd\t", join("\t", sort keys %v), "\n";

for my $k (@threads) {

    printf TPS "%d", $k;
    printf RT1 "%d", $k;
    printf RT2 "%d", $k;

    for my $i (sort keys %v) {
        open F, "<../res$i/sysbench.ro.$k.res" or die;
        my $tps=-1, $rt_avg=-1, $rt_99=-1;
        while (<F>) {
            $tps = $1    if /transactions:.*\((.*) per sec/o;
            $rt_avg = $1 if /avg:.*?(.*)ms/o;
            $rt_99 = $1  if /approx.  99 percentile:.*?(.*)ms/o;
        }
        close F;
        printf TPS "\t%s", pp($tps);
        printf RT1 "\t%.2f", $rt_avg;
        printf RT2 "\t%.2f", $rt_99;
    }

    print TPS "\n";
    print RT1 "\n";
    print RT2 "\n";

}

print TPS "\n\n# read/write\n#thd\t", join("\t", sort keys %v), "\n";
print RT1 "\n\n# read/write\n#thd\t", join("\t", sort keys %v), "\n";
print RT2 "\n\n# read/write\n#thd\t", join("\t", sort keys %v), "\n";

for my $k (@threads) {

    printf TPS "%d", $k;
    printf RT1 "%d", $k;
    printf RT2 "%d", $k;

    for my $i (sort keys %v) {
        open F, "<../res$i/sysbench.rw.$k.res" or die;
        my $tps=-1, $rt_avg=-1, $rt_99=-1;
        while (<F>) {
            $tps = $1    if /transactions:.*\((.*) per sec/o;
            $rt_avg = $1 if /avg:.*?(.*)ms/o;
            $rt_99 = $1  if /approx.  99 percentile:.*?(.*)ms/o;
        }
        close F;
        printf TPS "\t%s", pp($tps);
        printf RT1 "\t%.2f", $rt_avg;
        printf RT2 "\t%.2f", $rt_99;
    }

    print TPS "\n";
    print RT1 "\n";
    print RT2 "\n";

}


close RT2;
close RT1;
close TPS;

exit 0;


sub pp
{
    my $x = shift;
    my $res = "";

    if ($x < 1000.0) {
        $res = sprintf "%.2f", $x;
    }
    elsif ($x < 10000.0) {
        $res = sprintf "%.1f", $x;
    }
    else {
        $res = sprintf "%d", $x;
    }

    return $res;
}

