sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1073644
        write:                           0
        other:                           1073644
        total:                           2147288
    transactions:                        1073644 (17894.00 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1073644 (17894.00 per sec.)
    other operations:                    1073644 (17894.00 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              1073644
    total time taken by event execution: 238.2838
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.22ms
         max:                                  5.46ms
         approx.  95 percentile:               0.30ms

Threads fairness:
    events (avg/stddev):           268411.0000/31268.87
    execution time (avg/stddev):   59.5709/0.05

