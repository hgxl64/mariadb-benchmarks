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
        read:                            1674740
        write:                           0
        other:                           1674740
        total:                           3349480
    transactions:                        1674740 (27910.79 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1674740 (27910.79 per sec.)
    other operations:                    1674740 (27910.79 per sec.)

Test execution summary:
    total time:                          60.0033s
    total number of events:              1674740
    total time taken by event execution: 7676.0996
    per-request statistics:
         min:                                  1.48ms
         avg:                                  4.58ms
         max:                                 35.49ms
         approx.  95 percentile:               9.22ms

Threads fairness:
    events (avg/stddev):           13083.9062/63.60
    execution time (avg/stddev):   59.9695/0.00

