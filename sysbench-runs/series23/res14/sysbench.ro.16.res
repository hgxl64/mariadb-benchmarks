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
        read:                            1055115
        write:                           0
        other:                           1055115
        total:                           2110230
    transactions:                        1055115 (17584.97 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1055115 (17584.97 per sec.)
    other operations:                    1055115 (17584.97 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              1055115
    total time taken by event execution: 958.2089
    per-request statistics:
         min:                                  0.41ms
         avg:                                  0.91ms
         max:                                  2.87ms
         approx.  95 percentile:               1.08ms

Threads fairness:
    events (avg/stddev):           65944.6875/601.58
    execution time (avg/stddev):   59.8881/0.00

