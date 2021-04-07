#!/usr/bin/perl -w
#
# compose digest, with optional filtering on
# - test by regex
# - server by regex
# - last N results (tail)
#
# (w) Axel XL Schwenke for MariaDB.com

#configuration
my @RESULTFILES=  qw{QPS.dat TPS.dat};
my $TESTFILTER=   '.*';
my $SERVERFILTER= '.*';
my $TAIL=         0;
#end configuration

use Getopt::Long;

GetOptions(
  "test=s"   => \$TESTFILTER,
  "server=s" => \$SERVERFILTER,
  "tail=i"   => \$TAIL
) or die "usage: $0 [--test=<regex>] [--server=<regex>] [--tail=<number>]\n";


opendir D, ".";
my @TESTS= sort grep { /^t_/ && -d $_ } readdir D;
closedir D;

for my $test (@TESTS) {
  next unless ($test =~ $TESTFILTER);
  my $description= "Test '$test' - ";
  my $headline= "";
  my @data= ();

  if (-f "$test/DESC") {
    open F, "<$test/DESC";
    while (<F>) { $description.= $_; }
    close F;
  } else {
    $description.= "(description missing)\n";
  }

  for my $result (@RESULTFILES) {
    if (-f "$test/$result") {
      open F, "<$test/$result";
      while (<F>) {
         $headline= $_ if (/^#thread/);
         next if (/^#/);
         push(@data, $_) if (/$SERVERFILTER/);
      }
      close F;
      last;
    }
  } 

  if (@data) {
    my $len= scalar @data;
    if ($TAIL and $len>$TAIL) {
      @data= @data[$len-$TAIL .. $len-1];
    }
    print "-"x80, "\n";
    print $description;
    print "\n";
    print $headline;
    print join('', @data);
    print "\n";
  }
}

