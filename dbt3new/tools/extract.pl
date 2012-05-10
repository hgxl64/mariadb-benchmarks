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

for $q (sort semi_numeric keys %data) {
    my @t = sort neg_is_inf @{$data{$q}};
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


#sort order where negative numbers sort like +inf
sub neg_is_inf
{
    my $x = ($a < 0 ? 100000: $a);
    my $y = ($b < 0 ? 100000: $b);
    return ($x <=> $y);
}

#sort order for query "numbers"
sub semi_numeric
{
    my ($a1, $a2) = $a =~ /(\d*)(.*)/o;
    my ($b1, $b2) = $b =~ /(\d*)(.*)/o;

    return ($a1 == $b1) ?  ($a2 cmp $b2) : ($a1 <=> $b1);
}
