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
        read:                            1891761
        write:                           0
        other:                           1891761
        total:                           3783522
    transactions:                        1891761 (31529.15 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1891761 (31529.15 per sec.)
    other operations:                    1891761 (31529.15 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1891761
    total time taken by event execution: 477.3243
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.25ms
         max:                                  9.46ms
         approx.  95 percentile:               0.34ms

Threads fairness:
    events (avg/stddev):           236470.1250/4999.83
    execution time (avg/stddev):   59.6655/0.01

