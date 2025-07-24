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
        read:                            1069630
        write:                           0
        other:                           1069630
        total:                           2139260
    transactions:                        1069630 (17826.72 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1069630 (17826.72 per sec.)
    other operations:                    1069630 (17826.72 per sec.)

Test execution summary:
    total time:                          60.0015s
    total number of events:              1069630
    total time taken by event execution: 1918.0391
    per-request statistics:
         min:                                  1.12ms
         avg:                                  1.79ms
         max:                                  3.91ms
         approx.  95 percentile:               2.01ms

Threads fairness:
    events (avg/stddev):           33425.9375/36.62
    execution time (avg/stddev):   59.9387/0.00

