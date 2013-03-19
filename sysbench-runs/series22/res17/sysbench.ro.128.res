sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 128

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 127 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1838821
        write:                           0
        other:                           1838821
        total:                           3677642
    transactions:                        1838821 (30645.04 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1838821 (30645.04 per sec.)
    other operations:                    1838821 (30645.04 per sec.)

Test execution summary:
    total time:                          60.0039s
    total number of events:              1838821
    total time taken by event execution: 7675.9247
    per-request statistics:
         min:                                  1.35ms
         avg:                                  4.17ms
         max:                                 33.46ms
         approx.  95 percentile:               8.53ms

Threads fairness:
    events (avg/stddev):           14365.7891/69.86
    execution time (avg/stddev):   59.9682/0.00

