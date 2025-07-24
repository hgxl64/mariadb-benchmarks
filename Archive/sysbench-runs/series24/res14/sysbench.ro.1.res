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
        read:                            167962
        write:                           0
        other:                           167962
        total:                           335924
    transactions:                        167962 (2799.34 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 167962 (2799.34 per sec.)
    other operations:                    167962 (2799.34 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              167962
    total time taken by event execution: 59.8123
    per-request statistics:
         min:                                  0.19ms
         avg:                                  0.36ms
         max:                                  0.72ms
         approx.  95 percentile:               0.42ms

Threads fairness:
    events (avg/stddev):           167962.0000/0.00
    execution time (avg/stddev):   59.8123/0.00

