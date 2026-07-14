#!/usr/bin/perl -w
#
# monitor MariaDB Raft INFORMATION_SCHEMA tables
#
# (w) Axel XL Schwenke for MariaDB
#
# $Id$

use strict;
use DBI;
use Getopt::Long;
use Time::HiRes;
use Text::TabularDisplay;


#defaults
my $DBHOST= "localhost";
my $DBUSER= "";
my $DBPASS= "";
my $DBPORT= 3306;
my $INTVL= 10;
my $HELP= 0;
#end defaults

my $HELPMESSAGE = <<EOT;
$0 - monitor MariaDB Raft INFORMATION_SCHEMA tables

usage:    $0 [options]
options: --host <host> ....... connect to master at <host>, default: $DBHOST
         --port <port> ....... connect to master at <port>, default: $DBPORT
         --user <user> ....... connect as <user>, default: current user
         --password <pass> ... identify with <pass>, default: (no password)
         --interval <i> ...... time between measurements, default: $INTVL
         --help .............. show this help
EOT

die $HELPMESSAGE
    unless Getopt::Long::GetOptions(
                                    "host=s"     => \$DBHOST,
                                    "port=i"     => \$DBPORT,
                                    "user=s"     => \$DBUSER,
                                    "password=s" => \$DBPASS,
                                    "interval=i" => \$INTVL,
                                    "help|?!"    => \$HELP
                                   )
    and not $HELP;

#global variables
my $i= $INTVL;
my $n= 0;

#catch signals
$SIG{INT}= \&cleanup;
$SIG{TERM}= \&cleanup;

print STDERR "Raft monitor starting ...\n";

#connect host
my $dbh = DBI->connect("DBI:MariaDB:host=$DBHOST;port=$DBPORT", $DBUSER, $DBPASS) or die;
printf STDERR "connected to MariaDB: host=%s, port=%d, user=%s, password=%s\n",
    $DBHOST, $DBPORT, ($DBUSER or "(default)"), ($DBPASS or "(none)");
show_db_version($dbh);
check_if_raft($dbh);

#turn on autoflush on stdout
$|= 1;

#the monitor runs in an endless loop
while (1)
{
    my $last_run= Time::HiRes::time();

    print "\nInterval: ", $n, "\n\n";
    dump_table($dbh, "RAFT_RPC_SENT");
    dump_table($dbh, "RAFT_TIMERS");
    dump_table($dbh, "RAFT_LATENCY_STATS");
    dump_table($dbh, "RAFT_FOLLOWER_INFO");

    $i= $INTVL;
    $n++;

    my $sleeptime= $INTVL + time() - $last_run;
    while ($sleeptime < 0)
    {
        $sleeptime += $INTVL;
        $i += $INTVL;
        $n++;
    }

    Time::HiRes::sleep($sleeptime);
}

#not reached
exit 0;


#-------- subroutines --------

sub show_db_version
{
    my $dbh= shift;
    my $sth= $dbh->prepare('SELECT @@version');
    if ($sth->execute)
    {
        my ($v)= $sth->fetchrow_array;
        printf STDERR "database version: %s\n", $v;
        $sth->finish();
    }
}

sub check_if_raft
{
    my $dbh= shift;
    my $sth= $dbh->prepare('SHOW TABLES FROM INFORMATION_SCHEMA LIKE "RAFT_%"');
    if ($sth->execute)
    {
        my $rows= $sth->rows;
        $sth->finish();
        die "database is not running Raft!\n" unless ($rows);
    }
}

sub dump_table
{
    my $dbh= shift;
    my $table= shift;

    print "= $table =\n";
    my $sth= $dbh->prepare("SELECT * FROM INFORMATION_SCHEMA.$table");

    if ($sth->execute())
    {
        my $t= Text::TabularDisplay->new;
        $t->columns(@{$sth->{'NAME'}});
        $t->populate($sth->fetchall_arrayref);
        print $t->render, "\n";
        $sth->finish();
    }
}

sub cleanup
{
    print STDERR "\nclosing database connection\n";
    $dbh->disconnect();
    die "Raft monitor completed\n"
}

