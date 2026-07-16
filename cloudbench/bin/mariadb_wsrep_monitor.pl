#!/usr/bin/perl -w
#
# monitor wsrep_% status variables
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
$0 - monitor wsrep_% status variables

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

print STDERR "wsrep monitor starting ...\n";

#connect host
my $dbh = DBI->connect("DBI:MariaDB:host=$DBHOST;port=$DBPORT", $DBUSER, $DBPASS) or die;
printf STDERR "connected to MariaDB: host=%s, port=%d, user=%s, password=%s\n",
    $DBHOST, $DBPORT, ($DBUSER or "(default)"), ($DBPASS or "(none)");
show_db_version($dbh);

#turn on autoflush on stdout
$|= 1;

#the monitor runs in an endless loop
while (1)
{
    my $last_run= Time::HiRes::time();

    print "\nInterval: ", $n, " (time = ", $last_run, ")\n\n";

    my $sth= $dbh->prepare("SHOW GLOBAL STATUS LIKE 'wsrep_%'");

    if ($sth->execute())
    {
        my $t= Text::TabularDisplay->new;
        $t->columns(@{$sth->{'NAME'}});
        $t->populate($sth->fetchall_arrayref);
        print $t->render, "\n\n";
        $sth->finish();
    }

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

sub cleanup
{
    print STDERR "\nclosing database connection\n";
    $dbh->disconnect();
    die "wsrep monitor completed\n"
}

