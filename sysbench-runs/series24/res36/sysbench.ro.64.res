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
        read:                            1950247
        write:                           0
        other:                           1950247
        total:                           3900494
    transactions:                        1950247 (32503.27 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1950247 (32503.27 per sec.)
    other operations:                    1950247 (32503.27 per sec.)

Test execution summary:
    total time:                          60.0016s
    total number of events:              1950247
    total time taken by event execution: 3836.7227
    per-request statistics:
         min:                                  1.27ms
         avg:                                  1.97ms
         max:                                 15.60ms
         approx.  95 percentile:               2.36ms

Threads fairness:
    events (avg/stddev):           30472.6094/24.34
    execution time (avg/stddev):   59.9488/0.00

