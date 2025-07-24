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
        read:                            1567110
        write:                           0
        other:                           1567110
        total:                           3134220
    transactions:                        1567110 (26117.06 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1567110 (26117.06 per sec.)
    other operations:                    1567110 (26117.06 per sec.)

Test execution summary:
    total time:                          60.0033s
    total number of events:              1567110
    total time taken by event execution: 7676.2760
    per-request statistics:
         min:                                  1.63ms
         avg:                                  4.90ms
         max:                                 33.87ms
         approx.  95 percentile:               9.76ms

Threads fairness:
    events (avg/stddev):           12243.0469/57.65
    execution time (avg/stddev):   59.9709/0.00

