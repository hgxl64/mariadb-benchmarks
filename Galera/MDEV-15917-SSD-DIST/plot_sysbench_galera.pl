#!/usr/bin/perl -w
#
# plot data from sysbench run
#
# (w) Axel XL Schwenke for MariaDB Services AB
#
# $Id: 3201d812e52fc1e99e86c5e75d1411d4d6f12f06 $

use Getopt::Long;

#defaults
my $opt_pdf = 0;
my $opt_help = 0;
my $opt_threads = "";
#end defaults

my $usage = <<EOT;
$0 [options]
create throughput vs. trx time plots from sysbench results
options:
--pdf ............... create PDF output (default: PNG)
--threads=min,max ... use only results from the gives range 
--help, -? .......... show this text

EOT

die $usage unless GetOptions("pdf!"   => \$opt_pdf,
                             "threads=s" => \$opt_threads,
                             "help|?" => \$opt_help)
    and not $opt_help;

#collect info
my %wl = get_run_info("DESC.WL");
my %set = get_run_info("DESC");
my @threads = get_thread_info($opt_threads);

my $idx = 0;

open DATA, ">sysbench.data" or die;
open PLOT, ">sysbench.gnuplot" or die;

print PLOT "#!/usr/bin/gnuplot\n\nreset\n\n";
if ($opt_pdf) {
    print PLOT "set terminal pdf size 8, 5\nset output 'sysbench.pdf'\n\n";
} else {
    print PLOT "set terminal png medium nocrop enhanced size 960,500 background '#F0F0F0'\n\n";
}
print PLOT "set xrange [0:*]\nset xtics border nomirror\nunset x2tics\nset xlabel 'Throughput [kqps]'\n\n";
print PLOT "set logscale y 2\nset ytics border nomirror\nunset y2tics\nset ylabel 'Latency [ms]'\n\n";

for (my $i = 1; $i <= scalar keys %set; $i++) {
    print PLOT "set style line $i linewidth 2\n";
}
print PLOT "set key left top\n\n";

#
# one block per workload
#
for my $w (sort keys %wl) {
    print DATA "## ", $wl{$w}, "\n";

    print PLOT "set output 'sysbench_$w.png'\n" unless ($opt_pdf);
    print PLOT "set title '", $wl{$w}, "' font 'giant'\n";

    my $num_in_set = 1;

    for my $i (sort keys %set) {
        print DATA "# ", $set{$i}, "\n";

        for my $thd (@threads) {
            my $qps=-1, $rt_avg=-1;
            my $fn="res$i/$w.$thd.res";
            if (open F, "<$fn") {
                while (<F>) {
                    $qps = $1    if /queries:.*\((.*) per sec/o;
                    $rt_avg = $1 if /avg:\w*?(.*)/o;
                }
                close F;
            }
            printf DATA "%d\t%f\t%f\n", $thd, $qps, $rt_avg;
        }

        print DATA "\n\n";
        if ($num_in_set == 1) {
            print PLOT "plot 'sysbench.data' index $idx using (\$2/1000):3 with linespoints ";
            print PLOT "linestyle $num_in_set title '", $set{$i}, "'";
            print PLOT ",\\\n     '' index $idx using (\$2/1000):3:1 with labels ";
            print PLOT "center offset 1.5, 0.5 notitle";
        } else {
            print PLOT ",\\\n     '' index $idx using (\$2/1000):3 with linespoints ";
            print PLOT "linestyle $num_in_set title '", $set{$i}, "'";
        }
        $idx++;
        $num_in_set++;
    }
    print PLOT "\n\n";
}


close PLOT;
close DATA;

chmod 0755, "sysbench.gnuplot";
exec "gnuplot", "sysbench.gnuplot";

#not reached
exit 0;


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
        $d =~ s/(?<!\\)_/\\_/g;
        $d =~ s/(?<!\\)@/\\@/g;
	$res{$n}= $d;
    }
    close F;
    return %res;
}


sub get_thread_info
{
    my $opt= shift;
    my $min_threads= 1;
    my $max_threads= 1e10;

    if ($opt =~ /^(\d+),(\d+)$/o) {
        $min_threads= $1;
	$max_threads= $2;
    } elsif ($opt =~ /^,(\d+)$/o) {
        $max_threads= $1;
    } elsif ($opt =~ /^(\d+),$/o) {
        $min_threads= $1;
    }

    opendir D, "." or die "cannot opendir '.' : $!\n";
    my @resdir= grep { /^res\d+/ && -d $_ } readdir D;
    closedir D;

    my %t;
    for my $d (@resdir) {
        opendir D, $d or die "cannot opendir '$d' : $!\n";
        map { /\.(\d+)\.res$/ and $1<=$max_threads and $1>=$min_threads and $t{$1}= 1 } readdir D;
        closedir D;
    }
    return sort {$a <=> $b} keys %t;
}


