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
        read:                            2046639
        write:                           0
        other:                           2046639
        total:                           4093278
    transactions:                        2046639 (34110.12 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2046639 (34110.12 per sec.)
    other operations:                    2046639 (34110.12 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              2046639
    total time taken by event execution: 1916.8400
    per-request statistics:
         min:                                  0.55ms
         avg:                                  0.94ms
         max:                                  6.28ms
         approx.  95 percentile:               1.12ms

Threads fairness:
    events (avg/stddev):           63957.4688/64.19
    execution time (avg/stddev):   59.9012/0.00

