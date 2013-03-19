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
        read:                            1281556
        write:                           0
        other:                           1281556
        total:                           2563112
    transactions:                        1281556 (21358.76 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1281556 (21358.76 per sec.)
    other operations:                    1281556 (21358.76 per sec.)

Test execution summary:
    total time:                          60.0014s
    total number of events:              1281556
    total time taken by event execution: 3837.7263
    per-request statistics:
         min:                                  1.60ms
         avg:                                  2.99ms
         max:                                  9.20ms
         approx.  95 percentile:               3.58ms

Threads fairness:
    events (avg/stddev):           20024.3125/15.54
    execution time (avg/stddev):   59.9645/0.00

