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
        read:                            1513344
        write:                           0
        other:                           1513344
        total:                           3026688
    transactions:                        1513344 (25222.22 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1513344 (25222.22 per sec.)
    other operations:                    1513344 (25222.22 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1513344
    total time taken by event execution: 477.5728
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.32ms
         max:                                  1.82ms
         approx.  95 percentile:               0.42ms

Threads fairness:
    events (avg/stddev):           189168.0000/6062.35
    execution time (avg/stddev):   59.6966/0.02

