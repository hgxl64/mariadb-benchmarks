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
        read:                            1072840
        write:                           0
        other:                           1072840
        total:                           2145680
    transactions:                        1072840 (17878.86 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1072840 (17878.86 per sec.)
    other operations:                    1072840 (17878.86 per sec.)

Test execution summary:
    total time:                          60.0061s
    total number of events:              1072840
    total time taken by event execution: 7677.0572
    per-request statistics:
         min:                                  5.84ms
         avg:                                  7.16ms
         max:                                 18.18ms
         approx.  95 percentile:               7.58ms

Threads fairness:
    events (avg/stddev):           8381.5625/2.15
    execution time (avg/stddev):   59.9770/0.00

