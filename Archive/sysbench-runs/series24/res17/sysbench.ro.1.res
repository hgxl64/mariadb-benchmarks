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
        read:                            214164
        write:                           0
        other:                           214164
        total:                           428328
    transactions:                        214164 (3569.38 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 214164 (3569.38 per sec.)
    other operations:                    214164 (3569.38 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              214164
    total time taken by event execution: 59.8375
    per-request statistics:
         min:                                  0.10ms
         avg:                                  0.28ms
         max:                                  1.49ms
         approx.  95 percentile:               0.43ms

Threads fairness:
    events (avg/stddev):           214164.0000/0.00
    execution time (avg/stddev):   59.8375/0.00

