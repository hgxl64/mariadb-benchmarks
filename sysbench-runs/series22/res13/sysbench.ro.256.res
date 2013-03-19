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
        read:                            1292499
        write:                           0
        other:                           1292499
        total:                           2584998
    transactions:                        1292499 (21539.14 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1292499 (21539.14 per sec.)
    other operations:                    1292499 (21539.14 per sec.)

Test execution summary:
    total time:                          60.0070s
    total number of events:              1292499
    total time taken by event execution: 15352.8013
    per-request statistics:
         min:                                  1.59ms
         avg:                                 11.88ms
         max:                                 91.35ms
         approx.  95 percentile:              22.90ms

Threads fairness:
    events (avg/stddev):           5048.8242/39.96
    execution time (avg/stddev):   59.9719/0.00

