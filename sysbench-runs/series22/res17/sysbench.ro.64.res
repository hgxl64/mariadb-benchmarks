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
        read:                            1833717
        write:                           0
        other:                           1833717
        total:                           3667434
    transactions:                        1833717 (30560.93 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1833717 (30560.93 per sec.)
    other operations:                    1833717 (30560.93 per sec.)

Test execution summary:
    total time:                          60.0020s
    total number of events:              1833717
    total time taken by event execution: 3836.9409
    per-request statistics:
         min:                                  1.34ms
         avg:                                  2.09ms
         max:                                 13.88ms
         approx.  95 percentile:               2.49ms

Threads fairness:
    events (avg/stddev):           28651.8281/20.38
    execution time (avg/stddev):   59.9522/0.00

