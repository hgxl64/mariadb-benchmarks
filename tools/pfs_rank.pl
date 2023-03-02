#!/usr/bin/perl -w
#
# (w) Axel XL Schwenke for MariaDB AB
#
# rank mutexes from PFS dump
#
# $Id: 486779a4fd94663c1aca7bfe73a7f5ec7116094f $

use strict;
use Getopt::Long;

my $opt_log= 0;
my $opt_waits= 0;
my $opt_events= 0;

GetOptions(
           "events!" => \$opt_events,
           "waits!" => \$opt_waits,
           "log!" => \$opt_log
          ) or die "usage: $0 [--log | --waits | --events]\n";

my %d=();
my $num;

#get mutex stats

while (<>) {
    if (/^\| event/o) {
        if ($opt_log) {
            $num= 1024;
        } else {
            $num= 10;
        }
        next;
    }
    if (my ($mutex, $events, $waits) = /^\| (.*?)[\| ]+(\d+)[\| ]+(\d+)/) {
        my $n= $num;
        $n = $events if ($opt_events);
        $n = $waits if ($opt_waits);
        $d{$mutex} = (exists $d{$mutex} ? $d{$mutex} : 0) + $n;
        if ($opt_log) {
            $num /= 2;
        } else {
            $num -= 1;
        }
    }
}

foreach my $mutex (sort { $d{$b} <=> $d{$a} } keys %d) {
    printf "%s\t%d\n", $mutex, $d{$mutex};
}
exit 0;

