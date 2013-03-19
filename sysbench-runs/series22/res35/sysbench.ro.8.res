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
        read:                            1794383
        write:                           0
        other:                           1794383
        total:                           3588766
    transactions:                        1794383 (29906.09 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1794383 (29906.09 per sec.)
    other operations:                    1794383 (29906.09 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1794383
    total time taken by event execution: 477.4415
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.27ms
         max:                                 13.63ms
         approx.  95 percentile:               0.36ms

Threads fairness:
    events (avg/stddev):           224297.8750/4545.01
    execution time (avg/stddev):   59.6802/0.02

