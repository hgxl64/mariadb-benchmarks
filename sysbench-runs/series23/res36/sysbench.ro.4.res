sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            783243
        write:                           0
        other:                           783243
        total:                           1566486
    transactions:                        783243 (13053.96 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 783243 (13053.96 per sec.)
    other operations:                    783243 (13053.96 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              783243
    total time taken by event execution: 238.6401
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.30ms
         max:                                 11.71ms
         approx.  95 percentile:               0.40ms

Threads fairness:
    events (avg/stddev):           195810.7500/10601.13
    execution time (avg/stddev):   59.6600/0.02

