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
        read:                            2410704
        write:                           0
        other:                           2410704
        total:                           4821408
    transactions:                        2410704 (40177.40 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2410704 (40177.40 per sec.)
    other operations:                    2410704 (40177.40 per sec.)

Test execution summary:
    total time:                          60.0015s
    total number of events:              2410704
    total time taken by event execution: 3836.0399
    per-request statistics:
         min:                                  1.02ms
         avg:                                  1.59ms
         max:                                  7.61ms
         approx.  95 percentile:               1.89ms

Threads fairness:
    events (avg/stddev):           37667.2500/33.61
    execution time (avg/stddev):   59.9381/0.00

