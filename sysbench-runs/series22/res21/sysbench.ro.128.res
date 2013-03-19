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
        read:                            1673413
        write:                           0
        other:                           1673413
        total:                           3346826
    transactions:                        1673413 (27888.69 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1673413 (27888.69 per sec.)
    other operations:                    1673413 (27888.69 per sec.)

Test execution summary:
    total time:                          60.0033s
    total number of events:              1673413
    total time taken by event execution: 7676.0714
    per-request statistics:
         min:                                  1.46ms
         avg:                                  4.59ms
         max:                                 31.31ms
         approx.  95 percentile:               9.22ms

Threads fairness:
    events (avg/stddev):           13073.5391/60.43
    execution time (avg/stddev):   59.9693/0.00

