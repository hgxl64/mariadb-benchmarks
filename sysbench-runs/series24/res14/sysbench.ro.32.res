sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 32

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 31 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1057820
        write:                           0
        other:                           1057820
        total:                           2115640
    transactions:                        1057820 (17629.86 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1057820 (17629.86 per sec.)
    other operations:                    1057820 (17629.86 per sec.)

Test execution summary:
    total time:                          60.0016s
    total number of events:              1057820
    total time taken by event execution: 1918.2196
    per-request statistics:
         min:                                  1.27ms
         avg:                                  1.81ms
         max:                                  4.44ms
         approx.  95 percentile:               2.04ms

Threads fairness:
    events (avg/stddev):           33056.8750/24.23
    execution time (avg/stddev):   59.9444/0.00

