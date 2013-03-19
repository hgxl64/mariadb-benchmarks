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
        read:                            1062398
        write:                           0
        other:                           1062398
        total:                           2124796
    transactions:                        1062398 (17704.80 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1062398 (17704.80 per sec.)
    other operations:                    1062398 (17704.80 per sec.)

Test execution summary:
    total time:                          60.0062s
    total number of events:              1062398
    total time taken by event execution: 7677.1033
    per-request statistics:
         min:                                  5.78ms
         avg:                                  7.23ms
         max:                                 16.84ms
         approx.  95 percentile:               7.63ms

Threads fairness:
    events (avg/stddev):           8299.9844/2.38
    execution time (avg/stddev):   59.9774/0.00

