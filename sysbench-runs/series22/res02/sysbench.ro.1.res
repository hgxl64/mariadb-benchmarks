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
        read:                            211633
        write:                           0
        other:                           211633
        total:                           423266
    transactions:                        211633 (3527.20 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 211633 (3527.20 per sec.)
    other operations:                    211633 (3527.20 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              211633
    total time taken by event execution: 59.8519
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.28ms
         max:                                  0.89ms
         approx.  95 percentile:               0.35ms

Threads fairness:
    events (avg/stddev):           211633.0000/0.00
    execution time (avg/stddev):   59.8519/0.00

