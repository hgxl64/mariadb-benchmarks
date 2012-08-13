#!/usr/bin/perl -w
#
# run sqlbench against a MySQL/MariaDB server with
# different compiler/configure/server options
#
# (w) Axel XL Schwenke for MariaDB Services AB

use strict;
use Config::General;
use File::Path;
use Getopt::Long;
use Cwd 'abs_path';

# defaults
my $BUILDONLY = 0;
my $CONFIG    = "run-sqlbench.conf";
my $DEBUG     = 0;
my $HELP      = 0;
my $LIST      = 0;
my @RUN       = ();
my @SKIP      = ();
my $VERBOSE   = 0;
# end defaults

my $HELPMESSAGE = <<EOT;
usage: $0 [options] source-dir [[source-dir] ...]

options: --conf <file>  read config from <file>
         --buildonly .. just build the binaries
         --debug ...... show commands that would be run
         --list ....... list combinations
         --run ........ combination(s) to run, default: all
         --skip ....... which combination(s) not to run
         --verbose .... be more verbose
         --help, -? ... show this message
EOT

die $HELPMESSAGE
    unless Getopt::Long::GetOptions(
                                    "conf=s"     => \$CONFIG,
                                    "buildonly!" => \$BUILDONLY,
                                    "debug!"     => \$DEBUG,
                                    "verbose+"   => \$VERBOSE,
                                    "run=s"      => \@RUN,
                                    "skip=s"     => \@SKIP,
                                    "list!"      => \$LIST,
                                    "help|?"     => \$HELP
                                   )
    and not $HELP;

my %config = Config::General::ParseConfig($CONFIG) or die;

fatal("'sql-bench' is not set in $CONFIG. stop\n") unless exists $config{"sql-bench"};

my $sqlbench  = abs_path($config{"sql-bench"});
my $builddir  = abs_path($config{"builddir"}  || "builds");
my $resultdir = abs_path($config{"resultdir"} || "results");
my $socket    = abs_path($config{"socket"}    || "/tmp/mysql.sock.sqlbench");
my $pidfile   = abs_path($config{"pidfile"}   || "/tmp/mysqld.pid.sqlbench");
my $port = $config{"port"} || "6603";

#accept comma separated list for --run and --skip
@RUN  = split /,/, join(",", @RUN);
@SKIP = split /,/, join(",", @SKIP);

#default are all combinations from config
@RUN = sort keys %{$config{"combinations"}} unless @RUN;
my %skip = map { $_ => 1 } @SKIP;
@RUN = grep { not exists $skip{$_} } @RUN;

#check for invalid combos
@RUN = grep {unless ($config{"combinations"}{$_}){ warn "skipping unknown combination '$_'\n"; 0 }} @RUN;

if ($LIST) {
    print "predefined combinations:\n", join "\n", @RUN, "\n";
    exit 0;
}

my $def_env    = get_default_config("env");
my $def_conf   = get_default_config("configure");
my $def_mysqld = get_default_config("mysqld");
my $def_bench  = get_default_config("sqlbench");

$def_mysqld->{"--socket"} = $socket;
$def_mysqld->{"--port"} = $port;
$def_mysqld->{"--pid-file"} = $pidfile;
$def_bench->{"--socket"} = $socket;

my %FAILED = (); #indicator for failed builds

$| = 1; #no line buffering


#remaining arguments are source dirs

while (my $arg = shift @ARGV) {
    if (-d $arg) {
        process_srcdir($arg);
    } else {
        info("skipping '$arg' : not a directory\n");
    }
}

exit 0;



#
# functions for diagnostic messages
#

sub notice
{
    print "[", scalar localtime, "] Info: ", @_ if $VERBOSE;
}

sub info
{
    print "[", scalar localtime, "] Info: ", @_;
}

sub error
{
    print "[", scalar localtime, "] Error: ", @_;
}

sub fatal
{
    print "[", scalar localtime, "] Fatal: ", @_;
    exit 1;
}


#
# read a subgroup from <default>
# split keys and values at "="
# return ref to hash with keys/values
#
sub get_default_config
{
    my $type = shift;
    my %res = ();

    my $node = $config{"default"}{$type};

    if ($node) {
        $node = [ $node ] unless (ref $node eq "ARRAY");
        for my $x (@$node) {
            my ($key, $val) = split "=", $x, 2;
            $res{$key} = $val;
        }
    }

    return \%res;
}

#
# read a subgroup from <combinations><$combo>
# and merge with configs in %$args
# set $$build if there are parameters
#
sub merge_config
{
    my $combo = shift;
    my $build = shift;
    my $defaults = shift;
    my $type  = shift;

    my %args = %$defaults;

    my $node = $config{"combinations"}{$combo}{$type};

    if ($node) {
        $$build = $combo if defined $build;
        $node = [ $node ] unless (ref $node eq "ARRAY");
        for my $x (@$node) {
            if ($x =~ /\+=/) {
                my ($key, $val) = split "\\+=", $x, 2;
                $args{$key} .= $val;
            } else {
                my ($key, $val) = split "=", $x, 2;
                $args{$key} = $val;
            }
        }
    }

    return \%args;
}


#
# wrapper for system()
#
sub my_system
{
    $? = 0;
    if ($DEBUG) {
        print "DEBUG: system(", @_, ")\n";
    } else {
        system @_;
    }
}


#
# main workhorse
#
sub process_srcdir
{
    my $srcdir = shift;
    my $distname = $srcdir; $distname =~ s(.*/)();

    for my $combo (@RUN) {
        my $build  = "default";
        my $env    = merge_config($combo, \$build, $def_env,  "env");
        my $conf   = merge_config($combo, \$build, $def_conf, "configure");
        my $mysqld = merge_config($combo, undef, $def_mysqld, "mysqld");
        my $bench  = merge_config($combo, undef, $def_bench,  "sqlbench");

        my $basedir = "$builddir/$distname-$build";
        $conf->{"--prefix"} = $basedir;

        unless (-d $basedir || $DEBUG) {
            eval { mkpath($basedir) };
            if ($@) {
                error("could not create $basedir : $@\n");
                next;
            }
        }

        # workaround: do not set --basedir or else mysql_install_db
        # will not find mysqld on SuSE
        #$mysqld->{"--basedir"} = $basedir;

        if (exists $config{"datadir"}) {
            $mysqld->{"--datadir"} = $config{"datadir"} . "/$distname-$build";
        } else {
            $mysqld->{"--datadir"} = "$basedir/var";
        }

        unless (build_server($srcdir, $basedir, $build, $env, $conf, $mysqld)) {
            notice("skipping benchmark for '$srcdir' and '$combo'\n");
            next;
        }

        next if $BUILDONLY;

        my $pid = start_server($basedir, $mysqld);
        unless ($pid) {
            notice("skipping benchmark for '$srcdir' and '$combo'\n");
            next;
        }

        run_sqlbench($distname, $combo, $bench);
        stop_server($basedir, $pid);
    }
}


#
# build MySQL/MariaDB in $srcdir
#
sub build_server
{
    my ($srcdir, $basedir, undef, $env, undef, $mysqld) = @_;
    my $success = 1;

    if (exists $FAILED{$basedir}) {
        notice("build skipped (failed before)\n");
        return 0;
    }

    if (-d "$basedir/bin") {
        notice("build skipped (succeeded before)\n");
        $success = 1;

    } else {
        info("creating $basedir\n");

        #setup environment
        if ($DEBUG) {
            map { printf "DEBUG: ENV{%s} = %s\n", $_, $env->{$_}; } sort keys %$env;
        } else {
            map { $ENV{$_} = $env->{$_} } keys %$env;
        }

        if (-x "$srcdir/configure") {
            $success = build_with_configure(@_);
        }
        elsif (-f "$srcdir/CMakeLists.txt") {
            $success = build_with_cmake(@_);
        }
        else {
            error("dunno how to build tree in '$srcdir'\n");
            $success = 0;
        }
    }

    #create default schema(s)
    if ($success && not -d $mysqld->{"--datadir"}) {
        my $cmd = "cd $basedir && ./bin/mysql_install_db --no-defaults ";
        $cmd .= join " ", map {defined $mysqld->{$_} ? $_ . "=" . $mysqld->{$_} : $_} keys %$mysqld;
        $cmd .= " >run-sqlbench.log.mysql_install_db 2>&1";
        info("running 'mysql_install_db'\n");
        my_system($cmd);
        if ($?) {
            error("'mysql_install_db' failed\n");
            $success = 0;
        }
    }

    return $success;
}


#
# autotools build
#
sub build_with_configure
{
    my $srcdir  = shift;
    my $basedir = shift;
    my $build   = shift;
    my $env     = shift;
    my $conf    = shift;
    my $mysqld  = shift;

    #run configure
    my $cmd = "cd $srcdir && ./configure ";
    $cmd .= join " ", map {defined $conf->{$_} ? $_ . "=" . $conf->{$_} : $_} keys %$conf;
    $cmd .= " >run-sqlbench.log.configure-$build 2>&1";
    info("running 'configure'\n");
    my_system($cmd);
    if ($?) {
        error("'configure' failed\n");
        $FAILED{$basedir} = 1;
        return 0;
    }

    #build and install
    $cmd = "cd $srcdir && make ";
    if (exists $config{"makeflags"}) {
        $cmd .= $config{"makeflags"};
    }
    $cmd .= " >run-sqlbench.log.make-$build 2>&1";
    info("running 'make'\n");
    my_system($cmd);
    if ($?) {
        error("'make' failed\n");
        $FAILED{$basedir} = 1;
        return 0;
    }

    $cmd = "cd $srcdir && make install";
    $cmd .= " >>run-sqlbench.log.make-$build 2>&1";
    info("running 'make install'\n");
    my_system($cmd);
    if ($?) {
        error("'make install' failed\n");
        $FAILED{$basedir} = 1;
        return 0;
    }

    $cmd = "cd $srcdir && make clean";
    $cmd .= " >>run-sqlbench.log.make-$build 2>&1";
    info("running 'make clean'\n");
    my_system($cmd);

    return 1;
}


#
# translate configure options to cmake options
#
sub configure2cmake
{
    my $confargs  = shift;
    my $cmakeargs = shift;

    for my $key (keys %$confargs) {
        if ($key eq "--with-plugins") {
            my @val = split /,/, $confargs->{$key};
            push @$cmakeargs, map { s/-/_/g; "-DWITH_".uc($_)."=1" } @val;
        }
        elsif ($key eq "--with-extra-charsets") {
            push @$cmakeargs, "-DWITH_EXTRA_CHARSETS=" . $confargs->{$key};
        }
        elsif ($key eq "--with-ssl") {
            push @$cmakeargs, "-DWITH_SSL=bundled";
        }
        elsif ($key eq "--with-debug") {
            push @$cmakeargs, "-DCMAKE_BUILD_TYPE=Debug";
        }
        elsif ($key eq "--prefix") {
            push @$cmakeargs, "-DCMAKE_INSTALL_PREFIX=" . $confargs->{$key};
            push @$cmakeargs, "-DMYSQL_DATADIR=" . $confargs->{$key} . "/var";
        }
        elsif ($key eq "--with-mysqld-ldflags") {
            my $val = $confargs->{$key};
            if ($val eq "-static" || $val eq "-all-static") {
                push @$cmakeargs, "-DWITH_MYSQLD_LDFLAGS=-static";
            } else {
                info("dunno how to translate to cmake: ", $key, "=", $val, "\n");
            }
        }
        elsif ($key eq "--with-client-ldflags" ||
               $key eq "--enable-assembler" ||
               $key eq "--enable-thread-safe-client"
              ) {
            #ignore
        }
        else {
            $key =~ s/^--//;
            $key =~ s/-/_/g;
            push @$cmakeargs, "-D" . uc($key) ."=1";
        }
    }
}


#
# cmake build
#
sub build_with_cmake
{
    my $srcdir  = shift;
    my $basedir = shift;
    my $build   = shift;
    my $env     = shift;
    my $conf    = shift;
    my $mysqld  = shift;

    #build cmake argument list
    my @cmakeargs =
        ("-DINSTALL_LAYOUT=RPM", "-DINSTALL_SCRIPTDIR=bin",
         "-DINSTALL_MYSQLDATADIR=var", "-DINSTALL_SBINDIR=libexec",
         "-DINSTALL_SUPPORTFILESDIR=share", "-DINSTALL_SYSCONFDIR=etc",
         "-DINSTALL_UNIX_ADDRDIR=/tmp/mysql.sock" 
        );
    configure2cmake($conf, \@cmakeargs);

    #create builddir, run cmake
    my $cmd = "cd $srcdir; rm -rf build4sqlbench; ";
    $cmd .= "mkdir build4sqlbench && cd build4sqlbench && cmake .. ";
    $cmd .= join " ", @cmakeargs;
    $cmd .= " >run-sqlbench.log.cmake-$build 2>&1";
    info("running 'cmake'\n");
    my_system($cmd);
    if ($?) {
        error("'cmake' failed\n");
        $FAILED{$basedir} = 1;
        return 0;
    }

    #build and install
    $cmd = "cd $srcdir/build4sqlbench && make ";
    if (exists $config{"makeflags"}) {
        $cmd .= $config{"makeflags"};
    }
    $cmd .= " >run-sqlbench.log.make-$build 2>&1";
    info("running 'make'\n");
    my_system($cmd);
    if ($?) {
        error("'make' failed\n");
        $FAILED{$basedir} = 1;
        return 0;
    }

    $cmd = "cd $srcdir/build4sqlbench && make install";
    $cmd .= " >>run-sqlbench.log.make-$build 2>&1";
    info("running 'make install'\n");
    my_system($cmd);
    if ($?) {
        error("'make install' failed\n");
        $FAILED{$basedir} = 1;
        return 0;
    }

    $cmd = "cd $srcdir && rm -rf build4sqlbench";
    $cmd .= " >>/dev/null 2>&1";
    notice("removing builddir\n");
    my_system($cmd);

    return 1;
}


#
# start the server in $basedir with the arguments from %$srvargs
# return the pid of the mysqld_safe process or 0 on error
#
sub start_server
{
    my $basedir = shift;
    my $srvargs = shift;

    my $cmd = "cd $basedir; ./bin/mysqld_safe --no-defaults ";
    $cmd .= join " ", map {defined $srvargs->{$_} ? $_ . "=" . $srvargs->{$_} : $_} keys %$srvargs;
    $cmd .= " >/dev/null 2>&1";

    info("starting server in $basedir\n");

    if ($DEBUG) {
        print "DEBUG: exec($cmd)\n";
        return 42;
    }

    my $pid = fork;
    if ($pid == 0) {
        exec $cmd;
        die; #not reached
    }

    #wait 60 seconds for the pidfile to appear
    for (my $i=0; $i<60; $i++) {
        last if (-f $pidfile);
        sleep 1;
    }
    return $pid if (-f $pidfile);

    error("failed to start server in $basedir\n");

    kill 9, $pid;

    return 0;
}


sub stop_server
{
    my $basedir = shift;
    my $child   = shift;

    my $cmd = "cd $basedir; ./bin/mysqladmin --no-defaults ";
    $cmd .= "--socket=$socket --user=root shutdown >/dev/null 2>&1";

    info("stopping server in $basedir\n");

    my_system($cmd);
    if ($?) {
        error("failed to gracefully stop server in $basedir\n");
        my $pid = get_pid($pidfile);
        kill 9, $child;
        kill 1, $pid if ($pid);
    }
    return;
}


sub get_pid
{
    my $pidfile = shift;
    open F, "<$pidfile" or return 0;
    my $pid = <F>;
    close F;
    return chomp $pid;
}


sub run_sqlbench
{
    my $distname = shift;
    my $combo    = shift;
    my $args     = shift;

    my $dir = "$resultdir/$distname/$combo";
    unless (-d $dir || $DEBUG) {
        eval { mkpath($dir) };
        if ($@) {
            error("could not create $dir : $@\n");
            return;
        }
    }

    my $cmd = "cd $sqlbench; ./run-all-tests --dir=$dir --comment=$combo ";
    $cmd .= join " ", map {defined $args->{$_} ? $_ . "=" . $args->{$_} : $_} keys %$args;
    $cmd .= " >>$dir/sql-bench.log 2>&1";

    info("starting sql-bench ($combo)\n");

    my_system($cmd);

    if ($?) {
        error("sql-bench failed\n");
        #remove the result dir if it is empty
        eval { rmdir $dir };
    } else {
        info("sql-bench completed\n");
    }

    return;
}

