#!/usr/bin/perl -w
#
# collect data from sysbench run
#
# (w) Axel XL Schwenke for MariaDB Services AB

#DBMS type and version
my %v1 = (
          1 => "MariaDB-5.5.29",
          2 => "MySQL-5.5.30",
          3 => "MariaDB-10.0.1",
          4 => "MySQL-5.6.10",
          5 => "MariaDB-5.5.29",
          6 => "MySQL-5.5.30",
          7 => "MariaDB-10.0.1",
          8 => "MySQL-5.6.10"
         );

#permission type and version
my %v2 = (
          0 => "none",
          1 => "global",
          2 => "db",
          3 => "table"
         );

open TPS, ">tps.dat" or die;
open RT1, ">rt_avg.dat" or die;
open RT2, ">rt_95.dat" or die;

for my $i (sort keys %v1) {

    printf TPS "#%s (%s)\n#thd", $v1{$i}, ($i<5 ? "glibc malloc" : "tcmalloc");
    printf RT1 "#%s (%s)\n#thd", $v1{$i}, ($i<5 ? "glibc malloc" : "tcmalloc");
    printf RT2 "#%s (%s)\n#thd", $v1{$i}, ($i<5 ? "glibc malloc" : "tcmalloc");
    map {
        print TPS "\t", $v2{$_};
        print RT1 "\t", $v2{$_};
        print RT2 "\t", $v2{$_};
    } sort keys %v2;
    print TPS "\n";
    print RT1 "\n";
    print RT2 "\n";

    for my $k (1, 2, 4, 8, 16, 32, 64, 128, 256) {

        printf TPS "%d", $k;
        printf RT1 "%d", $k;
        printf RT2 "%d", $k;

        for my $j (sort keys %v2) {
            open F, "<../res$j$i/sysbench.ro.$k.res" or die;
            my $tps=-1, $rt_avg=-1, $rt_95=-1;
            while (<F>) {
                $tps = $1    if /transactions:.*\((.*) per sec/o;
                $rt_avg = $1 if /avg:.*?(.*)ms/o;
                $rt_95 = $1  if /approx.  95 percentile:.*?(.*)ms/o;
            }
            close F;
            printf TPS "\t%s", pp($tps);
            printf RT1 "\t%.2f", $rt_avg;
            printf RT2 "\t%.2f", $rt_95;
        }

        print TPS "\n";
        print RT1 "\n";
        print RT2 "\n";
    }

    print TPS "\n\n";
    print RT1 "\n\n";
    print RT2 "\n\n";
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

