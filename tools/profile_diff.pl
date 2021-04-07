#!/usr/bin/perl -w
#
# read two plain profiles from "perf report -n --no-call-graph"
# and compare them side-by-side
#
# (w) Axel (XL) Schwenke for MariaDB.org
#
# $Id$

use strict;

my $base_profile;
my $base_name;

for my $f (@ARGV) {
    process_file($f);
}

exit 0;


sub process_file
{
    my $filename = shift;

    unless (defined $base_name) {
        $base_name = $filename;
        $base_profile = read_profile($filename);
    }
    else {
        my $profile = read_profile($filename);
        diff_profile($base_name, $base_profile, $filename, $profile);
    }
}


sub read_profile
{
    my $filename = shift;
    my %data;

    open F, "<$filename" or die "cannot read $filename : $!\n";

    while (my $line = <F>) {
        next if $line =~ /^#/o;
        next if $line =~ /^\s*$/o;

        chomp $line;
        my (undef, $samples, undef, $obj, undef, $sym) = split " ", $line, 6;
        $data{"$obj:$sym"} = $samples;
    }
    close F;
    return \%data;
}


sub diff_profile
{
    my ($n1, $p1, $n2, $p2) = @_;

    #get unique set of symbols from both profiles
    my %seen;
    @seen{keys %$p1, keys %$p2} = ();
    my @symbols = keys %seen;

    #summarize
    my @summary = ();
    my $objlen = 6; # length of the "object" column
    my $sum1 = 0;
    my $sum2 = 0;
    for my $s (@symbols) {
        my $n1 = defined $p1->{$s} ? $p1->{$s} : 0;
        my $n2 = defined $p2->{$s} ? $p2->{$s} : 0;
        $sum1 += $n1;
        $sum2 += $n2;
        my ($obj, $sym) = split ":", $s, 2;
        $objlen = length $obj if ($objlen < length $obj);
        push @summary, [$n2-$n1, $n1, $n2, $obj, $sym];
    }

    print "A is $n1 ($sum1 samples)\n";
    printf "B is $n2 ($sum2 samples, %+.2f%%)\n\n", 100.0*($sum2-$sum1)/$sum1;
    print "delta(B-A)  samples_A  samples_B  object", " " x ($objlen-6), "  symbol\n";
    print "-" x 72, "\n";
    for (sort {$b->[0] <=> $a->[0]} @summary) {
        printf "%+10d%11d%11d  %-${objlen}s  %s\n", @$_;
    }
    print "-" x 72, "\n\n\n";
}

