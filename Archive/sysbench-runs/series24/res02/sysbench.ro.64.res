sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 64

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 63 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1501073
        write:                           0
        other:                           1501073
        total:                           3002146
    transactions:                        1501073 (25017.19 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1501073 (25017.19 per sec.)
    other operations:                    1501073 (25017.19 per sec.)

Test execution summary:
    total time:                          60.0017s
    total number of events:              1501073
    total time taken by event execution: 3837.3282
    per-request statistics:
         min:                                  1.44ms
         avg:                                  2.56ms
         max:                                  6.17ms
         approx.  95 percentile:               3.13ms

Threads fairness:
    events (avg/stddev):           23454.2656/23.59
    execution time (avg/stddev):   59.9583/0.00

