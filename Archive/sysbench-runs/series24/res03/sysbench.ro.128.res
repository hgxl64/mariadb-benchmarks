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
        read:                            1305197
        write:                           0
        other:                           1305197
        total:                           2610394
    transactions:                        1305197 (21752.08 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1305197 (21752.08 per sec.)
    other operations:                    1305197 (21752.08 per sec.)

Test execution summary:
    total time:                          60.0033s
    total number of events:              1305197
    total time taken by event execution: 7676.4711
    per-request statistics:
         min:                                  1.44ms
         avg:                                  5.88ms
         max:                                 45.31ms
         approx.  95 percentile:              10.31ms

Threads fairness:
    events (avg/stddev):           10196.8516/45.40
    execution time (avg/stddev):   59.9724/0.00

