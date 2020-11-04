#!/usr/bin/perl -w
#
# compose graphical digest, with optional filtering on
# - test by regex
# - server by regex
# - last N results (tail)
#
# (w) Axel XL Schwenke for MariaDB.com

#configuration
my @QPSFILES=     qw{QPS.dat TPS.dat};
my @RTFILES=      qw{RT_avg.dat};
my $BASENAME=     'gdigest';
my $TESTFILTER=   '.*';
my $SERVERFILTER= '.*';
my $TAIL=         0;
#end configuration

use Getopt::Long;

GetOptions(
  "basename=s" => \$BASENAME,
  "test=s"     => \$TESTFILTER,
  "server=s"   => \$SERVERFILTER,
  "tail=i"     => \$TAIL
) or die "usage: $0 [--test=<regex>] [--server=<regex>] [--tail=<number>] [--basename=<s>]\n";


opendir D, ".";
my @TESTS= sort grep { /^t_/ && -d $_ } readdir D;
closedir D;

my $idx = 0;

open DATA, ">$BASENAME.data" or die;
open PLOT, ">$BASENAME.gnuplot" or die;

print PLOT "#!/usr/bin/gnuplot\n\nreset\n\n";
print PLOT "set terminal pdf size 8, 5\nset output '$BASENAME.pdf'\n\n";

for (my $i = 1; $i <= 10; $i++) {
    print PLOT "set style line $i linewidth 2\n";
}

print PLOT "set xrange [0:*]\nset xtics border nomirror\nunset x2tics\nset xlabel 'Throughput [kqps]'\n\n";
print PLOT "set logscale y 2\nset ytics border nomirror\nunset y2tics\nset ylabel 'Latency [ms]'\n\n";
print PLOT "set key left top\n\n";


for my $test (@TESTS) {
  next unless ($test =~ $TESTFILTER);
  my @thdcnt= ();
  my @qpsdata= ();
  my @rtdata= ();

  for my $result (@QPSFILES) {
    if (-f "$test/$result") {
      open F, "<$test/$result";
      while (<F>) {
          if (/^#thread count/) {
            s/^#thread count\s*//;
            @thdcnt = split " ";
          }
          next if (/^#/);
          chomp;
          push(@qpsdata, $_) if (/$SERVERFILTER/);
      }
      close F;
      my $len= scalar @qpsdata;
      if ($TAIL and $len>$TAIL) {
          @qpsdata= @qpsdata[$len-$TAIL .. $len-1];
      }
      last;
    }
  }

  for my $result (@RTFILES) {
    if (-f "$test/$result") {
      open F, "<$test/$result";
      while (<F>) {
          next if (/^#/);
          chomp;
          push(@rtdata, $_) if (/$SERVERFILTER/);
      }
      close F;
      my $len= scalar @rtdata;
      if ($TAIL and $len>$TAIL) {
          @rtdata= @rtdata[$len-$TAIL .. $len-1];
      }
      last;
    }
  }

  process_test($test, \@qpsdata, \@rtdata, \@thdcnt);

}

close PLOT;
close DATA;

chmod 0755, "$BASENAME.gnuplot";
exec "gnuplot", "$BASENAME.gnuplot";

#not reached
exit 0;


sub process_test
{
    my ($title, $qps, $rt, $cnt)= @_;
    my $num_in_set = 1;

    print DATA "## ", $title, "\n";
    $title =~ s/_/\\_/g;
    print PLOT "set title '", $title, "' font 'giant'\n";

    while (scalar @$qps && scalar @$rt) {
        my @qpsdata= split ' ', shift @$qps;
        my @rtdata= split ' ', shift @$rt;

        #first field is the server version
        my $server=  shift @qpsdata;
        my $server2= shift @rtdata;

        #skip if not the same for QPS/RT
        next unless ($server eq $server2);

        #skip if only a single data point
        next if (scalar @qpsdata == 1);

        print DATA "# ", $server, "\n";
        my $i= 0;
        while (scalar @qpsdata && scalar @rtdata) {
            my $qps= shift @qpsdata;
            my $rt=  shift @rtdata;
            next if ($qps eq "---");
            printf DATA "%f\t%f\t%d\n", $qps, $rt, $cnt->[$i++];
        }
        print DATA "\n\n";

        if ($num_in_set == 1) {
            print PLOT "plot '$BASENAME.data' index $idx using (\$1/1000):2 with linespoints ";
            print PLOT "linestyle $num_in_set title '", $server, "'";
            print PLOT ",\\\n     '' index $idx using (\$1/1000):2:3 with labels center offset 1,1 notitle ";
        } else {
            print PLOT ",\\\n     '' index $idx using (\$1/1000):2 with linespoints ";
            print PLOT "linestyle $num_in_set title '", $server, "'";
        }

        $idx++;
        $num_in_set++;
    }
    print PLOT "\n\n";
}

