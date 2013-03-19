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
        read:                            2413632
        write:                           0
        other:                           2413632
        total:                           4827264
    transactions:                        2413632 (40222.27 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2413632 (40222.27 per sec.)
    other operations:                    2413632 (40222.27 per sec.)

Test execution summary:
    total time:                          60.0074s
    total number of events:              2413632
    total time taken by event execution: 15350.9397
    per-request statistics:
         min:                                  1.08ms
         avg:                                  6.36ms
         max:                                 74.11ms
         approx.  95 percentile:              16.34ms

Threads fairness:
    events (avg/stddev):           9428.2500/71.02
    execution time (avg/stddev):   59.9646/0.00

