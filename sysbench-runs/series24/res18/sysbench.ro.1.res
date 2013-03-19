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
        read:                            166801
        write:                           0
        other:                           166801
        total:                           333602
    transactions:                        166801 (2780.00 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 166801 (2780.00 per sec.)
    other operations:                    166801 (2780.00 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              166801
    total time taken by event execution: 59.7994
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.36ms
         max:                                  0.90ms
         approx.  95 percentile:               0.45ms

Threads fairness:
    events (avg/stddev):           166801.0000/0.00
    execution time (avg/stddev):   59.7994/0.00

