sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 256

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 255 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1002300
        write:                           0
        other:                           1002300
        total:                           2004600
    transactions:                        1002300 (16702.92 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1002300 (16702.92 per sec.)
    other operations:                    1002300 (16702.92 per sec.)

Test execution summary:
    total time:                          60.0075s
    total number of events:              1002300
    total time taken by event execution: 15353.5548
    per-request statistics:
         min:                                  1.97ms
         avg:                                 15.32ms
         max:                                109.57ms
         approx.  95 percentile:              28.26ms

Threads fairness:
    events (avg/stddev):           3915.2344/34.84
    execution time (avg/stddev):   59.9748/0.00

