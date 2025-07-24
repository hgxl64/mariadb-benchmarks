#!/usr/bin/perl -w
#
# extract exec times from all_explains.txt
#
# (w) Axel XL Schwenke for Monty Program AB

my %data = ();
my $q = "?";
my $t = 0;

while (<>) {
    if (/^===== (.*)_explain.sql/) {
        $q = $1;
        $data{$q} = [] unless exists $data{$q};
        next;
    }
    if (/^--- Time elapsed ---$/) {
        $t = <>;
        chomp $t;
        $t += 0;
        push @{$data{$q}}, $t;
    }
}

#print "query\tmedian\tmin\tmax\tfull_result\n";

for $q (sort {$a <=> $b} keys %data) {
    my @t = sort {$a <=> $b} @{$data{$q}};
    my $n = scalar @t;
    if ($n == 1) {
        print $q, "\t", $t[0], "\t", $t[0], "\t", $t[0], "\t";
    } else {
        my $m = int $n/2;
        print $q, "\t", $t[$m], "\t", $t[0], "\t", $t[$n-1], "\t";
    }
    print join(",", @t), "\n";
}

exit 0;
