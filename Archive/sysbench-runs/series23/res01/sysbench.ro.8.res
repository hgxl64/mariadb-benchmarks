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
        read:                            1910572
        write:                           0
        other:                           1910572
        total:                           3821144
    transactions:                        1910572 (31842.72 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1910572 (31842.72 per sec.)
    other operations:                    1910572 (31842.72 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              1910572
    total time taken by event execution: 476.8424
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.25ms
         max:                                  2.03ms
         approx.  95 percentile:               0.33ms

Threads fairness:
    events (avg/stddev):           238821.5000/32520.91
    execution time (avg/stddev):   59.6053/0.07

