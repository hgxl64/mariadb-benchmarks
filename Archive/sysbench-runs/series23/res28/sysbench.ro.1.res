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
        read:                            159145
        write:                           0
        other:                           159145
        total:                           318290
    transactions:                        159145 (2652.40 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 159145 (2652.40 per sec.)
    other operations:                    159145 (2652.40 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              159145
    total time taken by event execution: 59.8264
    per-request statistics:
         min:                                  0.19ms
         avg:                                  0.38ms
         max:                                  0.92ms
         approx.  95 percentile:               0.45ms

Threads fairness:
    events (avg/stddev):           159145.0000/0.00
    execution time (avg/stddev):   59.8264/0.00

