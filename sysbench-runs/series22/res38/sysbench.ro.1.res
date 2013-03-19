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
        read:                            164036
        write:                           0
        other:                           164036
        total:                           328072
    transactions:                        164036 (2733.92 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 164036 (2733.92 per sec.)
    other operations:                    164036 (2733.92 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              164036
    total time taken by event execution: 59.8218
    per-request statistics:
         min:                                  0.20ms
         avg:                                  0.36ms
         max:                                  1.24ms
         approx.  95 percentile:               0.44ms

Threads fairness:
    events (avg/stddev):           164036.0000/0.00
    execution time (avg/stddev):   59.8218/0.00

