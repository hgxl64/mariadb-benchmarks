#!/usr/bin/perl -w
#
# (w) Axel XL Schwenke for MariaDB AB
#
# extract time series for network usage from sar -n DEV reports
#
# $Id: 1ee88d9aaa7e0ed4dd61c79f3e7e842d7ceeb080 $

#defaults
my $opt_pkt = 0;
#end defaults

use strict;
use Getopt::Long;

GetOptions(
           "pkt!" => \$opt_pkt,
          ) or usage();

my $dev=  shift @ARGV or usage();
my $step= shift @ARGV or usage();

my $stamp= 0;

if ($opt_pkt) {
    print "#stamp\trxpkt\ttxpkt\n";
    while (<>) {
        chomp;
        my @d= split ' ';
        if (scalar @d == 10 && $d[0]=~/^[0-9]/ && $d[1] eq $dev) {
            print $stamp, "\t", $d[2], "\t", $d[3], "\n";
            $stamp += $step;
        }
    }
}
else {
    print "#stamp\trxkB\ttxkB\n";
    while (<>) {
        chomp;
        my @d= split ' ';
        if (scalar @d == 10 && $d[0]=~/^[0-9]/ && $d[1] eq $dev) {
            print $stamp, "\t", $d[4], "\t", $d[5], "\n";
            $stamp += $step;
        }
    }
}

exit 0;


sub usage
{
    die "usage: $0 [--pkt] netdev timestep\n";
}

