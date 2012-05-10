#!/usr/bin/perl -w
#
# translate persistent table statistics MariaDB <-> MySQL
#
# (w) Axel XL Schwenke for MariaDB Services AB
#
# usage: get tabular table/index stats from either
#        MySQL:   SELECT * FROM mysql.innodb_table_stats etc.
#        MariaDB: SELECT * FROM mysql.table_stat etc.
#
# then feed it this script and you will get a number
# of UPDATE statements to be fed in the other DBMS


use strict;

my %stats = ();
my $direction = 0;  #1: Maria->MySQL, 2: MySQL->Maria, 0: undecided
my $stat_type = ""; #"t": tables, "i": indexes, "": unknown

while (<>) {
    my $line = $_;

    if ($direction == 0) {
        guess_direction($line);
    }

    if ($direction != 0) {
        guess_stat_type($line);
    }

    if ($direction != 0 && $stat_type ne "") {
        process_line($line);
    }
}

dump_stats();

exit 0;



sub guess_direction
{
    my $line = shift;

    if ($line =~ /^\| db_name/) {
        $direction = 1;
    }
    elsif ($line =~ /^\| database_name/) {
        $direction = 2;
    }
}


sub guess_stat_type
{
    my $line = shift;

    if ($line =~ /^\| db_name.*\| cardinality/) {
        $stat_type = "t";
    }
    elsif ($line =~ /^\| db_name.*\| index_name/) {
        $stat_type = "i";
    }
    elsif ($line =~ /^\| database_name.*\| n_rows/) {
        $stat_type = "t";
    }
    elsif ($line =~ /^\| database_name.*\| index_name/) {
        $stat_type = "i";
    }
}


sub process_line
{
    if ($direction == 1) {
        if ($stat_type eq "t") {
            process_table_maria(@_);
        }
        elsif ($stat_type eq "i") {
            process_index_maria(@_);
        }
        else { die "impossible!"; }
    }
    elsif ($direction == 2) {
        if ($stat_type eq "t") {
            process_table_mysql(@_);
        }
        elsif ($stat_type eq "i") {
            process_index_mysql(@_);
        }
        else { die "impossible!"; }
    }
    else { die "impossible!"; }
}


sub process_table_maria
{
    my $line = shift;

    if ($line =~ /^\| (\S+)\s*\| (\S+)\s*\|\s*(\d+) \|$/o) {
        #$stats{$db}{$table}{"rownum"} = ...
        $stats{$1}{$2}{"rownum"} = $3;
    }
}

sub process_index_maria
{
    my $line = shift;

    if ($line =~ /^\| (\S+)\s*\| (\S+)\s*\| (\S+)\s*\|\s*(\d+) \|\s*([0-9.]+) \|$/o) {
        #$stats{$db}{$table}{"index"}{$index}{$prefix} = ...
        $stats{$1}{$2}{"index"}{$3}{$4} = $5;
    }
}

sub process_table_mysql
{
    my $line = shift;

    if ($line =~ /^\| (\S+)\s*\| (\S+)\s*\|[^|]*\|\s*(\d+)/o) {
        #$stats{$db}{$table}{"rownum"} = ...
        $stats{$1}{$2}{"rownum"} = $3;
    }
}

sub process_index_mysql
{
    my $line = shift;
    if ($line =~ /^\| (\S+)\s*\| (\S+)\s*\| (\S+)\s*\|[^|]*\| n_diff_pfx(\d+)\s*\|\s*(\d+)/o) {
        #$stats{$db}{$table}{"index"}{$index}{$prefix} = ...
        $stats{$1}{$2}{"index"}{$3}{int($4)} = $5;
    }
}

sub dump_stats
{
    if ($direction == 1) {
        dump_stats_for_mysql(@_);
    }
    elsif ($direction == 2) {
        dump_stats_for_maria(@_);
    }
}

sub dump_stats_for_maria
{
    #remove stats for implicit secondary key columns
    #example: create table ... primary key (col1, col2), index s1 (col3)
    #here InnoDB will create s1 as (col3, col1, col2) and collect stats
    #for (col3), (col3, col1) and (col3, col1, col2)
    #but MariaDB has only stats for (col3)
    for my $db (sort keys %stats) {
        for my $table (sort keys %{$stats{$db}}) {
            my $pklen = max(keys %{$stats{$db}{$table}{"index"}{"PRIMARY"}});
            #print STDERR "$db.$table PRIMARY len=$pklen\n";
            for my $idx (sort keys %{$stats{$db}{$table}{"index"}}) {
                next if $idx eq "PRIMARY";
                my $keylen = max(keys %{$stats{$db}{$table}{"index"}{$idx}}) - $pklen;
                #the following is a hack
                #sometimes InnoDB does not have stats for longer prefixes
                $keylen = 1 if ($keylen <= 0);
                my @extra = grep {$_ > $keylen} keys %{$stats{$db}{$table}{"index"}{$idx}};
                #print STDERR "$db.$table $idx len=$keylen, extra (", join(",", @extra), ")\n";
                for my $i (@extra) {
                    delete $stats{$db}{$table}{"index"}{$idx}{$i};
                }
            }
        }
    }

    #dump remaining stats in MariaDB format
    for my $db (sort keys %stats) {
        for my $table (sort keys %{$stats{$db}}) {
            printf "UPDATE mysql.table_stat SET cardinality=%d
                WHERE db_name='%s' AND table_name='%s';\n",
                $stats{$db}{$table}{"rownum"}, $db, $table;
            for my $idx (sort keys %{$stats{$db}{$table}{"index"}}) {
                for my $pfx (sort {$a<=>$b} keys %{$stats{$db}{$table}{"index"}{$idx}}) {
                    printf "UPDATE mysql.innodb_index_stats SET avg_frequency=%f
                        WHERE db_name='%s' AND table_name='%s'
                        AND index_name='%s' AND prefix_arity=%d;\n",
                        int($stats{$db}{$table}{"rownum"} / $stats{$db}{$table}{"index"}{$idx}{$pfx}),
                        $db, $table, $idx, $pfx;
                }
            }
        }
    }
}

sub dump_stats_for_mysql
{
    for my $db (sort keys %stats) {
        for my $table (sort keys %{$stats{$db}}) {
            printf "UPDATE mysql.innodb_table_stats SET n_rows=%d, last_update=NOW()
                WHERE database_name='%s' AND table_name='%s';\n",
                $stats{$db}{$table}{"rownum"}, $db, $table;
            for my $idx (sort keys %{$stats{$db}{$table}{"index"}}) {
                for my $pfx (sort {$a<=>$b} keys %{$stats{$db}{$table}{"index"}{$idx}}) {
                    my $records = $stats{$db}{$table}{"rownum"};
                    my $rec_per_key = $stats{$db}{$table}{"index"}{$idx}{$pfx};
                    my $n_diff = int($records / $rec_per_key / ($rec_per_key < 2 ? 1 : 2));
                    printf "UPDATE mysql.innodb_index_stats SET stat_value=%d, last_update=NOW()
                        WHERE database_name='%s' AND table_name='%s'
                        AND index_name='%s' AND stat_name='n_diff_pfx%02d';\n",
                        $n_diff, $db, $table, $idx, $pfx;
                }
            }
        }
    }
}


#return maximum of a set of strictly positive numbers
sub max
{
    my $max = 0;
    my $other;
    while (defined($other = shift @_)) {
        if ($other > $max) {
            $max = $other;
        }
    }
    return $max;
}

