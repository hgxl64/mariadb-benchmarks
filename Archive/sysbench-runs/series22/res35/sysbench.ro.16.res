sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            2538618
        write:                           0
        other:                           2538618
        total:                           5077236
    transactions:                        2538618 (42309.98 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2538618 (42309.98 per sec.)
    other operations:                    2538618 (42309.98 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              2538618
    total time taken by event execution: 956.2045
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.38ms
         max:                                  4.24ms
         approx.  95 percentile:               0.51ms

Threads fairness:
    events (avg/stddev):           158663.6250/722.82
    execution time (avg/stddev):   59.7628/0.01

