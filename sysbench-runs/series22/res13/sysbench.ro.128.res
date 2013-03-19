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
        read:                            1287607
        write:                           0
        other:                           1287607
        total:                           2575214
    transactions:                        1287607 (21458.86 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1287607 (21458.86 per sec.)
    other operations:                    1287607 (21458.86 per sec.)

Test execution summary:
    total time:                          60.0035s
    total number of events:              1287607
    total time taken by event execution: 7676.5933
    per-request statistics:
         min:                                  1.66ms
         avg:                                  5.96ms
         max:                                 42.09ms
         approx.  95 percentile:              10.19ms

Threads fairness:
    events (avg/stddev):           10059.4297/41.79
    execution time (avg/stddev):   59.9734/0.00

