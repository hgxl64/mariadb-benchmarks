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
my $timestep = undef;
my $opt_rate = 0;
#end defaults

GetOptions("rate!" => \$opt_rate, "timestep=i" => \$timestep);

my $varname= shift @ARGV or die "usage: $0 [--rate] [--timestep=n] variable-name\n";

my $start= (defined $timestep ? 0 : undef);
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
        $rate = ($d{$varname}-$lastval) / (defined $timestep ? $timestep : $d{"Uptime"}-$laststamp);
    }

    #print result
    if (defined $timestep) {
        printf "%d\t%s\n", $start, ($opt_rate ? $rate : $d{$varname});
        $start+= $timestep;
    } else {
        printf "%d\t%s\n", $d{"Uptime"}-$start, ($opt_rate ? $rate : $d{$varname});
    }

    $lastval = $d{$varname};
    $laststamp = $d{"Uptime"};

} while (not eof);

