sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1896225
        write:                           0
        other:                           1896225
        total:                           3792450
    transactions:                        1896225 (31603.50 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1896225 (31603.50 per sec.)
    other operations:                    1896225 (31603.50 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1896225
    total time taken by event execution: 956.7126
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.50ms
         max:                                  9.22ms
         approx.  95 percentile:               0.68ms

Threads fairness:
    events (avg/stddev):           118514.0625/2354.08
    execution time (avg/stddev):   59.7945/0.01

