#!/usr/bin/perl -w
#
# (w) Axel XL Schwenke for MariaDB Services AB
#
# $Id$

use strict;
use DBI;
use Benchmark qw(:all :hireswallclock);

#config
my $MYSQLDSN  = "DBI:mysql:database=test;host=localhost:mysql_server_prepare=1";
#my $MYSQLDSN  = "DBI:mysql:database=test;host=localhost";
my $SQLITEDSN = "DBI:SQLite:dbname=test.db";

my @rows = (10, 100, 1000, 10000, 100000); #how many rows to insert and select from
my @threads = (1, 2, 5, 10);               #how many threads to use for select
my $iter = 10000;                          #number of SELECT iterations
my $result_format = "%.4f";                #printf() time format for tabular result
#end config


my $USAGE = "usage: $0 mysql|sqlite\n";

my $target = shift or die $USAGE;
my $dsn = "";

if ($target =~ /mysql/i) {
    $dsn = $MYSQLDSN;
}
elsif ($target =~ /sqlite/i) {
    $dsn = $SQLITEDSN;
}
else {
    die "unknown database '$target'\n";
}

my %result=();

prepare_table($dsn);

for my $r (@rows) {
    $result{$r}->{"ins"} = benchmark_insert($dsn, $r);
    sleep 1;
    for my $t (@threads) {
        $result{$r}->{"sel"}->{$t} = benchmark_select($dsn, $r, $iter, $t);
    }
    empty_table($dsn);
    sleep 1;
}

cleanup($dsn);

print_tabular_result();

exit 0;


sub prepare_table
{
    my $dsn = shift;
    my $dbh = DBI->connect($dsn, "", "") or die "connect to '$dsn' failed\n";
    $dbh->do("DROP TABLE IF EXISTS t1");
    $dbh->do("CREATE TABLE t1 (c1 INT UNSIGNED, c2 CHAR(10), PRIMARY KEY (c1))");
    $dbh->disconnect();
}

sub empty_table
{
    my $dsn = shift;
    my $dbh = DBI->connect($dsn, "", "") or die "connect to '$dsn' failed\n";
    $dbh->do("DELETE FROM t1");
    $dbh->disconnect();
}

sub cleanup
{
    my $dsn = shift;
    my $dbh = DBI->connect($dsn, "", "") or die "connect to '$dsn' failed\n";
    $dbh->do("DROP TABLE t1");
    $dbh->disconnect();
}

sub benchmark_insert
{
    my $dsn = shift;
    my $n = shift;
    my $dbh = DBI->connect($dsn, "", "") or die "connect to '$dsn' failed\n";

    my $t0 = new Benchmark;
    $dbh->begin_work();
    my $sth = $dbh->prepare("INSERT INTO t1 (c1, c2) VALUES (?, ?)");
    for (my $i=0; $i<$n; $i++) {
        $sth->execute($i, "foobar");
    }
    $sth->finish();
    $dbh->commit();
    my $t1 = new Benchmark;
    my $ts = timestr(timediff($t1, $t0));
    printf "%d x INSERT needed\n%s\n", $n, $ts;
    $ts =~ /(.*) wallclock/;
    return $1;
}

sub benchmark_select
{
    my $dsn = shift;
    my $n = shift;   #table size
    my $m = shift;   #number selects
    my $t = shift;   #number threads

    my %childs = ();

    my $t0 = new Benchmark;
    for (my $c=0; $c<$t; $c++) {
        my $pid = fork;
        if ($pid == 0) {
            my $dbh = DBI->connect($dsn, "", "") or die "connect to '$dsn' failed\n";
            $dbh->begin_work();
            my $sth = $dbh->prepare("SELECT c2 FROM t1 WHERE c1=?");
            for (my $i=0; $i<$m; $i++) {
                $sth->execute(int rand $n);
                while (my @row = $sth->fetchrow_array()) {
                    die unless $row[0] eq "foobar";
                }
            }
            $sth->finish();
            $dbh->commit();
            $dbh->disconnect();
            exit 0;
        } else {
            $childs{$pid} = 1;
        }
    }
    while (%childs) {
        my $pid = wait;
        last if $pid < 0;
        delete $childs{$pid};
    }
    my $t1 = new Benchmark;
    my $ts = timestr(timediff($t1, $t0));
    printf "%d x SELECT (out of %d) x %d clients needed\n%s\n", $m, $n, $t, $ts;
    $ts =~ /(.*) wallclock/;
    return $1;
}


sub print_tabular_result
{
    print "\n", "-" x 40, "\n\tinsert", "\tselect" x scalar @threads, "\n";
    print "rows\t1", map { "\t".$_ } @threads, "\n";
    for my $r (@rows) {
        printf "%d\t".$result_format, $r, $result{$r}->{"ins"};
        map { printf "\t".$result_format, $result{$r}->{"sel"}->{$_}; } @threads;
        print "\n";
    }
    print "-" x 40, "\n";
}

