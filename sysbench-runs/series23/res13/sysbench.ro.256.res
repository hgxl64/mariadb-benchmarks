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
        read:                            1005696
        write:                           0
        other:                           1005696
        total:                           2011392
    transactions:                        1005696 (16759.60 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1005696 (16759.60 per sec.)
    other operations:                    1005696 (16759.60 per sec.)

Test execution summary:
    total time:                          60.0072s
    total number of events:              1005696
    total time taken by event execution: 15353.3090
    per-request statistics:
         min:                                  2.36ms
         avg:                                 15.27ms
         max:                                113.34ms
         approx.  95 percentile:              28.17ms

Threads fairness:
    events (avg/stddev):           3928.5000/36.26
    execution time (avg/stddev):   59.9739/0.00

