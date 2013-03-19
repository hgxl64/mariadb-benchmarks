sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 2

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 1 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            431173
        write:                           0
        other:                           431173
        total:                           862346
    transactions:                        431173 (7186.17 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 431173 (7186.17 per sec.)
    other operations:                    431173 (7186.17 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              431173
    total time taken by event execution: 119.6331
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.28ms
         max:                                  1.43ms
         approx.  95 percentile:               0.33ms

Threads fairness:
    events (avg/stddev):           215586.5000/1249.50
    execution time (avg/stddev):   59.8166/0.00

