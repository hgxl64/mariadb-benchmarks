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
        read:                            1448648
        write:                           0
        other:                           1448648
        total:                           2897296
    transactions:                        1448648 (24143.73 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1448648 (24143.73 per sec.)
    other operations:                    1448648 (24143.73 per sec.)

Test execution summary:
    total time:                          60.0010s
    total number of events:              1448648
    total time taken by event execution: 1917.6581
    per-request statistics:
         min:                                  0.76ms
         avg:                                  1.32ms
         max:                                  3.66ms
         approx.  95 percentile:               1.58ms

Threads fairness:
    events (avg/stddev):           45270.2500/56.07
    execution time (avg/stddev):   59.9268/0.00

