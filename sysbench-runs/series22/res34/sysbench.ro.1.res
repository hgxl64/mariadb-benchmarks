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
        read:                            156582
        write:                           0
        other:                           156582
        total:                           313164
    transactions:                        156582 (2609.68 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 156582 (2609.68 per sec.)
    other operations:                    156582 (2609.68 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              156582
    total time taken by event execution: 59.8038
    per-request statistics:
         min:                                  0.19ms
         avg:                                  0.38ms
         max:                                  1.21ms
         approx.  95 percentile:               0.47ms

Threads fairness:
    events (avg/stddev):           156582.0000/0.00
    execution time (avg/stddev):   59.8038/0.00

