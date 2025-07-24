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
        read:                            1670485
        write:                           0
        other:                           1670485
        total:                           3340970
    transactions:                        1670485 (27839.76 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1670485 (27839.76 per sec.)
    other operations:                    1670485 (27839.76 per sec.)

Test execution summary:
    total time:                          60.0036s
    total number of events:              1670485
    total time taken by event execution: 7676.0710
    per-request statistics:
         min:                                  1.47ms
         avg:                                  4.60ms
         max:                                 34.66ms
         approx.  95 percentile:               9.31ms

Threads fairness:
    events (avg/stddev):           13050.6641/72.71
    execution time (avg/stddev):   59.9693/0.00

