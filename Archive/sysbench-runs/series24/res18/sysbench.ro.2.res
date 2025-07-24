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
        read:                            396253
        write:                           0
        other:                           396253
        total:                           792506
    transactions:                        396253 (6604.17 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 396253 (6604.17 per sec.)
    other operations:                    396253 (6604.17 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              396253
    total time taken by event execution: 119.3208
    per-request statistics:
         min:                                  0.19ms
         avg:                                  0.30ms
         max:                                  0.78ms
         approx.  95 percentile:               0.35ms

Threads fairness:
    events (avg/stddev):           198126.5000/3.50
    execution time (avg/stddev):   59.6604/0.00

