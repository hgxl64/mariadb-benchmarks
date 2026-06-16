#!/bin/env python
from __future__ import division
import argparse
import sys
import os
import subprocess
import math
import time
import logging
from datetime import datetime
from timeit import default_timer as timer

VERSION='0.4.0'

class Node(object):

    def __init__(self):

        # cpu
        self.last_idle , self.last_total = float('NaN') , float('NaN')
        # disk stats
        self.prior_disk_reads = float('NaN')
        self.prior_disk_writes = float('NaN')
        self.prior_disk_read_sectors = float('NaN')
        self.prior_disk_write_sectors = float('NaN')
        # net stats
        self.prior_net_rcv_bytes_mb = float('NaN')
        self.prior_net_rcv_packets = float('NaN')
        self.prior_net_snd_bytes_mb = float('NaN')
        self.prior_net_snd_packets = float('NaN')

    def cpu_usage(self):
        command = "head -1 /proc/stat"
        if args.sshpem:
            sshcommand = [ 'ssh', '-oStrictHostKeyChecking=no', '-i'+args.sshpem, '%s@%s' % ( args.sshuser , args.host ), 'head -1 /proc/stat' ]
        else:
            sshcommand = [ 'ssh', '-oStrictHostKeyChecking=no' , '%s@%s' % ( args.sshuser , args.host ), 'head -1 /proc/stat' ]
        try:
            output=subprocess.check_output(sshcommand)
            fields = [int(column) for column in output.strip().split()[1:]]
            idle , total = fields[3] , sum(fields)
            idle_delta , total_delta = idle - self.last_idle , total - self.last_total
            self.last_idle , self.last_total = idle , total
            cpu_utilization = float("{0:.2f}".format(100.0 * (1.0 - idle_delta / total_delta)))
            logging.debug("cpu_utilization : cpu_utilization : " + str(cpu_utilization))
            return cpu_utilization 
        except Exception as e:
            logging.error("Unable to retrieve cpu_utilizaiton : " + str(e))
            return float("NaN")

    def memory_usage(self):
        command = "free | grep '^Mem'"
        if args.sshpem:
            sshcommand = [ 'ssh', '-oStrictHostKeyChecking=no', '-i'+args.sshpem, '%s@%s' % ( args.sshuser , args.host ), command ]
        else:
            sshcommand = [ 'ssh', '-oStrictHostKeyChecking=no', '%s@%s' % ( args.sshuser , args.host ), command ]
        logging.debug( 'sshCommand = ' + ' '.join(sshcommand) )
        ssh = subprocess.Popen(sshcommand,shell=False,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
        result = ssh.stdout.readlines()
        if result:
            logging.debug("memory_usage : result : " + str(result))
            memory_data=result[0].split()
            logging.debug("memory_usage : memory_data : " + str(memory_data))
            total_memory_gb=float(memory_data[1])/1024/1024
            used_memory_gb=float(memory_data[2])/1024/1024
            free_memory_gb=float(memory_data[3])/1024/1024
            buffcache_memory_gb=float(memory_data[5])/1024/1024
            logging.debug("memory_usage : total_memory_gb : " + str(total_memory_gb) + " : free_memory_gb : " + str(free_memory_gb))
            memory_utilization = float("{0:.2f}".format(100.0 * (used_memory_gb / total_memory_gb)))
            return memory_utilization, total_memory_gb, used_memory_gb, free_memory_gb, buffcache_memory_gb
        else:
            logging.error("unable to retrieve memory stats from node " + str(node))
        return float("NaN"), float("NaN"), float("NaN"), float("NaN"), float("NaN")

    def disk_usage(self):
        command = "df -k | grep '/data/clustrix'"
        if args.sshpem:
            sshcommand = [ 'ssh', '-oStrictHostKeyChecking=no', '-i'+args.sshpem, '%s@%s' % ( args.sshuser , args.host ), command ]
        else:
            sshcommand = [ 'ssh', '-oStrictHostKeyChecking=no', '%s@%s' % ( args.sshuser , args.host ), command ]
        logging.debug( 'sshCommand = ' + ' '.join(sshcommand) )
        ssh = subprocess.Popen(sshcommand,shell=False,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
        result = ssh.stdout.readlines()
        if result:
            logging.debug("disk_usage : result : " + str(result))
            disk_data=result[0].split()
            logging.debug("disk_usage : disk_data : " + str(disk_data))
            diskspace_total_gb=float(disk_data[1])/1024/1024
            diskspace_used_gb=float(disk_data[2])/1024/1024
            diskspace_avail_gb=float(disk_data[3])/1024/1024
            logging.debug("disk_usage : diskspace_total_gb : " + str(diskspace_total_gb) + " : diskspace_used_gb : " + str(diskspace_used_gb))
            diskspace_utilization=100*diskspace_used_gb/diskspace_total_gb
            return diskspace_utilization, diskspace_total_gb, diskspace_used_gb, diskspace_avail_gb
        else:
            return float("NaN"), float("NaN"), float("NaN"), float("NaN")

    def disk_stats(self):
        command = "cat /proc/diskstats"
        current_disk_reads = 0
        current_disk_read_sectors = 0
        current_disk_writes = 0
        current_disk_write_sectors = 0
        for node in args.host.split():
            if args.sshpem:
                sshcommand = [ 'ssh', '-oStrictHostKeyChecking=no', '-i'+args.sshpem, '%s@%s' % ( args.sshuser , args.host ), command ]
            else:
                sshcommand = [ 'ssh', '-oStrictHostKeyChecking=no', '%s@%s' % ( args.sshuser , args.host ), command ]
            logging.debug( 'sshCommand = ' + ' '.join(sshcommand) )
            ssh = subprocess.Popen(sshcommand,shell=False,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
            for line in iter(ssh.stdout.readline,''):
                logging.debug("node : " + str(node) + " : disk_stats : result : " + str(line))
                disk_data = line.split()
                if int(disk_data[1]) == 0:
                    logging.debug("node : " + str(node) + " : disk_stats : disk_data : " + str(disk_data))
                    current_disk_reads = current_disk_reads + float(disk_data[3])
                    current_disk_read_sectors = current_disk_read_sectors + float(disk_data[5])
                    current_disk_writes = current_disk_writes + float(disk_data[7])
                    current_disk_write_sectors = current_disk_write_sectors + float(disk_data[9])
                    logging.debug("node : " + str(node) + " : disk_stats : current_disk_reads : " + str(current_disk_reads) + " : current_disk_writes : " + str(current_disk_writes))
        delta_disk_reads = current_disk_reads - self.prior_disk_reads
        delta_disk_read_sectors = current_disk_read_sectors - self.prior_disk_read_sectors
        delta_disk_writes = current_disk_writes - self.prior_disk_writes
        delta_disk_write_sectors = current_disk_write_sectors - self.prior_disk_write_sectors
        self.prior_disk_reads=current_disk_reads
        self.prior_disk_read_sectors=current_disk_read_sectors
        self.prior_disk_writes=current_disk_writes
        self.prior_disk_write_sectors=current_disk_write_sectors
        logging.debug("disk_stats : delta_disk_reads : " + str(delta_disk_reads) + " : delta_disk_writes : " + str(delta_disk_writes))
        return delta_disk_reads, delta_disk_writes, delta_disk_read_sectors, delta_disk_write_sectors

    def net_stats(self):
        command = "cat /proc/net/dev | grep -v '^Inter' | grep -v '^ face' | grep -v '    lo:' | awk '{  rcvbytes += $2; rcvpackets += $3; sndbytes += $10; sndpackets += $11; }; END { print rcvbytes " + '" "' + " rcvpackets " + '" "' + " sndbytes " + '" "' + " sndpackets; }'"
        current_net_rcv_bytes_mb = 0
        current_net_rcv_packets = 0
        current_net_snd_bytes_mb = 0
        current_net_snd_packets = 0
        for node in args.host.split():
            if args.sshpem:
                sshcommand = [ 'ssh', '-oStrictHostKeyChecking=no', '-i'+args.sshpem, '%s@%s' % ( args.sshuser , args.host ), command ]
            else:
                sshcommand = [ 'ssh', '-oStrictHostKeyChecking=no', '%s@%s' % ( args.sshuser , args.host ), command ]
            logging.debug( 'sshCommand = ' + ' '.join(sshcommand) )
            ssh = subprocess.Popen(sshcommand,shell=False,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
            result = ssh.stdout.readlines()
            if result:
                logging.debug("node : " + str(node) + " : net_stats : result : " + str(result))
                disk_data = result[0].split()
                logging.debug("node : " + str(node) + " : net_stats : disk_data : " + str(disk_data))
                current_net_rcv_bytes_mb = current_net_rcv_bytes_mb + float(disk_data[0])/1024/1024
                current_net_rcv_packets = current_net_rcv_packets + float(disk_data[1])
                current_net_snd_bytes_mb = current_net_snd_bytes_mb + float(disk_data[2])/1024/1024
                current_net_snd_packets = current_net_snd_packets + float(disk_data[3])
                logging.debug("node : " + str(node) + " : net_stats : current_net_rcv_bytes_mb : " + str(current_net_rcv_bytes_mb) + " : current_net_snd_bytes_mb : " + str(current_net_snd_bytes_mb))
            else:
                logging.error("unable to read net stats (/proc/net/dev) from node " + str(node))
        delta_net_rcv_bytes_mb = current_net_rcv_bytes_mb - self.prior_net_rcv_bytes_mb
        delta_net_rcv_packets = current_net_rcv_packets - self.prior_net_rcv_packets
        delta_net_snd_bytes_mb = current_net_snd_bytes_mb - self.prior_net_snd_bytes_mb
        delta_net_snd_packets = current_net_snd_packets - self.prior_net_snd_packets
        self.prior_net_rcv_bytes_mb = current_net_rcv_bytes_mb
        self.prior_net_rcv_packets = current_net_rcv_packets
        self.prior_net_snd_bytes_mb = current_net_snd_bytes_mb
        self.prior_net_snd_packets = current_net_snd_packets
        logging.debug("net_stats : delta_net_rcv_bytes_mb : " + str(delta_net_rcv_bytes_mb) + " : delta_net_snd_bytes_mb : " + str(delta_net_snd_bytes_mb))
        return delta_net_rcv_bytes_mb, delta_net_snd_bytes_mb, delta_net_rcv_packets, delta_net_snd_packets

if __name__ == "__main__":

    parser = argparse.ArgumentParser(usage="%(prog)s <node>")
    parser.add_argument('--version', action='version', version='%(prog)s '+VERSION)
    connection_options = parser.add_argument_group('Node(s) connection settings')
    connection_options.add_argument("--nodes", dest="nodes", default="localhost", help="List of nodes(Default: localhost)")
    connection_options.add_argument("--host", dest="host", default="localhost", help="Host Name(Default: localhost)")
    connection_options.add_argument("-u", "--user", dest="sshuser", default="root", help="Host username(Default: root)")
    connection_options.add_argument("--pem", dest="sshpem", default="", help="pem file(Default:)")
    runtime_options = parser.add_argument_group('Runtime Optons')
    runtime_options.add_argument("--interval-seconds", type=int, default=10, help="Interval time between samples in seconds")
    runtime_options.add_argument("--duration", type=int, default=999999, help="Total duration time in seconds")
    runtime_options.add_argument("--debug", action='store_true', help="Print debugging messages")
    hardware_options = parser.add_argument_group('Hardware Measure Options')
    hardware_options.add_argument("--hardware", help="Monitor system hardware measures (/proc/...)", action="store_true")
    hardware_options.add_argument("--all", help="Collect all satistics", action="store_true")
    hardware_options.add_argument("--cpu", help="Display cpu statistics", action="store_true")
    hardware_options.add_argument("--disk", help="Display disk statistics", action="store_true")
    hardware_options.add_argument("--network", help="Display network statistics", action="store_true")
    hardware_options.add_argument("--memory", help="Display memory usage statistics", action="store_true")
    hardware_options.add_argument("--diskspace", help="Display disk space usage statistics", action="store_true")

    try:
        args = parser.parse_args()
    except argparse.ArgumentError as e:
        self.print_help(sys.stderr)
        parser.exit(2)

    if args.debug:
        logLevel = logging.DEBUG
    else:
        logLevel = logging.INFO
    logFormat = "[Hardware Monitor - " + args.host + " ] %(asctime)s [%(levelname)-5s] %(message)s"
    logging.basicConfig(stream=sys.stderr, level=logLevel, format=logFormat)

    logging.info("Hardware Monitor Begin")

    if args.all:
        args.hardware = True

    if args.hardware:
        args.cpu = True
        args.disk = True
        args.diskspace = True
        args.network = True
        args.memory = True

    node = Node()

    # Report Header
    sys.stdout.write("{0:} ".format("INTERVAL"))
    sys.stdout.write("{0:} ".format("TIMESTAMP"))
    sys.stdout.write("{0:} ".format("DELTA_SECS"))

    if args.cpu:
        sys.stdout.write("{0:} ".format("CPU_UTIL"))

    if args.memory:
        sys.stdout.write("{0:} ".format("MEM_UTIL"))
        sys.stdout.write("{0:} ".format("MEM_TOTAL_GB"))
        sys.stdout.write("{0:} ".format("MEM_USED_GB"))
        sys.stdout.write("{0:} ".format("MEM_FREE_GB"))
        sys.stdout.write("{0:} ".format("MEM_BUFFCACHE_GB"))

    if args.diskspace:
        sys.stdout.write("{0:} ".format("DISKSPACE_UTIL"))
        sys.stdout.write("{0:} ".format("DISKSPACE_TOTAL_GB"))
        sys.stdout.write("{0:} ".format("DISKSPACE_USED_GB"))
        sys.stdout.write("{0:} ".format("DISKSPACE_AVAIL_GB"))

    if args.disk:
        sys.stdout.write("{0:} ".format("DISK_IOPS"))
        sys.stdout.write("{0:} ".format("DISK_READS_PS"))
        sys.stdout.write("{0:} ".format("DISK_WRITES_PS"))
        sys.stdout.write("{0:} ".format("DISK_READ_SECTORS_PS"))
        sys.stdout.write("{0:} ".format("DISK_WRITE_SECTORS_PS"))

    if args.network:
        sys.stdout.write("{0:} ".format("NET_RCV_BYTES_PS"))
        sys.stdout.write("{0:} ".format("NET_SND_BYTES_PS"))
        sys.stdout.write("{0:} ".format("NET_RCV_PACKETS_PS"))
        sys.stdout.write("{0:} ".format("NET_SND_PACKETS_PS"))

    sys.stdout.write("\n")

    start_seconds = timer()
    current_seconds = start_seconds
    prior_seconds = start_seconds
    interval = 0

    while (current_seconds - start_seconds < args.duration ):
        timestamp = datetime.now()
        delta_seconds = current_seconds - prior_seconds

        if delta_seconds > 0:

            interval = interval + 1

            if ( interval % 100 == 0 ):
                logging.debug( "Hardware Monitor Interval {0:}".format(interval) )

            # Report Stats
            sys.stdout.write("{0:.0f} ".format(interval))
            sys.stdout.write("{0:%Y%m%d%H%M%S.%f} ".format(timestamp))
            sys.stdout.write("{0:.1f} ".format(delta_seconds))

            if args.cpu:
                cpu_utilization = node.cpu_usage()
                if math.isnan(cpu_utilization):
                    sys.stdout.write("{0:.2f} ".format(0.0))
                else:
                    sys.stdout.write("{0:.2f} ".format(cpu_utilization))

            if args.memory:
                memory_utilization, total_memory_gb, used_memory_gb, free_memory_gb, buffcache_memory_gb = node.memory_usage()
                if math.isnan(memory_utilization):
                    sys.stdout.write("{0:.2f} ".format(0.0))
                else:
                    sys.stdout.write("{0:.2f} ".format(memory_utilization))
                sys.stdout.write("{0:.2f} ".format(total_memory_gb))
                sys.stdout.write("{0:.2f} ".format(used_memory_gb))
                sys.stdout.write("{0:.2f} ".format(free_memory_gb))
                sys.stdout.write("{0:.2f} ".format(buffcache_memory_gb))

            if args.diskspace:
                diskspace_utilization, diskspace_total_gb, diskspace_used_gb, diskspace_avail_gb = node.disk_usage()
                if math.isnan(diskspace_utilization):
                    sys.stdout.write("{0:.2f} ".format(0.0))
                else:
                    sys.stdout.write("{0:.2f} ".format(diskspace_utilization))
                sys.stdout.write("{0:.2f} ".format(diskspace_total_gb))
                sys.stdout.write("{0:.2f} ".format(diskspace_used_gb))
                sys.stdout.write("{0:.2f} ".format(diskspace_avail_gb))

            if args.disk:
                disk_reads, disk_writes, disk_read_sectors, disk_write_sectors = node.disk_stats()
                disk_reads_ps = disk_reads / delta_seconds
                disk_writes_ps = disk_writes / delta_seconds
                disk_iops = disk_reads_ps + disk_writes_ps
                disk_read_sectors_ps = disk_read_sectors / delta_seconds
                disk_write_sectors_ps = disk_write_sectors / delta_seconds
                if math.isnan(disk_iops):
                    sys.stdout.write("{0:.2f} ".format(0.0))
                else:
                    sys.stdout.write("{0:.2f} ".format(disk_iops))
                if math.isnan(disk_reads_ps):
                    sys.stdout.write("{0:.2f} ".format(0.0))
                else:
                    sys.stdout.write("{0:.2f} ".format(disk_reads_ps))
                if math.isnan(disk_writes_ps):
                    sys.stdout.write("{0:.2f} ".format(0.0))
                else:
                    sys.stdout.write("{0:.2f} ".format(disk_writes_ps))
                if math.isnan(disk_read_sectors_ps):
                    sys.stdout.write("{0:.2f} ".format(0.0))
                else:
                    sys.stdout.write("{0:.2f} ".format(disk_read_sectors_ps))
                if math.isnan(disk_write_sectors_ps):
                    sys.stdout.write("{0:.2f} ".format(0.0))
                else:
                    sys.stdout.write("{0:.2f} ".format(disk_write_sectors_ps))

            if args.network:
                net_rcv_bytes, net_snd_bytes, net_rcv_packets, net_snd_packets = node.net_stats()
                net_rcv_bytes_ps = net_rcv_bytes / delta_seconds
                net_snd_bytes_ps = net_snd_bytes / delta_seconds
                net_rcv_packets_ps = net_rcv_packets / delta_seconds
                net_snd_packets_ps = net_snd_packets / delta_seconds
                if math.isnan(net_rcv_bytes_ps):
                    sys.stdout.write("{0:.2f} ".format(0.0))
                else:
                    sys.stdout.write("{0:.2f} ".format(net_rcv_bytes_ps))
                if math.isnan(net_snd_bytes_ps):
                    sys.stdout.write("{0:.2f} ".format(0.0))
                else:
                    sys.stdout.write("{0:.2f} ".format(net_snd_bytes_ps))
                if math.isnan(net_rcv_packets_ps):
                    sys.stdout.write("{0:.2f} ".format(0.0))
                else:
                    sys.stdout.write("{0:.2f} ".format(net_rcv_packets_ps))
                if math.isnan(net_snd_packets_ps):
                    sys.stdout.write("{0:.2f} ".format(0.0))
                else:
                    sys.stdout.write("{0:.2f} ".format(net_snd_packets_ps))

            sys.stdout.write("\n")
            sys.stdout.flush()

        sleeptime = args.interval_seconds - ( timer() - current_seconds )
        prior_seconds = current_seconds
        if sleeptime > 0:
            time.sleep(sleeptime)
        current_seconds = timer()

    logging.info("Hardware Monitor Done")
