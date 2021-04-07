#!/usr/bin/perl -w
#
# (w) Axel XL Schwenke for MariaDB AB
#
# extract time series data from iostat -mx dumps
#
# $Id$

#defaults
my $opt_disk = undef;
my $opt_cpu = 1;
#end defaults

use strict;
use Getopt::Long;

GetOptions(
           "disk=s" => \$opt_disk,
           "cpu!" => \$opt_cpu
          ) or usage();

if ((not defined $opt_disk) && $opt_cpu==0) {
    usage();
}

my $step= shift @ARGV or usage();

my $stamp= 0;

if ($opt_cpu) {
    while (<>) {
        if (/^avg-cpu/o) {
            $_ = <>;
            chomp;
            s/^\s+//;
            tr/ / /s;
            my ($user, $nice, $system, $wait, $steal, $idle) = split ' ';
            printf "%d\t%f\t%f\t%f\t%f\n", $stamp, $user+$nice, $system, $wait, $idle;
            $stamp += $step;
        }
    }
}
elsif (defined $opt_disk) {
    while (<>) {
        if (/^$opt_disk/) {
            chomp;
            my @d= split ' ';
            print $stamp, "\t", $d[5], "\t", $d[6], "\n";
            $stamp += $step;
        }
    }
}
else {
    die "neither cpu nor disk stats requested - doing nothing\n";
}

exit 0;


sub usage
{
    die "usage: $0 [--disk=s] [--cpu] timestep\n";
}

