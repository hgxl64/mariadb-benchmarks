#!/usr/bin/perl -w
#
# collect data from sysbench run
#
# (w) Axel XL Schwenke for MariaDB Services AB

#DBMS type and version
my %v1 = (
          "01" => "MySQL-5.6.10",
          "02" => "MySQL-5.6.10 (segmented toc)",
          "04" => "MariaDB-10.0.1",
          "06" => "MySQL-5.5.30",
          "08" => "MariaDB-5.5.30"
         );

@threads = (1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024);

#open result files
open TPS, ">tps.dat" or die;
open RT1, ">rt_avg.dat" or die;
open RT2, ">rt_95.dat" or die;

#print result header
print TPS "# transactions per second\n";
print RT1 "# average response time in milliseconds\n";
print RT2 "# 95 percentile response time in milliseconds\n";
map {
    print TPS "# res", $_, " = ", $v1{$_}, "\n";
    print RT1 "# res", $_, " = ", $v1{$_}, "\n";
    print RT2 "# res", $_, " = ", $v1{$_}, "\n";
} sort keys %v1;
print TPS "\n#thd";
print RT1 "\n#thd";
print RT2 "\n#thd";
map {
    print TPS "\tres", $_;
    print RT1 "\tres", $_;
    print RT2 "\tres", $_;
} sort keys %v1;
print TPS "\n\n";
print RT1 "\n\n";
print RT2 "\n\n";


#loop over runs
for my $t (@threads) {

    print TPS $t;
    print RT1 $t;
    print RT2 $t;

    for my $i (sort keys %v1) {

        open F, "<../res$i/sysbench.ro.$t.res" or die;
        my $tps=-1, $rt_avg=-1, $rt_95=-1;
        while (<F>) {
            $tps = $1    if /transactions:.*\((.*) per sec/o;
            $rt_avg = $1 if /avg:.*?(.*)ms/o;
            $rt_95 = $1  if /approx.  95 percentile:.*?(.*)ms/o;
        }
        close F;

        printf TPS "\t%s", pp_tps($tps);
        printf RT1 "\t%s", pp_rt($rt_avg);
        printf RT2 "\t%s", pp_rt($rt_95);
    }

    print TPS "\n";
    print RT1 "\n";
    print RT2 "\n";
}

close RT2;
close RT1;
close TPS;

exit 0;


sub pp_tps
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


sub pp_rt
{
    my $x = shift;
    return sprintf "%.2f", $x;
}
