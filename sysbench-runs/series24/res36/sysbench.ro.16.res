sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            2038404
        write:                           0
        other:                           2038404
        total:                           4076808
    transactions:                        2038404 (33973.16 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2038404 (33973.16 per sec.)
    other operations:                    2038404 (33973.16 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              2038404
    total time taken by event execution: 956.9556
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.47ms
         max:                                 10.29ms
         approx.  95 percentile:               0.61ms

Threads fairness:
    events (avg/stddev):           127400.2500/1319.39
    execution time (avg/stddev):   59.8097/0.00

