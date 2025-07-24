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
        read:                            1153314
        write:                           0
        other:                           1153314
        total:                           2306628
    transactions:                        1153314 (19221.44 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1153314 (19221.44 per sec.)
    other operations:                    1153314 (19221.44 per sec.)

Test execution summary:
    total time:                          60.0014s
    total number of events:              1153314
    total time taken by event execution: 1917.9891
    per-request statistics:
         min:                                  1.22ms
         avg:                                  1.66ms
         max:                                  4.08ms
         approx.  95 percentile:               1.86ms

Threads fairness:
    events (avg/stddev):           36041.0625/35.65
    execution time (avg/stddev):   59.9372/0.00

