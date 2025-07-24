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
        read:                            1052616
        write:                           0
        other:                           1052616
        total:                           2105232
    transactions:                        1052616 (17543.10 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1052616 (17543.10 per sec.)
    other operations:                    1052616 (17543.10 per sec.)

Test execution summary:
    total time:                          60.0017s
    total number of events:              1052616
    total time taken by event execution: 1918.2520
    per-request statistics:
         min:                                  1.07ms
         avg:                                  1.82ms
         max:                                  4.77ms
         approx.  95 percentile:               2.05ms

Threads fairness:
    events (avg/stddev):           32894.2500/20.15
    execution time (avg/stddev):   59.9454/0.00

