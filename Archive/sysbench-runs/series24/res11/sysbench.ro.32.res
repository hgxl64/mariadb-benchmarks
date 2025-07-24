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
        read:                            1738185
        write:                           0
        other:                           1738185
        total:                           3476370
    transactions:                        1738185 (28969.24 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1738185 (28969.24 per sec.)
    other operations:                    1738185 (28969.24 per sec.)

Test execution summary:
    total time:                          60.0011s
    total number of events:              1738185
    total time taken by event execution: 1917.3096
    per-request statistics:
         min:                                  0.62ms
         avg:                                  1.10ms
         max:                                  3.55ms
         approx.  95 percentile:               1.30ms

Threads fairness:
    events (avg/stddev):           54318.2812/72.35
    execution time (avg/stddev):   59.9159/0.00

