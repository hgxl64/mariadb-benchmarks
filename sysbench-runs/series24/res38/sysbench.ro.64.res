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
        read:                            1038180
        write:                           0
        other:                           1038180
        total:                           2076360
    transactions:                        1038180 (17302.08 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1038180 (17302.08 per sec.)
    other operations:                    1038180 (17302.08 per sec.)

Test execution summary:
    total time:                          60.0032s
    total number of events:              1038180
    total time taken by event execution: 3837.9245
    per-request statistics:
         min:                                  2.43ms
         avg:                                  3.70ms
         max:                                 20.59ms
         approx.  95 percentile:               3.99ms

Threads fairness:
    events (avg/stddev):           16221.5625/6.32
    execution time (avg/stddev):   59.9676/0.00

