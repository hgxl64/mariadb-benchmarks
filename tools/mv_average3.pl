#!/usr/bin/perl -w
#
# (w) Axel XL Schwenke for MariaDB AB
#
# read a 3-column TSV file and calculate a moving average on columns 2+3

#defaults
my $avgcnt = 10;
#end defaults

use Getopt::Long;

GetOptions("interval=i" => \$avgcnt) or die "usage: $0 [-interval n]\n";

my @data_x = ();
my @data_y = ();
my @data_z = ();

while (<>) {
    chomp;
    my ($x, $y, $z, undef) = split "\t";
    push @data_x, $x;
    push @data_y, $y;
    push @data_z, $z;
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

my @avg_z = do {
  my $sum = 0;
  my @summers = ();
  map {
    $sum += $_;
    push @summers, $_;
    $sum -= shift @summers if @summers > $avgcnt;
    $sum / @summers;
  } @data_z;
};

for my $x (@data_x) {
    print $x, "\t", shift @avg_y, "\t", shift @avg_z, "\n";
}
