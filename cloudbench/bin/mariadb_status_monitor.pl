#!/usr/bin/perl -w
#
# monitor MariaDB status variables
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
my $VERBOSE= 0;
#end defaults

my $HELPMESSAGE = <<EOT;
$0 - monitor MariaDB status variables

usage:    $0 [options]
options: --host <host> ....... connect to master at <host>, default: $DBHOST
         --port <port> ....... connect to master at <port>, default: $DBPORT
         --user <user> ....... connect as <user>, default: current user
         --password <pass> ... identify with <pass>, default: (no password)
         --interval <i> ...... time between measurements, default: $INTVL
         --verbose ........... increase verbosity, default: quiet
         --help .............. show this help
EOT

die $HELPMESSAGE
    unless Getopt::Long::GetOptions(
                                    "host=s"     => \$DBHOST,
                                    "port=i"     => \$DBPORT,
                                    "user=s"     => \$DBUSER,
                                    "password=s" => \$DBPASS,
                                    "interval=i" => \$INTVL,
                                    "verbose+"   => \$VERBOSE,
                                    "help|?!"    => \$HELP
                                   )
    and not $HELP;

#global variables
my $n= 0;
my $have_raft= 0;

#catch signals
$SIG{INT}= \&cleanup;
$SIG{TERM}= \&cleanup;

print STDERR "MariaDB status monitor starting ...\n";

#connect host
my $dbh = DBI->connect("DBI:MariaDB:host=$DBHOST;port=$DBPORT", $DBUSER, $DBPASS) or die;
printf STDERR "connected to MariaDB: host=%s, port=%d, user=%s, password=%s\n",
    $DBHOST, $DBPORT, ($DBUSER or $ENV{'USER'}), ($DBPASS or "(none)") if ($VERBOSE);

show_db_version($dbh);
$have_raft= check_for_raft($dbh);

#turn on autoflush on stdout
$|= 1;

#the monitor runs in an endless loop
while (1)
{
    my $last_run= Time::HiRes::time();

    print "\nInterval: ", $n, " (time = ", $last_run, ")\n\n";

    show_global_status($dbh);

    if ($have_raft)
    {
        dump_I_S_table($dbh, "RAFT_RPC_SENT");
        dump_I_S_table($dbh, "RAFT_TIMERS");
        dump_I_S_table($dbh, "RAFT_LATENCY_STATS");
        dump_I_S_table($dbh, "RAFT_FOLLOWER_INFO");
    }

    $n++;

    my $sleeptime= $INTVL + time() - $last_run;
    while ($sleeptime < 0)
    {
        $sleeptime += $INTVL;
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
        print STDERR "database version: ", $v, "\n";
        $sth->finish();
    }
}


sub check_for_raft
{
    my $dbh= shift;
    my $sth= $dbh->prepare('SHOW TABLES FROM INFORMATION_SCHEMA LIKE "RAFT_%"');
    if ($sth->execute)
    {
        my $rows= $sth->rows;
        $sth->finish();
        if ($rows)
        {
            print STDERR "enabling RAFT I_S dumps\n";
            return 1;
        }
    }
    return 0;
}


sub show_global_status
{
    my $dbh= shift;

    print "===== SHOW GLOBAL STATUS =====\n";
    my $sth= $dbh->prepare("SHOW GLOBAL STATUS");

    if ($sth->execute())
    {
        my $t= Text::TabularDisplay->new;
        $t->columns(@{$sth->{'NAME'}});
        $t->populate($sth->fetchall_arrayref);
        print $t->render, "\n\n";
        $sth->finish();
    }
}


sub dump_I_S_table
{
    my $dbh= shift;
    my $table= shift;

    print "===== table: INFORMATION_SCHEMA.$table =====\n";
    my $sth= $dbh->prepare("SELECT * FROM INFORMATION_SCHEMA.$table");

    if ($sth->execute())
    {
        my $t= Text::TabularDisplay->new;
        $t->columns(@{$sth->{'NAME'}});
        $t->populate($sth->fetchall_arrayref);
        print $t->render, "\n\n";
        $sth->finish();
    }
}


sub cleanup
{
    print STDERR "\nclosing database connection\n";
    $dbh->disconnect();
    die "MariaDB status monitor completed\n"
}

