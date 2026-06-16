#!/bin/env python3
from __future__ import division
import argparse
import sys
import os
import subprocess
import math
import time
import logging
import mariadb
from datetime import datetime
from timeit import default_timer as timer

VERSION='2.1.0'

NULL_STATUS_VARIABLES = [
    "BINLOG_SNAPSHOT_FILE",
    "INNODB_BUFFER_POOL_DUMP_STATUS",
    "INNODB_BUFFER_POOL_RESIZE_STATUS",
    "SSL_CIPHER",
    "SSL_CIPHER_LIST",
    "SSL_SERVER_NOT_AFTER",
    "SSL_SERVER_NOT_BEFORE",
    "SSL_VERSION",
    "WSREP_CLUSTER_CAPABILITIES",
    "WSREP_CLUSTER_STATE_UUID",
    "WSREP_PROVIDER_CAPABILITIES",
    "WSREP_PROVIDER_NAME",
    "WSREP_PROVIDER_VENDOR",
    "WSREP_PROVIDER_VERSION"
]
NON_NUMERIC_VARIABLES = [
    "COMPRESSION",
    "COLUMNSTORE_VERSION",
    "COLUMNSTORE_COMMIT_HASH",
    "INNODB_BUFFER_POOL_LOAD_INCOMPLETE",
    "INNODB_BUFFER_POOL_LOAD_STATUS",
    "INNODB_HAVE_BZIP2",
    "INNODB_HAVE_LZ4",
    "INNODB_HAVE_LZMA",
    "INNODB_HAVE_LZO",
    "INNODB_HAVE_PUNCH_HOLE",
    "INNODB_HAVE_SNAPPY",
    "RPL_SEMI_SYNC_MASTER_STATUS",
    "RPL_SEMI_SYNC_SLAVE_STATUS",
    "RPL_STATUS",
    "SLAVE_RUNNING",
    "SSL_SESSION_CACHE_MODE",
    "WSREP_CLUSTER_STATUS",
    "WSREP_CONNECTED",
    "WSREP_READY",
    "SERVER_AUDIT_ACTIVE",
    "SERVER_AUDIT_CURRENT_LOG",
    "SERVER_AUDIT_LAST_ERROR",
    "SERVER_AUDIT_SESSION_FILTER",
    "WSREP_LOCAL_STATE_UUID",
    "WSREP_LOCAL_STATE_COMMENT",
    "WSREP_INCOMING_ADDRESSES",
    "WSREP_EVS_DELAYED",
    "WSREP_EVS_EVICT_LIST",
    "WSREP_EVS_REPL_LATENCY",
    "WSREP_EVS_STATE",
    "WSREP_GCOMM_UUID",
    "WSREP_PROTOCOL_VERSION",
    "WSREP_LAST_COMMITTED",
    "WSREP_COMMIT_OOOL",
    "WSREP_LOCAL_STATE"
]
NON_INTEGER_VARIABLES = [
    "LAST_QUERY_COST",
    "BUSY_TIME",
    "CPU_TIME",
    "SLAVE_HEARTBEAT_PERIOD",
    "WSREP_LOCAL_RECV_QUEUE_AVG",
    "WSREP_FLOW_CONTROL_PAUSED",
    "WSREP_CERT_DEPS_DISTANCE",
    "WSREP_APPLY_OOOE",
    "WSREP_APPLY_OOOL",
    "WSREP_APPLY_WINDOW",
    "WSREP_COMMIT_WINDOW",
    "WSREP_CERT_INTERVAL"
]
NON_ACCUMATIVE_VARIABLES = [
    "THREADS_CONNECTED",
    "THREADS_RUNNING",
    "THREADPOOL_THREADS",
    "THREADPOOL_IDLE_THREADS",
    "WSREP_LOCAL_SEND_QUEUE",
    "WSREP_LOCAL_SEND_QUEUE_MAX",
    "WSREP_LOCAL_SEND_QUEUE_MIN",
    "WSREP_LOCAL_SEND_QUEUE_AVG",
    "WSREP_LOCAL_RECV_QUEUE",
    "WSREP_LOCAL_RECV_QUEUE_MAX",
    "WSREP_LOCAL_RECV_QUEUE_MIN"
]
class Database(object):

    prior_detail = {}

    def _connect(self):
        logging.info("[MariaDB Monitor] Connecting to database on host {0} as {1}...".format(args.dbhost, args.dbuser))
        try:
            self.dbconnection = mariadb.connect(
                host=args.dbhost,
                user=args.dbuser,
                password=args.dbpassword,
                # ssl_ca=args.dbssl_ca,
                port=args.dbport)
            self.dbconnection.autocommit = True
            self.cursor = self.dbconnection.cursor()
            self.cursor.execute("select version()")
            row = self.cursor.fetchone()
            logging.info("[MariaDB Monitor] Connected to database.  Version : " + str(row[0]))
        except mariadb.Error as e:
            sys.stderr.write("[MariaDB Monitor] Error connecting to MariaDB Platform : " + str(e) + "\n")
            sys.exit(1)

    def _check_connection(self):
        try:
            self.cursor.execute("select version()")
            row = self.cursor.fetchall()
            if row:
                return True
            else:
                try:
                    logging.info("[MariaDB Monitor] Reconnecting to database.")
                    self._connect()
                except Exception as e:
                    logging.error("[MariaDB Monitor] Exception while reconnecting database. : " + str(e))
                    return False
        except Exception as e:
            logging.error("[MariaDB Monitor] No connection with database. : " + str(e))
            return False

    def mariadb_global_stats(self, interval, timestamp, delta_seconds):
        # Report Header
        if ( interval == 1):
            header = "INTERVAL TIMESTAMP DELTA_SECS"
        # Report Stats
        detail = "{0:.0f} ".format(interval) + "{0:%Y%m%d%H%M%S.%f} ".format(timestamp) + "{0:.1f}".format(delta_seconds)
        self.cursor.execute("select variable_name, variable_value from information_schema.global_status;")
        rows = self.cursor.fetchall()
        current_detail = {}
        logging.debug("mariadb_global_stats : rows : " + str(self.cursor.rowcount))
        for row in rows:
            if row[0] not in NULL_STATUS_VARIABLES:
                if row[0] not in NON_NUMERIC_VARIABLES:
                    if row[0] not in NON_INTEGER_VARIABLES:
                        try:
                            logging.debug("Variable = " + row[0] + ", Value = " + row[1])
                            if (interval == 1 ):
                                header = header + " " + row[0]
                            if (interval != 1):
                                if row[0] in NON_ACCUMATIVE_VARIABLES:
                                    detail = detail + " " + row[1]
                                else:
                                    detail = detail + " " + str( int(row[1]) - int(self.prior_detail[row[0]]) )
                            current_detail[row[0]] = row[1]
                        except Exception as e:
                            logging.error("[MariaDB Monitor] Unable to process value. : " + "Variable = " + row[0] + ", Value = " + row[1] + ", " + str(e))
        if (interval == 1):
            sys.stdout.write(header + "\n")
        if (interval != 1):
            sys.stdout.write(detail + "\n")
        sys.stdout.flush()
        self.prior_detail = current_detail
        return None

if __name__ == "__main__":

    parser = argparse.ArgumentParser(usage="%(prog)s <node>")
    parser.add_argument('--version', action='version', version='%(prog)s '+VERSION)
    database_settings = parser.add_argument_group('Database connection settings')
    database_settings.add_argument("--dbhost", dest="dbhost", default="localhost", help="Database Host Name (Default: localhost)")
    database_settings.add_argument("--dbuser", dest="dbuser", default="root", help="Database username (Default: root)")
    database_settings.add_argument("--dbport", dest="dbport", type=int, default=3306, help="Database port (Default: 3306)")
    database_settings.add_argument("--dbpassword", dest="dbpassword", default="", help="Database password (Default: blank)")
    database_settings.add_argument("--ssl", dest="ssl", default=False, help="Use SSL to connect (Default: no)")
    database_settings.add_argument("--dbssl_ca", dest="dbssl_ca", default="", help="Database ssl_ca file (Default: blank)")
    runtime_options = parser.add_argument_group('Runtime Optons')
    runtime_options.add_argument("--interval-seconds", type=int, default=10, help="Interval time between samples in seconds")
    runtime_options.add_argument("--duration", type=int, default=999999, help="Total duration time in seconds")
    runtime_options.add_argument("--debug", action='store_true', help="Print debugging messages")

    try:
        args = parser.parse_args()
    except argparse.ArgumentError as e:
        self.print_help(sys.stderr)
        parser.exit(2)

    if args.debug:
        logLevel = logging.DEBUG
    else:
        logLevel = logging.INFO
    logFormat = "[MariaDB Monitor - " + args.dbhost + " ] %(asctime)s [%(levelname)-5s] %(message)s"
    logging.basicConfig(stream=sys.stderr, level=logLevel, format=logFormat)

    logging.info("[MariaDB Monitor] MariaDB Performance Monitor Begin!")

    mdb = Database()
    mdb._connect()

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
                logging.debug("[MariaDB Monitor] Performance Monitor Interval {0:}".format(interval))

            mdb.mariadb_global_stats(interval,timestamp,delta_seconds)

        sleeptime = args.interval_seconds - ( timer() - current_seconds )
        prior_seconds = current_seconds
        if sleeptime > 0:
            time.sleep(sleeptime)
        current_seconds = timer()

    logging.info("[MariaDB Monitor] Performance Monitor Done!")
