#!/usr/bin/perl -w
#
# collect data from sysbench run
#
# (w) Axel XL Schwenke for MariaDB Services AB

my %v = get_run_info(@ARGV, "DESC");
my @threads = get_thread_info();

open TPS, ">TPS.dat" or die;
open RT1, ">RT_avg.dat" or die;
open RT2, ">RT_99.dat" or die;

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
        my $tps=-1, $rt_avg=-1, $rt_99=-1;
        if (open F, "<res$i/sysbench.ro.$k.res") {
            while (<F>) {
                $tps = $1    if /transactions:.*\((.*) per sec/o;
                $rt_avg = $1 if /avg:.*?(.*)ms/o;
                $rt_99 = $1  if /approx.  99 percentile:.*?(.*)ms/o;
            }
            close F;
        }
        printf TPS "\t%s", pp($tps);
        printf RT1 "\t%s", pp($rt_avg);
        printf RT2 "\t%s", pp($rt_99);
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
        my $tps=-1, $rt_avg=-1, $rt_99=-1;
        if (open F, "<res$i/sysbench.rw.$k.res") {
            while (<F>) {
                $tps = $1    if /transactions:.*\((.*) per sec/o;
                $rt_avg = $1 if /avg:.*?(.*)ms/o;
                $rt_99 = $1  if /approx.  99 percentile:.*?(.*)ms/o;
            }
            close F;
        }
        printf TPS "\t%s", pp($tps);
        printf RT1 "\t%s", pp($rt_avg);
        printf RT2 "\t%s", pp($rt_99);
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


sub get_run_info
{
    my $descfile = shift;
    my %res;
    open F, "<$descfile" or die "cannot read from '$descfile' : $!\n";
    while (<F>) {
        chomp;
	next if /^#/;
	next if /^\s*$/;
        my ($n, $d) = split /\s*\.{2,}\s*/o;
	$res{$n}= $d;
    }
    close F;
    return %res;
}


sub get_thread_info
{
    opendir D, "." or die "cannot opendir '.' : $!\n";
    my @resdir= grep { /^res\d+/ && -d $_ } readdir D;
    closedir D;

    my %t;
    for my $d (@resdir) {
        opendir D, $d or die "cannot opendir '$d' : $!\n";
        map { /\.(\d+)\.res$/ and $t{$1}= 1 } readdir D;
        closedir D;
    }
    return sort {$a <=> $b} keys %t;
}

