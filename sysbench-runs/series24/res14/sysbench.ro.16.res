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
        read:                            1045245
        write:                           0
        other:                           1045245
        total:                           2090490
    transactions:                        1045245 (17420.52 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1045245 (17420.52 per sec.)
    other operations:                    1045245 (17420.52 per sec.)

Test execution summary:
    total time:                          60.0008s
    total number of events:              1045245
    total time taken by event execution: 958.2013
    per-request statistics:
         min:                                  0.57ms
         avg:                                  0.92ms
         max:                                  2.48ms
         approx.  95 percentile:               1.08ms

Threads fairness:
    events (avg/stddev):           65327.8125/578.84
    execution time (avg/stddev):   59.8876/0.00

