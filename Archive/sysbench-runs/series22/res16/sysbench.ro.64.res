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
        read:                            1966338
        write:                           0
        other:                           1966338
        total:                           3932676
    transactions:                        1966338 (32771.52 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1966338 (32771.52 per sec.)
    other operations:                    1966338 (32771.52 per sec.)

Test execution summary:
    total time:                          60.0014s
    total number of events:              1966338
    total time taken by event execution: 3836.6812
    per-request statistics:
         min:                                  1.22ms
         avg:                                  1.95ms
         max:                                  7.16ms
         approx.  95 percentile:               2.33ms

Threads fairness:
    events (avg/stddev):           30724.0312/21.31
    execution time (avg/stddev):   59.9481/0.00

