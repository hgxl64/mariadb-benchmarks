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
        read:                            1056723
        write:                           0
        other:                           1056723
        total:                           2113446
    transactions:                        1056723 (17611.57 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1056723 (17611.57 per sec.)
    other operations:                    1056723 (17611.57 per sec.)

Test execution summary:
    total time:                          60.0016s
    total number of events:              1056723
    total time taken by event execution: 1918.1279
    per-request statistics:
         min:                                  0.98ms
         avg:                                  1.82ms
         max:                                  3.53ms
         approx.  95 percentile:               2.04ms

Threads fairness:
    events (avg/stddev):           33022.5938/24.41
    execution time (avg/stddev):   59.9415/0.00

