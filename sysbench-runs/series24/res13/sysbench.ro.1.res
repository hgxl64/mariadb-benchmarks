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
        read:                            270521
        write:                           0
        other:                           270521
        total:                           541042
    transactions:                        270521 (4508.66 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 270521 (4508.66 per sec.)
    other operations:                    270521 (4508.66 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              270521
    total time taken by event execution: 59.8079
    per-request statistics:
         min:                                  0.10ms
         avg:                                  0.22ms
         max:                                  0.64ms
         approx.  95 percentile:               0.38ms

Threads fairness:
    events (avg/stddev):           270521.0000/0.00
    execution time (avg/stddev):   59.8079/0.00

