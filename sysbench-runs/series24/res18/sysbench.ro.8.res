sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 8

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 7 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1146580
        write:                           0
        other:                           1146580
        total:                           2293160
    transactions:                        1146580 (19109.47 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1146580 (19109.47 per sec.)
    other operations:                    1146580 (19109.47 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1146580
    total time taken by event execution: 478.2039
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.42ms
         max:                                  1.16ms
         approx.  95 percentile:               0.55ms

Threads fairness:
    events (avg/stddev):           143322.5000/4969.52
    execution time (avg/stddev):   59.7755/0.02

