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
        read:                            1445298
        write:                           0
        other:                           1445298
        total:                           2890596
    transactions:                        1445298 (24088.05 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1445298 (24088.05 per sec.)
    other operations:                    1445298 (24088.05 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1445298
    total time taken by event execution: 957.6375
    per-request statistics:
         min:                                  0.20ms
         avg:                                  0.66ms
         max:                                  5.47ms
         approx.  95 percentile:               0.85ms

Threads fairness:
    events (avg/stddev):           90331.1250/2092.07
    execution time (avg/stddev):   59.8523/0.00

