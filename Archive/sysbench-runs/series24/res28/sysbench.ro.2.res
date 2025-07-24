sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 2

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 1 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            532999
        write:                           0
        other:                           532999
        total:                           1065998
    transactions:                        532999 (8883.26 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 532999 (8883.26 per sec.)
    other operations:                    532999 (8883.26 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              532999
    total time taken by event execution: 119.2759
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.22ms
         max:                                  0.89ms
         approx.  95 percentile:               0.30ms

Threads fairness:
    events (avg/stddev):           266499.5000/50065.50
    execution time (avg/stddev):   59.6380/0.08

