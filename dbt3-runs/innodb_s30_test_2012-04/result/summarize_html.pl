#!/usr/bin/perl -w
#
# summarize DBT3 results, make HTML table
#
# (w) Axel XL Schwenke for MariaDB Services AB


use strict;

my @data = (); #collected data
my $n = 0;     #data set number

print "<html>\n<table border>\n<tr>\n<th></th>\n";

while (my $file = shift @ARGV) {
    process_file($file);
}
print "</tr>\n\n";
print "<tr>\n<th>Query</th>\n<th>Seconds</th>\n";
print "<th>Seconds</th><th>relative</th>\n" x ($n-1);
print "</tr>\n\n";

dump_data();

print "\n</table>\n</html>\n";

exit 0;


sub process_file
{
    my $file = shift;
    open F, "<$file" or die "cannot read $file : $!\n";
    my %dataset = ();
    while (<F>) {
        my @field = split "\t";
        if (5 == scalar @field) {
            $dataset{$field[0]} = $field[1]; #query => median
        }
    }
    close F;
    push @data, \%dataset;
    $n++;
    print "<th", ($n==1 ? ">" : " colspan=2>"), $file, "</th>\n";
}


sub dump_data
{
    for my $q (sort semi_numeric keys %{$data[0]}) {
        print "<tr><td>$q</td><td>";
        print time_formatted($data[0]->{$q});
        print "</td>";
        for my $ds (1..$n-1) {
            if (exists $data[$ds]->{$q}) {
                print "<td>";
                print time_formatted($data[$ds]->{$q});
                print "</td><td>";
                print deviation_formatted($data[$ds]->{$q}, $data[0]->{$q});
                print "</td>";
            } else {
                print "<td>>7200</td><td></td>";
            }
        }
        print "</tr>\n";
    }
}


sub semi_numeric
{
    my ($a1, $a2) = $a =~ /(\d*)(.*)/o;
    my ($b1, $b2) = $b =~ /(\d*)(.*)/o;

    return ($a1 == $b1) ?  ($a2 cmp $b2) : ($a1 <=> $b1);
}


sub time_formatted
{
    my $t = shift;
    return ($t < 0 ? ">7200" : sprintf "%d", $t);
}

sub deviation_formatted
{
    my ($x, $ref) = @_;

    return "" if ($x<0 || $ref<0);

    my $res = "+";

    $x -= $ref;
    if ($x < 0) {
        $res = "-";
        $x = - $x;
    }

    $x = 100.0 * $x / $ref;

    if ($x == 0) {
        $res = "&plusmn;0";
    }
    elsif ($x < 10.0) {
        $res .= sprintf "%.2f%%", $x;
    }
    elsif ($x < 100.0) {
        $res .= sprintf "%.1f%%", $x;
    }
    else {
        $res .= sprintf "%.0f%%", $x;
    }

    return $res;
}

