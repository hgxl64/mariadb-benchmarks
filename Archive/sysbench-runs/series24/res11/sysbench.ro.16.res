sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1726546
        write:                           0
        other:                           1726546
        total:                           3453092
    transactions:                        1726546 (28775.54 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1726546 (28775.54 per sec.)
    other operations:                    1726546 (28775.54 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1726546
    total time taken by event execution: 957.3364
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.55ms
         max:                                  4.89ms
         approx.  95 percentile:               0.70ms

Threads fairness:
    events (avg/stddev):           107909.1250/407.03
    execution time (avg/stddev):   59.8335/0.01

