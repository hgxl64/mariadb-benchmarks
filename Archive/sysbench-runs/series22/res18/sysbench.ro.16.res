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
        read:                            1048969
        write:                           0
        other:                           1048969
        total:                           2097938
    transactions:                        1048969 (17482.52 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1048969 (17482.52 per sec.)
    other operations:                    1048969 (17482.52 per sec.)

Test execution summary:
    total time:                          60.0010s
    total number of events:              1048969
    total time taken by event execution: 958.1038
    per-request statistics:
         min:                                  0.52ms
         avg:                                  0.91ms
         max:                                  7.03ms
         approx.  95 percentile:               1.08ms

Threads fairness:
    events (avg/stddev):           65560.5625/897.33
    execution time (avg/stddev):   59.8815/0.00

