sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 2

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 1 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            456782
        write:                           0
        other:                           456782
        total:                           913564
    transactions:                        456782 (7612.98 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 456782 (7612.98 per sec.)
    other operations:                    456782 (7612.98 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              456782
    total time taken by event execution: 119.6650
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.26ms
         max:                                  0.88ms
         approx.  95 percentile:               0.31ms

Threads fairness:
    events (avg/stddev):           228391.0000/974.00
    execution time (avg/stddev):   59.8325/0.00

