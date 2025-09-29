#!/usr/bin/perl -w
#
# (w) Axel XL Schwenke for MariaDB AB
#
# merge multiple TSV files by first column
#
# * values in column 1 must be numeric
# * all values of column 1 must exist in the first file
#
# $Id: b1d0f04e2aba947fab8b32733d07cf9df267918e $


my %merged = ();
my $header = undef;

while (my $line = <>) {
    chomp $line;
    my ($stamp, $fields) = split ' ', $line, 2;

    if ($stamp =~ /^#/) {
        $header = $stamp;
        $stamp = -1;
    }

    if (not exists $merged{$stamp}) {
        $merged{$stamp} = $fields;
    } else {
        $merged{$stamp} = $merged{$stamp}."\t".$fields;
    }
}

if (defined $header) {
    print $header, "\t", $merged{-1}, "\n";
    delete $merged{-1};
}

for my $ts (sort {$a <=> $b} keys %merged) {
    print $ts, "\t", $merged{$ts}, "\n";
}

