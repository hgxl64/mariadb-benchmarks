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
        read:                            2437278
        write:                           0
        other:                           2437278
        total:                           4874556
    transactions:                        2437278 (40620.28 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2437278 (40620.28 per sec.)
    other operations:                    2437278 (40620.28 per sec.)

Test execution summary:
    total time:                          60.0015s
    total number of events:              2437278
    total time taken by event execution: 3836.0306
    per-request statistics:
         min:                                  1.01ms
         avg:                                  1.57ms
         max:                                 11.03ms
         approx.  95 percentile:               1.88ms

Threads fairness:
    events (avg/stddev):           38082.4688/36.35
    execution time (avg/stddev):   59.9380/0.00

