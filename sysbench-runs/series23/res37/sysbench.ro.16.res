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
        read:                            1612891
        write:                           0
        other:                           1612891
        total:                           3225782
    transactions:                        1612891 (26881.19 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1612891 (26881.19 per sec.)
    other operations:                    1612891 (26881.19 per sec.)

Test execution summary:
    total time:                          60.0007s
    total number of events:              1612891
    total time taken by event execution: 957.5824
    per-request statistics:
         min:                                  0.19ms
         avg:                                  0.59ms
         max:                                 12.40ms
         approx.  95 percentile:               0.76ms

Threads fairness:
    events (avg/stddev):           100805.6875/741.08
    execution time (avg/stddev):   59.8489/0.01

