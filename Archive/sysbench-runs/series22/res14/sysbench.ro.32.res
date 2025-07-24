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
        read:                            1049758
        write:                           0
        other:                           1049758
        total:                           2099516
    transactions:                        1049758 (17495.49 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1049758 (17495.49 per sec.)
    other operations:                    1049758 (17495.49 per sec.)

Test execution summary:
    total time:                          60.0016s
    total number of events:              1049758
    total time taken by event execution: 1918.2482
    per-request statistics:
         min:                                  1.33ms
         avg:                                  1.83ms
         max:                                  4.62ms
         approx.  95 percentile:               2.05ms

Threads fairness:
    events (avg/stddev):           32804.9375/22.53
    execution time (avg/stddev):   59.9453/0.00

