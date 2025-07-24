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
        read:                            1316094
        write:                           0
        other:                           1316094
        total:                           2632188
    transactions:                        1316094 (21934.32 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1316094 (21934.32 per sec.)
    other operations:                    1316094 (21934.32 per sec.)

Test execution summary:
    total time:                          60.0016s
    total number of events:              1316094
    total time taken by event execution: 3837.6443
    per-request statistics:
         min:                                  1.39ms
         avg:                                  2.92ms
         max:                                  8.70ms
         approx.  95 percentile:               3.47ms

Threads fairness:
    events (avg/stddev):           20563.9688/21.82
    execution time (avg/stddev):   59.9632/0.00

