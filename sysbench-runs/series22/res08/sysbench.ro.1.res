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
        read:                            207308
        write:                           0
        other:                           207308
        total:                           414616
    transactions:                        207308 (3455.11 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 207308 (3455.11 per sec.)
    other operations:                    207308 (3455.11 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              207308
    total time taken by event execution: 59.8452
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.29ms
         max:                                  4.19ms
         approx.  95 percentile:               0.36ms

Threads fairness:
    events (avg/stddev):           207308.0000/0.00
    execution time (avg/stddev):   59.8452/0.00

