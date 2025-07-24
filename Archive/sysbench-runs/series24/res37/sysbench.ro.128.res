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
        read:                            1832488
        write:                           0
        other:                           1832488
        total:                           3664976
    transactions:                        1832488 (30539.50 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1832488 (30539.50 per sec.)
    other operations:                    1832488 (30539.50 per sec.)

Test execution summary:
    total time:                          60.0039s
    total number of events:              1832488
    total time taken by event execution: 7675.9758
    per-request statistics:
         min:                                  1.31ms
         avg:                                  4.19ms
         max:                                 30.43ms
         approx.  95 percentile:               8.60ms

Threads fairness:
    events (avg/stddev):           14316.3125/63.96
    execution time (avg/stddev):   59.9686/0.00

