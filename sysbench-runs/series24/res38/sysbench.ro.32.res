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
        read:                            1036310
        write:                           0
        other:                           1036310
        total:                           2072620
    transactions:                        1036310 (17271.36 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1036310 (17271.36 per sec.)
    other operations:                    1036310 (17271.36 per sec.)

Test execution summary:
    total time:                          60.0017s
    total number of events:              1036310
    total time taken by event execution: 1918.2279
    per-request statistics:
         min:                                  1.34ms
         avg:                                  1.85ms
         max:                                 17.66ms
         approx.  95 percentile:               2.07ms

Threads fairness:
    events (avg/stddev):           32384.6875/14.27
    execution time (avg/stddev):   59.9446/0.00

