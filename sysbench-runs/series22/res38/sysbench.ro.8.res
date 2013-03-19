sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 8

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 7 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1047257
        write:                           0
        other:                           1047257
        total:                           2094514
    transactions:                        1047257 (17454.13 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1047257 (17454.13 per sec.)
    other operations:                    1047257 (17454.13 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1047257
    total time taken by event execution: 478.3247
    per-request statistics:
         min:                                  0.20ms
         avg:                                  0.46ms
         max:                                  4.21ms
         approx.  95 percentile:               0.59ms

Threads fairness:
    events (avg/stddev):           130907.1250/2280.77
    execution time (avg/stddev):   59.7906/0.01

