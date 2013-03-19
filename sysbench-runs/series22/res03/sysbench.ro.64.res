sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 64

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 63 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1382635
        write:                           0
        other:                           1382635
        total:                           2765270
    transactions:                        1382635 (23043.29 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1382635 (23043.29 per sec.)
    other operations:                    1382635 (23043.29 per sec.)

Test execution summary:
    total time:                          60.0016s
    total number of events:              1382635
    total time taken by event execution: 3837.4753
    per-request statistics:
         min:                                  1.49ms
         avg:                                  2.78ms
         max:                                  7.61ms
         approx.  95 percentile:               3.36ms

Threads fairness:
    events (avg/stddev):           21603.6719/21.62
    execution time (avg/stddev):   59.9606/0.00

