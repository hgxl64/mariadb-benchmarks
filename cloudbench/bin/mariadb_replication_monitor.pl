#!/usr/bin/perl -w
#
# monitor MariaDB GTID replication
#
# (c) Axel XL Schwenke, axel@mariadb.com

use strict;
use DBI;
use Getopt::Long;
use Time::HiRes;


#defaults
my $DBHOST= "localhost";
my $DBUSER= "";
my $DBPASS= "";
my $DBPORT= 3306;
my @SLAVES= ();
my $INTVL= 10;
my $HELP= 0;
my $DEBUG= 0;
#end defaults

my $HELPMESSAGE = <<EOT;
$0 - monitor MariaDB GTID replication

usage:    $0 [options]
options: --host <host> ....... connect to master at <host>, default: $DBHOST
         --port <port> ....... connect to master at <port>, default: $DBPORT
         --user <user> ....... connect as <user>, default: current user
         --password <pass> ... identify with <pass>, default: (no password)
         --slave <host> ...... connect to slave at <host> (can be repeated)
         --interval <i> ...... time between measurements, default: $INTVL
         --help .............. show this help
EOT

die $HELPMESSAGE
    unless Getopt::Long::GetOptions(
                                    "host=s"     => \$DBHOST,
                                    "port=i"     => \$DBPORT,
                                    "user=s"     => \$DBUSER,
                                    "password=s" => \$DBPASS,
                                    "slave=s"    => \@SLAVES,
                                    "interval=i" => \$INTVL,
                                    "debug!"     => \$DEBUG,
                                    "help|?!"    => \$HELP
                                   )
    and not $HELP;

#global variables
my @db_handles= ();
my @stmt_handles= ();
my $i= $INTVL;

#catch signals
$SIG{INT}= \&cleanup;
$SIG{TERM}= \&cleanup;

print STDERR "GTID replication monitor starting ...\n";

#connect master
my $dbh = DBI->connect("DBI:MariaDB:host=$DBHOST;port=$DBPORT", $DBUSER, $DBPASS) or die;
printf STDERR "connected to master: host=%s, port=%d, user=%s, password=%s\n",
    $DBHOST, $DBPORT, ($DBUSER or "(default)"), ($DBPASS or "(none)");
show_db_version($dbh);
push @db_handles, $dbh;

#connect slaves
foreach my $s (@SLAVES)
{
    my $dbh = DBI->connect("DBI:MariaDB:host=$s;port=$DBPORT", $DBUSER, $DBPASS) or die;
    printf STDERR "connected to slave: host=%s, port=%d, user=%s, password=%s\n",
        $s, $DBPORT, ($DBUSER or "(default)"), ($DBPASS or "(none)");
    show_db_version($dbh);
    push @db_handles, $dbh;
}

#if we reached this, all databases are connected
#prepare statement
foreach my $dbh (@db_handles)
{
    my $sth= $dbh->prepare($DEBUG ? 'SELECT now(3)+0' : 'SELECT @@gtid_current_pos');
    push @stmt_handles, $sth;
}

#print header line
print "interval", "\t", "gtid_master";
for my $i (1 .. scalar @SLAVES)
{
    print "\t", "gtid_slave_$i";
}
print "\n";

#turn on autoflush on stdout
$|= 1;

#the monitor runs in an endless loop

while (1)
{
    my $last_run= Time::HiRes::time();

    my $line="$i";
    foreach my $sth (@stmt_handles)
    {
        $line= $line . "\t" . fetch_gtid_pos($sth);
    }
    print $line . "\n";

    $i= $INTVL;
    my $sleeptime= $INTVL + time() - $last_run;
    while ($sleeptime < 0)
    {
        $sleeptime += $INTVL;
        $i += $INTVL;
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

sub fetch_gtid_pos
{
    my $sth= shift;
    if ($sth->execute())
    {
        if (my ($gtid)= $sth->fetchrow_array)
        {
            if ($DEBUG)
            {
                return $gtid;
            } else {
                my (undef, undef, $pos)= split "-", $gtid;
                return ($pos or "NaN");
            }
        }
        return "NaN";
    }
    return $sth->errstr;
}

sub cleanup
{
    print STDERR "\nclosing " . scalar @stmt_handles . " statement handles\n";
    foreach my $sth (@stmt_handles)
    {
        $sth->finish();
    }

    print STDERR "closing " . scalar @db_handles . " database connections\n";
    foreach my $dbh (@db_handles)
    {
        $dbh->disconnect();
    }

    die "GTID replication monitor completed\n"
}

