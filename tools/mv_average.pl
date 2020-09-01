#!/usr/bin/perl -w
#
# (w) Axel XL Schwenke for MariaDB AB
#
# read a 2-column TSV file and calculate a moving average on column 2

#defaults
my $avgcnt = 10;
#end defaults

use Getopt::Long;

GetOptions("interval=i" => \$avgcnt) or die "usage: $0 [-interval n]\n";

my @data_x = ();
my @data_y = ();

while (<>) {
    chomp;
    my ($x, $y, undef) = split "\t";
    push @data_x, $x;
    push @data_y, $y;
}

my @avg_y = do {
  my $sum = 0;
  my @summers = ();
  map {
    $sum += $_;
    push @summers, $_;
    $sum -= shift @summers if @summers > $avgcnt;
    $sum / @summers;
  } @data_y;
};

for my $x (@data_x) {
    print $x, "\t", shift @avg_y, "\n";
}
