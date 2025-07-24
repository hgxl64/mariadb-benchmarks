sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            842913
        write:                           0
        other:                           842913
        total:                           1685826
    transactions:                        842913 (14048.42 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 842913 (14048.42 per sec.)
    other operations:                    842913 (14048.42 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              842913
    total time taken by event execution: 238.5335
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.28ms
         max:                                 13.40ms
         approx.  95 percentile:               0.38ms

Threads fairness:
    events (avg/stddev):           210728.2500/8537.46
    execution time (avg/stddev):   59.6334/0.01

