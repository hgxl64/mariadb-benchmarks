#!/usr/bin/perl -w
#
# summarize DBT3 results
#
# (w) Axel XL Schwenke for MariaDB Services AB


use strict;

my @data = (); #collected data
my $n = 0;     #data set number

while (my $file = shift @ARGV) {
    process_file($file);
}

dump_data();
exit 0;


sub process_file
{
    my $file = shift;
    open F, "<$file" or die "cannot read $file : $!\n";
    my %dataset = ();
    while (<F>) {
        my @field = split "\t";
        if (5 == scalar @field) {
            $dataset{$field[0]} = [$field[2], $field[1], $field[3]];
        }
    }
    close F;
    push @data, \%dataset;
    $n++;
    print "#data set $n : $file", $n==1 ? " (reference)\n" : "\n";
}


sub dump_data
{
    print "#\n#\t";
    map { print "set $_\t\t\t" } (1..$n);
    print "\n#query\t", "min\tmedian\tmax\t" x $n, "\n\n\n";

    #absolute numbers first
    for my $q (sort semi_numeric keys %{$data[0]}) {
        print $q;
        for my $ds (0..$n-1) {
            if (exists $data[$ds]->{$q}) {
                map { printf "\t%d", $_ } @{$data[$ds]->{$q}};
            } else {
                print "\t-1\t-1\t-1";
            }
        }
        print "\n";
    }
    print "\n\n";

    #then percentages
    my %ref = map { $_ => $data[0]->{$_}->[1] } keys %{$data[0]};

    for my $q (sort semi_numeric keys %{$data[0]}) {
        print $q;
        for my $ds (0..$n-1) {
            if (exists $data[$ds]->{$q} && $data[$ds]->{$q}->[0] > 0) {
                map { printf "\t%.2f", 100.0 * $_ / $ref{$q} }
                @{$data[$ds]->{$q}};
            } else {
                print "\t-1\t-1\t-1";
            }
        }
        print "\n";
    }
}


sub semi_numeric
{
    my ($a1, $a2) = $a =~ /(\d*)(.*)/o;
    my ($b1, $b2) = $b =~ /(\d*)(.*)/o;

    return ($a1 == $b1) ?  ($a2 cmp $b2) : ($a1 <=> $b1);
}

