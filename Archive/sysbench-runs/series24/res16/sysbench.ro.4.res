sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1285217
        write:                           0
        other:                           1285217
        total:                           2570434
    transactions:                        1285217 (21420.18 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1285217 (21420.18 per sec.)
    other operations:                    1285217 (21420.18 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              1285217
    total time taken by event execution: 238.1698
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.19ms
         max:                                  5.07ms
         approx.  95 percentile:               0.25ms

Threads fairness:
    events (avg/stddev):           321304.2500/4946.20
    execution time (avg/stddev):   59.5424/0.01

