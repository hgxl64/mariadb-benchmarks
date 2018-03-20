#!/usr/bin/perl -w
#
# collect data from sysbench run
#
# (w) Axel XL Schwenke for MariaDB Services AB

$BENCHMARK="sysbench write-only, 20 writes per TRX, 1 table";

my @v = get_run_info();
my @threads = get_thread_info();

open TPS, ">QPS.dat" or die;
open RT1, ">RT_avg.dat" or die;
open RT2, ">RT_95.dat" or die;

print TPS "#$BENCHMARK\n#QPS\n#\n";
print RT1 "#$BENCHMARK\n#average transaction time [ms]\n#\n";
print RT2 "#$BENCHMARK\n#95%ile of transaction time [ms]\n#\n";

print TPS "#thread count       \t", join("\t", @threads), "\n";
print RT1 "#thread count       \t", join("\t", @threads), "\n";
print RT2 "#thread count       \t", join("\t", @threads), "\n";

for my $i (@v) {

    printf TPS "%-20s", $i;
    printf RT1 "%-20s", $i;
    printf RT2 "%-20s", $i;

    for my $k (@threads) {
        my $tps=-1, $rt_avg=-1, $rt_95=-1;
        if (open F, "<$i/sysbench.$k.res") {
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


sub pp
{
    my $x = shift;
    my $res = "";

    if ($x < 0) {
        $res = "---";
    }
    elsif ($x < 10.0) {
        $res = sprintf "%.4f", $x;
    }
    elsif ($x < 100.0) {
        $res = sprintf "%.3f", $x;
    }
    elsif ($x < 1000.0) {
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


sub by_version
{
    my @aa= $a =~ /^(.*?)(\d+)\.(\d+)\.(\d+)/;
    my @bb= $b =~ /^(.*?)(\d+)\.(\d+)\.(\d+)/;
    return $aa[0] cmp $bb[0] if ($aa[0] ne $bb[0]);
    return $aa[1] <=> $bb[1] if ($aa[1] ne $bb[1]);
    return $aa[2] <=> $bb[2] if ($aa[2] ne $bb[2]);
    return $aa[3] <=> $bb[3] if ($aa[3] ne $bb[3]);
    return $a cmp $b;
}


sub get_run_info
{
    opendir D, "." or die "cannot opendir '.' : $!\n";
    my @resdir= grep { /^m/ && -d $_ } readdir D;
    closedir D;

    return sort by_version @resdir;
}

 
sub get_thread_info
{
    opendir D, "." or die "cannot opendir '.' : $!\n";
    my @resdir= grep { /^m/ && -d $_ } readdir D;
    closedir D;

    my %t;
    for my $d (@resdir) {
        opendir D, $d or die "cannot opendir '$d' : $!\n";
        map { /\.(\d+)\.res$/ and $t{$1}= 1 } readdir D;
        closedir D;
    }
    return sort {$a <=> $b} keys %t;
}

