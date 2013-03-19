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
        read:                            959005
        write:                           0
        other:                           959005
        total:                           1918010
    transactions:                        959005 (15983.31 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 959005 (15983.31 per sec.)
    other operations:                    959005 (15983.31 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              959005
    total time taken by event execution: 238.3458
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.25ms
         max:                                  1.25ms
         approx.  95 percentile:               0.32ms

Threads fairness:
    events (avg/stddev):           239751.2500/6154.45
    execution time (avg/stddev):   59.5864/0.03

