#!/usr/bin/perl -w
#
# (w) Axel "XL" Schwenke for MariaDB
#
# $Id$

use strict;
use Getopt::Long;
use HTTP::Request;
use LWP::UserAgent;
use JSON::MaybeXS;
use Data::Dumper;
$Data::Dumper::Indent= 1;
my $LOG;

#default options
my $host= undef;
my $port= 3000;
my $token= undef;
my $dashboard= "nodeexporter";
my $cluster= $ENV{"CLUSTER"} || undef;
my $node= undef;
my $ts_to= time();
my $ts_from= $ts_to-3600;
my $expires= 365*24*60*60;
my $help= 0;
#end

my $helpmessage= <<EOM;
$0 -  snapshot a Grafana dashboard

usage: $0 --host ... --token ... --cluster ... [options]

options: --host ........ where Grafana listens
         --port ........ Grafana port (default: $port)
         --auth ........ auth token
         --dashboard ... dashboard UID (default: $dashboard)
         --cluster ..... cluster to select in snapshot
         --node ........ node to select in snapshot
         --from ........ start time of snapshot (default: now-1h)
         --to .......... end time of snapshot (default: now)
         --expires ..... how long the snapshot is valid (default: 1 year)
EOM

die $helpmessage
unless Getopt::Long::GetOptions(
                                "host=s"      => \$host,
                                "port=i"      => \$port,
                                "auth=s"      => \$token,
                                "dashboard=s" => \$dashboard,
                                "cluster=s"   => \$cluster,
                                "node=s"      => \$node,
                                "from=s"      => \$ts_from,
                                "to=s"        => \$ts_to,
                                "expires=i"   => \$expires,
                                "help|?!"     => \$help
                               )
and not $help;


# get dashboard
my $ua= LWP::UserAgent->new();
my $req = HTTP::Request->new();
$req->method('GET');
$req->uri("http://$host:$port/api/dashboards/uid/$dashboard");
$req->header("Authorization" => "Bearer $token");
$req->accept_decodable;
my $res= $ua->request($req);
die $res->status_line unless ($res->is_success);

#open $LOG, "> original_json.txt" or die $!;
#print $LOG $res->decoded_content;
#close $LOG;

my $dash= decode_json($res->decoded_content)->{"dashboard"};

open $LOG, "> original.txt" or die $!;
print $LOG Dumper($dash);
close $LOG;

# modify dashboard for snapshot
# set time span
$dash->{"time"}{"from"}= $ts_from;
$dash->{"time"}{"to"}= $ts_to;
# disable refresh
$dash->{"refresh"}="";
# set cluster and node
my @var_templates= @{$dash->{"templating"}{"list"}};
foreach my $var (@var_templates) {
    if ($var->{"name"} eq "cluster") {
        $var->{"current"}{"selected"}= 1;
        $var->{"current"}{"text"}= $cluster;
        $var->{"current"}{"value"}= $cluster;
        $var->{"options"}= $var->{"current"};
        $var->{"type"}= "custom";
        $var->{"query"}= $cluster;
    }
    if ($var->{"name"} eq "node") {
        $var->{"current"}{"selected"}= 1;
        $var->{"current"}{"text"}= $node;
        $var->{"current"}{"value"}= $node;
        $var->{"options"}= $var->{"current"};
        $var->{"type"}= "custom";
        $var->{"query"}= $node;
    }
}

open $LOG, "> modified.txt" or die $!;
print $LOG Dumper($dash);
close $LOG;

# build request
my $snap= {
    "dashboard" => $dash,
    "expires" => $expires,
    "name" => "$dashboard snapshot"
};

#open $LOG, "> snap_request.txt" or die $!;
#print $LOG Dumper($snap);
#close $LOG;

#open $LOG, "> snap_request_json.txt" or die $!;
#print $LOG encode_json $snap;
#close $LOG;

$req->method('POST');
$req->uri("http://$host:$port/api/snapshots");
$req->header("Authorization" => "Bearer $token");
$req->header("Content-Type" => "application/json");
$req->accept_decodable;
$req->content(encode_json $snap);
$res= $ua->request($req);
die $res->status_line unless ($res->is_success);

my $snap_res= decode_json $res->decoded_content;

open $LOG, "> snap_result.txt" or die $!;
print $LOG Dumper($snap_res);
close $LOG;

print $snap_res->{"url"};

exit 0;
