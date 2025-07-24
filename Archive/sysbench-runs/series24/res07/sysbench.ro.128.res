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
        read:                            1881531
        write:                           0
        other:                           1881531
        total:                           3763062
    transactions:                        1881531 (31356.61 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1881531 (31356.61 per sec.)
    other operations:                    1881531 (31356.61 per sec.)

Test execution summary:
    total time:                          60.0043s
    total number of events:              1881531
    total time taken by event execution: 7675.7270
    per-request statistics:
         min:                                  1.32ms
         avg:                                  4.08ms
         max:                                 35.34ms
         approx.  95 percentile:               8.40ms

Threads fairness:
    events (avg/stddev):           14699.4609/66.08
    execution time (avg/stddev):   59.9666/0.00

