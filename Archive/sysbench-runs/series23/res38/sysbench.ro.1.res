sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 1

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
Done.

OLTP test statistics:
    queries performed:
        read:                            151646
        write:                           0
        other:                           151646
        total:                           303292
    transactions:                        151646 (2527.42 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 151646 (2527.42 per sec.)
    other operations:                    151646 (2527.42 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              151646
    total time taken by event execution: 59.8021
    per-request statistics:
         min:                                  0.24ms
         avg:                                  0.39ms
         max:                                  0.94ms
         approx.  95 percentile:               0.46ms

Threads fairness:
    events (avg/stddev):           151646.0000/0.00
    execution time (avg/stddev):   59.8021/0.00

