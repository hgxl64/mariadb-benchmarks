sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 32

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 31 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1465861
        write:                           0
        other:                           1465861
        total:                           2931722
    transactions:                        1465861 (24430.62 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1465861 (24430.62 per sec.)
    other operations:                    1465861 (24430.62 per sec.)

Test execution summary:
    total time:                          60.0010s
    total number of events:              1465861
    total time taken by event execution: 1917.5562
    per-request statistics:
         min:                                  0.64ms
         avg:                                  1.31ms
         max:                                  3.69ms
         approx.  95 percentile:               1.55ms

Threads fairness:
    events (avg/stddev):           45808.1562/48.06
    execution time (avg/stddev):   59.9236/0.00

