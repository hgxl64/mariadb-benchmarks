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
        read:                            2421626
        write:                           0
        other:                           2421626
        total:                           4843252
    transactions:                        2421626 (40359.37 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2421626 (40359.37 per sec.)
    other operations:                    2421626 (40359.37 per sec.)

Test execution summary:
    total time:                          60.0016s
    total number of events:              2421626
    total time taken by event execution: 3836.0585
    per-request statistics:
         min:                                  1.01ms
         avg:                                  1.58ms
         max:                                  7.22ms
         approx.  95 percentile:               1.89ms

Threads fairness:
    events (avg/stddev):           37837.9062/36.46
    execution time (avg/stddev):   59.9384/0.00

