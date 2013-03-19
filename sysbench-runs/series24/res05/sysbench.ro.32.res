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
        read:                            2721226
        write:                           0
        other:                           2721226
        total:                           5442452
    transactions:                        2721226 (45353.07 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2721226 (45353.07 per sec.)
    other operations:                    2721226 (45353.07 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              2721226
    total time taken by event execution: 1915.3675
    per-request statistics:
         min:                                  0.36ms
         avg:                                  0.70ms
         max:                                 16.55ms
         approx.  95 percentile:               0.86ms

Threads fairness:
    events (avg/stddev):           85038.3125/771.36
    execution time (avg/stddev):   59.8552/0.00

