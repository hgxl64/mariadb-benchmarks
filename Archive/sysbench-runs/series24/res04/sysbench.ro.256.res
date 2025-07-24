sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 256

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 255 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1040430
        write:                           0
        other:                           1040430
        total:                           2080860
    transactions:                        1040430 (17336.64 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1040430 (17336.64 per sec.)
    other operations:                    1040430 (17336.64 per sec.)

Test execution summary:
    total time:                          60.0133s
    total number of events:              1040430
    total time taken by event execution: 15354.3606
    per-request statistics:
         min:                                  4.55ms
         avg:                                 14.76ms
         max:                                 78.28ms
         approx.  95 percentile:              22.35ms

Threads fairness:
    events (avg/stddev):           4064.1797/24.29
    execution time (avg/stddev):   59.9780/0.01

