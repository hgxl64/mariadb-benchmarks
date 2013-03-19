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
        read:                            1045033
        write:                           0
        other:                           1045033
        total:                           2090066
    transactions:                        1045033 (17413.20 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1045033 (17413.20 per sec.)
    other operations:                    1045033 (17413.20 per sec.)

Test execution summary:
    total time:                          60.0138s
    total number of events:              1045033
    total time taken by event execution: 15354.5255
    per-request statistics:
         min:                                  5.74ms
         avg:                                 14.69ms
         max:                                 70.25ms
         approx.  95 percentile:              22.46ms

Threads fairness:
    events (avg/stddev):           4082.1602/24.22
    execution time (avg/stddev):   59.9786/0.00

