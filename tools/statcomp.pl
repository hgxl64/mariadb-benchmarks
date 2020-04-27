#!/usr/bin/perl -w
#
# read some tabular results and merge them for easier comparison
# (w) Axel XL Schwenke for MariaDB.org
#
# $Id$

use Getopt::Long;

#defaults
my $opt_unset = 0;
my $opt_same = 0;
my $opt_tsv = 0;
my $opt_help = 0;
my $opt_vars = "";
#end defaults

my $usage = <<EOT;
$0 [options] file1 file2 ...
read and compare tabular SHOW STATUS or SHOW VARIABLES from file1..n
options:
--zero|unset ... skip variables that are 0 or unset in all files
--same ......... skip variables that are same in all files
--tsv .......... write tab-separated output (default: tabular)
--var=regex .... consider only variables matching regex
--help, -? ..... show this text

EOT

die $usage unless GetOptions("zero|unset!" => \$opt_unset,
                             "same!" =>  \$opt_same,
                             "tsv!" => \$opt_tsv,
                             "var=s" => \$opt_vars,
                             "help|?" => \$opt_help)
    and not $opt_help;

my %data = ();
my $heading = "variable";
my $varlen = length $heading;
my %datlen = ();

while (my $f= shift) {
    process_file($f);
}

filter_data();

if ($opt_tsv) {
    dump_data_tsv();
} else {
    calculate_lengths();
    dump_data();
}

exit 0;


sub process_file
{
    my $file= shift;
    my %vars = ();
    my $count= 0;
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
    my @files = sort keys %datlen;
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


sub calculate_lengths
{
    my @files = sort keys %datlen;
    my %vars = ();
    map { map { $vars{$_} = 1 unless defined $vars{$_} } keys %{$data{$_}} } @files;

    foreach my $k (sort keys %vars) {
        $varlen= length($k) if $varlen < length($k);
        map {
            $datlen{$_}= length($data{$_}->{$k}) if $datlen{$_} < length($data{$_}->{$k})
        } @files;
    }
}


sub dump_data
{
    my @files = sort keys %datlen;
    my $count= 0;
    my %vars = ();
    map { map { $vars{$_} = 1 unless defined $vars{$_} } keys %{$data{$_}} } @files;

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
            defined $data{$_}->{$k}
            ? print " | ", $data{$_}->{$k}, " " x ($datlen{$_} - length $data{$_}->{$k})
            : print " | ", " " x $datlen{$_}
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
    my @files = sort keys %datlen;
    my %vars = ();
    map { map { $vars{$_} = 1 unless defined $vars{$_} } keys %{$data{$_}} } @files;

    print $heading;
    map { print "\t", $_ } @files;
    print "\n";

    foreach my $k (sort keys %vars) {
        if ($opt_unset && all_unset_or_zero($k)) {
            next;
        }
        if ($opt_same && all_same($k)) {
            next;
        }
        print "$k";
        map { defined $data{$_}->{$k} ? print "\t", $data{$_}->{$k} : print "\t---" } @files;
        print "\n";
    }
}


sub all_unset_or_zero
{
    my $key = shift;
    my $same = 1;
    my @files = sort keys %datlen;
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
    my @files = sort keys %datlen;
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

