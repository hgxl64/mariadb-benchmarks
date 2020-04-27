#!/usr/bin/perl -w
#
# read some tabular results and calculate differences
# (w) Axel XL Schwenke for MariaDB.org
#
# $Id$

use Getopt::Long;

#defaults
my $opt_unset = 0;
my $opt_same = 0;
my $opt_tsv = 0;
my $opt_progressive = 0;
my $opt_help = 0;
my $opt_vars = "";
my $opt_relative = "";
#end defaults

my $usage = <<EOT;
$0 [options] file1 file2 ...
read and differentiate tabular SHOW STATUS or SHOW VARIABLES from file1..n
options:
--zero|unset ..... skip variables that are 0 or unset in all files
--same ........... skip variables that are same in all files
--progressive .... calculate progressive differences
--relative=var ... show diffs relative to diff of variable var
--tsv ............ write tab-separated output (default: tabular)
--var=regex ...... consider only variables matching regex
--help, -? ....... show this text

EOT

die $usage unless GetOptions("zero|unset!"  => \$opt_unset,
                             "same!"        => \$opt_same,
                             "progressive!" => \$opt_progressive,
                             "tsv!"         => \$opt_tsv,
                             "var=s"        => \$opt_vars,
                             "relative=s"   => \$opt_relative,
                             "help|?"       => \$opt_help)
    and not $opt_help;

my %data = ();
my $heading = "variable";
my $varlen = length $heading;
my %datlen = ();
my @files = ();

my %diffs = ();


while (my $f = shift) {
    process_file($f);
    push @files, $f;
}

filter_data();
do_diffs();

my $f = shift @files;

if ($opt_progressive) {
    print "progressive variable diffs, starting with '$f'";
} else {
    print "variable diffs vs. '$f'";
}

if ($opt_relative && defined $data{$f}->{$opt_relative}) {
    print " relative to '$opt_relative'\n";
    do_relative();
} else {
    print "\n";
}

if ($opt_tsv) {
    dump_data_tsv();
} else {
    calculate_lengths();
    dump_data();
}

exit 0;


sub process_file
{
    my $file  = shift;
    my %vars  = ();
    my $count = 0;
    $datlen{$file} = length $file;

    open F, "<$file" or die "could not read $file : $!\n";

    while (<F>) {
        if (/^\| (.*?)\s*\|\s*(.*?)\s*\|$/) {
            $vars{$1}= $2;
            $count++;
        }
        elsif (/^(.*?)\t(.*)/) {
            $vars{$1}= $2;
            $count++;
        }
    }
    $data{$file}= \%vars;
    close F;
    print STDERR "read ", $count, " lines from ", $file, "\n";
}


sub filter_data
{
    my %vars = ();
    map { map { $vars{$_} = 1 unless defined $vars{$_} } keys %{$data{$_}} } @files;

    foreach my $k (sort keys %vars) {
        unless ($k =~ /$opt_vars/o) {
            map { delete $data{$_}->{$k} } @files;
        }
        elsif ($opt_unset && all_unset_or_zero($k)) {
            map { delete $data{$_}->{$k} } @files;
        }
        elsif ($opt_same && all_same($k)) {
            map { delete $data{$_}->{$k} } @files;
        }
    }
}


sub do_diffs
{
    my $f = shift @files;
    my $b = $data{$f};

    for my $ff (@files) {
        my %d = ();
        for my $v (sort keys %{$data{$ff}}) {
            $d{$v} = $data{$ff}->{$v} - $b->{$v};
        }
        $diff{$ff} = \%d;
        if ($opt_progressive) {
            $b = $data{$ff};
        }
    }

    unshift @files, $f;
}


sub do_relative
{
    for my $f (@files) {
        my $r = $diff{$f}->{$opt_relative};
        for my $v (sort keys %{$data{$f}}) {
            if ($v eq $opt_relative) {
                $diff{$f}->{$v} = "(" . $diff{$f}->{$v} . ")";
            } else {
                $diff{$f}->{$v} = pp($diff{$f}->{$v} / $r); #/
            }
        }
    }
}


sub calculate_lengths
{
    my %vars = ();
    map { map { $vars{$_} = 1 unless defined $vars{$_} } keys %{$data{$_}} } @files;

    foreach my $k (sort keys %vars) {
        $varlen= length($k) if $varlen < length($k);
        map {
            $datlen{$_}= length($diff{$_}->{$k}) if $datlen{$_} < length($diff{$_}->{$k})
        } @files;
    }
}


sub dump_data
{
    my $count= 0;
    my %vars = ();
    map { map { $vars{$_} = 1 unless defined $vars{$_} } keys %{$diff{$_}} } @files;

    print "+-", "-" x $varlen;
    map { print "-+-", "-" x $datlen{$_} } @files;
    print "-+\n";

    print "| ", $heading, " " x ($varlen - length $heading);
    map { print " | ", $_, " " x ($datlen{$_} - length $_) } @files;
    print " |\n";

    print "+-", "-" x $varlen;
    map { print "-+-", "-" x $datlen{$_} } @files;
    print "-+\n";

    foreach my $k (sort keys %vars) {
        print "| ", $k, " " x ($varlen - length $k);
        map {
            print " | ", $diff{$_}->{$k}, " " x ($datlen{$_} - length $diff{$_}->{$k})
        } @files;
        print " |\n";
        $count++;
    }

    print "+-", "-" x $varlen;
    map { print "-+-", "-" x $datlen{$_} } @files;
    print "-+\n";
    print $count, " lines\n";
}


sub dump_data_tsv
{
    my %vars = ();
    map { map { $vars{$_} = 1 unless defined $vars{$_} } keys %{$diff{$_}} } @files;

    print $heading;
    map { print "\t", $_ } @files;
    print "\n";

    foreach my $k (sort keys %vars) {
        print "$k";
        map { print "\t", $diff{$_}->{$k} } @files;
        print "\n";
    }
}


sub all_unset_or_zero
{
    my $key = shift;
    my $same = 1;
    my $val;

    map {
        if (defined $data{$_}->{$key}) {
            if ($data{$_}->{$key} eq '' || $data{$_}->{$key} eq '0') {
                if (not defined $val) {
                    $val = $data{$_}->{$key};
                }
                else {
                    if ($val ne $data{$_}->{$key}) {
                        $same = 0;
                    }
                }
            }
            else {
                $same = 0;
            }
        }
    } @files;

    return $same;
}


sub all_same
{
    my $key = shift;
    my $same = 1;
    my $val;

    map {
        if (defined $data{$_}->{$key}) {
            if (not defined $val) {
                $val = $data{$_}->{$key};
            }
            else {
                if ($val ne $data{$_}->{$key}) {
                    $same = 0;
                }
            }
        }
        else {
            $same = 0;
        }
    } @files;

    return $same;
}


sub pp
{
    my $x = shift;
    my $res = "";
    my $sgn = "";

    if ($x < 0) {
        $sgn = "-";
        $x = -$x
    }

    if ($x == int($x)) {
        $res = sprintf "%d", $x;
    }
    elsif ($x < 10.0) {
        $res = sprintf "%.4f", $x;
    }
    elsif ($x < 100.0) {
        $res = sprintf "%.3f", $x;
    }
    elsif ($x < 1000.0) {
        $res = sprintf "%.2f", $x;
    }
    elsif ($x < 10000.0) {
        $res = sprintf "%.1f", $x;
    }
    else {
        $res = sprintf "%d", $x;
    }

    return $sgn . $res;
}

