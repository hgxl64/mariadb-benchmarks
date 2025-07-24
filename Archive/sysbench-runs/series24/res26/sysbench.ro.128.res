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
        read:                            1953748
        write:                           0
        other:                           1953748
        total:                           3907496
    transactions:                        1953748 (32560.63 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1953748 (32560.63 per sec.)
    other operations:                    1953748 (32560.63 per sec.)

Test execution summary:
    total time:                          60.0034s
    total number of events:              1953748
    total time taken by event execution: 7675.6173
    per-request statistics:
         min:                                  1.27ms
         avg:                                  3.93ms
         max:                                 33.32ms
         approx.  95 percentile:               8.13ms

Threads fairness:
    events (avg/stddev):           15263.6562/67.57
    execution time (avg/stddev):   59.9658/0.00

