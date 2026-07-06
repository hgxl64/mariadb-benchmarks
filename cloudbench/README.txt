cloudbench - Framework for MariaDB Cloud Benchmarks

1. Basics

All cloud instances (VMs) belong to a cluster. The cluster is either
given as commandline option "--cluster" or - preferrably - set in
environment variable CLUSTER. The cluster itself and all VMs are
described in -> property files (in the ./properties dir).

The framework scripts are run on another host, the orchestrator. The
orchestrator must be in the whitelist of the cloud so that it can
connect to cloud instances via SSH (TCP 22) and MariaDB (TCP 3306).

There are 3 types of cloud instances

  1. server nodes; these run the MariaDB server
  2. driver nodes; these run the benchmark tools
  3. maxscale nodes; these run MaxScale


1.1 Server Nodes

Depending on -> cluster type these run a flavor of the MariaDB server.
To hold the additional data an extra disk resource is requested from
the cloud. This disk is mounted by the VM under /data/cbench. The
default filesystem is ext4.

Server installations go to /data/cbench/install, so that subdirs like
/data/cbench/install/bin etc. exist.

The MariaDB config files go to /data/cbench/install/etc/my.cnf.d.
The MariaDB data dir is /data/cbench/datadir. All processes are started
as user that sshed in the VM (the cloud user name can differ). The
subdirs below /data/cbench are also owned by that user.

The number of server nodes depends an the -> cluster type. For MariaDB
standalone tests there is only one server node. But replication or
Galera tests may require multiple nodes. There is always one special
node - node1 - with a special role depending on cluster type.

Server nodes run a predefined OS image, depending on the cloud.


1.2 Driver Nodes

The driver node always runs a special machine image. It contains the OS
as well as necessary software. The list of software includes

- https://github.com/hgxl64/sysbench-1.x-mariadb; a fork of sysbench1.1
  with enhanced histograms and extra P25, P50 and P75 stats

- HammerDB in /data/cbench/HammerDB-5.0

- the MariaDB client in a version that does *not* enforce SSL

Extra driver scripts (i.e. sysbench LUA scripts) are contained in
subdir driver of this repo. They will be copied to /data/cbench/driver.

Depending on the benchmark there can be one or multiple driver nodes.
The sysbench-tpcc benchmark for example runs on a single driver only.
In case of multiple drivers they are started syncronously and their
results are combined.


1.3 MaxScale Nodes

The MaxScale proxy is optional. It is however required to run realistic
benchmarks on a replication configuration. The exact MaxScale
configuration depends on the -> cluster type. Multiple MaxScale nodes
are possible and then identically configured and used with load
balancing via the builtin sysbench load balancing mechanism.

If a MaxScale node is configured, then "CLUSTERNAME.maxscale" is
created additionally to the CLUSTERNAME cluster. The MaxScale
pseudo-cluster can then be used for benchmarks.


2. Cluster Types

2.1 MariaDB Standalone

This cluster type has one server node running a MariaDB server. The
my.cnf is created automatically to make best use of CPU and Memory
resources.


2.2 MariaDB Replication

This cluster type has one server node (node1) configured as replication
master and an arbitrary number of additional server nodes acting as
replication slaves of that master.

It is normally used with MaxScale which is configured to tolerate a
maximum replication lag of 10s and using the readwritesplit router.


2.3 Galera Master-Slave

This configures a cluster running Galera. The number of cluster nodes
is >=3 and an odd number (default: 3). The special node1 is the first
node that is started (no special meaning for Galera). It is also by
convention the only node that should receive be writes.

Therefor it is normally used with MaxScale and the readwritesplit
router separates read-only and read-write transactions. If used without
MaxScale all transactions (reads *and* writes) will go to node1.


2.4 Galera Master-Master

This is like Galera Master-Slave but now all nodes are treated as
equal. There is no need to deploy MaxScale with this cluster type.
By default a driver accesses all server nodes using the builtin load
balancing mechanism of sysbench.


2.5 Raft Master-Slave

This is like Galera Master-Slave, except that a Raft-enabled MariaDB is
picked for installation (currently only MariaDB Enterprise 12.3) and
that the Raft binaries are installed. Node1 is called 'leader node' for
Raft clusters and should receive all writes.


2.6 Raft Master-Master

This is like Galera Master-Master with the Raft exceptions. While in a
Raft cluster any node can be written to, there is still a performance
penalty if a write happens on a node that is not the leader node.


3. Property Files

3.1 General concepts




3.2 Node property files

Node property files describe a physical node. Example:

---- cut ---- ---- cut ---- ---- cut ---- ---- cut ----
system.name = g1

system.external.ip = 172.20.0.164
system.internal.ip = 10.10.0.164

server.cloud = gcp
gcp.zone = us-central1-b
gcp.instance_type = n2-standard-16

ssh.user = clustrix
ssh.pem = /home/galera/.ssh/gcp_key.pem
---- cut ---- ---- cut ---- ---- cut ---- ---- cut ----

The system name and external/internal IP address are mandatory.

The external IP address is the one under which the node can be reached
by the orchestrator node. The internal IP address is the one that is to
be used for communication between the nodes of a cluster (i.e. SQL
traffic for a benchmark).

The external network needs only to allow some services. ATM that are
SSH (tcp/22) and MySQL (tcp/3306). Cloudbench however relies on a
unrestricted network between the cluster nodes.

If the node was allocated from a cloud, the cloud itself (server.cloud)
and cloud-specific properties will be added.

The ssh properties are used by the orchestrator node. They are however
optional. Default is to use the current user. SSH connections must use
public keys.


3.3 System property files


3.4 Cluster property files


3.5 Special purpose property files


4. Monitoring

4.1 Prometheus

For the GCP cloud a monitoring solution was setup. This consists of a
Prometheus server running on an always-on GCP instance. Prometheus is
configured to keep data for 1 year. It scrapes all targets in 15s
intervals. The targets are set in separate JSON files under
/etc/prometheus/targets.

When new cloud nodes are spun up with gcp.allocate.nodes.sh they get
the Prometheus Node Exporter installed and a JSON file is added. This
file is removed when the node is released by gcp.release.nodes.sh

For server nodes of a cluster (aka nodes that run MariaDB) the MySQL
Exporter is installed and a JSON file is added. This happens in the
stage when the cluster software is installed (build.cluster.sh).

Prometheus listens on port 9090. The port is forwarded by a Cloudflare
tunnel to https://prometheus1.benchmarks.mariadb.net.


4.2 Grafana

To visualise the data from Prometheus, a Grafana instance was setup (on
the same cloud machine). It has some dashboards installed in directory
'MariaDB' (WIP)

A snapshot mechanism was created (grafana.snapshot.pl) that works for
the Node Exporter Dashboard. This is allows to create a snapshot of
the dashboard for the duration of a benchmark.

Other dashboard will be added (WIP)

Grafana listens on port 3000. The port is forwarded by a Cloudflare
tunnel to https://grafana1.benchmarks.mariadb.net.


