#!/usr/bin/perl -w
#
# (w) Axel XL Schwenke for MariaDB AB
#
# extract time series data from SHOW GLOBAL STATUS dumps
#
# $Id$

use strict;
use Getopt::Long;

#defaults
my $opt_rate = 0;
#end defaults

GetOptions("rate!" => \$opt_rate);

my $varname= shift @ARGV or die "usage: $0 [--rate] variable-name\n";

my $start= undef;
my $laststamp = undef;
my $lastval = undef;
<>;

do {
    #hash holds one result set
    my %d = ();

    #read set until EOF or start of next set
    while (<>) {
        chomp;
        my ($k, $v) = split "\t";
        last if ($k eq "Variable_name");
        $d{$k} = $v;
    }

    #set start timestamp, so we can print time starting from 0
    if (not defined $start) {
        $start = $d{"Uptime"};
    }

    #calculate rate from last value and timestamp
    my $rate = 0;
    if (not defined $lastval) {
        $lastval = $d{$varname};
        $laststamp = $d{"Uptime"};
    } else {
        $rate = ($d{$varname}-$lastval) / ($d{"Uptime"}-$laststamp);
    }

    #print result
    if ($opt_rate) {
        printf "%d\t%.1f\n", $d{"Uptime"}-$start, $rate;
    } else {
        printf "%d\t%s\n", $d{"Uptime"}-$start, $d{$varname};
    }

    $lastval = $d{$varname};
    $laststamp = $d{"Uptime"};

} while (not eof);

