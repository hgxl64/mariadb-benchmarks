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
        read:                            1539110
        write:                           0
        other:                           1539110
        total:                           3078220
    transactions:                        1539110 (25650.31 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1539110 (25650.31 per sec.)
    other operations:                    1539110 (25650.31 per sec.)

Test execution summary:
    total time:                          60.0036s
    total number of events:              1539110
    total time taken by event execution: 7676.4184
    per-request statistics:
         min:                                  1.65ms
         avg:                                  4.99ms
         max:                                 36.11ms
         approx.  95 percentile:               9.90ms

Threads fairness:
    events (avg/stddev):           12024.2969/52.03
    execution time (avg/stddev):   59.9720/0.00

