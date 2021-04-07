package sysbench;

use Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(pp get_run_info get_thread_info my_version by_mtime);


#
# pretty-print a number
#
sub pp
{
    my $x = shift;
    my $res = "";

    if ($x < 0) {
        $res = "---";
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

    return $res;
}


#
# sort versions strings
#
sub by_version
{
    #split to prefix and 3 numbers, separated by dots
    my @aa= $a =~ /^(.*?)(\d+)\.(\d+)\.(\d+)/;
    my @bb= $b =~ /^(.*?)(\d+)\.(\d+)\.(\d+)/;
    #sort prefix lexicographically
    return $aa[0] cmp $bb[0] if ($aa[0] ne $bb[0]);
    #sort version numbers numerically
    return $aa[1] <=> $bb[1] if ($aa[1] ne $bb[1]);
    return $aa[2] <=> $bb[2] if ($aa[2] ne $bb[2]);
    return $aa[3] <=> $bb[3] if ($aa[3] ne $bb[3]);
    return $a cmp $b;
}


#
# sort by mtime
#
sub by_mtime
{
    return (stat($a))[9] cmp (stat($b))[9];
}


#
# find out for which servers the benchmark was run
#
sub get_run_info
{
    opendir D, "." or die "cannot opendir '.' : $!\n";
    my @resdir= grep { /^m/ && -d $_ } readdir D;
    closedir D;

    return @resdir;
}

 
#
# find out for which thread counts the benchmark was run
#
sub get_thread_info
{
    opendir D, "." or die "cannot opendir '.' : $!\n";
    my @resdir= grep { /^m/ && -d $_ } readdir D;
    closedir D;

    my %t;
    for my $d (@resdir) {
        opendir D, $d or die "cannot opendir '$d' : $!\n";
        map { /\.(\d+)\.res$/ and $t{$1}= 1 } readdir D;
        closedir D;
    }
    return sort {$a <=> $b} keys %t;
}

