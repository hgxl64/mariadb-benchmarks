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
        read:                            1956970
        write:                           0
        other:                           1956970
        total:                           3913940
    transactions:                        1956970 (32614.48 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1956970 (32614.48 per sec.)
    other operations:                    1956970 (32614.48 per sec.)

Test execution summary:
    total time:                          60.0031s
    total number of events:              1956970
    total time taken by event execution: 7675.6821
    per-request statistics:
         min:                                  1.29ms
         avg:                                  3.92ms
         max:                                 34.74ms
         approx.  95 percentile:               8.09ms

Threads fairness:
    events (avg/stddev):           15288.8281/62.66
    execution time (avg/stddev):   59.9663/0.00

