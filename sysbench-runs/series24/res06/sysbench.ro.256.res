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
        read:                            1967779
        write:                           0
        other:                           1967779
        total:                           3935558
    transactions:                        1967779 (32792.21 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1967779 (32792.21 per sec.)
    other operations:                    1967779 (32792.21 per sec.)

Test execution summary:
    total time:                          60.0075s
    total number of events:              1967779
    total time taken by event execution: 15351.8374
    per-request statistics:
         min:                                  1.26ms
         avg:                                  7.80ms
         max:                                 93.50ms
         approx.  95 percentile:              19.76ms

Threads fairness:
    events (avg/stddev):           7686.6367/54.53
    execution time (avg/stddev):   59.9681/0.00

