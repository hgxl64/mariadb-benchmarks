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
        read:                            1034406
        write:                           0
        other:                           1034406
        total:                           2068812
    transactions:                        1034406 (17239.58 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1034406 (17239.58 per sec.)
    other operations:                    1034406 (17239.58 per sec.)

Test execution summary:
    total time:                          60.0018s
    total number of events:              1034406
    total time taken by event execution: 1918.2369
    per-request statistics:
         min:                                  0.97ms
         avg:                                  1.85ms
         max:                                  4.77ms
         approx.  95 percentile:               2.08ms

Threads fairness:
    events (avg/stddev):           32325.1875/17.82
    execution time (avg/stddev):   59.9449/0.00

