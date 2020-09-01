#!/usr/bin/perl -w
#
# (w) Axel XL Schwenke for MariaDB AB
#
# extract time series data from PERFORMANCE_SCHEMA dumps

use strict;

my $mutex= shift @ARGV or die "usage: $0 mutex-name\n";

my $stamp= 0;
my $step= 1;

#find the time step
while (<>) {
    if (/sleep\((\d+)\)/) {
        $step= $1+0;
        #print STDERR "found time step: $step\n";
        last;
    }
}

#extract mutex stats
while (<>) {
    if (/^Bye/) {
        $stamp += $step;
    }
    if (/^\|/) {
        my $line = $_;
        $line =~ s/^\| //s;
        if ($line =~ /$mutex[\| ]+(\d+)[\| ]+(\d+)/) {
            print $stamp, "\t", $1, "\t", $2, "\n";
        }
    }
}

