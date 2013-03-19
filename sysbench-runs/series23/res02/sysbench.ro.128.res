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
        read:                            1311780
        write:                           0
        other:                           1311780
        total:                           2623560
    transactions:                        1311780 (21861.75 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1311780 (21861.75 per sec.)
    other operations:                    1311780 (21861.75 per sec.)

Test execution summary:
    total time:                          60.0034s
    total number of events:              1311780
    total time taken by event execution: 7676.6692
    per-request statistics:
         min:                                  1.47ms
         avg:                                  5.85ms
         max:                                 40.56ms
         approx.  95 percentile:              10.30ms

Threads fairness:
    events (avg/stddev):           10248.2812/51.20
    execution time (avg/stddev):   59.9740/0.00

