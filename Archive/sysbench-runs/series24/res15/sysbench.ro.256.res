sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 256

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 255 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            2425378
        write:                           0
        other:                           2425378
        total:                           4850756
    transactions:                        2425378 (40417.78 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2425378 (40417.78 per sec.)
    other operations:                    2425378 (40417.78 per sec.)

Test execution summary:
    total time:                          60.0077s
    total number of events:              2425378
    total time taken by event execution: 15350.7502
    per-request statistics:
         min:                                  0.81ms
         avg:                                  6.33ms
         max:                                 78.16ms
         approx.  95 percentile:              16.27ms

Threads fairness:
    events (avg/stddev):           9474.1328/70.28
    execution time (avg/stddev):   59.9639/0.00

