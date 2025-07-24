sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 8

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 7 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1970890
        write:                           0
        other:                           1970890
        total:                           3941780
    transactions:                        1970890 (32848.00 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1970890 (32848.00 per sec.)
    other operations:                    1970890 (32848.00 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              1970890
    total time taken by event execution: 476.3256
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.24ms
         max:                                 14.39ms
         approx.  95 percentile:               0.31ms

Threads fairness:
    events (avg/stddev):           246361.2500/17660.90
    execution time (avg/stddev):   59.5407/0.06

