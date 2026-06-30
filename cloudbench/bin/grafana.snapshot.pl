#!/usr/bin/perl -w
#
#

use strict;
use Getopt::Long;
use HTTP::Request;
use LWP::UserAgent;
use JSON::MaybeXS;

#default options
my $host= undef;
my $port= 3000;
my $token= undef;
my $dashboard= "nodeexporter";
my $ts_to= time();
my $ts_from= $ts_to-3600;
my $valid= 365*24*60*60;
my $help= 0;
#end

my $helpmessage= <<EOM;
$0 -  snapshot a Grafana dashboard

usage: $0 --host ... --token ... [options]

options: --host ........ where Grafana listens
         --port ........ Grafana port (default: $port)
         --auth ........ auth token
         --dashboard ... dashboard UID (default: $dashboard)
         --from ........ start time of snapshot (default: now-1h)
         --to .......... end time of snapshot (default: now)
         --valid ....... how long the snapshot is valid (default: 1 year)


EOM


die $helpmessage
unless Getopt::Long::GetOptions(
                                "host=s"      => \$host,
                                "port=s"      => \$port,
                                "auth=s"      => \$token,
                                "dashboard=s" => \$dashboard,
                                "from=s"      => \$ts_from,
                                "to=s"        => \$ts_to,
                                "help|?!"     => \$help
                               )
and not $help;

my $ua= LWP::UserAgent->new();

my $req = HTTP::Request->new(
  'GET' => "http://$host:$port/apis/dashboard.grafana.app/v1/namespaces/default/dashboards/$dashboard"
                            );
$req->header("Authorization" => "Bearer $token");
$req->accept_decodable;

my $res= $ua->request($req);
if ($res->is_success) {
    print $res->decoded_content;
} else {
    print STDERR $res->status_line, "\n";
}

