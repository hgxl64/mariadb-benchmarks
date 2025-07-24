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
        read:                            1033129
        write:                           0
        other:                           1033129
        total:                           2066258
    transactions:                        1033129 (17218.55 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1033129 (17218.55 per sec.)
    other operations:                    1033129 (17218.55 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              1033129
    total time taken by event execution: 958.2089
    per-request statistics:
         min:                                  0.51ms
         avg:                                  0.93ms
         max:                                  6.22ms
         approx.  95 percentile:               1.10ms

Threads fairness:
    events (avg/stddev):           64570.5625/640.77
    execution time (avg/stddev):   59.8881/0.00

