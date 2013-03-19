sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 8

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 7 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1361820
        write:                           0
        other:                           1361820
        total:                           2723640
    transactions:                        1361820 (22696.86 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1361820 (22696.86 per sec.)
    other operations:                    1361820 (22696.86 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1361820
    total time taken by event execution: 477.7212
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.35ms
         max:                                  1.54ms
         approx.  95 percentile:               0.49ms

Threads fairness:
    events (avg/stddev):           170227.5000/6764.09
    execution time (avg/stddev):   59.7152/0.02

