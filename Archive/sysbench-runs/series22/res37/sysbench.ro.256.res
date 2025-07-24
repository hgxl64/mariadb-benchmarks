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
        read:                            1825264
        write:                           0
        other:                           1825264
        total:                           3650528
    transactions:                        1825264 (30417.19 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1825264 (30417.19 per sec.)
    other operations:                    1825264 (30417.19 per sec.)

Test execution summary:
    total time:                          60.0076s
    total number of events:              1825264
    total time taken by event execution: 15352.2144
    per-request statistics:
         min:                                  1.35ms
         avg:                                  8.41ms
         max:                                 87.04ms
         approx.  95 percentile:              21.07ms

Threads fairness:
    events (avg/stddev):           7129.9375/52.64
    execution time (avg/stddev):   59.9696/0.00

