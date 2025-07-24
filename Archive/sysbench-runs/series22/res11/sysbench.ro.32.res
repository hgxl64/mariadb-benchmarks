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
        read:                            1734633
        write:                           0
        other:                           1734633
        total:                           3469266
    transactions:                        1734633 (28910.17 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1734633 (28910.17 per sec.)
    other operations:                    1734633 (28910.17 per sec.)

Test execution summary:
    total time:                          60.0008s
    total number of events:              1734633
    total time taken by event execution: 1917.3307
    per-request statistics:
         min:                                  0.63ms
         avg:                                  1.11ms
         max:                                  5.97ms
         approx.  95 percentile:               1.30ms

Threads fairness:
    events (avg/stddev):           54207.2812/45.58
    execution time (avg/stddev):   59.9166/0.00

