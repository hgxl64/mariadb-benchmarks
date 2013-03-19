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
        read:                            1963162
        write:                           0
        other:                           1963162
        total:                           3926324
    transactions:                        1963162 (32717.68 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1963162 (32717.68 per sec.)
    other operations:                    1963162 (32717.68 per sec.)

Test execution summary:
    total time:                          60.0031s
    total number of events:              1963162
    total time taken by event execution: 7675.5813
    per-request statistics:
         min:                                  1.28ms
         avg:                                  3.91ms
         max:                                 34.44ms
         approx.  95 percentile:               8.10ms

Threads fairness:
    events (avg/stddev):           15337.2031/62.59
    execution time (avg/stddev):   59.9655/0.00

