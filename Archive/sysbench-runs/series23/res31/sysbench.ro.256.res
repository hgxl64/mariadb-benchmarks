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
        read:                            1542365
        write:                           0
        other:                           1542365
        total:                           3084730
    transactions:                        1542365 (25703.03 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1542365 (25703.03 per sec.)
    other operations:                    1542365 (25703.03 per sec.)

Test execution summary:
    total time:                          60.0071s
    total number of events:              1542365
    total time taken by event execution: 15352.8148
    per-request statistics:
         min:                                  1.68ms
         avg:                                  9.95ms
         max:                                 89.74ms
         approx.  95 percentile:              24.24ms

Threads fairness:
    events (avg/stddev):           6024.8633/49.45
    execution time (avg/stddev):   59.9719/0.00

