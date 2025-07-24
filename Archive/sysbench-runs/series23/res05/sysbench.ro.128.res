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
        read:                            2150243
        write:                           0
        other:                           2150243
        total:                           4300486
    transactions:                        2150243 (35834.84 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2150243 (35834.84 per sec.)
    other operations:                    2150243 (35834.84 per sec.)

Test execution summary:
    total time:                          60.0043s
    total number of events:              2150243
    total time taken by event execution: 7675.6858
    per-request statistics:
         min:                                  1.23ms
         avg:                                  3.57ms
         max:                                 33.16ms
         approx.  95 percentile:               7.37ms

Threads fairness:
    events (avg/stddev):           16798.7734/70.28
    execution time (avg/stddev):   59.9663/0.00

