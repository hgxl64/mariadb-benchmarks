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
        read:                            2171719
        write:                           0
        other:                           2171719
        total:                           4343438
    transactions:                        2171719 (36194.28 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2171719 (36194.28 per sec.)
    other operations:                    2171719 (36194.28 per sec.)

Test execution summary:
    total time:                          60.0017s
    total number of events:              2171719
    total time taken by event execution: 3836.4202
    per-request statistics:
         min:                                  1.21ms
         avg:                                  1.77ms
         max:                                  6.30ms
         approx.  95 percentile:               2.06ms

Threads fairness:
    events (avg/stddev):           33933.1094/27.64
    execution time (avg/stddev):   59.9441/0.00

