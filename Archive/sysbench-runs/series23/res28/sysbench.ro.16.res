sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1044149
        write:                           0
        other:                           1044149
        total:                           2088298
    transactions:                        1044149 (17402.19 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1044149 (17402.19 per sec.)
    other operations:                    1044149 (17402.19 per sec.)

Test execution summary:
    total time:                          60.0010s
    total number of events:              1044149
    total time taken by event execution: 958.3091
    per-request statistics:
         min:                                  0.43ms
         avg:                                  0.92ms
         max:                                  6.77ms
         approx.  95 percentile:               1.08ms

Threads fairness:
    events (avg/stddev):           65259.3125/567.36
    execution time (avg/stddev):   59.8943/0.00

