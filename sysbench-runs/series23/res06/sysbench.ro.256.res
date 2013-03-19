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
        read:                            1689510
        write:                           0
        other:                           1689510
        total:                           3379020
    transactions:                        1689510 (28155.04 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1689510 (28155.04 per sec.)
    other operations:                    1689510 (28155.04 per sec.)

Test execution summary:
    total time:                          60.0074s
    total number of events:              1689510
    total time taken by event execution: 15352.0973
    per-request statistics:
         min:                                  1.56ms
         avg:                                  9.09ms
         max:                                 88.90ms
         approx.  95 percentile:              22.68ms

Threads fairness:
    events (avg/stddev):           6599.6484/47.40
    execution time (avg/stddev):   59.9691/0.00

