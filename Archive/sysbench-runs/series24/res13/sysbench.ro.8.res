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
        read:                            1486337
        write:                           0
        other:                           1486337
        total:                           2972674
    transactions:                        1486337 (24772.12 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1486337 (24772.12 per sec.)
    other operations:                    1486337 (24772.12 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1486337
    total time taken by event execution: 477.8983
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.32ms
         max:                                  1.44ms
         approx.  95 percentile:               0.45ms

Threads fairness:
    events (avg/stddev):           185792.1250/3980.60
    execution time (avg/stddev):   59.7373/0.02

