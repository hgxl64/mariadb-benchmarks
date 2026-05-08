cloudbench - Framework for MariaDB Cloud Benchmarks

1. Basics

All cloud instances (VMs) belong to a cluster. The cluster is either
given as commandline option "--cluster" or - preferrably - set in
environment variable CLUSTER. The cluster itself and all VMs are
described in -> property files (in ./properties dir).

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

The MariaDB config files go to /data/cbench/install/etc/server.cnf. The
MariaDB data dir is /data/cbench/datadir. All processes are started as
user that sshed in the VM (the cloud user name can differ). The subdirs
below /data/cbench are also owned by that user.

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

- the MariaDB client in a version that does *not* enforce SSL

Sysbench LUA scripts are shipped separately. They are contained in
subdir driver/lua of this repo.

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
configuration is created automatically to make best use of CPU and
Memory resources.


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
router separates read-only and read-write transactions.


2.4 Galera Master-Master

This is like Galera Master-Slave but now all nodes are treated as
equal. There is no need to deploy MaxScale with this cluster type.
By default a driver accesses all server nodes using the builtin load
valancing mechanism of sysbench.


2.5 Raft Master-Slave

TBD


2.6 Raft Master-Master

TDB


3. Property Files







