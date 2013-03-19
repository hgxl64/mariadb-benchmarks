sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 128

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 127 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1067912
        write:                           0
        other:                           1067912
        total:                           2135824
    transactions:                        1067912 (17796.50 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1067912 (17796.50 per sec.)
    other operations:                    1067912 (17796.50 per sec.)

Test execution summary:
    total time:                          60.0069s
    total number of events:              1067912
    total time taken by event execution: 7677.1854
    per-request statistics:
         min:                                  3.48ms
         avg:                                  7.19ms
         max:                                 19.43ms
         approx.  95 percentile:               7.59ms

Threads fairness:
    events (avg/stddev):           8343.0625/2.26
    execution time (avg/stddev):   59.9780/0.00

