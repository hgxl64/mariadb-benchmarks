sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 32

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 31 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1972082
        write:                           0
        other:                           1972082
        total:                           3944164
    transactions:                        1972082 (32867.50 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1972082 (32867.50 per sec.)
    other operations:                    1972082 (32867.50 per sec.)

Test execution summary:
    total time:                          60.0010s
    total number of events:              1972082
    total time taken by event execution: 1916.5174
    per-request statistics:
         min:                                  0.51ms
         avg:                                  0.97ms
         max:                                  5.56ms
         approx.  95 percentile:               1.23ms

Threads fairness:
    events (avg/stddev):           61627.5625/295.52
    execution time (avg/stddev):   59.8912/0.00

