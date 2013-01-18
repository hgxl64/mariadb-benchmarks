#!/usr/bin/perl -w
#
# read some tabular results and merge them for easier comparison
# (w) Axel XL Schwenke for MariaDB.org
#
# $Id$

my %data = ();
my $heading = "variable name";
my $varlen = length $heading;
my %datlen = ();

while (my $f= shift) {
    process_file($f);
}

dump_data();

exit 0;


sub process_file
{
    my $f= shift;
    my %vars = ();
    my $c= 0;
    $datlen{$f} = length $f;

    open F, "<$f" or die "could not read $f : $!\n";

    while (<F>) {
        if (/^\| (.*?)\s*\|\s*(.*?)\s*\|$/) {
            $vars{$1}= $2;
            $varlen= length($1) if $varlen < length($1);
            $datlen{$f}= length($2) if $datlen{$f} < length($2);
            $c++;
        }
    }
    $data{$f}= \%vars;
    close F;
    print STDERR "read ", $c, " lines from ", $f, "\n";
}

sub dump_data
{
    my @files = sort keys %datlen;
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
    }

    print "+-", "-" x $varlen;
    map { print "-+-", "-" x $datlen{$_} } @files;
    print "-+\n";

}
