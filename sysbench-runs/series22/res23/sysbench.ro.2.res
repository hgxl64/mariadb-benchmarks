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
        read:                            426629
        write:                           0
        other:                           426629
        total:                           853258
    transactions:                        426629 (7110.44 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 426629 (7110.44 per sec.)
    other operations:                    426629 (7110.44 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              426629
    total time taken by event execution: 119.4304
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.28ms
         max:                                  1.46ms
         approx.  95 percentile:               0.38ms

Threads fairness:
    events (avg/stddev):           213314.5000/225.50
    execution time (avg/stddev):   59.7152/0.02

