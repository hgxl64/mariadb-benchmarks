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
        read:                            1649375
        write:                           0
        other:                           1649375
        total:                           3298750
    transactions:                        1649375 (27488.09 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1649375 (27488.09 per sec.)
    other operations:                    1649375 (27488.09 per sec.)

Test execution summary:
    total time:                          60.0033s
    total number of events:              1649375
    total time taken by event execution: 7675.9571
    per-request statistics:
         min:                                  1.49ms
         avg:                                  4.65ms
         max:                                 37.81ms
         approx.  95 percentile:               9.38ms

Threads fairness:
    events (avg/stddev):           12885.7422/56.90
    execution time (avg/stddev):   59.9684/0.00

