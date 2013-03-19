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
        read:                            1916440
        write:                           0
        other:                           1916440
        total:                           3832880
    transactions:                        1916440 (31940.17 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1916440 (31940.17 per sec.)
    other operations:                    1916440 (31940.17 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              1916440
    total time taken by event execution: 1917.0870
    per-request statistics:
         min:                                  0.59ms
         avg:                                  1.00ms
         max:                                  6.43ms
         approx.  95 percentile:               1.19ms

Threads fairness:
    events (avg/stddev):           59888.7500/147.36
    execution time (avg/stddev):   59.9090/0.00

