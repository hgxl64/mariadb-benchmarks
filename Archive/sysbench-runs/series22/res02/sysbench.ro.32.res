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
        read:                            1627998
        write:                           0
        other:                           1627998
        total:                           3255996
    transactions:                        1627998 (27132.89 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1627998 (27132.89 per sec.)
    other operations:                    1627998 (27132.89 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              1627998
    total time taken by event execution: 1917.2779
    per-request statistics:
         min:                                  0.57ms
         avg:                                  1.18ms
         max:                                  3.82ms
         approx.  95 percentile:               1.47ms

Threads fairness:
    events (avg/stddev):           50874.9375/90.06
    execution time (avg/stddev):   59.9149/0.00

