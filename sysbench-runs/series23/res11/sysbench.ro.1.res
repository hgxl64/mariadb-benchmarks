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
        read:                            307240
        write:                           0
        other:                           307240
        total:                           614480
    transactions:                        307240 (5120.64 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 307240 (5120.64 per sec.)
    other operations:                    307240 (5120.64 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              307240
    total time taken by event execution: 59.8123
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.19ms
         max:                                  0.80ms
         approx.  95 percentile:               0.36ms

Threads fairness:
    events (avg/stddev):           307240.0000/0.00
    execution time (avg/stddev):   59.8123/0.00

